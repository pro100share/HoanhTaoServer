
local dwSystemID = SystemNameToID.CPetSystem;
local szSql = [[select * from "T_Pet_Info" where "dwRoleId" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}

CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)


----³èÎï¼¼ÄÜ
local szSql = [[select * from "T_PetSkill_Info" where "dwRoleID" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,2,1)


local szSql2 = [[select * from "T_PetSkill_Learned" where "dwRoleID" = %s]];
local tbParam1 = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql2,tbParam1,3,1)