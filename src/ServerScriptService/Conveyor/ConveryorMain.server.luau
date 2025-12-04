local CollectionService = game:GetService("CollectionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

local ChangeDropTimeEvent = ReplicatedStorage:WaitForChild("ChangeDropTime") :: RemoteEvent
local ClickedBaggageEvent = ReplicatedStorage:WaitForChild("ClickedBaggage") :: RemoteEvent


type DropperType = {
    Part: BasePart,
    Activate: () -> (),
}

local DropTime = 1

local DropperPart = Workspace:WaitForChild("Dropper") :: BasePart
local DestroyerPart = Workspace:WaitForChild("Destroyer") :: BasePart

local Dropper = require(script.Parent.Dropper)
local Destroyer = require(script.Parent.Destroyer)

local dropperInstance = Dropper.new(DropperPart) :: DropperType
Destroyer.new(DestroyerPart)

ChangeDropTimeEvent.OnServerEvent:Connect(function(player: Player, newDropTime: number)
    print("Received new drop time from player " .. player.Name .. ": " .. tostring(newDropTime))
    local owner = CollectionService:GetTagged("Owner")[1] :: Player
    if owner ~= nil and player ~= owner then
        print("Player " .. player.Name .. " is not the owner. Ignoring drop time change.")
        return
    end
    CollectionService:AddTag(player, "Owner")

    DropTime = newDropTime
end)

ClickedBaggageEvent.OnServerEvent:Connect(function(player: Player, baggagePart: BasePart)
     local baggageId = baggagePart.Name:match("%d+$")
    print(baggageId)
end)

while true do
    dropperInstance:Activate()
    task.wait(DropTime)
end