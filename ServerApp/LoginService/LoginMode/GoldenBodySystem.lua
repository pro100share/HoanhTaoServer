local dwSystemID = SystemNameToID.CGoldenBodySystem;
local szSql = [[select * from "T_Role_GoldenBody" where "nRoleId" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)