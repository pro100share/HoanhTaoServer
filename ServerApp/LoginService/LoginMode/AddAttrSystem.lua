



local dwSystemID = SystemNameToID.CAddAttrSystem;
local szSql = [[select * from "t_role_addattrs" where "roleid" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam)



