




local dwSystemID = SystemNameToID.CScriptSystem;
local szSql = [[select * from "T_Account_Charge_Record" where "dwAccountID" = %s and "dwGold">0]];
local tbParam = 
{
	{
		Param = ParamType.dwAccountID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1,1)