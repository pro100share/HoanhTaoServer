




local dwSystemID = SystemNameToID.COnlineGiftSystem;
local szSql = [[select * from "T_Role_OnlineGift" where "dwRoleID" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)