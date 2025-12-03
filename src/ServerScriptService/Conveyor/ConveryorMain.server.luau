local Workspace = game:GetService("Workspace")

local DropperPart = Workspace:WaitForChild("Dropper") :: BasePart

local Dropper = require(script.Parent.Dropper)

local dropperInstance = Dropper.new(DropperPart)

while true do
    dropperInstance:Activate()
    task.wait(1)
end