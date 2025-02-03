local dwSystemID = SystemNameToID.CChallengeQunXiaSystem;
local szSql = [[select * from "T_Role_QunXia" where "dwRoleID" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)