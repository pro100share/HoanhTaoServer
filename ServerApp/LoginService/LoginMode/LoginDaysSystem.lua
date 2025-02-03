



local dwSystemID = SystemNameToID.CLoginDaysSystem;
local szSql = [[select * from "T_Role_LoginDays" where "dwRoleID" = %s LIMIT 1]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)


