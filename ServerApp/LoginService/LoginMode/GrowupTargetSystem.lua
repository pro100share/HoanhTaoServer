



local dwSystemID = SystemNameToID.CGrowupTargetSystem;
local szSql = [[select * from "T_Role_GrowupTarget" where "dwRoleID" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)