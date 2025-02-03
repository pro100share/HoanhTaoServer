




local dwSystemID = SystemNameToID.CSettingSystem;
local szSql = [[select * from "T_Role_Setting" where "dwRoleID" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwAccountID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1,1)