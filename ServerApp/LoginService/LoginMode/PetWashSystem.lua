local dwSystemID = SystemNameToID.CPetWashSystem;
local szSql = [[select * from "T_PetWash_Info" where "dwRoleID" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1,1)