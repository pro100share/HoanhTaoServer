local dwSystemID = SystemNameToID.CZhenlongChessSystem;
local szSql = [[select * from "T_Role_ZhenlongChess" where "dwRoleID" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)