local dwSystemID = SystemNameToID.CPetEquipSystem;
local szSql = [[select * from "T_PetEquip_Info" where "dwRoleID" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1,1)