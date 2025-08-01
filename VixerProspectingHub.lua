local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Play the sound once
if not playerGui:FindFirstChild("IdiotSound") then
    local sound = Instance.new("Sound", playerGui)
    sound.SoundId = "rbxassetid://301964312" -- "You are an idiot" sound
    sound.Volume = 1
    sound.Looped = true
    sound.Name = "IdiotSound"
    sound:Play()
end

-- Function to spawn the bouncing popup
local function spawnPopup()
    local gui = Instance.new("ScreenGui", playerGui)
    gui.ResetOnSpawn = false

    local frame = Instance.new("Frame", gui)
    frame.Size = UDim2.new(0, 300, 0, 150)
    frame.BackgroundColor3 = Color3.new(0, 0, 0)
    frame.Position = UDim2.new(0.5, -150, 0.5, -75) -- Centered
    frame.BorderSizePixel = 0
    frame.Name = "IdiotWindow"

    local text = Instance.new("TextLabel", frame)
    text.Size = UDim2.new(1, 0, 0.6, 0)
    text.BackgroundTransparency = 1
    text.Text = "YOU ARE AN IDIOT ☻☻☻"
    text.TextColor3 = Color3.new(1, 1, 1)
    text.Font = Enum.Font.Arcade
    text.TextScaled = true

    local close = Instance.new("TextButton", frame)
    close.Size = UDim2.new(0, 30, 0, 30)
    close.Position = UDim2.new(1, -35, 0, 5)
    close.BackgroundColor3 = Color3.new(1, 0, 0)
    close.Text = "X"
    close.TextColor3 = Color3.new(1, 1, 1)
    close.Font = Enum.Font.ArialBold
    close.TextScaled = true

    close.MouseButton1Click:Connect(function()
        spawnPopup()
        spawnPopup()
    end)

    -- Bouncing animation
    local runService = game:GetService("RunService")
    local direction = Vector2.new(2, 2)

    runService.RenderStepped:Connect(function()
        local absSize = frame.AbsoluteSize
        local absPos = frame.AbsolutePosition

        local newPos = frame.Position
        newPos = UDim2.new(
            0, frame.Position.X.Offset + direction.X,
            0, frame.Position.Y.Offset + direction.Y
        )

        -- Screen size
        local screenSize = gui.AbsoluteSize

        if newPos.X.Offset <= 0 or newPos.X.Offset + absSize.X >= screenSize.X then
            direction = Vector2.new(-direction.X, direction.Y)
        end
        if newPos.Y.Offset <= 0 or newPos.Y.Offset + absSize.Y >= screenSize.Y then
            direction = Vector2.new(direction.X, -direction.Y)
        end

        frame.Position = newPos
    end)
end

-- Start with one popup
spawnPopup()
