




local dwSystemID = SystemNameToID.CSwordSystem;
local szSql = [[select * from "T_Role_Sword" where "dwRoleId" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)