local Commands = {
	kill = function(Player, Target)
		if (Player.Name == Target) or (Target == "me") or (Target == nil) then
			Player.Character:WaitForChild("Humanoid").Health = 0;
		elseif Target == "all" then
			for _, Play in pairs(game.Players:GetPlayers()) do
				Play.Character:WaitForChild("Humanoid").Health = 0;
			end
		else
			for _, player in pairs(game.Players:GetPlayers()) do
				if Target == player.Name:sub(1,#Target):lower() then
					player.Character:WaitForChild("Humanoid").Health = 0;
					break
				end
			end
		end
	end,

	jail = function(Player, Target)
		if (Player.Name == Target) or (Target == "me") or (Target == nil) then
			local Jail = game.Workspace:FindFirstChild(Player.Name .. " Jail")
			if Jail then
				Jail:Destroy()
			end

			local Jail = game.ReplicatedStorage.Assets_.Jail:Clone()
			Player.RespawnLocation = Jail.tp
			Jail:SetPrimaryPartCFrame(Player.Character.HumanoidRootPart.CFrame)
			Jail.Name = Player.Name .. " Jail"
			Jail.Parent = workspace
		elseif Target == "all" then
			for _, Play in pairs(game.Players:GetPlayers()) do
				local Jail = game.Workspace:FindFirstChild(Play.Name .. " Jail")
				if Jail then
					Jail:Destroy()
				end

				local Jail = game.ReplicatedStorage.Assets_.Jail:Clone()
				Play.RespawnLocation = Jail.tp
				Jail:SetPrimaryPartCFrame(Play.Character.HumanoidRootPart.CFrame)
				Jail.Name = Play.Name .. " Jail"
				Jail.Parent = workspace
				break
			end
		else
			for _, player in pairs(game.Players:GetPlayers()) do
				if Target == player.Name:sub(1,#Target):lower() then
					local Jail = game.Workspace:FindFirstChild(player.Name .. " Jail")
					if Jail then
						Jail:Destroy()
					end

					local Jail = game.ReplicatedStorage.Assets_.Jail:Clone()
					player.RespawnLocation = Jail.tp
					Jail:SetPrimaryPartCFrame(player.Character.HumanoidRootPart.CFrame)
					Jail.Name = player.Name .. " Jail"
				end
			end

		end
	end,

	unjail = function(Player, Target)
		if (Player.Name == Target) or (Target == "me") or (Target == nil) then
			local Jail = game.Workspace:FindFirstChild(Player.Name .. " Jail")
			if Jail then
				Jail:Destroy()
			end
		elseif Target == "all" then
			for _, Play in pairs(game.Players:GetPlayers()) do
				local Jail = game.Workspace:FindFirstChild(Play.Name .. " Jail")
				if Jail then
					Jail:Destroy()
				end
				break
			end
		else
			for _, player in pairs(game.Players:GetPlayers()) do
				if Target == player.Name:sub(1,#Target):lower() then
					local Jail = game.Workspace:FindFirstChild(player.Name .. " Jail")
					if Jail then
						Jail:Destroy()
					end
				end
			end

		end
	end,

	blind = function(Player, Target)
		if (Player.Name == Target) or (Target == "me") or (Target == nil) then
			if not Player.PlayerGui:FindFirstChild("Blind") then
				local Blind = game.ReplicatedStorage.Assets_.Blind:Clone()
				Blind.Parent = Player.PlayerGui
			end
		elseif Target == "all" then
			for _, Play in pairs(game.Players:GetPlayers()) do
				if not Play.PlayerGui:FindFirstChild("Blind") then
					local Blind = game.ReplicatedStorage.Assets_.Blind:Clone()
					Blind.Parent = Play.PlayerGui
				end
			end
		else
			for _, player in pairs(game.Players:GetPlayers()) do
				if Target == player.Name:sub(1,#Target):lower() then
					local Blind = game.ReplicatedStorage.Assets_.Blind:Clone()
					Blind.Parent = player.PlayerGui
					break
				end
			end
		end
	end,
	
	unblind = function(Player, Target)
		if (Player.Name == Target) or (Target == "me") or (Target == nil) then
			if not Player.PlayerGui:FindFirstChild("Blind") then
				Player.PlayerGui.Blind:Destroy()
			end
		elseif Target == "all" then
			for _, Play in pairs(game.Players:GetPlayers()) do
				if not Play.PlayerGui:FindFirstChild("Blind") then
					Play.PlayerGui.Blind:Destroy()
				end
			end
		else
			for _, player in pairs(game.Players:GetPlayers()) do
				if Target == player.Name:sub(1,#Target):lower() then
					player.PlayerGui.Blind:Destroy()
					break
				end
			end
		end
	end,

	brightness = function(Player, Target)
		game.Lighting.Brightness = tonumber(Target) or 2
	end,

	noclip = function(Player, Target)
		if (Player.Name == Target) or (Target == "me") or (Target == nil) then
			game.ReplicatedStorage.Events_.Noclip:FireClient(Player)
		elseif Target == "all" then
			for _, Play in pairs(game.Players:GetPlayers()) do
				game.ReplicatedStorage.Events_.Noclip:FireClient(Play)
			end
		else
			for _, player in pairs(game.Players:GetPlayers()) do
				if Target == player.Name:sub(1,#Target):lower() then
					game.ReplicatedStorage.Events_.Noclip:FireClient(player)
				end
			end
		end
	end,

	fly = function(Player, Target)
		if (Player.Name == Target) or (Target == "me") or (Target == nil) then
			game.ReplicatedStorage.Events_.Flight:FireClient(Player)
		elseif Target == "all" then
			for _, Play in pairs(game.Players:GetPlayers()) do
				game.ReplicatedStorage.Events_.Flight:FireClient(Play)
			end
		else
			for _, player in pairs(game.Players:GetPlayers()) do
				if Target == player.Name:sub(1,#Target):lower() then
					game.ReplicatedStorage.Events_.Flight:FireClient(player)
				end
			end
		end
	end,

	explode = function(Player, Target)
		if (Player.Name == Target) or (Target == "me") or (Target == nil) then
			local Explosion = Instance.new("Explosion")
			Explosion.Position = Player.Character.Head.Position
			Explosion.Parent = Player.Character.Head
		elseif Target == "all" then
			for _, Play in pairs(game.Players:GetPlayers()) do
				local Explosion = Instance.new("Explosion")
				Explosion.Position = Play.Character.Head.Position
				Explosion.Parent = Play.Character.Head
			end
		else
			for _, player in pairs(game.Players:GetPlayers()) do
				if Target == player.Name:sub(1,#Target):lower() then
					local Explosion = Instance.new("Explosion")
					Explosion.Position = player.Character.Head.Position
					Explosion.Parent = player.Character.Head
					break
				end
			end
		end
	end,

	rejoin = function(Player, Target)
		local TeleportService = game:GetService("TeleportService")
		local ServerCode = TeleportService:ReserveServer(game.PlaceId)
		local PlayertoTP = game.Players:FindFirstChild(Target or Player.Name) 
		if PlayertoTP then 
			TeleportService:TeleportToPrivateServer(
				game.PlaceId, 
				ServerCode, 
				{PlayertoTP}, 
				nil, 
				"SENT_FROM_ADMIN" .. game.JobId
			)
		end
	end,

	cmds = function(Player)
		game.ReplicatedStorage.Events_.Commands:FireClient(Player)
	end,

	commands = function(Player)
		game.ReplicatedStorage.Events_.Commands:FireClient(Player)
	end,
	
	shutdownserver = function(Player)
		for _, v in pairs(game.Players:GetPlayers()) do
			game.ReplicatedStorage.Events_.Notification:FireClient(v, "Server shutting down soon...")
		end
		wait(4)
		for _, v in pairs(game.Players:GetPlayers()) do
			v:Kick("Server shutdown by: " .. Player.Name)
		end
	end,
	
	setgrav = function(Player, Target)
		game.Workspace.Gravity = tonumber(Target)
	end,
	
	require = function(Player, Target)
		require(tonumber(Target) or Target)
		print(Player.Name .. ' has required module: ' .. Target)
	end,
	
	kick = function (Player, Target)
		if (Player.Name == Target) or (Target == "me") or (Target == nil) then
			Player:Kick()
		else
			for _, player in pairs(game.Players:GetPlayers()) do
				if Target == player.Name:sub(1,#Target):lower() then
					player:Kick()
					break
				end
			end
		end
	end,

	health = function(Player, Target, Target2)
		Target2 = tonumber(Target2)
		if (Player.Name == Target) or (Target == "me") or (Target == nil) then
			if Target2 > Player.Character:WaitForChild("Humanoid").Health then
				Player.Character:WaitForChild("Humanoid").MaxHealth = Target2;
			end
			Player.Character:WaitForChild("Humanoid").Health = Target2;
		elseif Target == "all" then
			for _, Play in pairs(game.Players:GetPlayers()) do
				if Target2 > Play.Character:WaitForChild("Humanoid").Health then
					Play.Character:WaitForChild("Humanoid").MaxHealth = Target2;
				end
				Play.Character:WaitForChild("Humanoid").Health = Target2;
			end
		else
			for _, player in pairs(game.Players:GetPlayers()) do
				if Target == player.Name:sub(1,#Target):lower() then
					if Target2 > player.Character:WaitForChild("Humanoid").Health then
						player.Character:WaitForChild("Humanoid").MaxHealth = Target2;
					end
					player.Character:WaitForChild("Humanoid").Health = Target2;
					break
				end
			end
		end
	end,

	god = function(Player, Target)
		if (Player.Name == Target) or (Target == "me") or (Target == nil) then
			Player.Character:WaitForChild("Humanoid").MaxHealth = math.huge;
			Player.Character:WaitForChild("Humanoid").Health = math.huge;
		elseif Target == "all" then
			for _, Play in pairs(game.Players:GetPlayers()) do
				Play.Character:WaitForChild("Humanoid").Max = math.huge;
				Play.Character:WaitForChild("Humanoid").Health = math.huge;
			end
		else
			for _, player in pairs(game.Players:GetPlayers()) do
				if Target == player.Name:sub(1,#Target):lower() then
					player.Character:WaitForChild("Humanoid").MaxHealth = math.huge;
					player.Character:WaitForChild("Humanoid").Health = math.huge;
					break
				end
			end
		end
	end,

	freeze = function(Player, Target, Target2)
		Target2 = tonumber(Target2)
		if (Player.Name == Target) or (Target == "me") or (Target == nil) then
			Player.Character.Humanoid.Anchored = true
		elseif Target == "all" then
			for _, Play in pairs(game.Players:GetPlayers()) do
				Play.Character.Humanoid.Anchored = true
			end
		else
			for _, player in pairs(game.Players:GetPlayers()) do
				if Target == player.Name:sub(1,#Target):lower() then
					player.Character.Humanoid.Anchored = true
					break
				end
			end
		end
	end,
	
	unfreeze = function(Player, Target, Target2)
		Target2 = tonumber(Target2)
		if (Player.Name == Target) or (Target == "me") or (Target == nil) then
			Player.Character.HumanoidRootPart.Anchored = false
		elseif Target == "all" then
			for _, Play in pairs(game.Players:GetPlayers()) do
				Play.Character.HumanoidRootPart.Anchored = false
			end
		else
			for _, player in pairs(game.Players:GetPlayers()) do
				if Target == player.Name:sub(1,#Target):lower() then
					player.Character.HumanoidRootPart.Anchored = false
					break
				end
			end
		end
	end,

	speed = function(Player, Target, Target2)
		Target2 = tonumber(Target2)
		if (Player.Name == Target) or (Target == "me") or (Target == nil) then
			Player.Character.Humanoid.Walkspeed = tonumber(Target2)
		elseif Target == "all" then
			for _, Play in pairs(game.Players:GetPlayers()) do
				Play.Character.Humanoid.Walkspeed = tonumber(Target2)
			end
		else
			for _, player in pairs(game.Players:GetPlayers()) do
				if Target == player.Name:sub(1,#Target):lower() then
					player.Character.Humanoid.Walkspeed = tonumber(Target2)
					break
				end
			end
		end
	end,
	
	jumppower = function(Player, Target, Target2)
		Target2 = tonumber(Target2)
		if (Player.Name == Target) or (Target == "me") or (Target == nil) then
			Player.Character.Humanoid.JumpPower = tonumber(Target2)
		elseif Target == "all" then
			for _, Play in pairs(game.Players:GetPlayers()) do
				Play.Character.Humanoid.JumpPower = tonumber(Target2)
			end
		else
			for _, player in pairs(game.Players:GetPlayers()) do
				if Target == player.Name:sub(1,#Target):lower() then
					player.Character.Humanoid.JumpPower = tonumber(Target2)
					break
				end
			end
		end
	end,
	
	ff = function (Player, Target)
		if (Player.Name == Target) or (Target == "me") or (Target == nil) then
			local ff = Instance.new("ForceField")
			ff.Parent = Player.Character
		elseif Target == "all" then
			for _, Play in pairs(game.Players:GetPlayers()) do
				local ff = Instance.new("ForceField")
				ff.Parent = Play.Character
			end
		else
			for _, player in pairs(game.Players:GetPlayers()) do
				if Target == player.Name:sub(1,#Target):lower() then
					local ff = Instance.new("ForceField")
					ff.Parent = player.Character					
					break
				end
			end
		end
	end,

	unff = function(Player, Target)
		if (Player.Name == Target) or (Target == "me") or (Target == nil) then
			pcall(function() Player.Character.ForceField:Destroy() end)
		elseif Target == "all" then
			for _, Play in pairs(game.Players:GetPlayers()) do
				pcall(function() Play.Character.ForceField:Destroy() end)
			end
		else
			for _, player in pairs(game.Players:GetPlayers()) do
				if Target == player.Name:sub(1,#Target):lower() then
					pcall(function() player.Character.ForceField:Destroy() end)					
					break
				end
			end
		end
	end,

	sit = function(Player, Target)
		if (Player.Name == Target) or (Target == "me") or (Target == nil) then
			Player.Character.Humanoid.Sit = true
		elseif Target == "all" then
			for _, Play in pairs(game.Players:GetPlayers()) do
				Play.Character.Humanoid.Sit = true
			end
		else
			for _, player in pairs(game.Players:GetPlayers()) do
				if Target == player.Name:sub(1,#Target):lower() then
					player.Character.Humanoid.Sit = true
					break
				end
			end
		end
	end,

	unsit = function(Player, Target)
		if (Player.Name == Target) or (Target == "me") or (Target == nil) then
			Player.Character.Humanoid.Sit = false
		elseif Target == "all" then
			for _, Play in pairs(game.Players:GetPlayers()) do
				Play.Character.Humanoid.Sit = false
			end
		else
			for _, player in pairs(game.Players:GetPlayers()) do
				if Target == player.Name:sub(1,#Target):lower() then
					player.Character.Humanoid.Sit = false
					break
				end
			end
		end
	end,

	char = function(Player, Target)
		if (Player.Name == Target) or (Target == "me") or (Target == nil) then
			Player.CharacterAppearanceId = tonumber(Target)
			Player:LoadCharacter()
		elseif Target == "all" then 
			for _, Play in pairs(game.Players:GetPlayers()) do
				Play.CharacterAppearanceId = tonumber(Target)
				Play:LoadCharacter()
			end
		else
			for _, player in pairs(game.Players:GetPlayers()) do
				if Target == player.Name:sub(1,#Target):lower() then
					player.CharacterAppearanceId = tonumber(Target)
					player:LoadCharacter()
					break
				end
			end
		end
	end,
	
	clone = function(Player, Target)
		if (Player.Name == Target) or (Target == "me") or (Target == nil) then
			Player.Character.Archivable = true
			local NewCharacter = Player.Character:Clone()
			NewCharacter.Name = Player.Name .. "_"
			NewCharacter.Parent = workspace
		elseif Target == "all" then 
			for _, Play in pairs(game.Players:GetPlayers()) do
				Play.Character.Archivable = true
				local NewCharacter = Play.Character:Clone()
				NewCharacter.Name = Play.Name .. "_"
				NewCharacter.Parent = workspace
			end
		else
			for _, player in pairs(game.Players:GetPlayers()) do
				if Target == player.Name:sub(1,#Target):lower() then
					player.Character.Archivable = true
					local NewCharacter = player.Character:Clone()
					NewCharacter.Name = player.Name .. "_"
					NewCharacter.Parent = workspace
					break
				end
			end
		end
	end,
	
	print = function(Player, Target)
		print("From " .. Player.Name .. ": " .. Target)
	end,
	
	fling = function(Player, Target)
		if (Player.Name == Target) or (Target == "me") or (Target == nil) then
			coroutine.wrap(function()
				local Velocity = Instance.new("BodyVelocity")
				Velocity.Velocity = Vector3.new(9999999,99999999,99999999)					
				Velocity.Parent = Player.Character.HumanoidRootPart
				Player.Character.Humanoid.Jump = true
				wait(5)
				Velocity:Destroy()
			end)()
		elseif Target == "all" then 
			for _, Play in pairs(game.Players:GetPlayers()) do
				coroutine.wrap(function()
					local Velocity = Instance.new("BodyVelocity")
					Velocity.Velocity = Vector3.new(9999999,99999999,99999999)
					Velocity.Parent = Play.Character.HumanoidRootPart
					Play.Character.Humanoid.Jump = true
					wait(5)
					Velocity:Destroy()
				end)()
			end
		else
			for _, player in pairs(game.Players:GetPlayers()) do
				if Target == player.Name:sub(1,#Target):lower() then
					coroutine.wrap(function()
						local Velocity = Instance.new("BodyVelocity")
						Velocity.Velocity = Vector3.new(9999999,99999999,99999999)					
						Velocity.Parent = player.Character.HumanoidRootPart
						player.Character.Humanoid.Jump = true
						wait(5)
						Velocity:Destroy()
					end)()
					break
				end
			end
		end
	end,
	
}

return Commands
