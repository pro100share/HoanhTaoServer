local dwSystemID = SystemNameToID.CKungFuSystem;
local szSql = [[select * from "T_Role_KungFu_Info" where "n_RoleID" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)