
local dwSystemID = SystemNameToID.CErrantSystem;
local szSql = [[select "dwMapId", "szKillMonster" from "T_Errant_Info" where "dwRoleId" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)

local szSql2 = [[select "szErrantAward" from "T_Errant_Award_Info" where "dwRoleId" = %s]];

CLoginMode:AddMode(dwSystemID,szSql2,tbParam,2)