local CollectionService = game:GetService("CollectionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local ClickedBaggageEvent = ReplicatedStorage:WaitForChild("ClickedBaggage") :: RemoteEvent

local mouse = game.Players.LocalPlayer:GetMouse()

local clickedBaggage: BasePart? = nil

mouse.Button1Down:Connect(function()
    if clickedBaggage then
        ClickedBaggageEvent:FireServer(clickedBaggage)
        local baggageId = clickedBaggage.Name:match("%d+$")
        print(baggageId)
    end
end)

RunService.Heartbeat:Connect(function()
    local target = mouse.Target
    if target and CollectionService:HasTag(target, "Baggage") then
        clickedBaggage = target
    else
        clickedBaggage = nil
    end
end)

