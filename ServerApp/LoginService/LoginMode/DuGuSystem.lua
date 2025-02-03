local dwSystemID = SystemNameToID.CDuGuSystem;
local szSql = [[select * from "T_Role_DuGuJiuJian_Info" where "dwRoleId" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleId;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)