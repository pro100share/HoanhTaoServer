

local strCmd1 = 'DELETE FROM "T_Role_Task" WHERE "dwRoleID" = $1';
local strCmd2 = 'DELETE FROM "T_Role_Task_Ex" WHERE "dwRoleID" = $1';

local function func(dwRoleID)
	CPlayerDBQuery:execute(strCmd1, dwRoleID);
    CPlayerDBQuery:execute(strCmd2, dwRoleID);
end


CDeleteCall:AddCall(func);



