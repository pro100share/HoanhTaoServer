





local dwSystemID = SystemNameToID.CPulseSystem;
local szSql = [[select * from "T_Role_Pulse" where "dwRoleID" = %s LIMIT 1]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)