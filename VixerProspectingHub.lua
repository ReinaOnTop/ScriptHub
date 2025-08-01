local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- [YOUR EXISTING SOUND CODE - UNCHANGED]
if not playerGui:FindFirstChild("IdiotSound") then
    local sound = Instance.new("Sound", playerGui)
    sound.SoundId = "rbxassetid://7266001792"
    sound.Volume = 1
    sound.Looped = true
    sound.Name = "IdiotSound"
    sound:Play()
end

-- [NEW CHAT SPAM FUNCTION ADDED HERE]
local function spamChat()
    while true do
        wait(math.random(3, 7)) -- Spams every 3-7 seconds (adjustable)
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
            "YOU ARE AN IDIOT ☻☻☻", 
            "All"
        )
    end
end
coroutine.wrap(spamChat)() -- Starts the spam loop

-- [YOUR EXISTING POPUP FUNCTION - COMPLETELY UNCHANGED]
local function spawnPopup()
    -- ... (all your existing popup code remains exactly the same)
end

-- [YOUR EXISTING SPAWN COMMAND - UNCHANGED]
spawnPopup()
