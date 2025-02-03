local dwSystemID = SystemNameToID.CEscortSystem;
local szSql = [[select * from "T_Escort_Info" where "dwRoleId" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)
