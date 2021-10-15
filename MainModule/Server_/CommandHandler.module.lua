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
			require(script.Parent.Start_Noclip):setCollidable(Player)
		elseif Target == "all" then
			for _, Play in pairs(game.Players:GetPlayers()) do
				require(script.Parent.Start_Noclip):setCollidable(Play)
			end
		else
			for _, player in pairs(game.Players:GetPlayers()) do
				if Target == player.Name:sub(1,#Target):lower() then
					require(script.Parent.Start_Noclip):setCollidable(player)
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
			Player.Character:WaitForChild("Humanoid").Health = Target2;
		elseif Target == "all" then
			for _, Play in pairs(game.Players:GetPlayers()) do
				Play.Character:WaitForChild("Humanoid").Health = Target2;
			end
		else
			for _, player in pairs(game.Players:GetPlayers()) do
				if Target == player.Name:sub(1,#Target):lower() then
					player.Character:WaitForChild("Humanoid").Health = Target2;
					break
				end
			end
		end
	end,
}

return Commands
