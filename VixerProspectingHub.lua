local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Play "you are an idiot" sound once
if not playerGui:FindFirstChild("IdiotSound") then
	local sound = Instance.new("Sound", playerGui)
	sound.SoundId = "rbxassetid://301964312"
	sound.Volume = 1
	sound.Looped = true
	sound.Name = "IdiotSound"
	sound:Play()
end

-- Troll GUI function
local function spawnTrollGui()
	local gui = Instance.new("ScreenGui", playerGui)
	gui.ResetOnSpawn = false

	local frame = Instance.new("Frame")
	frame.Size = UDim2.new(0, 300, 0, 100)
	frame.Position = UDim2.new(0.5, -150, 0.5, -50) -- CENTER of screen
	frame.BackgroundColor3 = Color3.new(0, 0, 0)
	frame.BorderSizePixel = 2
	frame.Name = "TrollFrame"
	frame.Parent = gui

	local label = Instance.new("TextLabel", frame)
	label.Size = UDim2.new(1, 0, 0.7, 0)
	label.Position = UDim2.new(0, 0, 0, 0)
	label.Text = "YOU ARE AN IDIOT ☻☻☻"
	label.TextColor3 = Color3.new(1, 1, 1)
	label.TextScaled = true
	label.BackgroundTransparency = 1
	label.Font = Enum.Font.Arcade

	local close = Instance.new("TextButton", frame)
	close.Size = UDim2.new(0, 30, 0, 30)
	close.Position = UDim2.new(1, -35, 0, 5)
	close.Text = "X"
	close.TextColor3 = Color3.new(1, 0, 0)
	close.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
	close.Font = Enum.Font.SourceSansBold
	close.TextScaled = true

	-- On close: double the windows
	close.MouseButton1Click:Connect(function()
		gui:Destroy()
		spawnTrollGui()
		spawnTrollGui()
	end)

	-- Bounce movement
	local speedX = math.random(2, 5) * (math.random(1, 2) == 1 and 1 or -1)
	local speedY = math.random(2, 5) * (math.random(1, 2) == 1 and 1 or -1)

	game:GetService("RunService").RenderStepped:Connect(function()
		if not frame or not frame.Parent then return end
		local pos = frame.Position
		local newX = pos.X.Offset + speedX
		local newY = pos.Y.Offset + speedY

		local screenWidth = gui.AbsoluteSize.X
		local screenHeight = gui.AbsoluteSize.Y
		local frameWidth = frame.AbsoluteSize.X
		local frameHeight = frame.AbsoluteSize.Y

		if newX <= 0 or newX + frameWidth >= screenWidth then
			speedX = -speedX
		end
		if newY <= 0 or newY + frameHeight >= screenHeight then
			speedY = -speedY
		end

		frame.Position = UDim2.new(0, newX, 0, newY)
	end)
end

-- Start the troll
spawnTrollGui()
