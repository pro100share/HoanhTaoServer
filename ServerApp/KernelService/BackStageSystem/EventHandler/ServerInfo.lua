local base = _G;

local ServerInfo;

ServerInfo = function ()
	local setData = {
		Network = { dwServerHostID = CConfig.Network.dwServerHostID };
		szAdmDBIP = CConfig.szAdmDBIP;
		szAdmDBUser = CConfig.szAdmDBUser;
		szAdmDBPwd = CConfig.szAdmDBPwd;
		AccountDB = { ConnParam = { szDBName = CConfig.AccountDB.ConnParam.szDBName } };
		RoleDB = { ConnParam = { szDBName = CConfig.RoleDB.ConnParam.szDBName } };
	};
    BackstageSystem:SendToAS(BackstageSystem.setMessageID.ServerInfo, base.json.encode(setData));
end

BackstageSystem:RegistEvent("server_info", ServerInfo);