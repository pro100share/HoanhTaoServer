


local dwSystemID = SystemNameToID.CEvaluateSystem;
local szSql = [[select * from "T_Role_Evaluate_Send_New" where "dwRoleID" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}

CLoginMode:AddMode(dwSystemID,szSql,tbParam)
