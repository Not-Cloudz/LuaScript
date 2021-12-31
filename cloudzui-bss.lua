local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Not-Cloudz/LuaScript/master/uilib.lua"))()
local api = loadstring(game:HttpGet("https://raw.githubusercontent.com/not-weuz/xlpapi/main/api.lua"))()

local CloudzUIWindow = library.new(true)
CloudzUIWindow.ChangeToggleKey(Enum.KeyCode.Semicolon)

local CreditsCategory = CloudzUIWindow:Category("Credits")

-- Credits Category
local Credits = CreditsCategory:Sector("Information")
Credits:Cheat("Label", "-- Thank you for using our script, "..api.nickname)
Credits:Cheat("Label", "-- Script version: 1.0 ")
Credits:Cheat("Label", "-- Place version: "..game.PlaceVersion)
Credits:Cheat("Label", "-- Hide GUI Button: ;")
Credits:Cheat("Label", "-- UI Library : Finity")
Credits:Cheat("Label", "-- API by weuz_ and davidshavrov)
Credits:Cheat("Label", "-- Script by Cloudz")
