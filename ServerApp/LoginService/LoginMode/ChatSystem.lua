



local dwSystemID = SystemNameToID.CChatSystem;
local szSql = [[select "dwBanStart","dwBanTime" from "T_Role_Info" where "dwRoleID"=%s limit 1]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}

CLoginMode:AddMode(dwSystemID,szSql,tbParam)