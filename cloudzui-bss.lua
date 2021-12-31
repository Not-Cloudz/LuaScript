shared.notify = true
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Not-Cloudz/LuaScript/master/uilib.lua"))()
local api = loadstring(game:HttpGet("https://raw.githubusercontent.com/not-weuz/xlpapi/main/api.lua"))()

local playerstatsevent = game:GetService("ReplicatedStorage").Events.RetrievePlayerStats
local statstable = playerstatsevent:InvokeServer()
local monsterspawners = game:GetService("Workspace").MonsterSpawners

local temptable = {
    version = "1.0",
    magnitude = 60,
    tokensfarm = false,
    converting = false
    },
    cache = {
        autofarm = false,
  }
    

local cloudzui = {
    toggles = {
        autofarm = false,
        farmclosestleaf = false,
        farmbubbles = false,
        autodig = false,
        farmflower = false,
        loopfarmspeed = false,
        farmcoco = false,
        farmflame = false,
        farmclouds = false,
        enabletokenblacklisting = false,
        donotfarmtokens = false
    },
    vars = {
        field = "Rose Field",
        convertat = 100,
        farmspeed = 60,
        prefer = "Tokens",
        walkspeed = 70,
        jumppower = 70,
        farmtype = "Walk"
    }
}

function statsget() local StatCache = require(game.ReplicatedStorage.ClientStatCache) local stats = StatCache:Get() return stats end


function disableall()
    if cloudzui.toggles.autofarm and not temptable.converting then
        temptable.cache.autofarm = true
        cloudzui.toggles.autofarm = false
    end
end

function enableall()
    if temptable.cache.autofarm then
        cloudzui.toggles.autofarm = true
        temptable.cache.autofarm = false
    end
end

function gettoken()
    task.wait()
    if temptable.running == false then
        for e,r in next, game:GetService("Workspace").Collectibles:GetChildren() do
            itb = false
            if r:FindFirstChildOfClass("Decal") and cloudzui.toggles.enabletokenblacklisting then
                if api.findvalue(kocmoc.bltokens, string.split(r:FindFirstChildOfClass("Decal").Texture, 'rbxassetid://')[2]) then
                    itb = true
                end
            end
            if r.Name == game.Players.LocalPlayer.Name and not r:FindFirstChild("got it") or tonumber((r.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude) <= temptable.magnitude and not r:FindFirstChild("got it") and not itb then
                farm(r) local val = Instance.new("IntValue",r) val.Name = "got it" break
            end
        end
    end
end

function converthoney()
    if temptable.converting then
        while game.Players.LocalPlayer.CoreStats.Pollen.Value > 1 and task.wait(1) and temptable.converting do
            if game.Players.LocalPlayer.CoreStats.Pollen.Value > 1 and temptable.converting and game.Players.LocalPlayer.PlayerGui.ScreenGui.ActivateButton.TextBox.Text ~= "Stop Making Honey" and game.Players.LocalPlayer.PlayerGui.ScreenGui.ActivateButton.BackgroundColor3 ~= Color3.new(201, 39, 28) or game.Players.LocalPlayer.CoreStats.Pollen.Value > 1 and temptable.converting and (game:GetService("Players").LocalPlayer.SpawnPos.Value.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 5 and shouldiconvertballoonnow then
                api.tween(1, game:GetService("Players").LocalPlayer.SpawnPos.Value * CFrame.fromEulerAnglesXYZ(0, 110, 0))
                game:GetService("ReplicatedStorage").Events.PlayerHiveCommand:FireServer("ToggleHoneyMaking")
            elseif game.Players.LocalPlayer.CoreStats.Pollen.Value < 1 then
                task.wait(6)
                if game.Players.LocalPlayer.CoreStats.Pollen.Value < 1 then temptable.converting = false end
            end
        end
    end
end

function closestleaf()
    for i,v in next, game.Workspace.Flowers:GetChildren() do
        if temptable.running == false and tonumber((v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude) < temptable.magnitude then
            farm(v)
            break
        end
    end
end

function getbubble()
    for i,v in next, game.workspace.Particles:GetChildren() do
        if string.find(v.Name, "Bubble") and temptable.running == false and tonumber((v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude) < temptable.magnitude then
            farm(v)
            break
        end
    end
end

function getflower()
    flowerrrr = flowertable[math.random(#flowertable)]if tonumber((flowerrrr-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude) <=temptable.magnitude then if temptable.running == false then if cloudzui.toggles.loopfarmspeed then game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = cloudzui.vars.farmspeed end api.walkTo(flowerrrr) end end
end

function getcloud()
    for i,v in next, game:GetService("Workspace").Clouds:GetChildren() do
        e = v:FindFirstChild("Plane")
        if e and temptable.running == false and tonumber((e.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude) < temptable.magnitude then
            farm(e)
            break
        end
    end
end

function getcoco()
    for i,v in next, game.workspace.Particles:GetChildren() do
        if v.Name == "WarningDisk" and v.BrickColor == BrickColor.new("Lime green") and temptable.running == false and tonumber((v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude) < temptable.magnitude then
            farm(v)
            break
        end
    end
end

function getflame()
    for i,v in next, game.workspace.Particles:GetChildren() do
        if v.Name == "FlamePart" and temptable.running == false and tonumber((v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude) < temptable.magnitude then
            farm(v)
            break
        end
    end
end

local defaultcloudzui = cloudzui

local CloudzUIWindow = library.new(true)
CloudzUIWindow.ChangeToggleKey(Enum.KeyCode.Semicolon)

local CreditsCategory = CloudzUIWindow:Category("Credits")
local FarmingCategory = CloudzUIWindow:Category("Farming")

-- Credits Category
local Credits = CreditsCategory:Sector("Information")
Credits:Cheat("Label", "-- Thank you for using our script, "..api.nickname)
Credits:Cheat("Label", "-- Script version : "..temptable.version)
Credits:Cheat("Label", "-- Place version : "..game.PlaceVersion)
Credits:Cheat("Label", "-- Hide GUI Button : ;")
Credits:Cheat("Label", "-- UI Library : Finity")
Credits:Cheat("Label", "-- API by weuz_ and davidshavrov")
Credits:Cheat("Label", "-- Script by Cloudz")

-- Farming Category
local Farming = FarmingCategory:Sector(Farming)
Farming:Cheat("Dropdown", "Field", function(Option) temptable.tokensfarm = false cloudzui.vars.field = Option end, {options=fieldstable})
Farming:Cheat("Slider", "Convert at :", function(Value) cloudzui.vars.convertat = Value end, {min = 0, max = 100, suffix = "%"})
Farming:Cheat("Checkbox", "Autofarm", function(State) cloudzui.toggles.autofarm = not cloudzui.toggles.autofarm end)
Farming:Cheat("Checkbox", "Autodig", function(State) cloudzui.toggles.autodig = not cloudzui.toggles.autodig end)
Farming:Cheat("Checkbox", "Farm Bubbles", function(State) cloudzui.toggles.farmbubbles = not cloudzui.toggles.farmbubbles end)
Farming:Cheat("Checkbox", "Farm Flames", function(State) cloudzui.toggles.farmflame = not cloudzui.toggles.farmflame end)
Farming:Cheat("Checkbox", "Farm Coconuts", function(State) cloudzui.toggles.farmcoco = not cloudzui.toggles.farmcoco end)
Farming:Cheat("Checkbox", "Farm Clouds", function(State) kcloudzui.toggles.farmclouds = not cloudzui.toggles.farmclouds end)
Farming:Cheat("Checkbox", "Farm Closest Leaves", function(State) cloudzui.toggles.farmclosestleaf = not cloudzui.toggles.farmclosestleaf end)
