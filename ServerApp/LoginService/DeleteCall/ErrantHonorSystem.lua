local strCmd1 = 'delete from "T_Errant_Honor_Info" where "dwRoleId" = $1';     --0

local function func(dwRoleID)
	CPlayerDBQuery:execute(strCmd1, dwRoleID);
end

CDeleteCall:AddCall(func);