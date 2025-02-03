

local dwSystemID = SystemNameToID.CCommercialGiftSys;
local szSql = [[select * from "T_CommercialGift" where "dwAccountID" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwAccountID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)