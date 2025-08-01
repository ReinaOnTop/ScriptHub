local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Sound setup (only once)
local function playAnnoyingSound()
    local sound = Instance.new("Sound", playerGui)
    sound.SoundId = "rbxassetid://301964312"  -- You Are An Idiot sound
    sound.Volume = 1
    sound.Looped = true
    sound.Name = "IdiotSound"
    sound:Play()
end

-- Only play sound once
if not playerGui:FindFirstChild("IdiotSound") then
    playAnnoyingSound()
end

-- GUI Spawner
local function spawnTrollGui()
    local gui = Instance.new("ScreenGui", playerGui)
    gui.ResetOnSpawn = false

    local frame = Instance.new("Frame", gui)
    frame.Size = UDim2.new(0, 200, 0, 100)
    frame.Position = UDim2.new(math.random(), 0, math.random(), 0)
    frame.BackgroundColor3 = Color3.new(0, 0, 0)
    frame.BorderSizePixel = 0
    frame.Name = "TrollFrame"

    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, 0, 0.6, 0)
    label.Position = UDim2.new(0, 0, 0, 0)
    label.Text = "YOU ARE AN IDIOT!"
    label.TextColor3 = Color3.new(1, 0, 0)
    label.TextScaled = true
    label.BackgroundTransparency = 1
    label.Font = Enum.Font.SourceSansBold

    local closeBtn = Instance.new("TextButton", frame)
    closeBtn.Size = UDim2.new(1, 0, 0.4, 0)
    closeBtn.Position = UDim2.new(0, 0, 0.6, 0)
    closeBtn.Text = "Close"
    closeBtn.TextColor3 = Color3.new(1, 1, 1)
    closeBtn.BackgroundColor3 = Color3.new(0.3, 0, 0)

    -- On Close: destroy this, spawn 2 more
    closeBtn.MouseButton1Click:Connect(function()
        gui:Destroy()
        spawnTrollGui()
        spawnTrollGui()
    end)
end

-- Start with one
spawnTrollGui()
