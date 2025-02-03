--[[
	ÐÞ³ÇÇ½ÏµÍ³
	ÇúÓ¨
	2013-04-26
]]


local dwSystemID = SystemNameToID.CBuildRampartSystem;
local szSql = [[select * from "T_Build_Rampart_Info" where "dwRoleId" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}

CLoginMode:AddMode(dwSystemID,szSql,tbParam)
