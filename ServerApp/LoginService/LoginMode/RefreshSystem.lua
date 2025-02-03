



local dwSystemID = SystemNameToID.CRefreshSystem;
local szSql = [[select * from "T_Role_Refresh" where "dwRoleID" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)