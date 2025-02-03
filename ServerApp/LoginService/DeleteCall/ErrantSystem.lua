local strCmd1 = 'delete from "T_Errant_Info" where "dwRoleId" = $1';  
local strCmd2 = 'delete from "T_Errant_Award_Info" where "dwRoleId" = $1';       
local function func(dwRoleID)
	CPlayerDBQuery:execute(strCmd1, dwRoleID);
	CPlayerDBQuery:execute(strCmd2, dwRoleID);
end

CDeleteCall:AddCall(func);