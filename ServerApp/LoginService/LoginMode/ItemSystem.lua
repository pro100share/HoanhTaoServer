




local dwSystemID = SystemNameToID.CItemSystem;
local szSql = [[select * from "T_Role_ItemSystem" where "dwRoleID" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)

local szSql2 = [[select * from "T_Role_Item_Normal" where "dwRoleID" = %s]];
CLoginMode:AddMode(dwSystemID,szSql2,tbParam,2)

local szSql3 = [[select * from "T_Role_Item_Equip" where "dwRoleID" = %s]];
CLoginMode:AddMode(dwSystemID,szSql3,tbParam,3)