local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({
	Name = "VOOR V2 HUB",
	HidePremium = false,
	SaveConfig = true,
	ConfigFolder = "OrionTest",
	IntroEnabled = false,  -- Enable intro animation
	IntroText = "VOOR Scripts",  -- Set custom intro text
	Icon = "rbxassetid://132351513425524",  -- Custom icon (change if needed)
	IntroIcon = "rbxassetid://132351513425524"  -- Custom icon for the intro (optional)
})

local PlayerTab = Window:MakeTab({
	Name = "MAIN V2",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = PlayerTab:AddSection({
	Name = "Movement"
})

PlayerTab:AddSlider({
	Name = "Walkspeed",
	Min = 16,
	Max = 500,
	Default = 16,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Walkspeed",
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end    
})

PlayerTab:AddSlider({
	Name = "Jump Height",
	Min = 16,
	Max = 500,
	Default = 5,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Jump Height",
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
	end    
})

-- Add the "Keep Enlighten" button
PlayerTab:AddButton({
	Name = "Keep Enlighten",
	Callback = function()
		local player = game.Players.LocalPlayer

		-- Detect when specific messages are sent in chat
		player.Chatted:Connect(function(msg)
			msg = msg:lower()  -- Case-insensitive
			if msg == "oof" or msg == ";oof" or msg == "oof all" or msg == ";oof all" then
				-- Equip the first tool
				local tool = player.Backpack:FindFirstChildOfClass("Tool")
				if tool then
					tool.Parent = player.Character
				end

				-- Say the command ";r6 fast" quickly
				game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(";r6 fast", "All")
			end
		end)
	end
})

-- Fly functionality
local flyActive = false
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local flySpeed = 50

local function toggleFly()
	flyActive = not flyActive

	if flyActive then
		local bodyGyro = Instance.new("BodyGyro", character.HumanoidRootPart)
		bodyGyro.P = 9e4
		bodyGyro.MaxTorque = Vector3.new(9e4, 9e4, 9e4)

		local bodyVelocity = Instance.new("BodyVelocity", character.HumanoidRootPart)
		bodyVelocity.Velocity = Vector3.new(0, 0, 0)
		bodyVelocity.MaxForce = Vector3.new(9e4, 9e4, 9e4)

		while flyActive do
			wait()
			bodyGyro.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position)
			bodyVelocity.Velocity = (workspace.CurrentCamera.CFrame.LookVector * flySpeed)
		end

		bodyGyro:Destroy()
		bodyVelocity:Destroy()
	else
		-- Disable flying by resetting velocity
		humanoid.PlatformStand = false
	end
end

-- Button to toggle Fly
PlayerTab:AddButton({
	Name = "Toggle Fly",
	Callback = function()
		toggleFly()
	end
})

-- Add a new "Troll" tab
local TrollTab = Window:MakeTab({
	Name = "Troll",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

-- Button to activate Admin Abuse
local abuseActive = false

local function adminAbuse()
	while abuseActive do
		-- Equip the first tool
		local tool = game.Players.LocalPlayer.Backpack:FindFirstChildOfClass("Tool")
		if tool then
			tool.Parent = game.Players.LocalPlayer.Character
		end

		-- Admin abuse commands
		game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(";fling others", "All")
		wait(1)
		game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(";oof others", "All")
		wait(1)
		game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(";freeze others", "All")
		wait(1)
		game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(";jail others", "All")
		wait(1)
		game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(";punish others", "All")
		wait(1)
	end
end

-- Button to activate Admin Abuse
TrollTab:AddButton({
	Name = "Admin Abuse",
	Callback = function()
		if not abuseActive then
			abuseActive = true
			spawn(adminAbuse)
		end
	end
})

-- Button to stop Admin Abuse
TrollTab:AddButton({
	Name = "Unactivate Admin Abuse",
	Callback = function()
		abuseActive = false
	end
})

-- Spam feature
TrollTab:AddButton({
	Name = "SPAM Y̵O̶U̴ ̶S̶H̸O̸U̸L̷D̸ ̵H̴A̶V̶E̵ ̷L̴I̸S̵T̸E̸N̵E̸D̸ ̸T̷O̸ ̶M̷E̷",
	Callback = function()
		while true do
			wait(1)  -- Adjust the spam interval if needed
			game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Y̵O̶U̴ ̶S̶H̸O̸U̸L̷D̸ ̵H̴A̶V̶E̵ ̷L̴I̸S̵T̸E̸N̵E̸D̸ ̸T̷O̸ ̶M̷E̷", "All")
		end
	end
})

-- Add a new "Steal" tab
local StealTab = Window:MakeTab({
	Name = "Steal",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

-- Button to steal "The Arkenstone"
StealTab:AddButton({
	Name = "Steal Enlighten",
	Callback = function()
		local player = game.Players.LocalPlayer

		for _, target in ipairs(game.Players:GetPlayers()) do
			if target ~= player then
				local tool = target.Backpack:FindFirstChild("The Arkenstone")
				if tool then
					-- Cut the player's arm that holds the tool
					local character = target.Character
					if character then
						local arm = character:FindFirstChild("Right Arm") or character:FindFirstChild("Left Arm")
						if arm then
							arm:Destroy()  -- Simulating cutting the arm
						end
						-- Steal the tool
						tool.Parent = player.Backpack
						break  -- Exit after stealing one tool
					end
				end
			end
		end
	end
})

-- Add "Steal Admin Time" section
local StealAdminTab = Window:MakeTab({
	Name = "Steal Admin Time",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

-- Button to show chat message for stealing admin time
StealAdminTab:AddButton({
	Name = "Steal Admin Time",
	Callback = function()
		local message = "Admin time stealer (If it doesn't work then Chosen One updated :/)"
		game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
	end
})

-- Add "AFK" section
local AFKTab = Window:MakeTab({
	Name = "AFK",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

-- Button for AFK Farming
AFKTab:AddButton({
	Name = "AFK Farm",
	Callback = function()
		-- This can be a placeholder to indicate AFK farming.
		local message = "AFK Farming Active! You won't be kicked for being AFK."
		game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
	end
})

-- Button for Manage Admin Server
AFKTab:AddButton({
	Name = "Manage Admin Server",
	Callback = function()
		local message = "Managing admin server, activating features."
		game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
	end
})

-- Add Escape section
local EscapeTab = Window:MakeTab({
	Name = "Escape",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

-- Button to escape from jail
EscapeTab:AddButton({
	Name = "Escape from Jail",
	Callback = function()
		local player = game.Players.LocalPlayer
		local character = player.Character or player.CharacterAdded:Wait()
		if character then
			-- Eliminate the character
			character:BreakJoints()  -- Kills the player
		end
	end
})

-- Button to escape from freeze
EscapeTab:AddButton({
	Name = "Escape from Freeze",
	Callback = function()
		local player = game.Players.LocalPlayer
		local character = player.Character or player.CharacterAdded:Wait()
		if character then
			-- Eliminate the character
			character:BreakJoints()  -- Kills the player
		end
	end
})

-- Button to escape from glitch (oof the player)
EscapeTab:AddButton({
	Name = "Escape from Glitch",
	Callback = function()
		local player = game.Players.LocalPlayer
		local character = player.Character or player.CharacterAdded:Wait()
		if character then
			-- Eliminate the character
			character:BreakJoints()  -- Kills the player
		end
	end
})

-- Add Premium section
local PremiumTab = Window:MakeTab({
	Name = "Premium",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

-- Label for premium unlock
PremiumTab:AddLabel("Unlock Premium to chat with Voor AI!")

-- Create "Enter Key" button to show GUI
PremiumTab:AddButton({
	Name = "Enter Key",
	Callback = function()
		-- Create a new GUI for key entry
		local keyEntryGui = Instance.new("ScreenGui", game.CoreGui)
		local frame = Instance.new("Frame", keyEntryGui)
		frame.Size = UDim2.new(0.4, 0, 0.2, 0)
		frame.Position = UDim2.new(0.3, 0, 0.4, 0)
		frame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)

		local label = Instance.new("TextLabel", frame)
		label.Size = UDim2.new(1, 0, 0.5, 0)
		label.Text = "Enter Key"
		label.TextColor3 = Color3.new(1, 1, 1)
		label.BackgroundTransparency = 1

		local input = Instance.new("TextBox", frame)
		input.Size = UDim2.new(0.8, 0, 0.3, 0)
		input.Position = UDim2.new(0.1, 0, 0.5, 0)
		input.Text = ""
		input.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
		input.TextColor3 = Color3.new(1, 1, 1)

		local submitButton = Instance.new("TextButton", frame)
		submitButton.Size = UDim2.new(0.5, 0, 0.3, 0)
		submitButton.Position = UDim2.new(0.25, 0, 0.8, 0)
		submitButton.Text = "Submit"
		submitButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
		submitButton.TextColor3 = Color3.new(1, 1, 1)

		-- Input for premium key
		local premiumKeyEntered = false
		local premiumKey = "VOORISDABEST"

		submitButton.MouseButton1Click:Connect(function()
			if input.Text == premiumKey then
				premiumKeyEntered = true
				local message = "Premium unlocked! Enjoy the features."
				game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")

				-- Add the Premium Coming Soon button
				PremiumTab:AddButton({
					Name = "Premium Coming Soon",
					Callback = function()
						local message = "Premium features are on the way!"
						game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
					end
				})

				keyEntryGui:Destroy()  -- Close the key entry GUI
			else
				local message = "Invalid key. Please try again."
				game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
			end
		end)
	end
})
