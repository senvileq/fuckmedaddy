local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3')))()

local w = library:CreateWindow("Crusaders' Heaven Gui")

local functions = w:CreateFolder("Functions")
local items = w:CreateFolder("Items")
local credits = w:CreateFolder("Credits")

local me = game.Players.LocalPlayer
 
--vals
local using = false
local collectArrow = false

function use()
local arrow = game.Workspace:FindFirstChild("Stand Arrow")
if me.Backpack:FindFirstChild("Stand Arrow") then
local pooc = game:GetService("Workspace").Pucci.Pucci
pooc:FireServer()
  wait(0.25)
local arr = game:GetService("ReplicatedStorage").ItemEvent.StandArrow
arr:FireServer()
wait(5)
using = false
else
if arrow then
fireclickdetector(arrow.ClickDetector)

local pooc = game:GetService("Workspace").Pucci.Pucci
pooc:FireServer()
 wait(0.25)
local arr = game:GetService("ReplicatedStorage").ItemEvent.StandArrow
arr:FireServer()
wait(5)
using = false
elseif not arrow then

end
end
end

functions:Button("Stand Switcher",function()
    using = true
    use()
end)

items:Label("Auto Collect",{
TextSize = 15;
TextColor = Color3.fromRGB(255,255,255);
BgColor = Color3.fromRGB(69,69,69);
})

items:Toggle("Arrows", {flag = "AutoArrow"}))

items:Label("soon xd!!",{
TextSize = 15;
TextColor = Color3.fromRGB(255,255,255);
BgColor = Color3.fromRGB(69,69,69);
})


credits:Label("made by senvil#1505",{
TextSize = 10;
TextColor = Color3.fromRGB(255,255,255);
BgColor = Color3.fromRGB(69,69,69);
})

if items.flags.AutoArrow then
 while true do
      wait()
 for _, item in pairs(game.Workspace:GetDescendants()) do
    if item.Name == "Stand Arrow" then
        fireclickdetector(item.ClickDetector)
    end
end
  end
 end
