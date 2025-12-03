local CollectionService = game:GetService("CollectionService")

local Destroyer = {}
Destroyer.__index = Destroyer

function Destroyer.new(part: BasePart)
    local self = setmetatable({}, Destroyer)
    self.Part = part

    part.Touched:Connect(function(hitPart)
        local isBaggage = CollectionService:HasTag(hitPart, "Baggage")
        if isBaggage then
            self:OnActivate(hitPart)
        end
    end)
    return self
end

function Destroyer:OnActivate(hitPart: BasePart)
    print("Destroyer activated for part: " .. self.Part.Name .. ", destroying: " .. hitPart.Name)
    hitPart:Destroy()
end

return Destroyer