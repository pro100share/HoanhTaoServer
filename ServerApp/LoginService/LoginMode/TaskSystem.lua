



local dwSystemID = SystemNameToID.CTaskSystem;
local szSql = [[select * from "T_Role_Task" where "dwRoleID" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)

local szSql2 = [[select * from "T_Role_Task_Ex" where "dwRoleID" = %s]];
CLoginMode:AddMode(dwSystemID,szSql2,tbParam,2)
