--

local dwSystemID = SystemNameToID.CBaiduSystem;
local szSql = [[select * from "T_Role_Baidu" where "dwRoleID" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)
