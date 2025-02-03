



local dwSystemID = SystemNameToID.CPKSystem;
local szSql = [[select * from "T_Role_Plus_Info" where "dwRoleID" = %s LIMIT 1]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)