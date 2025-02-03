



local dwSystemID = SystemNameToID.CHiddenWeaponSystem;
local szSql = [[select * from "T_Role_HiddenWeapon" where "dwRoleID" = %s ]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)