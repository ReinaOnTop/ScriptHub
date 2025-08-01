local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Play the sound once
if not playerGui:FindFirstChild("IdiotSound") then
    local sound = Instance.new("Sound", playerGui)
    sound.SoundId = "rbxassetid://7266001792" -- "You are an idiot" sound
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
    frame.BackgroundColor3 = Color3.new(0, 0, 0) -- Start with black
    frame.BorderSizePixel = 0
    frame.Name = "IdiotWindow"

    -- Random starting position
    local screenSize = workspace.CurrentCamera.ViewportSize
    local randomX = math.random(0, screenSize.X - 300)
    local randomY = math.random(0, screenSize.Y - 150)
    frame.Position = UDim2.new(0, randomX, 0, randomY)

    local text = Instance.new("TextLabel", frame)
    text.Size = UDim2.new(1, 0, 0.6, 0)
    text.BackgroundTransparency = 1
    text.Text = "YOU ARE AN IDIOT ☻☻☻"
    text.TextColor3 = Color3.new(1, 1, 1) -- White text (will invert)
    text.Font = Enum.Font.Arcade
    text.TextScaled = true

    local close = Instance.new("TextButton", frame)
    close.Size = UDim2.new(0, 30, 0, 30)
    close.Position = UDim2.new(1, -35, 0, 5)
    close.BackgroundColor3 = Color3.new(1, 0, 0) -- Red close button
    close.Text = "X"
    close.TextColor3 = Color3.new(1, 1, 1)
    close.Font = Enum.Font.ArialBold
    close.TextScaled = true

    close.MouseButton1Click:Connect(function()
        spawnPopup() 
        spawnPopup() 
        spawnPopup()
        spawnPopup() 
        spawnPopup() 
        spawnPopup()
        spawnPopup() 
        spawnPopup() 
        spawnPopup()
    end)

    -- Bouncing animation
    local runService = game:GetService("RunService")
    local direction = Vector2.new(math.random(2, 4), math.random(2, 4))

    -- Color flashing effect
    local isBlack = true
    local flashSpeed = 0.1 -- Adjust speed (lower = faster flashing)

    runService.RenderStepped:Connect(function(deltaTime)
        -- Bouncing movement
        local absSize = frame.AbsoluteSize
        local absPos = frame.AbsolutePosition
        local screenSize = gui.AbsoluteSize

        local newPos = UDim2.new(
            0, frame.Position.X.Offset + direction.X,
            0, frame.Position.Y.Offset + direction.Y
        )

        -- Bounce off edges
        if newPos.X.Offset <= 0 or newPos.X.Offset + absSize.X >= screenSize.X then
            direction = Vector2.new(-direction.X, direction.Y)
        end
        if newPos.Y.Offset <= 0 or newPos.Y.Offset + absSize.Y >= screenSize.Y then
            direction = Vector2.new(direction.X, -direction.Y)
        end

        frame.Position = newPos

        -- Color flashing (invert colors)
        isBlack = not isBlack
        if isBlack then
            frame.BackgroundColor3 = Color3.new(0, 0, 0) -- Black background
            text.TextColor3 = Color3.new(1, 1, 1) -- White text
        else
            frame.BackgroundColor3 = Color3.new(1, 1, 1) -- White background
            text.TextColor3 = Color3.new(0, 0, 0) -- Black text
        end
    end)
end

-- Start with one popup
spawnPopup()
