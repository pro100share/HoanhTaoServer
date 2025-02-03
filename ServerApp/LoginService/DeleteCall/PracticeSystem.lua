local strCmd1 = 'delete from "T_Practice_Info" where "dwRoleId" = $1';    
local function func(dwRoleID)
	CPlayerDBQuery:execute(strCmd1, dwRoleID);
end

CDeleteCall:AddCall(func);