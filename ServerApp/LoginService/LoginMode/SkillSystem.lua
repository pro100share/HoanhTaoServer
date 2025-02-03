




local dwSystemID = SystemNameToID.CSkillSystem;
local szSql = [[select * from "T_Role_Skill_Info" where "dwRoleID" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)

local szSql2 = [[select * from "T_Role_Battle_Info" where "dwRoleID" = %s LIMIT 1]];
CLoginMode:AddMode(dwSystemID,szSql2,tbParam,2)