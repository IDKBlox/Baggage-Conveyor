local Workspace = game:GetService("Workspace")

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

while true do
    dropperInstance:Activate()
    task.wait(DropTime)
end