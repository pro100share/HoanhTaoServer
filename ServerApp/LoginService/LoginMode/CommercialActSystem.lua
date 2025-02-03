

local dwSystemID = SystemNameToID.CCommercialActSystem;
local szSql = [[select * from "T_Account_CommercialAct" where "dwAccountID" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwAccountID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)