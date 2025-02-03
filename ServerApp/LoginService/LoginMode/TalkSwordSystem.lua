



local dwSystemID = SystemNameToID.CTalkSwordSystem;
local szSql = [[select * from "T_Role_TalkSword" where "nRoleID" = %s ]];
local tbParam = 
{
	{
		Param = ParamType.nRoleID;
	};
}
CLoginMode:AddMode(dwSystemID,szSql,tbParam,1)