local player = game.Players.LocalPlayer
local camera = workspace.CurrentCamera
local runService = game:GetService("RunService")
local tracers = {}

local function createTracer()
    local tracer = Drawing.new("Line")
    tracer.Visible = true
    tracer.Color = Color3.new(1, 1, 1)
    tracer.Thickness = 2
    tracer.Transparency = 1
    tracer.ZIndex = 10
    return tracer
end

local function updateTracers()
    for _, otherPlayer in pairs(game.Players:GetPlayers()) do
        if otherPlayer ~= player and otherPlayer.Character and otherPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local tracer = tracers[otherPlayer]
            if not tracer then
                tracer = createTracer()
                tracers[otherPlayer] = tracer
            end
            
            local fromPos = camera:WorldToViewportPoint(player.Character.HumanoidRootPart.Position)
            local toPos = camera:WorldToViewportPoint(otherPlayer.Character.HumanoidRootPart.Position)
            tracer.From = Vector2.new(fromPos.X, fromPos.Y)
            tracer.To = Vector2.new(toPos.X, toPos.Y)
        end
    end
end

local function clearTracers()
    for _, tracer in pairs(tracers) do
        tracer:Remove()
    end
    tracers = {}
end

local function onCharacterAdded(character)
    local hasPass = false
    local success, result = pcall(function()
        return game:GetService("MarketplaceService"):UserOwnsGamePassAsync(player.UserId, gamePassId)
    end)

    if success and result then
        hasPass = true
    end

    if hasPass then
        runService.RenderStepped:Connect(updateTracers)
    end
end

player.CharacterAdded:Connect(onCharacterAdded)

if player.Character then
    onCharacterAdded(player.Character)
end

player.AncestryChanged:Connect(function(_, parent)
    if not parent then
        clearTracers()
    end
end)
