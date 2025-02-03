

local strCmd = 'DELETE FROM "T_Role_Mail" WHERE "dwReceiver" = $1';

local function func(dwRoleID)
	CPlayerDBQuery:execute(strCmd, dwRoleID);
end


CDeleteCall:AddCall(func);



