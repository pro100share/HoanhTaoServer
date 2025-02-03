local dwSystemID = SystemNameToID.CShieldSystem;
local szSql = [[select * from "T_Role_Shield" where "nRoleID" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)