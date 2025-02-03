local dwSystemID = SystemNameToID.CPetAptitudeSystem;
local szSql = [[select * from "T_PetAptitude_Info" where "dwRoleID" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1,1)