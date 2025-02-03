local dwSystemID = SystemNameToID.CHeroTokenSystem;
local szSql = [[select * from "T_Role_HeroToken_Info" where "dwRoleId" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleId;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)
