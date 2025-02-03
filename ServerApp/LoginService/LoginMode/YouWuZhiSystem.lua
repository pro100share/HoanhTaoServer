



local dwSystemID = SystemNameToID.CYouWuZhiSystem;
local szSql = [[select * from "T_Role_YWZ" where "dwRoleID" = %s ]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)