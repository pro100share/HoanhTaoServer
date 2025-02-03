

local strCmd = 'DELETE FROM "T_Role_Martial_Info" WHERE "dwRoleID" = $1';

local function func(dwRoleID)
	CPlayerDBQuery:execute(strCmd, dwRoleID);
end


CDeleteCall:AddCall(func);



