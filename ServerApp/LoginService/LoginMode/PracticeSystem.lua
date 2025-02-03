local dwSystemID = SystemNameToID.CPracticeSystem;
local szSql = [[select * from "T_Practice_Info" where "dwRoleId" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)