local BezierCurveModule = require(game.ReplicatedStorage:WaitForChild("Modules"):WaitForChild("iyiinsan5555's_BezierCurveModule"))

-- Define your control points as Vector3 values
local controlPoints = {
    Vector3.new(0, 5, 0),
    Vector3.new(10,5,7.5),
    Vector3.new(-15,10,-5.5),
    Vector3.new(-30, 8, 10),
    Vector3.new(35, 50,10),
    Vector3.new(50, 5, -10)
}

local BezierCurve = BezierCurveModule.new(controlPoints)

BezierCurve:VisualizeControlPoints()

task.wait(3)

for i = 0, 1, 0.01 do
    local point = BezierCurve:GetPoint(i)
    
    local part = Instance.new("Part")
    part.Parent = workspace
    part.Position = point
    part.Anchored = true
    part.Size = Vector3.new(1,1,1)
    task.wait()
end


task.wait(5)

BezierCurve:DeleteVisualazeParts()