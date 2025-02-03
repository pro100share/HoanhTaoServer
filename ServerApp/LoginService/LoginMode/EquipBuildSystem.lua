local dwSystemID = SystemNameToID.CEquipBuildSystem;
local szSql = [[select "szBuildInfo", "dwSuitLevel" from "T_Equip_Build_Info" where "dwRoleId" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)

local szSql2 = [[select "dwCritBless", "dwBuildNum" from "T_Role_EquipBuild_Info" where "dwRoleId" = %s]];

CLoginMode:AddMode(dwSystemID,szSql2,tbParam,2)