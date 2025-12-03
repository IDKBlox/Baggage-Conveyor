local Dropper = {}
Dropper.__index = Dropper

function Dropper.new(part: BasePart)
    local self = setmetatable({}, Dropper)
    self.Part = part
    return self
end

function Dropper:Activate()
    print("Dropper activated for part: " .. self.Part.Name)
end

return Dropper