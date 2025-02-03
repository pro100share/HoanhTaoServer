local dwSystemID = SystemNameToID.CGestSystem;
local szSql = [[select * from "T_Role_Gest_Info" where "dwRoleId" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)