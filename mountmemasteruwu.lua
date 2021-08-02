--[made by senvil#1505, ur mom and StrayCat#5898]
local library = loadstring(game:HttpGet("https://pastebin.com/raw/vcAve8Vi", true))()
local MOTG = library:CreateWindow({text = "mount of the niggers"})

_G.JoinLogs = false
repStrg = game:GetService("ReplicatedStorage")
plrs = game:GetService("Players")
plr = plrs.LocalPlayer
resources = repStrg.Resources
remotes = resources.Remotes
banList = {}
local ItemAmount = 1
local MobAmount = 1
local IslandAmount = 1

local function sendNotification(title, text, icon)
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = tostring(title),
		Text = tostring(text),
		Icon = tostring(icon)
	})
end

local function detectInput(path, input)
	for _, detect in pairs(path:GetChildren()) do
		if string.lower(string.sub(detect.Name, 1, #input)) == string.lower(input) then
			return detect
		end
	end
end

local function checkStat(stat)
	statAmount = 0
	for _, comp in pairs(plr.PlayerGui.HUD[stat]:GetChildren()) do
		if comp:IsA("Frame") and comp.BackgroundColor3 ~= Color3.fromRGB(255, 97, 56) then
			if comp.Size == UDim2.new(0, 15, 0, 15) then
				statAmount = statAmount + 1
			end
		end
	end
	return statAmount
end

local function convertString(obj)
	segments=obj:split(".")
	current=game

	for _, v in pairs(segments) do
		current=current[v]
	end
	return current
end

local function inputPlayer(input, remote, ...)
	if string.lower(input) == "all" then
		for _, playa in pairs(plrs:GetPlayers()) do
			remote:FireServer(playa, ...)
		end
	elseif string.lower(input) == "others" then
		for _, playa in pairs(plrs:GetPlayers()) do
			if playa ~= plr then
				remote:FireServer(playa, ...)
			end
		end
	elseif string.lower(input) == "me" then
		remote:FireServer(plr, ...)
	else
		input = detectInput(plrs, input)
		remote:FireServer(input, ...)
	end
end

local function returnState(bool)
	if bool == true then
		return "Enabled"
	elseif bool == false then
		return "Disabled"
	end
end

resources.Bindables.Notify:Fire(
	"uwu",
	"made with ur mom, senvil#1000",
	Color3.new(0.2, 0.78, 0.3)
)

MOTG:AddToggle("Join Logs", function(bool)
	_G.JoinLogs = bool
	wait(0.1)
	sendNotification("Notification Log", "Join Logs: " .. returnState(_G.JoinLogs), "rbxthumb://type=Asset&id=36997136&w=150&h=150")
end)

MOTG:AddToggle("Pause Time", function(bool)
	remotes.ToggleTimer:FireServer(bool)
	wait(0.1)
	sendNotification("Notification Log", "Pause Time: " .. returnState(repStrg.TimerPaused.Value), "rbxthumb://type=Asset&id=36997136&w=150&h=150")
end)

MOTG:AddToggle("PVP", function(bool)
	remotes.TogglePVP:FireServer(bool)
	wait(0.1)
	sendNotification("Notification Log", "PVP: " .. returnState(repStrg.PVP.Value), "rbxthumb://type=Asset&id=36997136&w=150&h=150")
end)

MOTG:AddLabel(" ---------------")

MOTG:AddButton("Increase Stats", function()
	remotes.InteractItem:FireServer("Use",resources.Items["Maxthirst Potion"])
	remotes.InteractItem:FireServer("Use",resources.Items["Maxhunger Potion"])
	remotes.InteractItem:FireServer("Use",resources.Items["Maxstamina Potion"])
	remotes.InteractItem:FireServer("Use",resources.Items["Maxhealth Potion"])
end)

MOTG:AddButton("Refill Health", function()
	repeat
		remotes.InteractItem:FireServer("Use", resources.Items["Maxhealth Potion"])
		wait()
	until plr.Character.Humanoid.Health == plr.Character.Humanoid.MaxHealth
end)


MOTG:AddButton("Chop Trees", function()
	for _, tree in pairs(workspace.Plants:GetChildren()) do
		if type(string.find(tree.Name, "Tree")) or type(string.find(tree.Name, "Palm")) == "number" then
			remotes.ChopTree:FireServer(tree)
		end
	end
end)

MOTG:AddButton("Break Rocks", function()
	for _, rock in pairs(workspace.Rocks:GetChildren()) do
		remotes.BreakRock:FireServer(rock)
	end
end)

MOTG:AddButton("End Season", function()
	remotes.EndSeason:FireServer()
end)

MOTG:AddBox("Island Amount", function(object, focus)
	if focus then
		IslandAmount = tonumber(object.Text)
	end
end)

MOTG:AddButton("Raise Island", function()
	for i = 1, IslandAmount do
		remotes.RaiseIsland:FireServer()
		wait(0.1)
	end
end)

MOTG:AddLabel(" ---------------")

MOTG:AddBox("Spawn Player", function(object, focus)
	if focus then
		inputPlayer(object.Text, remotes.Spawn, player, nil)
	end
end)

MOTG:AddBox("Kill Player", function(object, focus)
	if focus then
		if repStrg.PVP.Value == false then
			sendNotification("Notification Log", "PVP Is Disabled", "rbxthumb://type=Asset&id=36997136&w=150&h=150")
			return
		else
			inputPlayer(object.Text, remotes.DamagePlayer, math.huge)
		end
	end
end)

MOTG:AddBox("God Player", function(object, focus)
	if focus then
		if repStrg.PVP.Value == false then
			sendNotification("Notification Log", "PVP Is Disabled", "rbxthumb://type=Asset&id=36997136&w=150&h=150")
			return
		else
			inputPlayer(object.Text, remotes.DamagePlayer, -math.huge)
		end
	end
end)

MOTG:AddBox("Kick Player", function(object, focus)
	if focus then
		player = detectInput(plrs, object.Text)
		inputPlayer(object.Text, remotes.DestroyItem, player)
		sendNotification("Notification Log", player.Name .. " Was Kicked", plrs:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420))
	end
end)

MOTG:AddBox("Ban Player", function(object, focus)
	if focus then
		if _G.JoinLogs == false then
			sendNotification("Notification Log", "Join Logs Are Disabled", "rbxthumb://type=Asset&id=36997136&w=150&h=150")
		else
			player = detectInput(plrs, object.Text)
			banList[player.Name] = true
			remotes.DestroyItem:FireServer(player)
			sendNotification("Notification Log", player.Name .. " Was Banned", plrs:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420))
		end
	end
end)

plrs.PlayerAdded:Connect(function(plr)
	if _G.JoinLogs == true then
		sendNotification("Notification Log", plr.Name .. " Has Joined", plrs:GetUserThumbnailAsync(plr.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420))
		if banList[plr.Name] == true then
			remotes.DestroyItem:FireServer(plr)
			sendNotification("Notification Log", plr.Name .. " Was Kicked", plrs:GetUserThumbnailAsync(plr.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420))
			return
		end
	else
	end
end)

MOTG:AddBox("Equip Mask", function(object, focus)
	if focus then
		mask = detectInput(resources.Hats, object.Text)
		remotes.EquipMask:FireServer(tostring(mask))
	end
end)

MOTG:AddBox("Destroy Item", function(object, focus)
	if focus then
		item = convertString(object.Text)
		remotes.DestroyItem:FireServer(item)
	end
end)

MOTG:AddBox("Use Item", function(object, focus)
	if focus then
		item = detectInput(resources.Items, object.Text)
		remotes.InteractItem:FireServer("Use", item)
	end
end)

MOTG:AddBox("Play Music", function(object, focus)
	if focus then
		for _, sound in pairs(game:GetService("SoundService"):GetChildren()) do
			remotes.DestroyItem:FireServer(sound)
		end
		remotes.PlaySound:FireServer("rbxassetid://"..tonumber(object.Text),game.SoundService)
	end
end)

MOTG:AddLabel(" ---------------")

MOTG:AddBox("Item Name", function(object, focus)
	if focus then
		ItemRequest = detectInput(resources.Items, object.Text)
	end
end)

MOTG:AddBox("Item Amount", function(object, focus)
	if focus then
	ItemAmount = tonumber(object.Text)
	end
end)

MOTG:AddButton("Spawn Items", function()
	for i = 1, ItemAmount do
		remotes.MakeItem:FireServer(tostring(ItemRequest),(plr.Character.Head.CFrame * CFrame.new(0,5.5,0)).p)
		wait(0.050)
	end
end)

MOTG:AddButton("Clear Items", function()
	for _, item in pairs(workspace.Items:GetChildren()) do
		remotes.DestroyItem:FireServer(item)
	end
end)

MOTG:AddLabel(" ---------------")

MOTG:AddBox("Animal Name", function(object, focus)
	if focus then
		MobRequest = detectInput(resources.Animals, object.Text)
	end
end)

MOTG:AddBox("Animal Amount", function(object, focus)
	if focus then
		MobAmount = tonumber(object.Text)
	end
end)

MOTG:AddButton("Spawn Animals", function()
	for i = 1, MobAmount do
		remotes.MakeAnimal:FireServer(tostring(MobRequest),(plr.Character.Head.CFrame * CFrame.new(0,5.5,0)).p)
		wait(0.050)
	end
end)

MOTG:AddButton("Kill Animals", function()
	for _, animal in pairs(workspace.Animals:GetChildren()) do
		game.ReplicatedStorage.Resources.Remotes.DamageAnimal:FireServer(animal, 20000)
	end
end)

MOTG:AddButton("God Animals", function()
	for _, animal in pairs(workspace.Animals:GetChildren()) do
		remotes.DamageAnimal:FireServer(animal, -math.huge)
	end
end)
