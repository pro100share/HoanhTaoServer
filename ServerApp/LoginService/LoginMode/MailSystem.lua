


local dwSystemID = SystemNameToID.CMailSystem;
local szSql = [[select * from "T_Role_Mail" where "dwReceiver" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)