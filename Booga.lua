--loadstring(game:HttpGet(('https://pastebin.com/raw/rd7xYZ86'),true))()
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/norapichx/Ui/main/Turtle.lua"))()

local P1 = library:Window("MAIN")
local P2 = library:Window("Craft")
local P3 = library:Window("Drop Item")
local P4 = library:Window("Teleport")

library:Keybind("P")

local Tbl = {}
for i,v in pairs(game:GetService("Players"):GetPlayers()) do
    Tbl[i] = v.Name
end


P1:Dropdown("Players", Tbl, function(Player)
    _G.Plr = Player
    return
end)

P1:Button("TP On", function(x)
        print("Tp On")
        Tkill = x
        if Tkill == false then return end
        while Tkill do wait()
        local lplayer = game:GetService("Players").LocalPlayer
        --local runService = game:GetService('RunService')
        --_G.TP = runService.Stepped:Connect(function()
        lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[_G.Plr].Character.HumanoidRootPart.CFrame*CFrame.new(-1, 0, 2.2)
        if game:GetService("Players")[_G.Plr].Character.Humanoid.Health <= 0 or nil then
            Tkill = false
        end
    end
     --end)
end)
P1:Button("TP Off", function(x)
print("Tp Off")
Tkill = false
-- _G.TP:Disconnect()
end)
-- P1:Toggle("View", false, function(x)
--     View = x
-- if View == true then
-- if game:GetService("Players")[_G.Plr].Character.Humanoid then
--     game:GetService("Workspace").CurrentCamera.CameraSubject = game:GetService("Players")[_G.Plr].Character.Humanoid
-- else
--     game:GetService("Workspace").CurrentCamera.CameraSubject = game:GetService("Players")[_G.Plr].Character.Head
-- end
-- end
-- if View == false then
--     if lplayer.Character.Humanoid then
--         game:GetService("Workspace").CurrentCamera.CameraSubject = lplayer.Character.Humanoid
--     else
--         game:GetService("Workspace").CurrentCamera.CameraSubject = lplayer.Character.Head
--     end
-- end
-- end)
P1:Label("--------------------------------", Color3.fromRGB(255, 255, 255))
P1:Button("Bring On", function(x)
    print("Bring On")
    local lplayer = game:GetService("Players").LocalPlayer
    local runService = game:GetService('RunService')
    _G.TP = runService.Stepped:Connect(function()
        game:GetService("Players")[_G.Plr].Character.HumanoidRootPart.CFrame = lplayer.Character.HumanoidRootPart.CFrame*CFrame.new(0, 2.5, -15)
 end)
end)
P1:Button("Bring Off", function(x)
print("Bring Off")
_G.TP:Disconnect()
end)
P1:Label("--------------------------------", Color3.fromRGB(255, 255, 255))

P1:Toggle("Auto Heal (BloodFruit)", false, function(x)
    Heal = x
    if Heal == false then return end
        while Heal do wait()
local lplayer = game:GetService("Players").LocalPlayer
if lplayer.Character.Humanoid.Health <= 95 then
local food = "Bloodfruit"
local Event = game:GetService("ReplicatedStorage").Events.UseBagItem
Event:FireServer(food)
end
end
end)

P2:Button("Crystal Stick", function(x)
local Item = "Crystal Stick"
local Event = game:GetService("ReplicatedStorage").Events.CraftItem
Event:FireServer(Item)
end)
P2:Button("Magnetite Stick", function(x)
    local Item = "Magnetite Stick"
    local Event = game:GetService("ReplicatedStorage").Events.CraftItem
    Event:FireServer(Item)
    end)
P2:Button("Magnetite Axe", function(x)
    local Item = "Magnetite Axe"
    local Event = game:GetService("ReplicatedStorage").Events.CraftItem
    Event:FireServer(Item)
    end)
P2:Button("Magnetite Pick", function(x)
    local Item = "Magnetite Pick"
    local Event = game:GetService("ReplicatedStorage").Events.CraftItem
    Event:FireServer(Item)
    end)
P2:Button("Magnetite Crossbow", function(x)
    local Item = "Magnetite Crossbow"
    local Event = game:GetService("ReplicatedStorage").Events.CraftItem
    Event:FireServer(Item)
    end)
P2:Button("Magnetite Mask", function(x)
    local Item = "Magnetite Mask"
    local Event = game:GetService("ReplicatedStorage").Events.CraftItem
    Event:FireServer(Item)
    end)
P2:Button("Magnetite Greaves", function(x)
    local Item = "Magnetite Greaves"
    local Event = game:GetService("ReplicatedStorage").Events.CraftItem
    Event:FireServer(Item)
    end)
P2:Button("Magnetite Chestplate", function(x)
    local Item = "Magnetite Chestplate"
    local Event = game:GetService("ReplicatedStorage").Events.CraftItem
    Event:FireServer(Item)
    end)

P3:Box("Item", function(x)
    _G.item = x
end)
P3:Toggle("Drop", false, function(x)
    Drops = x
    if Drops == false then return end
while Drops do wait()
local item = tostring(_G.item)
game.ReplicatedStorage.Events.DropBagItem:FireServer(item)
end
end)


P4:Button("Ancient Tree", function(x)
    local plr = game.Players.LocalPlayer
	local char = plr.Character
	local root = char.HumanoidRootPart
	wait()
	local pos = Vector3.new(-480, -4, -1240)
	local time = 0.1
	local increment = 2
	local debounce = false
	local diff = pos-root.Position
	local mag = diff.magnitude
	local heading = CFrame.new(root.Position, pos).lookVector
	local function movetolocation()
		if debounce then return end
		debounce = true
		for a = 0, mag, increment do
			if cancelmove then
				print("Stopped moving to location")
				break
			end
			root.Anchored = false
			root.CFrame = root.CFrame + (heading * increment)
			wait( (time/mag) * increment )
		end
		debounce = false
		root.Anchored = true
	end
	wait()
	movetolocation()
	root.Anchored = false

	for i = 1,350 do
		if cancelmove then
			break
		end
		wait()
		root.Anchored = true
		root.CFrame = CFrame.new(root.CFrame.x, root.CFrame.y +1 , root.CFrame.z)
	end
	root.Anchored = false
    end)
