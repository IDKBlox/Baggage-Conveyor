local CollectionService = game:GetService("CollectionService")
local ServerStorage = game:GetService("ServerStorage")


local Dropper = {}
Dropper.__index = Dropper

function Dropper.new(part: BasePart)
    local self = setmetatable({}, Dropper)
    self.Part = part

    self.BaggageCount = 0

    local baggage = ServerStorage:FindFirstChild("Baggage") :: BasePart
    assert(baggage, "No `Baggage` part found in ServerStorage, Create one to use the Dropper")

    self.BaggageTemplate = baggage
    return self
end

function Dropper:Activate()
    -- print("Dropper activated for part: " .. self.Part.Name)
    local newBaggage = self.BaggageTemplate:Clone()

    local randomizeColor = Color3.new(math.random(), math.random(), math.random())
    local randomMaterial = Enum.Material:GetEnumItems()[math.random(1, #Enum.Material:GetEnumItems())]

    newBaggage.Material = randomMaterial
    newBaggage.Color = randomizeColor
    
    self.BaggageCount  += 1
    newBaggage.Name = string.format("Baggage_%s_%d", self.Part.Name, self.BaggageCount)
    CollectionService:AddTag(newBaggage, "Baggage")
    newBaggage.CFrame = self.Part.CFrame * CFrame.new(0, -self.Part.Size.Y / 2 - newBaggage.Size.Y / 2, 0)
    newBaggage.Parent = self.Part.Parent
end

return Dropper