


local dwSystemID = SystemNameToID.CCollectSystem;
local szSql = [[select * from "T_Role_Collect" where "dwRoleID" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}

CLoginMode:AddMode(dwSystemID,szSql,tbParam)