local dwSystemID = SystemNameToID.CKungFuExtendSystem;
local szSql = [[select * from "T_Role_KungFuExtend" where "nRoleId" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)