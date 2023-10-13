--[[
    Setup utility for Rep Binder
    
    > Sukuria papkes
    > Parsiunčia "imgui" lib'ą 
    > Parsiunčia "SampEvents" lib'ą 
    > Parsiunčia "AutoReboot.lua", "SF Integration.lua", "reload_all.lua" papildinius 
    > Parsiunčia "Rep Binder.luac" Stable versija. 

    @Mintaras - 2023-10-13 
]]

local dlstatus = require('moonloader').download_status 

function main()
    repeat wait(0) until isSampAvailable() 
    repeat wait(0) until sampIsLocalPlayerSpawned() 

    if not doesDirectoryExist(thisScript().directory.."/lib/mimgui") then createDirectory(thisScript().directory.."/lib/mimgui") end 
    if not doesDirectoryExist(thisScript().directory.."/lib/samp") then createDirectory(thisScript().directory.."/lib/samp") end 
    if not doesDirectoryExist(thisScript().directory.."/lib/samp/events") then createDirectory(thisScript().directory.."/lib/samp/events") end 
    if not doesDirectoryExist(thisScript().directory.."/config/RepBind") then createDirectory(thisScript().directory.."/config/RepBind") end 

    if not doesFileExist(thisScript().directory.."/lib/imgui.lua") then print("Downloading: ./GTA-SanAndreas/moonloader/lib/imgui.lua") downloadUrlToFile("https://raw.githubusercontent.com/Mintaras1/RepBindJson/main/GTA-SanAndreas/moonloader/lib/imgui.lua", thisScript().directory.."/lib/imgui.lua") end 
    while not doesFileExist(thisScript().directory.."/lib/imgui.lua") do wait(1) end 

	if not doesFileExist(thisScript().directory.."/lib/mimgui/cdefs.lua") then print("/Downloading: ./GTA-SanAndreas/moonloader/lib/mimgui/cdefs.lua") downloadUrlToFile("https://raw.githubusercontent.com/Mintaras1/RepBindJson/main/GTA-SanAndreas/moonloader/lib/mimgui/cdefs.lua", thisScript().directory.."/lib/mimgui/cdefs.lua") end 
    while not doesFileExist(thisScript().directory.."/lib/mimgui/cdefs.lua") do wait(1) end 

	if not doesFileExist(thisScript().directory.."/lib/mimgui/cimguidx9.dll") then print("/Downloading: ./GTA-SanAndreas/moonloader/lib/mimgui/cimguidx9.dll") downloadUrlToFile("https://github.com/Mintaras1/RepBindJson/raw/main/GTA-SanAndreas/moonloader/lib/mimgui/cimguidx9.dll", thisScript().directory.."/lib/mimgui/cimguidx9.dll") end
    while not doesFileExist(thisScript().directory.."/lib/mimgui/cimguidx9.dll") do wait(1) end  

	if not doesFileExist(thisScript().directory.."/lib/mimgui/dx9.lua") then print("/Downloading: ./GTA-SanAndreas/moonloader/lib/mimgui/dx9.lua") downloadUrlToFile("https://github.com/Mintaras1/RepBindJson/raw/main/GTA-SanAndreas/moonloader/lib/mimgui/dx9.lua", thisScript().directory.."/lib/mimgui/dx9.lua") end 
    while not doesFileExist(thisScript().directory.."/lib/mimgui/dx9.lua") do wait(1) end 

	if not doesFileExist(thisScript().directory.."/lib/mimgui/imgui.lua") then print("/Downloading: ./GTA-SanAndreas/moonloader/lib/mimgui/imgui.lua") downloadUrlToFile("https://github.com/Mintaras1/RepBindJson/raw/main/GTA-SanAndreas/moonloader/lib/mimgui/imgui.lua", thisScript().directory.."/lib/mimgui/imgui.lua") end 
    while not doesFileExist(thisScript().directory.."/lib/mimgui/imgui.lua") do wait(1) end 

	if not doesFileExist(thisScript().directory.."/lib/mimgui/init.lua") then print("/Downloading: ./GTA-SanAndreas/moonloader/lib/mimgui/init.lua") downloadUrlToFile("https://github.com/Mintaras1/RepBindJson/raw/main/GTA-SanAndreas/moonloader/lib/mimgui/init.lua", thisScript().directory.."/lib/mimgui/init.lua") end 
    while not doesFileExist(thisScript().directory.."/lib/mimgui/init.lua") do wait(1) end 

    --

	if not doesFileExist(thisScript().directory.."/lib/samp/events.lua") then print("/Downloading: ./GTA-SanAndreas/moonloader/lib/samp/events.lua") downloadUrlToFile("https://github.com/Mintaras1/RepBindJson/raw/main/GTA-SanAndreas/moonloader/lib/samp/events.lua", thisScript().directory.."/lib/samp/events.lua") end 
    while not doesFileExist(thisScript().directory.."/lib/samp/events.lua") do wait(1) end 

	if not doesFileExist(thisScript().directory.."/lib/samp/raknet.lua") then print("/Downloading: ./GTA-SanAndreas/moonloader/lib/samp/raknet.lua") downloadUrlToFile("https://github.com/Mintaras1/RepBindJson/raw/main/GTA-SanAndreas/moonloader/lib/samp/raknet.lua", thisScript().directory.."/lib/samp/raknet.lua") end 
    while not doesFileExist(thisScript().directory.."/lib/samp/raknet.lua") do wait(1) end 

	if not doesFileExist(thisScript().directory.."/lib/samp/synchronization.lua") then print("/Downloading: ./GTA-SanAndreas/moonloader/lib/samp/synchronization.lua") downloadUrlToFile("https://github.com/Mintaras1/RepBindJson/raw/main/GTA-SanAndreas/moonloader/lib/samp/synchronization.lua", thisScript().directory.."/lib/samp/synchronization.lua") end 
    while not doesFileExist(thisScript().directory.."/lib/samp/synchronization.lua") do wait(1) end 

	if not doesFileExist(thisScript().directory.."/lib/samp/events/bitstream_io.lua") then print("/Downloading: ./GTA-SanAndreas/moonloader/lib/samp/events/bitstream_io.lua") downloadUrlToFile("https://github.com/Mintaras1/RepBindJson/raw/main/GTA-SanAndreas/moonloader/lib/samp/events/bitstream_io.lua", thisScript().directory.."/lib/samp/events/bitstream_io.lua") end 
    while not doesFileExist(thisScript().directory.."/lib/samp/events/bitstream_io.lua") do wait(1) end 

	if not doesFileExist(thisScript().directory.."/lib/samp/events/core.lua") then print("/Downloading: ./GTA-SanAndreas/moonloader/lib/samp/events/core.lua") downloadUrlToFile("https://github.com/Mintaras1/RepBindJson/raw/main/GTA-SanAndreas/moonloader/lib/samp/events/core.lua", thisScript().directory.."/lib/samp/events/core.lua") end 
    while not doesFileExist(thisScript().directory.."/lib/samp/events/core.lua") do wait(1) end 

	if not doesFileExist(thisScript().directory.."/lib/samp/events/extra_types.lua") then print("/Downloading: ./GTA-SanAndreas/moonloader/lib/samp/events/extra_types.lua") downloadUrlToFile("https://github.com/Mintaras1/RepBindJson/raw/main/GTA-SanAndreas/moonloader/lib/samp/events/extra_types.lua", thisScript().directory.."/lib/samp/events/extra_types.lua") end 
    while not doesFileExist(thisScript().directory.."/lib/samp/events/extra_types.lua") do wait(1) end 

	if not doesFileExist(thisScript().directory.."/lib/samp/events/handlers.lua") then print("/Downloading: ./GTA-SanAndreas/moonloader/lib/samp/events/handlers.lua") downloadUrlToFile("https://github.com/Mintaras1/RepBindJson/raw/main/GTA-SanAndreas/moonloader/lib/samp/events/handlers.lua", thisScript().directory.."/lib/samp/events/handlers.lua") end 
    while not doesFileExist(thisScript().directory.."/lib/samp/events/handlers.lua") do wait(1) end 

	if not doesFileExist(thisScript().directory.."/lib/samp/events/utils.lua") then print("/Downloading: ./GTA-SanAndreas/moonloader/lib/samp/events/utils.lua") downloadUrlToFile("https://github.com/Mintaras1/RepBindJson/raw/main/GTA-SanAndreas/moonloader/lib/samp/events/utils.lua", thisScript().directory.."/lib/samp/events/utils.lua") end 
    while not doesFileExist(thisScript().directory.."/lib/samp/events/utils.lua") do wait(1) end 

    --

	if not doesFileExist(thisScript().directory.."/AutoReboot.lua") then print("/Downloading: ./GTA-SanAndreas/moonloader/AutoReboot.lua") downloadUrlToFile("https://github.com/Mintaras1/RepBindJson/raw/main/GTA-SanAndreas/moonloader/AutoReboot.lua", thisScript().directory.."/AutoReboot.lua") end 
    while not doesFileExist(thisScript().directory.."/AutoReboot.lua") do wait(1) end 

	if not doesFileExist(thisScript().directory.."/SF Integration.lua") then print("/Downloading: ./GTA-SanAndreas/moonloader/SF Integration.lua") downloadUrlToFile("https://github.com/Mintaras1/RepBindJson/raw/main/GTA-SanAndreas/moonloader/SF Integration.lua", thisScript().directory.."/SF Integration.lua") end 
    while not doesFileExist(thisScript().directory.."/SF Integration.lua") do wait(1) end 

	if not doesFileExist(thisScript().directory.."/reload_all.lua") then print("/Downloading: ./GTA-SanAndreas/moonloader/reload_all.lua") downloadUrlToFile("https://github.com/Mintaras1/RepBindJson/raw/main/GTA-SanAndreas/moonloader/reload_all.lua", thisScript().directory.."/reload_all.lua") end 
    while not doesFileExist(thisScript().directory.."/reload_all.lua") do wait(1) end 

    --

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
                                reloadScripts()
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
