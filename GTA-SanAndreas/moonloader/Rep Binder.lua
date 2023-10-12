--[[
    Setup utility for Rep Binder

    > Sukuria papkes
    > Parsiunčia "imgui" lib'ą
    > Parsiunčia "Rep Binder.luac" Stable versija.

    @Mintaras - 2023-10-12
]]

local dlstatus = require('moonloader').download_status 

function main()
    repeat wait(0) until isSampAvailable() 
    if not doesDirectoryExist(thisScript().directory.."/lib/mimgui") then createDirectory(thisScript().directory.."/lib/mimgui") end 
    if not doesDirectoryExist(thisScript().directory.."/config/RepBind") then createDirectory(thisScript().directory.."/config/RepBind") end 

    if not doesFileExist(thisScript().directory.."/lib/imgui.lua") then print("Downloading: ./GTA-SanAndreas/lib/imgui.lua",-1) downloadUrlToFile("https://raw.githubusercontent.com/Mintaras1/RepBindJson/main/GTA-SanAndreas/moonloader/lib/imgui.lua", thisScript().directory.."/lib/imgui.lua") end 
    while not doesFileExist(thisScript().directory.."/lib/imgui.lua") do wait(1) end 

	if not doesFileExist(thisScript().directory.."/lib/mimgui/cdefs.lua") then print("/Downloading: ./GTA-SanAndreas/lib/mimgui/cdefs.lua",-1) downloadUrlToFile("https://raw.githubusercontent.com/Mintaras1/RepBindJson/main/GTA-SanAndreas/moonloader/lib/mimgui/cdefs.lua", thisScript().directory.."/lib/mimgui/cdefs.lua") end 
    while not doesFileExist(thisScript().directory.."/lib/mimgui/cdefs.lua") do wait(1) end 

	if not doesFileExist(thisScript().directory.."/lib/mimgui/cimguidx9.dll") then print("/Downloading: ./GTA-SanAndreas/lib/mimgui/cimguidx9.dll",-1) downloadUrlToFile("https://github.com/Mintaras1/RepBindJson/raw/main/GTA-SanAndreas/moonloader/lib/mimgui/cimguidx9.dll", thisScript().directory.."/lib/mimgui/cimguidx9.dll") end
    while not doesFileExist(thisScript().directory.."/lib/mimgui/cimguidx9.dll") do wait(1) end  

	if not doesFileExist(thisScript().directory.."/lib/mimgui/dx9.lua") then print("/Downloading: ./GTA-SanAndreas/lib/mimgui/dx9.lua",-1) downloadUrlToFile("https://github.com/Mintaras1/RepBindJson/raw/main/GTA-SanAndreas/moonloader/lib/mimgui/dx9.lua", thisScript().directory.."/lib/mimgui/dx9.lua") end 
    while not doesFileExist(thisScript().directory.."/lib/mimgui/dx9.lua") do wait(1) end 

	if not doesFileExist(thisScript().directory.."/lib/mimgui/imgui.lua") then print("/Downloading: ./GTA-SanAndreas/lib/mimgui/imgui.lua",-1) downloadUrlToFile("https://github.com/Mintaras1/RepBindJson/raw/main/GTA-SanAndreas/moonloader/lib/mimgui/imgui.lua", thisScript().directory.."/lib/mimgui/imgui.lua") end 
    while not doesFileExist(thisScript().directory.."/lib/mimgui/imgui.lua") do wait(1) end 

	if not doesFileExist(thisScript().directory.."/lib/mimgui/init.lua") then print("/Downloading: ./GTA-SanAndreas/lib/mimgui/init.lua",-1) downloadUrlToFile("https://github.com/Mintaras1/RepBindJson/raw/main/GTA-SanAndreas/moonloader/lib/mimgui/init.lua", thisScript().directory.."/lib/mimgui/init.lua") end 
    while not doesFileExist(thisScript().directory.."/lib/mimgui/init.lua") do wait(1) end 

    sampAddChatMessage(ltu("{dF8D1B}[RepBind.lua] {e6BB24}Visi reikalingi failai buvo atsiūsti."), 0xe6BB24)
	downloadUrlToFile("https://raw.githubusercontent.com/Mintaras1/RepBindJson/main/global.json", thisScript().directory.."/config/RepBind/global.json", function(id, status, p1, p2) 
		if status == dlstatus.STATUS_ENDDOWNLOADDATA then 
			lua_thread.create(function() wait(1000)
				while not doesFileExist(thisScript().directory.."/config/RepBind/global.json") do print("waiti'n on global.json") wait(1000) end 
				local global_json = jsonread(thisScript().directory.."/config/RepBind/global.json") 
				while not global_json.Ping do print("waiti'n on gobal_json") global_json = jsonread(thisScript().directory.."/config/RepBind/global.json") end 
				jsonwrite(thisScript().directory.."/config/RepBind/global.json") 
				if not global_json then sampAddChatMessage(ltu("{dF8D1B}[RepBind.lua] {FF0000}[Error] {e6BB24}global_json not loaded in time"), 0xe6BB24) thisScript():reload() end 
                local SingleUse = true 
                downloadUrlToFile(global_json.Global.DownloadUrl.Stable, thisScript().path, function(id, status, p1, p2) 
                    if status == dlstatus.STATUS_ENDDOWNLOADDATA then 
                        if SingleUse then sampAddChatMessage(ltu("{dF8D1B}[RepBind.lua] {e6BB24}Reporterių Keybindas paruoštas naudojimui. :)"), 0xe6BB24) SingleUse = false end 
                        lua_thread.create(function() wait(1000) 
                            if doesFileExist(thisScript().directory.."AutoReboot.lua") then 
                                thisScript():unload() 
                            else 
                                thisScript():reload() 
                            end 
                        end) 
                    end 
                end) 
			end) 
		end 
	end) 
    while true do wait(1) end 
end

function ltu(text, code) 
	local encoding = require "encoding" 
	encoding.default = "cp1257" 
	local u8 = encoding.UTF8 
    local ltRaides = {"ą","č","ę","ė","į","š","ų","ū","ž","Ą","Į","Š","Ų","Ū","Ž","Þ"}
	local ltu = {"\xc4\x85","\xc4\x8d","\xc4\x99","\xc4\x97","\xc4\xaf","\xc5\xa1","\xc5\xb3","\xc5\xab","\xc5\xbe","\xc4\x84","\xc4\xae","\xc5\xa0","\xc5\xb2","\xc5\xaa","\xc5\xbd","\xc5\xbd"} 
    for x = 1, #ltu do if string.find(text, ltRaides[x]) then text = string.gsub(text, ltRaides[x], ltu[x]) end end 
	if code=="encode" then text = u8:encode(text) else text = u8:decode(text) end 
	return text 
end 

function jsonread(path) if doesFileExist(path) then local f = io.open(path, 'a+') local data = decodeJson(f:read('*a')) f:close() return data else return {} end end 
function jsonwrite(path, data) if doesFileExist(path) then os.remove(path) end if type(data) ~= 'table' then return end local f = io.open(path, 'a+') local writing_data = encodeJson(data) f:write(writing_data) f:close() end 
