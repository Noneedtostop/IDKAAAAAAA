-- Gui to Lua
-- Version: 3.2

-- Instances:

local ESP = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local UICorner = Instance.new("UICorner")
local SelfDestruct = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
local Helper1 = Instance.new("TextLabel")
local Helper2 = Instance.new("TextLabel")




ESP.Name = "ESP"
ESP.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ESP.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ESP
Frame.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 3
Frame.BorderColor3 = Color3.new(225,255,255)
Frame.Position = UDim2.new(0.76154995, 0, 0.025062656, 0)
Frame.Size = UDim2.new(0, 300, 0, 180)

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Size = UDim2.new(0, 300, 0, 35)
TextLabel.Font = Enum.Font.SourceSansBold
TextLabel.Text = "NoneedIsGoated"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true



SelfDestruct.Name = "SelfDestruct"
SelfDestruct.Parent = Frame
SelfDestruct.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
SelfDestruct.BorderColor3 = Color3.fromRGB(0, 0, 0)
SelfDestruct.BorderSizePixel = 3
SelfDestruct.BorderColor3 = Color3.new(1,1,1)
SelfDestruct.Position = UDim2.new(0, 0, 0.805555582, 0)
SelfDestruct.Size = UDim2.new(0, 300, 0, 35)
SelfDestruct.Font = Enum.Font.SourceSansBold
SelfDestruct.Text = "DESTROY"
SelfDestruct.TextColor3 = Color3.fromRGB(255, 255, 255)
SelfDestruct.TextScaled = true
SelfDestruct.TextSize = 14.000
SelfDestruct.TextWrapped = true



Helper1.Name = "Helper1"
Helper1.Parent = Frame
Helper1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Helper1.BackgroundTransparency = 1.000
Helper1.BorderColor3 = Color3.fromRGB(0, 0, 0)
Helper1.BorderSizePixel = 0
Helper1.Position = UDim2.new(0, 0, 0.305555552, 0)
Helper1.Size = UDim2.new(0, 300, 0, 35)
Helper1.Font = Enum.Font.SourceSansBold
Helper1.Text = "= for esp"
Helper1.TextColor3 = Color3.fromRGB(255, 255, 255)
Helper1.TextScaled = true
Helper1.TextSize = 14.000
Helper1.TextWrapped = true

Helper2.Name = "Helper2"
Helper2.Parent = Frame
Helper2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Helper2.BackgroundTransparency = 1.000
Helper2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Helper2.BorderSizePixel = 0
Helper2.Position = UDim2.new(0, 0, 0.5, 0)
Helper2.Size = UDim2.new(0, 300, 0, 35)
Helper2.Font = Enum.Font.SourceSansBold
Helper2.Text = "Right bracket to toggle visibility"
Helper2.TextColor3 = Color3.fromRGB(255, 255, 255)
Helper2.TextScaled = true
Helper2.TextSize = 14.000
Helper2.TextWrapped = true

local function CGKA_fake_script() -- MainFrame.LocalScript 
	local script = Instance.new('LocalScript', Frame)

	local UIS = game:GetService("UserInputService")
	local UIToggled = true
	local ESPToggled = false
	local Players = game.Players


	UIS.InputBegan:Connect(function(input)
		if input.KeyCode == Enum.KeyCode.Equals then
			local getPlayers = game.Players:GetPlayers()

			if ESPToggled == false then
				local getPlayers = game.Players:GetPlayers()

				for i, v in pairs(getPlayers) do
					local ESP = Instance.new("Highlight")
					local ESPColor = Color3.new(255,0,0)
					ESP.Name = "ESP"
					ESP.FillTransparency = 1
					ESP.Parent = v.Character
					ESP.OutlineColor = ESPColor

				end
				ESPToggled = true
			else

				local getPlayers = game.Players:GetPlayers()

				for i, v in pairs(getPlayers) do
					local foundESP = v.Character:FindFirstChild("ESP")
					foundESP:Destroy()
				end
				ESPToggled = false
			end
		end
	end)

	UIS.InputBegan:Connect(function(input)
		if input.KeyCode == Enum.KeyCode.RightBracket then
			if UIToggled == true then
				script.Parent.Visible = false
				UIToggled = false

			else

				script.Parent.Visible = true
				UIToggled = true

			end
		end
	end)
end

SelfDestruct.MouseButton1Click:Connect(function()
	-- Stop the ESP
	local getPlayers = game.Players:GetPlayers()
	for i, v in pairs(getPlayers) do
		local foundESP = v.Character:FindFirstChild("ESP")
		if foundESP then
			foundESP:Destroy()
		end
	end

	-- Destroy the GUI
	ESP:Destroy()
end)

coroutine.wrap(CGKA_fake_script)()
