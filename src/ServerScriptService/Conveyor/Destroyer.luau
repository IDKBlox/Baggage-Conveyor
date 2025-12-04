local CollectionService = game:GetService("CollectionService")
local Debris = game:GetService("Debris")
local TweenService = game:GetService("TweenService")

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
    if hitPart:GetAttribute("Destroying") then return end
    hitPart:SetAttribute("Destroying", true)
    
    hitPart.CanCollide = false
    
    local originalCFrame = hitPart.CFrame
    
    local destroyTween = TweenService:Create(
        hitPart,
        TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In),
        {
            Size = Vector3.new(0.1, 0.1, 0.1),
            Transparency = 1
        }
    )
    
    destroyTween:Play()
    
    task.spawn(function()
        local elapsed = 0
        local duration = 0.4
        while elapsed < duration do
            elapsed += task.wait()
            local alpha = math.min(elapsed / duration, 1)
            hitPart.CFrame = originalCFrame * CFrame.Angles(0, math.rad(360 * alpha * 2), 0)
        end
    end)
    
    Debris:AddItem(hitPart, 0.5)
end

return Destroyer