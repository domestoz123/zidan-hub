local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "KeyGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 350, 0, 150)
frame.Position = UDim2.new(0.5, -175, 0.5, -75) -- center
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Parent = screenGui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundTransparency = 1
title.Text = "Enter Key"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 24
title.Parent = frame

local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(1, -20, 0, 30)
textBox.Position = UDim2.new(0, 10, 0, 40)
textBox.PlaceholderText = "Enter your key here"
textBox.ClearTextOnFocus = false
textBox.Text = ""
textBox.TextColor3 = Color3.new(1, 1, 1)
textBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
textBox.Parent = frame

local notifyLabel = Instance.new("TextLabel")
notifyLabel.Size = UDim2.new(1, -20, 0, 25)
notifyLabel.Position = UDim2.new(0, 10, 0, 120)
notifyLabel.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
notifyLabel.TextColor3 = Color3.new(1, 1, 1)
notifyLabel.Font = Enum.Font.SourceSans
notifyLabel.TextSize = 18
notifyLabel.Text = ""
notifyLabel.Visible = false
notifyLabel.Parent = frame

local function notify(text)
    notifyLabel.Text = text
    notifyLabel.Visible = true
    delay(3, function()
        notifyLabel.Visible = false
    end)
end

local getKeyButton = Instance.new("TextButton")
getKeyButton.Size = UDim2.new(0.45, -10, 0, 30)
getKeyButton.Position = UDim2.new(0, 10, 0, 80)
getKeyButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
getKeyButton.TextColor3 = Color3.new(1, 1, 1)
getKeyButton.Font = Enum.Font.SourceSansBold
getKeyButton.TextSize = 20
getKeyButton.Text = "Get Key"
getKeyButton.Parent = frame

local validateKeyButton = Instance.new("TextButton")
validateKeyButton.Size = UDim2.new(0.45, -10, 0, 30)
validateKeyButton.Position = UDim2.new(0.55, 0, 0, 80)
validateKeyButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
validateKeyButton.TextColor3 = Color3.new(1, 1, 1)
validateKeyButton.Font = Enum.Font.SourceSansBold
validateKeyButton.TextSize = 20
validateKeyButton.Text = "Validate Key"
validateKeyButton.Parent = frame

local keyLink = "https://ads.luarmor.net/get_key?for=-ZdLkzaDBOrqx"

getKeyButton.MouseButton1Click:Connect(function()
    setclipboard(keyLink)
    notify("Key link copied to clipboard!")
end)

validateKeyButton.MouseButton1Click:Connect(function()
    local inputKey = textBox.Text
    if inputKey == "" then
        notify("Please enter a key!")
        return
    end

    -- Destroy UI immediately
    screenGui:Destroy()

    -- Assign script_key right before loading the loader
    script_key = inputKey
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/12c2c0bbcf0573e9759f8d71da2b264b.lua"))()
end)
