




local dwSystemID = SystemNameToID.CQihunSystem;
local szSql = [[select * from "t_role_qihun" where "roleid" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)



