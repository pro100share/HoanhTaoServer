local dwSystemID = SystemNameToID.CCrossSvrSystem;
local szSql = [[select "dwHonor" from "T_Role_Cross_Info" where "dwRoleId" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)