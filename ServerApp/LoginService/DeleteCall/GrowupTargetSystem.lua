

local strCmd1 = 'delete from "T_Role_GrowupTarget" where "dwRoleID" = $1';

local function func(dwRoleID)
	CPlayerDBQuery:execute(strCmd1, dwRoleID);
end


CDeleteCall:AddCall(func);



