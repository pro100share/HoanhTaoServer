

local strCmd1 = 'delete from "T_Role_ItemSystem" where "dwRoleID" = $1';
local strCmd2 = 'delete from "T_Role_Item_Normal" where "dwRoleID" = $1';
local strCmd3 = 'delete from "T_Role_Item_Equip" where "dwRoleID" = $1';

local function func(dwRoleID)
	CPlayerDBQuery:execute(strCmd1, dwRoleID);
    CPlayerDBQuery:execute(strCmd2, dwRoleID);
    CPlayerDBQuery:execute(strCmd2, dwRoleID);
end


CDeleteCall:AddCall(func);



