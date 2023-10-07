-- Definitions

-- Functions
local function Lerp(a, b, t)
    return a + (b - a) * t
end

local BezierCurveModule = {}
BezierCurveModule.__index = BezierCurveModule

function BezierCurveModule.new(ControlPoints)
    local self = setmetatable({}, BezierCurveModule)
    self.ControlPoints = ControlPoints
    return self
end

function BezierCurveModule:GetPoint(t)
    local controlPoints = self.ControlPoints
    local n = #controlPoints

    if n == 2 then
        return Lerp(controlPoints[1], controlPoints[2], t)
    end

    local newPoints = {}
    for i = 1, n - 1 do
        newPoints[i] = Lerp(controlPoints[i], controlPoints[i + 1], t)
    end

    return BezierCurveModule.new(newPoints):GetPoint(t)
end

function BezierCurveModule:VisualizeControlPoints(CustomColor :Color3)

    local ControlPoints = self.ControlPoints
    local VisualizePartsFolder = workspace:FindFirstChild("VisualizePartsFolder") or Instance.new("Folder")
    VisualizePartsFolder.Parent = workspace
    VisualizePartsFolder.Name = "VisualizePartsFolder"

    local Color = CustomColor or  Color3.fromRGB(255, 255, 255)

    for i, ControlPoint in pairs(ControlPoints) do

        local VisualizePart = Instance.new("Part")
        VisualizePart.Parent = VisualizePartsFolder
        VisualizePart.Name = "VisualizePart"..i
        VisualizePart.Position = ControlPoint
        VisualizePart.Shape = Enum.PartType.Ball
        VisualizePart.Material = Enum.Material.Neon
        VisualizePart.Size = Vector3.new(1,1,1)
        VisualizePart.Anchored = true
        VisualizePart.CanCollide = false
        VisualizePart.CanTouch = false
        VisualizePart.CanQuery = false
        VisualizePart.Color = Color

    end

end


function BezierCurveModule:DeleteVisualazeParts()

    local VisualizePartsFolder = workspace:FindFirstChild("VisualizePartsFolder")

    if VisualizePartsFolder then
        VisualizePartsFolder:Destroy()
    else
        warn("There is no VisualizePartsFolder")
    end
    
end


return BezierCurveModule
