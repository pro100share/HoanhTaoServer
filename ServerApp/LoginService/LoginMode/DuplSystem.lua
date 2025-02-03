





local dwSystemID = SystemNameToID.CDuplSystem;
local szSql = [[select "dwDuplId", "dwTimes", "dwDateTimes" from "T_Dupl_Info" where "dwRoleId" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}

CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)


local szSql2 = [[select "bossTimes" from "T_Dupl_ZL_Info" where "roleId" = %s]];
CLoginMode:AddMode(dwSystemID,szSql2,tbParam,2)

local szSql3 = [[select "dwScore","dwDuplId" from "T_Dupl_JiFen_Info" where "dwRoleId" = %s]];
CLoginMode:AddMode(dwSystemID,szSql3,tbParam,3)

local szSql4 = [[select "hitBossInfo" from "T_Dupl_ZL_Boss_Record" where "roleId" = %s]];
CLoginMode:AddMode(dwSystemID,szSql4,tbParam,4)
