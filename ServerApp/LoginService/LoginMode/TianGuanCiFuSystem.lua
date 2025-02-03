




local dwSystemID = SystemNameToID.CTianGuanCiFuSystem;
local szSql = [[select * from "T_Role_TianGuanCiFu" where "n_RoleID" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)
