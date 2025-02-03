

local dwSystemID = SystemNameToID.CAmuletSystem;
local szSql = [[select * from "T_Role_Amulet" where "RoleID" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}

CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)