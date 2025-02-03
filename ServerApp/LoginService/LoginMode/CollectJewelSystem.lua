

local dwSystemID = SystemNameToID.CCollectJewelSystem;
local szSql = [[select * from "T_Role_CollectJewel" where "dwRoleID" = %s LIMIT 1]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)