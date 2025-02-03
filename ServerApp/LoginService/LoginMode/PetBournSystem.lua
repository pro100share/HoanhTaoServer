local dwSystemID = SystemNameToID.CPetBournSystem;
local szSql = [[select * from "T_PetBourn_Info" where "dwRoleID" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1,1)