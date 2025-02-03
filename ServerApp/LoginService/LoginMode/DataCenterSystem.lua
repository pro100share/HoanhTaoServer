


local dwSystemID = SystemNameToID.CDataCenterSystem;
local szSql = [[select * from "T_Role_DataCenter" where "dwRoleID" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}

CLoginMode:AddMode(dwSystemID,szSql,tbParam)