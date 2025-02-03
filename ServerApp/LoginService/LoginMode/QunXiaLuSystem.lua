local dwSystemID = SystemNameToID.CQunXiaLuSystem;
local szSql = [[select * from "T_Role_QunXiaLu" where "dwRoleID" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)