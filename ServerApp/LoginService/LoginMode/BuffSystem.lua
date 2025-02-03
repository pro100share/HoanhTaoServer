

local dwSystemID = SystemNameToID.CBuffSystem;
local szSql = [[select "dwBuffID", "dwEntityID", "dwTime", "dwValue", "dwLeaveTime", "dwLevel", "dwEffectNum", "dwFixTime" from "T_Role_Buff_Info" where "dwRoleID" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}

CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)


