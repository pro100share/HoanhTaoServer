

local dwSystemID = SystemNameToID.CCollectJewelLevelSystem;
local szSql = [[select * from "T_Role_CollectJewelLevel" where "dwRoleID" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}

CLoginMode:AddMode(dwSystemID,szSql,tbParam)