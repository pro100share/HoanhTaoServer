

local dwSystemID = SystemNameToID.CAutoBattleSystem;
local szSql = [[select * from "T_Role_Auto_Battle_Setting" where "dwRoleID" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}

CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)
