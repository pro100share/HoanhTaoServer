

local dwSystemID = SystemNameToID.CGourdSystem;
local szSql = [[select * from "T_Role_Gourd" where "dwRoleID" = %s LIMIT 1]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)