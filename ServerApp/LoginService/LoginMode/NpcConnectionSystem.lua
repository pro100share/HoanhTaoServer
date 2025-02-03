




local dwSystemID = SystemNameToID.CNpcConnectionSystem;
local szSql = [[select * from "T_Role_NpcConnection" where "dwRoleID" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)