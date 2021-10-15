game.Players.PlayerAdded:Connect(function(Player)
	Player.Chatted:Connect(function(Message)
		local Settings = require(game:FindFirstChild("Sword_Admin" , true).Settings)
		if Message:sub(1,#Settings.prefix) == Settings.prefix then
			local Command = Message:sub(#Settings.prefix + 1, #(Message:split(" ")[1] or #Message))
			
			local CommandHandler = require(script.Parent.CommandHandler)
			local func = CommandHandler[Command]
			local succ, err = pcall(function() 
				func(Player, Message:split(" ")[2], Message:split(" ")[3])
			end)
			
			if not succ then
				print(err)
				game.ReplicatedStorage.Events_.Notification:FireClient(Player, err)
			end
		end
	end)
end)
