local dwSystemID = SystemNameToID.CTieBuShanSystem;
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}

local szSql1 = [[select "dwClothLevel", "dwClothExp", "dwForbidValue", "dwSuitLevel" from "T_Iron_Cloth_Info" where "dwRoleId" = %s]];

CLoginMode:AddMode(dwSystemID,szSql1,tbParam,1)