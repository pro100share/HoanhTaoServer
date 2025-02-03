




local dwSystemID = SystemNameToID.CMegaKillSystem;
local szSql = [[select * from "T_Role_MegaKill" where "dwRoleID" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam)



