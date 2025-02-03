local dwSystemID = SystemNameToID.CGuildSystem;
local szSql = [[select * from "T_Role_GuildLD" where "dwRoleID" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)