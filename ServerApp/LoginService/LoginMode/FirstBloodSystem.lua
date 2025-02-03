



local dwSystemID = SystemNameToID.CFirstBloodSystem;
local szSql = [[select * from "T_Role_FirstBlood" where "dwRoleID" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}

CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)


local szSql2 = [[select * from "T_Role_CountNumber" where "dwRoleID" = %s]];

CLoginMode:AddMode(dwSystemID,szSql2,tbParam,2)
