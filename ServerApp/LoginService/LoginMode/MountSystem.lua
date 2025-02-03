





local dwSystemID = SystemNameToID.CMountSystem;
local szSql = [[select * from "T_Role_MountSystem" where "n_RoleID" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)

local szSql2 = [[select * from "T_Role_Mount" where "n_RoleID" = %s]];
CLoginMode:AddMode(dwSystemID,szSql2,tbParam,2)