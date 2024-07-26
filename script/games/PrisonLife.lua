local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("PrisonUltimate", "Synapse")
local Tab = Window:NewTab("Prison Life Scripts")
local Section = Tab:NewSection(" ")
Section:NewButton("Tiger Admin", " ", function()
-- soon
end)
Section:NewButton("Prisonware", " ", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Denverrz/scripts/master/PRISONWARE_v1.3.txt"))();
end)
Section:NewButton("Prizzlife", " ", function()
-- soon
end)
