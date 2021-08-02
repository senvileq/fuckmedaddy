local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wally2", true))()

local w = library:CreateWindow("Crusaders' Heaven Gui")

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
wait(5.5)
local summon = game:GetService("ReplicatedStorage").Stands.Summon
summon:FireServer()
using = false
else
if arrow then
fireclickdetector(arrow.ClickDetector)

local pooc = game:GetService("Workspace").Pucci.Pucci
pooc:FireServer()
 wait(0.25)
local arr = game:GetService("ReplicatedStorage").ItemEvent.StandArrow
arr:FireServer()
wait(5.5)
local summon = game:GetService("ReplicatedStorage").Stands.Summon
summon:FireServer()
using = false
elseif not arrow then

end
end
end

w:Section("Functions")
local b = w:Button("Stand Switcher", function()
  if using == true then return end
   using = false
   use()
end)



w:Section("Items")

local t = w:Toggle('Auto Collect Arrows', {flag = "Arrows"})

w:Section("made by senvil#1000")


spawn(function() 
        while wait(0.25) do
            if w.flags.Arrows then
                    for _, item in pairs(game.Workspace:GetDescendants()) do
                      if item.Name == "Stand Arrow" then
                     fireclickdetector(item.ClickDetector)
                   end
                end
            end
        end
    end)
