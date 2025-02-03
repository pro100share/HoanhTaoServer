local dwSystemID = SystemNameToID.CFashionDressSystem;
local szSql = [[select * from "T_Role_FashionDress" where "dwRoleID" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)

local szSq2 = [[select * from "T_Role_HuaShenDan" where "dwRoleID" = %s]];
CLoginMode:AddMode(dwSystemID,szSq2,tbParam,2)