                                                                                                        --[[
Head Admins | Full command permission
Admins | A set command permssion of your choice
Temp Admins | A set command permssion of your choice (typically lower)                                    ]]

return{
	prefix = ";";
	adminJoinMessage = true;
	advertising = true;
	freeAdmin = false;
	-------------
	Head_Admins = {
		"widesteal321"; 
		"player2";
	};
	---#
	-- All commands 
	-- Can only be made Head Admin through this script 
	-------------
	Admins = {
		"player1"; 
		"player2";
	};
	---#
	Admin_Commands = {"kill"; "kick"; "ff"; "unff"; "explode"; "leaderstat"; "speed"; "clonep"; "tempadmin"; "freeze"; "cmds";};
	-- A set list of commands
	-- Can be made admin through the ;admin command
	-------------
	BanLand = {
		"player1";
		"player2";
	};
	--#
	-- Users who cannot access your game
	-------------
	Temp_Admins = {
		"player1"; 
		"player2";
	};
	---#
	Temp_AdminCommands = {"kill"; "ff"; "unff"; "speed"; "cmds"; "freeze";};
	-- A set list of commands
	-- Can be made admin through the ;tempadmin command
	-------------
	GamePassId = 00000;
	GamePassRank = 1;
	-- Players that own your selected gamepass will receive what ranks
	-- 1 = tempadmins, 2 = admins, 3 = head admin
	PremiumAdmin = false;
	PremiumRank = 1;
	-- Players that own premium will receive what ranks.
	-- 1 = tempadmin, 2 = admins, 3 = head admin
}
