

local dwSystemID = SystemNameToID.COnlineAwardsSystem;
local szSql = [[select * from "T_Role_OnlineAwards" where "dwRoleID" = %s LIMIT 1]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)