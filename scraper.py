from datetime import datetime
from bs4 import BeautifulSoup
import requests
import re
import json
import os

json_file_path = os.path.join(os.path.dirname(os.path.realpath(__file__)), "ads.json")

soup = BeautifulSoup(requests.get("https://sarg.lt/index.php?/cp/5-skelbimai/").text , "html.parser")
skelbimai = str(soup.find("div",attrs={"style":"margin-left:20px;"}))

skelbimai = re.sub("<div style=\"margin-left:20px;\">|</div>|<b>|</b>","",skelbimai)
skelbimai = re.sub("<br/> ","\n",skelbimai).split("\n")

try:
    with open(json_file_path, "r", encoding="utf-8") as file:
        ad_arr = json.load(file)
except FileNotFoundError:
    ad_arr = []

for ad in skelbimai:
    match = re.match(r"\[(.*?)\]\s(\w+):\s(.+)", ad) 
    if match:
        input_text = re.sub(r'\[(.*?)\]', lambda x: re.sub(r'\(\d+\)', '', x.group()), match.group(3), 1)
        input_text = re.sub(r'\[(.*?)\]', lambda x: re.sub(r'\s+', '_', x.group()), input_text, 1)
        input_text = re.sub("Þ", "Ž", input_text)
        found = False
        for data in ad_arr:
            if data["Skelbimas"] == input_text:
                stored_date = datetime.strptime(data["Data"], "%Y-%m-%d %H:%M:%S")
                current_date = datetime.strptime(match.group(1), "%Y-%m-%d %H:%M:%S")
                if stored_date < current_date:
                    data["Data"] = match.group(1)
                    print("Updated date for ad:", input_text)
                found = True
                break
        if not found:
            data = {
                "Data": match.group(1),
                "Reporteris": match.group(2),
                "Skelbimas": input_text
            }
            ad_arr.insert(0, data)
            print("Added:", input_text)

ad_arr.sort(key=lambda x: datetime.strptime(x["Data"], "%Y-%m-%d %H:%M:%S"), reverse=True)

print("\nSaugoma",len(ad_arr), "skirtingų skelbimų nuo 2024-04-16\n")

for ad in ad_arr:
    print("["+ad["Data"]+"] "+ad["Skelbimas"])

with open(json_file_path, "w", encoding="utf-8") as file:
    json.dump(ad_arr, file, ensure_ascii=False)
