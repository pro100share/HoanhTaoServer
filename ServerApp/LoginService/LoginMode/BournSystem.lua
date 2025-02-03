


local dwSystemID = SystemNameToID.CBournSystem;
local szSql = [[select * from "T_Role_Bourn" where "dwRoleID" = %s LIMIT 1]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}

CLoginMode:AddMode(dwSystemID,szSql,tbParam)
