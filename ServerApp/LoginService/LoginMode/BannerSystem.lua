local dwSystemID = SystemNameToID.CBannerSystem;
local szSql = [[select * from "T_Role_Banner_Info" where "dwRoleID" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)
