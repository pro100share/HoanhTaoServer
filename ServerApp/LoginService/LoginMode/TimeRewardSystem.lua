



local dwSystemID = SystemNameToID.CTimeRewardSystem;
local szSql = [[select * from "T_Role_Time_Reward" where "dwRoleID" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)

local szSql2 = [[select * from "T_Role_Info" where "dwRoleID" = %s]];
CLoginMode:AddMode(dwSystemID,szSql2,tbParam,2)