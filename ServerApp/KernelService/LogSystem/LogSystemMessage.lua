function _G.OnPlayerCreateSession(AccountID,IP, UF)
    CLogSystemManager:activex(CConfig.Network.dwServerHostID,AccountID,4,"0",UF)
end;

function _G.OnPlayerLogin(AccountID, IP, UF)
    CLogSystemManager:game_enter(AccountID,UF,'0','0', IP);
end;

function _G.OnPlayerCreateRole(AccountID, RoleID, Name, IP ,UF)
	CLogSystemManager:create_role(AccountID, Name, UF , "0", "0", IP, RoleID, 0, 0);
	CLogSystemManager:activex(CConfig.Network.dwServerHostID, AccountID, 5, "0", UF);
end;
