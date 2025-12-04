local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local ChangeDropTimeEvent = ReplicatedStorage:WaitForChild("ChangeDropTime") :: RemoteEvent

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")
local VariableControllerGui = PlayerGui:WaitForChild("VariableControllerGui")

local UIDragDetector = VariableControllerGui:FindFirstChild("UIDragDetector", true) :: UIDragDetector
local Button = UIDragDetector.Parent :: TextButton
local Parent = Button.Parent :: Frame

local Range = {Min = 0.05, Max = 2}
local CurrentValue = 1

local function updateValueFromPosition()
    local buttonCenterX = Button.AbsolutePosition.X + (Button.AbsoluteSize.X / 2)
	local parentCenterX = Parent.AbsolutePosition.X + (Parent.AbsoluteSize.X / 2)
	local draggableHalfWidth = (Parent.AbsoluteSize.X - Button.AbsoluteSize.X) / 2

   	local normalizedPos = (buttonCenterX - parentCenterX) / draggableHalfWidth
	normalizedPos = math.clamp(normalizedPos, -1, 1)

    if normalizedPos < 0 then
		CurrentValue = 1 + (normalizedPos * (1 - Range.Min))
	else
		CurrentValue = 1 + (normalizedPos * (Range.Max - 1))
	end
    Button.Text = string.format("%.2f", CurrentValue)
end

UIDragDetector.DragStart:Connect(function()
    Button.TextTransparency = 0.5
end)

UIDragDetector.DragContinue:Connect(function()
    updateValueFromPosition()
end)

UIDragDetector.DragEnd:Connect(function()
    updateValueFromPosition()
    ChangeDropTimeEvent:FireServer(CurrentValue)
    Button.TextTransparency = 0
end)