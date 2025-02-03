


local dwSystemID = SystemNameToID.CMapSystem;
local szSql = [[select * from "T_Role_Map_Info" where "dwRoleID" = %s LIMIT 1]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)
