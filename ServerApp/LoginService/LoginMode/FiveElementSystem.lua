




local dwSystemID = SystemNameToID.CFiveElementSystem;
local szSql = [[select * from "T_Role_FiveElem" where "dwRoleID" = %s LIMIT 1]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}

CLoginMode:AddMode(dwSystemID,szSql,tbParam)
