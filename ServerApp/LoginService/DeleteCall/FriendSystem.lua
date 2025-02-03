

local strCmd = 'delete from "T_Role_Friend" where "dwRoleID" = $1';

local function func(dwRoleID)
	CPlayerDBQuery:execute(strCmd, dwRoleID);
end


CDeleteCall:AddCall(func);



