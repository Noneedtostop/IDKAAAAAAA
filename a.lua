-- Instances:
local ScreenGui = Instance.new("ScreenGui")
local Aimbot = Instance.new("Frame")
local Toggle = Instance.new("TextButton")
local Title = Instance.new("TextLabel")
local Destroy = Instance.new("TextButton")
local FOVCircle = Instance.new("ImageLabel") -- New FOV Circle ImageLabel

-- Properties:
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Aimbot.Parent = ScreenGui
Aimbot.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
Aimbot.BorderColor3 = Color3.fromRGB(255, 255, 255)
Aimbot.BorderSizePixel = 3
Aimbot.Position = UDim2.new(0.76154995, 0, 0.24, 0)
Aimbot.Size = UDim2.new(0, 200, 0, 125)

Destroy.Name = "Destroy"
Destroy.Parent = Aimbot
Destroy.Text = "Destroy"
Destroy.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Destroy.BorderColor3 = Color3.fromRGB(255, 255, 255)
Destroy.BorderSizePixel = 3
Destroy.Position = UDim2.new(0, 0, 0.75999999, 0)
Destroy.Size = UDim2.new(0, 200, 0, 30)
Destroy.Font = Enum.Font.SourceSansBold
Destroy.TextColor3 = Color3.fromRGB(255, 255, 255)
Destroy.TextScaled = true
Destroy.TextSize = 14.000
Destroy.TextWrapped = true

Toggle.Name = "Toggle"
Toggle.Parent = Aimbot
Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Toggle.BackgroundTransparency = 1.000
Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
Toggle.BorderSizePixel = 0
Toggle.Position = UDim2.new(0, 0, 0.296000004, 0)
Toggle.Size = UDim2.new(0, 200, 0, 50)
Toggle.Font = Enum.Font.SourceSansBold
Toggle.Text = "Off"
Toggle.TextColor3 = Color3.fromRGB(255, 0, 0)
Toggle.TextScaled = true
Toggle.TextSize = 14.000
Toggle.TextWrapped = true

Title.Parent = Aimbot
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title.BorderSizePixel = 0
Title.Size = UDim2.new(0, 200, 0, 37)
Title.Font = Enum.Font.SourceSans
Title.Text = "SO GOATED"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.TextSize = 14.000
Title.TextWrapped = true

-- FOV Circle Properties:
FOVCircle.Name = "FOVCircle"
FOVCircle.Parent = Aimbot
FOVCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FOVCircle.BackgroundTransparency = 1.000
FOVCircle.Size = UDim2.new(0, 200, 0, 200) -- Adjust size as needed
FOVCircle.Image = "http://www.roblox.com/asset/?id=6980070100" -- Replace with your FOV circle image URL
FOVCircle.ImageColor3 = Color3.fromRGB(255, 255, 255) -- Set to the color of your FOV circle
FOVCircle.ImageTransparency = 0.5 -- Adjust transparency as needed
FOVCircle.Visible = false -- Initially hidden

-- Variables:
local isRightMouseDown = false
local FOV_RADIUS = 100 -- Adjust this value as needed

-- Functions:
local function DestroyAimbot()
	Aimbot:Destroy()
end

local function getClosestPlayerInFOV()
	local closestDist = math.huge
	local closestPlayer = nil
	local cameraPos = game.Workspace.CurrentCamera.CFrame.Position

	for _, player in pairs(game.Players:GetPlayers()) do
		if player ~= game.Players.LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
			local playerPos = player.Character.HumanoidRootPart.Position
			local dist = (playerPos - cameraPos).magnitude
			if dist < closestDist and dist <= FOV_RADIUS then
				closestDist = dist
				closestPlayer = player
			end
		end
	end

	return closestPlayer
end

local function ToggleAimbot()
	if Toggle.Text == "Off" then
		Toggle.Text = "On"
		Toggle.TextColor3 = Color3.fromRGB(0, 170, 0)
		FOVCircle.Visible = true -- Show the FOV circle when aimbot is turned on
	else
		Toggle.Text = "Off"
		Toggle.TextColor3 = Color3.fromRGB(255, 0, 0)
		FOVCircle.Visible = false -- Hide the FOV circle when aimbot is turned off
	end
end

-- Scripts:
Toggle.MouseButton1Click:Connect(function()
	if Toggle.Text == "Off" then
		Toggle.Text = "On"
		Toggle.TextColor3 = Color3.fromRGB(0, 170, 0)
		FOVCircle.Visible = true -- Show the FOV circle when aimbot is turned on
	else
		Toggle.Text = "Off"
		Toggle.TextColor3 = Color3.fromRGB(255, 0, 0)
		FOVCircle.Visible = false -- Hide the FOV circle when aimbot is turned off
	end
end)

Toggle.MouseButton2Down:Connect(function()
	isRightMouseDown = true
end)

Toggle.MouseButton2Up:Connect(function()
	isRightMouseDown = false
end)

Destroy.MouseButton1Click:Connect(DestroyAimbot)

game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessedEvent)
	if not gameProcessedEvent and Toggle.Text == "On" then
		if input.UserInputType == Enum.UserInputType.MouseButton2 or input.KeyCode == Enum.KeyCode.ButtonL1 or input.KeyCode == Enum.KeyCode.ButtonL2 then
			isRightMouseDown = true
		elseif input.KeyCode == Enum.KeyCode.Minus then
			ToggleAimbot()
		end
	end
end)

game:GetService("UserInputService").InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton2 or input.KeyCode == Enum.KeyCode.ButtonL1 then
		isRightMouseDown = false
	end
end)

game:GetService("RunService").Stepped:Connect(function()
	if isRightMouseDown then
		local closest = getClosestPlayerInFOV()
		if closest then
			game.Workspace.CurrentCamera.CFrame = CFrame.new(game.Workspace.CurrentCamera.CFrame.Position, closest.Character.HumanoidRootPart.Position)
		end
	end
end)
