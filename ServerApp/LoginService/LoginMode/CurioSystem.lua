local dwSystemID = SystemNameToID.CCurioSystem;
local szSql = [[select * from "T_Role_Curio" where "nRoleId" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)