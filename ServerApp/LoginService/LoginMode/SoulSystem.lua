

local dwSystemID = SystemNameToID.CSoulSystem;
local szSql1 = [[select * from "T_Role_Soul_System" where "dwRoleID" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql1,tbParam,1)


local szSql2 = [[select * from "T_Role_Soul_Object" where "dwRoleID" = %s]];

CLoginMode:AddMode(dwSystemID,szSql2,tbParam,2)

