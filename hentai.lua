local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3')))()

local w = library:CreateWindow("A")

local b = w:CreateFolder("B") 

local me = game.Players.LocalPlayer
 
--vals
local using = false

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

b:Label("Crusaders' Heaven GUI",{
TextSize = 25
TextColor = Color3.fromRGB(255,255,255)
BgColor = Colo3.fromRGB(69,69,69)
})

b:Button("Remove your current stand and use an arrow",function()
    using = true
    use()
end)
