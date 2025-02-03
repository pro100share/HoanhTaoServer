local dwSystemID = SystemNameToID.CStoneSystem;
local szSql = [[select * from "T_Role_FoundryStone" where "dwRoleID" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)