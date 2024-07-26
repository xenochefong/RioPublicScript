local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Camera = game.Workspace.CurrentCamera

local function getNearestPlayer()
    local nearestPlayer = nil
    local shortestDistance = math.huge

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local distance = (LocalPlayer.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
            if distance < shortestDistance then
                nearestPlayer = player
                shortestDistance = distance
            end
        end
    end

    return nearestPlayer
end

local function updateAimbot()
    if LocalPlayer:GetAttribute("HasAimbot") then
        local targetPlayer = getNearestPlayer()
        if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local targetPosition = targetPlayer.Character.HumanoidRootPart.Position
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, targetPosition)
        end
    end
end

RunService.RenderStepped:Connect(function()
    updateAimbot()
end)

while true do
    wait(5)
    updateAimbot()
end
