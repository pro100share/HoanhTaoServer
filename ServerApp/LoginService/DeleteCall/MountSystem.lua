

local strCmd1 = 'delete from "T_Role_MountSystem" where "n_RoleID" = $1';
local strCmd2 = 'delete from "T_Role_Mount" where "n_RoleID" = $1';

local function func(dwRoleID)
	CPlayerDBQuery:execute(strCmd1, dwRoleID);
    CPlayerDBQuery:execute(strCmd2, dwRoleID);
end


CDeleteCall:AddCall(func);



