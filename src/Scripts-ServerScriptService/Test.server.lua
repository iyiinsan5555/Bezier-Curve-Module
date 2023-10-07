local BezierCurve = require(game.ReplicatedStorage:WaitForChild("Modules"):WaitForChild("iyiinsan5555's_BezierCurveModule"))

-- Define your control points as Vector3 values
local controlPoints = {
    Vector3.new(0, 5, 0),
    Vector3.new(10,5,7.5),
    Vector3.new(-15,10,-5.5),
    Vector3.new(-30, 8, 10),
    Vector3.new(35, 50,10)
}

local bezier = BezierCurve.new(controlPoints)

bezier:VisualizeControlPoints()

task.wait(3)

for i = 0, 10, 0.1 do
    local t = i / 10
    local point = bezier:GetPoint(t)
    
    local part = Instance.new("Part")
    part.Parent = workspace
    part.Position = point
    part.Anchored = true
    part.Size = Vector3.new(1,1,1)
    task.wait()
end


task.wait(5)

bezier:DeleteVisualazeParts()