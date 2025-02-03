

local strCmd1 = 'DELETE FROM "T_Role_Time_Reward" WHERE "dwRoleID" = $1';

local function func(dwRoleID)
	CPlayerDBQuery:execute(strCmd1, dwRoleID);
end


CDeleteCall:AddCall(func);



