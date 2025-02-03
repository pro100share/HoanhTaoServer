



local dwSystemID = SystemNameToID.CVipSystem;
local szSql = [[select * from "T_Role_Vip" where "dwRoleID" = %s LIMIT 1]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)
