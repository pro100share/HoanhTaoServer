




local dwSystemID = SystemNameToID.CNoviceSystem;
local szSql = [[select * from "T_Role_NoviceGuide_New" where "dwRoleID" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)