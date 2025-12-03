local CollectionService = game:GetService("CollectionService")
local ServerStorage = game:GetService("ServerStorage")


local Dropper = {}
Dropper.__index = Dropper

function Dropper.new(part: BasePart)
    local self = setmetatable({}, Dropper)
    self.Part = part

    local baggage = ServerStorage:FindFirstChild("Baggage") :: BasePart
    assert(baggage, "No `Baggage` part found in ServerStorage, Create one to use the Dropper")

    self.BaggageTemplate = baggage
    return self
end

function Dropper:Activate()
    print("Dropper activated for part: " .. self.Part.Name)

    local newBaggage = self.BaggageTemplate:Clone()
    CollectionService:AddTag(newBaggage, "Baggage")
    newBaggage.CFrame = self.Part.CFrame * CFrame.new(0, -self.Part.Size.Y / 2 - newBaggage.Size.Y / 2, 0)
    newBaggage.Parent = self.Part.Parent
end

return Dropper