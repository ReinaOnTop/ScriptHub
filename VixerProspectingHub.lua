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

    -- Random position on screen (not centered anymore)
    local randX = math.random(0, playerGui.AbsoluteSize.X - 300)
    local randY = math.random(0, playerGui.AbsoluteSize.Y - 150)
    frame.Position = UDim2.new(0, randX, 0, randY)

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

    -- Shaking effect
    local runService = game:GetService("RunService")
    local basePos = frame.Position

    runService.RenderStepped:Connect(function()
        local offsetX = math.random(-2, 2)
        local offsetY = math.random(-2, 2)
        frame.Position = basePos + UDim2.new(0, offsetX, 0, offsetY)
    end)
end

-- Start with one popup
spawnPopup()
