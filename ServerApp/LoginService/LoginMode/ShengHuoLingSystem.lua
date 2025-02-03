local dwSystemID = SystemNameToID.CShengHuoLingSystem;
local szSql = [[select * from "T_Role_ShengHuoLing" where "dwRoleID" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)