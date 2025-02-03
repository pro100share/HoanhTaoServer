local dwSystemID = SystemNameToID.CRecyclingSystem;
local szSql = [[select * from "T_Role_Recycling" where "nRoleId" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)