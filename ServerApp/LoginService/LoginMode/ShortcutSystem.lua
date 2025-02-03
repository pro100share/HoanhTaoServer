



local dwSystemID = SystemNameToID.CShortcutSystem;
local szSql = [[select * from "T_Role_Shortcut_Info" where "dwRoleID" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)