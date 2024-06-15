from discord_webhook import DiscordWebhook
from datetime import datetime, timedelta
from bs4 import BeautifulSoup
import requests
import re
import json
import os

webhook_url = "URL_HERE" # Insert discord webhook url to post changes to discord.

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
        input_text = re.sub("Á", "Į", input_text)
        input_text = re.sub("M: SK", "M: SandKing", input_text)
        found = False
        for data in ad_arr:
            if data["Skelbimas"] == input_text:
                stored_date = datetime.strptime(data["Data"], "%Y-%m-%d %H:%M:%S")
                current_date = datetime.strptime(match.group(1), "%Y-%m-%d %H:%M:%S")
                if stored_date < current_date :
                    data["Data"] = match.group(1)
                    print("Updated date for ad:", input_text)
                    if (stored_date + timedelta(minutes=30)) < current_date:
                        time_delta = current_date - stored_date
                        days = time_delta.days
                        hours = abs(days) * 24 + time_delta.seconds // 3600
                        minutes = (time_delta.seconds % 3600) // 60
                        if days > 0:
                            if hours % 24 == 0:
                                time_delta = f"{days}d {minutes}min"
                            else:
                                time_delta = f"{days}d {hours % 24}h {minutes}min"
                        else:
                            if hours == 0:
                                time_delta = f"{minutes}min"
                            else:
                                time_delta = f"{hours}h {minutes}min"
                        Webhook_EMB = {
                                "title": "Reporteris " + match.group(2),
                                "description": "Seniau skelbtas skelbimas\nPaskutinį kartą buvo skelbtas prieš: " + time_delta + "```" + input_text + "```",
                                "url": "https://sarg.khai.lt",
                                "color": 16763904,
                                "footer": {"text": match.group(1)}
                            }
                        DiscordWebhook(url=webhook_url, username="Rep Bind (Skelbimų archyvas)",avatar_url="https://cdn.discordapp.com/avatars/873276798102818826/3e9a8bc764d045d5ef09205350211396.png", embeds=[Webhook_EMB]).execute()
                found = True
                break
        if not found:
            data = {
                "Data": match.group(1),
                "Reporteris": match.group(2),
                "Skelbimas": input_text
            }
            ad_arr.insert(0, data)
            Webhook_EMB = {
                    "title": "Reporteris " + match.group(2),
                    "description": "Naujas skelbimas:```" + input_text + "```",
                    "url": "https://sarg.khai.lt",
                    "color": 65280,
                    "footer": {"text": match.group(1)}
                }
            DiscordWebhook(url=webhook_url, username="Rep Bind (Skelbimų archyvas)", avatar_url="https://cdn.discordapp.com/avatars/873276798102818826/3e9a8bc764d045d5ef09205350211396.png", embeds=[Webhook_EMB]).execute()
            print("Added:", input_text)

ad_arr.sort(key=lambda x: datetime.strptime(x["Data"], "%Y-%m-%d %H:%M:%S"), reverse=True)

print("\nSaugoma",len(ad_arr), "skirtingų skelbimų nuo 2024-04-16\n")

for_count = 0
for ad in ad_arr:
    if for_count < 20:
        print("["+ad["Data"]+"] "+ad["Skelbimas"])
        for_count = for_count + 1

with open(json_file_path, "w", encoding="utf-8") as file:
    json.dump(ad_arr, file,indent=4, ensure_ascii=False)


