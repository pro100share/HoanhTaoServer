
local dwSystemID = SystemNameToID.CMuseSystem;
local szSql = [[select * from "T_Role_Muse" where "dwRoleID" = %s LIMIT 1]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}

CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)

local szSql2 = [[SELECT "a"."dwInjectID","a"."dwTime","szRoleName" FROM "T_Role_Info" "b", 
	(SELECT * FROM "T_Role_Inject_Log"  WHERE "dwRoleID" = %s) "a" 
	WHERE "a"."dwInjectID" = "b"."dwRoleID"]];

CLoginMode:AddMode(dwSystemID,szSql2,tbParam,2)



