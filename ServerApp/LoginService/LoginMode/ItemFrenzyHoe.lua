



local dwSystemID = SystemNameToID.CFrenzyHoeSystem;
local szSql = [[select * from "T_Item_FrenzyHoe"]];
local tbParam = 
{

}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1,1)


local szSql2 = [[select * from "T_Role_FrenzyHoe" where "dwRoleId" = %s]];
local tbParam1 = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql2,tbParam1,2,1)


-- local szSql3 = [[select * from "T_BroadCast_FrenzyHoe"]];
-- local tbParam2 = 
-- {

-- }
-- CLoginMode:AddMode(dwSystemID,szSql3,tbParam2,3,1)

