

local dwSystemID = SystemNameToID.CSwordFoundrySystem;
local szSql = [[select * from "T_Role_SwordFoundry" where "dwRoleID" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)