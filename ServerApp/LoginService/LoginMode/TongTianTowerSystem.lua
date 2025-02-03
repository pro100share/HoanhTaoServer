local dwSystemID = SystemNameToID.CTongTianTowerSystem;
local szSql = [[select * from "T_Role_TongTianTower_Info" where "nRoleId" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)