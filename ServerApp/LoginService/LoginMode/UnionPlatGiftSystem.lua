



local dwSystemID = SystemNameToID.CUnionPlatGiftSystem;
local szSql = [[select * from "T_Role_UnionPlatGift" where "dwRoleID" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)
