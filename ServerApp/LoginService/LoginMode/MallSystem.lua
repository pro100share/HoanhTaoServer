




local dwSystemID = SystemNameToID.CMallSystem;
local szSql = [[select * from "T_Role_Mall" where "dwRoleID" = %s LIMIT 1]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)


local szSql2 = [[select * from "T_Role_LuckDraw" where "dwRoleID" = %s]];

CLoginMode:AddMode(dwSystemID,szSql2,tbParam,2)