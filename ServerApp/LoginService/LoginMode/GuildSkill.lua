



local dwSystemID = SystemNameToID.CGuildSkill;
local szSql = [[select * from "T_Role_GuildSkill" where "dwRoleID" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam)



