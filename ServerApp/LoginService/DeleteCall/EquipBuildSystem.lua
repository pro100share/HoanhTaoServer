local strCmd1 = 'delete from "T_Equip_Build_Info" where "dwRoleId" = $1';     --0
local strCmd2 = 'delete from "T_Role_Build_Info" where "dwRoleId" = $1';  --1

local function func(dwRoleID)
	CPlayerDBQuery:execute(strCmd1, dwRoleID);
	CPlayerDBQuery:execute(strCmd2, dwRoleID);
end

CDeleteCall:AddCall(func);