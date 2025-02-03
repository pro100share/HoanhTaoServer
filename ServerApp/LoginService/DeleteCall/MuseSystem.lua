

local strCmd = 'DELETE FROM "T_Role_Muse" WHERE "dwRoleID" = $1';

local function func(dwRoleID)
	CPlayerDBQuery:execute(strCmd, dwRoleID);
end;


CDeleteCall:AddCall(func)



