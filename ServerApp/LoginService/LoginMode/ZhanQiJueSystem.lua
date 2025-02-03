local dwSystemID = SystemNameToID.CZhanQiJueSystem;
local szSql = [[select * from "T_Role_ZhanQiJue_Info" where "dwRoleId" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleId;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)
