local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "KeySystemGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 400, 0, 300)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 8)
MainCorner.Parent = MainFrame

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "TitleLabel"
TitleLabel.Size = UDim2.new(1, 0, 0, 50)
TitleLabel.Position = UDim2.new(0, 0, 0, 0)
TitleLabel.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TitleLabel.BorderSizePixel = 0
TitleLabel.Text = "Key System"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 24
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 8)
TitleCorner.Parent = TitleLabel

local KeyInputBox = Instance.new("TextBox")
KeyInputBox.Name = "KeyInputBox"
KeyInputBox.Size = UDim2.new(0, 360, 0, 40)
KeyInputBox.Position = UDim2.new(0.5, -180, 0, 80)
KeyInputBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
KeyInputBox.BorderSizePixel = 0
KeyInputBox.Text = ""
KeyInputBox.PlaceholderText = "Paste your key here..."
KeyInputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInputBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
KeyInputBox.TextSize = 16
KeyInputBox.Font = Enum.Font.Gotham
KeyInputBox.ClearTextOnFocus = false
KeyInputBox.Parent = MainFrame

local KeyInputCorner = Instance.new("UICorner")
KeyInputCorner.CornerRadius = UDim.new(0, 6)
KeyInputCorner.Parent = KeyInputBox

local KeyInputPadding = Instance.new("UIPadding")
KeyInputPadding.PaddingLeft = UDim.new(0, 10)
KeyInputPadding.PaddingRight = UDim.new(0, 10)
KeyInputPadding.Parent = KeyInputBox

local GetKeyButton = Instance.new("TextButton")
GetKeyButton.Name = "GetKeyButton"
GetKeyButton.Size = UDim2.new(0, 170, 0, 45)
GetKeyButton.Position = UDim2.new(0, 20, 0, 140)
GetKeyButton.BackgroundColor3 = Color3.fromRGB(60, 120, 200)
GetKeyButton.BorderSizePixel = 0
GetKeyButton.Text = "Get Key"
GetKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
GetKeyButton.TextSize = 18
GetKeyButton.Font = Enum.Font.GothamBold
GetKeyButton.Parent = MainFrame

local GetKeyCorner = Instance.new("UICorner")
GetKeyCorner.CornerRadius = UDim.new(0, 6)
GetKeyCorner.Parent = GetKeyButton

local CheckKeyButton = Instance.new("TextButton")
CheckKeyButton.Name = "CheckKeyButton"
CheckKeyButton.Size = UDim2.new(0, 170, 0, 45)
CheckKeyButton.Position = UDim2.new(1, -190, 0, 140)
CheckKeyButton.BackgroundColor3 = Color3.fromRGB(60, 200, 120)
CheckKeyButton.BorderSizePixel = 0
CheckKeyButton.Text = "Check Key"
CheckKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CheckKeyButton.TextSize = 18
CheckKeyButton.Font = Enum.Font.GothamBold
CheckKeyButton.Parent = MainFrame

local CheckKeyCorner = Instance.new("UICorner")
CheckKeyCorner.CornerRadius = UDim.new(0, 6)
CheckKeyCorner.Parent = CheckKeyButton

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Name = "StatusLabel"
StatusLabel.Size = UDim2.new(0, 360, 0, 30)
StatusLabel.Position = UDim2.new(0.5, -180, 0, 210)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = ""
StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
StatusLabel.TextSize = 14
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.TextWrapped = true
StatusLabel.Parent = MainFrame

local function createHoverEffect(button, hoverColor, normalColor)
    button.MouseEnter:Connect(function()
        local tween = TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = hoverColor})
        tween:Play()
    end)
    
    button.MouseLeave:Connect(function()
        local tween = TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = normalColor})
        tween:Play()
    end)
end

createHoverEffect(GetKeyButton, Color3.fromRGB(80, 140, 220), Color3.fromRGB(60, 120, 200))
createHoverEffect(CheckKeyButton, Color3.fromRGB(80, 220, 140), Color3.fromRGB(60, 200, 120))

GetKeyButton.MouseButton1Click:Connect(function()
    local keyLink = "https://ads.luarmor.net/get_key?for=Dueling_Grounds_Script_KEY-gGXpmaFmySwD"
    
    setclipboard(keyLink)
    
    StatusLabel.Text = "Key link copied to clipboard!"
    StatusLabel.TextColor3 = Color3.fromRGB(100, 200, 255)
    
    task.wait(3)
    StatusLabel.Text = ""
end)

CheckKeyButton.MouseButton1Click:Connect(function()
    local pastedKey = KeyInputBox.Text
    
    if pastedKey == "" or pastedKey == nil then
        StatusLabel.Text = "Please enter a key!"
        StatusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
        task.spawn(function()
            task.wait(2)
            if StatusLabel then
                StatusLabel.Text = ""
            end
        end)
        return
    end
    
    CheckKeyButton.Active = false
    
    StatusLabel.Text = "Checking key..."
    StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 100)
    
    task.spawn(function()
        pcall(function()
            script_key = pastedKey
            loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/731b8f16fc225bed547286d5238d9118.lua"))()
        end)
    end)
    
    task.spawn(function()
        task.wait(3)
        
        pcall(function()
            if ScreenGui then
                ScreenGui.Enabled = false
            end
        end)
        
        pcall(function()
            if ScreenGui then
                ScreenGui:Destroy()
            end
        end)
        
        pcall(function()
            if ScreenGui and ScreenGui.Parent then
                ScreenGui.Parent = nil
            end
        end)
    end)
end)
-- for those who made it this far, yes i couldnt bother the ui is made by AI boohoo..