

local dwSystemID = SystemNameToID.CTitleSystem;
local szSql = [[select * from "T_Role_Title" where "dwRoleID" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}

CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)