



local dwSystemID = SystemNameToID.CFriendSystem;
local szSql = [[select * from "T_Role_Mood" where "dwRoleID" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)

local szSql2 = [[select * from "T_Role_Friend" where "dwRoleID" = %s]];
CLoginMode:AddMode(dwSystemID,szSql2,tbParam,2)
