-- Instances:
local ScreenGui = Instance.new("ScreenGui")
local Aimbot = Instance.new("Frame")
local Toggle = Instance.new("TextButton")
local Title = Instance.new("TextLabel")

-- Properties:
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Aimbot.Name = "Aimbot"
Aimbot.Parent = ScreenGui
Aimbot.BackgroundColor3 = Color3.fromRGB(7, 168, 255)
Aimbot.BorderSizePixel = 0
Aimbot.Position = UDim2.new(0.027777778, 0, 0.0788177326, 0)
Aimbot.Size = UDim2.new(0, 95, 0, 98)

Toggle.Name = "Toggle"
Toggle.Parent = Aimbot
Toggle.BackgroundColor3 = Color3.fromRGB(7, 168, 255)
Toggle.BorderSizePixel = 0
Toggle.Position = UDim2.new(0, 0, 0.386523575, 0)
Toggle.Size = UDim2.new(0, 95, 0, 50)
Toggle.Font = Enum.Font.SourceSans
Toggle.Text = "Off"
Toggle.TextColor3 = Color3.fromRGB(255, 0, 0)
Toggle.TextSize = 40.000
Toggle.TextWrapped = true

Title.Name = "Title"
Title.Parent = Aimbot
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.BorderSizePixel = 0
Title.Size = UDim2.new(0, 95, 0, 29)
Title.Font = Enum.Font.SourceSans
Title.Text = "Aimbot by brunkin"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.TextSize = 14.000
Title.TextWrapped = true

-- Functions:
local function getClosestPlayer()
    local closestDist = math.huge
    local closestPlayer = nil
    
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local dist = (player.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude
            if dist < closestDist then
                closestDist = dist
                closestPlayer = player
            end
        end
    end
    
    return closestPlayer
end

-- Scripts:
Toggle.MouseButton1Click:Connect(function()
    if Toggle.Text == "Off" then
        Toggle.Text = "On"
        Toggle.TextColor3 = Color3.fromRGB(0, 170, 0)
    else
        Toggle.Text = "Off"
        Toggle.TextColor3 = Color3.fromRGB(255, 0, 0)
    end
end)

game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessedEvent)
    if not gameProcessedEvent and Toggle.Text == "On" and input.UserInputType == Enum.UserInputType.MouseButton2 then
        local closest = getClosestPlayer()
        if closest then
            game.Workspace.CurrentCamera.CFrame = CFrame.new(game.Workspace.CurrentCamera.CFrame.Position, closest.Character.HumanoidRootPart.Position)
        end
    end
end)
