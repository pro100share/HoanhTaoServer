



local dwSystemID = SystemNameToID.CPlayerShopSystem;
local szSql = [[select * from "T_Role_PlayerShopItem" where "dwRoleID" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)

local szSql2 = [[select * from "T_Role_PlayerShopName" where "dwRoleID" = %s]];

CLoginMode:AddMode(dwSystemID,szSql2,tbParam,2)