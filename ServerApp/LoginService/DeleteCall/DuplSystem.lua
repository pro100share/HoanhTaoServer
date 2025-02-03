local strCmd1 = 'delete from "T_Dupl_Info" where "dwRoleId" = $1';     --0
local strCmd2 = 'delete from "T_Dupl_JiFen_Info" where "dwRoleId" = $1';  --1
local strCmd3 = 'delete from "T_Dupl_ZL_Boss_Record" where "roleId" = $1';  --1
local strCmd4 = 'delete from "T_Dupl_ZL_Info" where "roleId" = $1';  --1
local function func(dwRoleID)
	CPlayerDBQuery:execute(strCmd1, dwRoleID);
	CPlayerDBQuery:execute(strCmd2, dwRoleID);
	CPlayerDBQuery:execute(strCmd3, dwRoleID);
	CPlayerDBQuery:execute(strCmd4, dwRoleID);
end

CDeleteCall:AddCall(func);