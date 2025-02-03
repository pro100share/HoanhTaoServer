--[[
	³äÖµ½±ÀøÏµÍ³
	ÇúÓ¨
	2013-06-13
]]


local dwSystemID = SystemNameToID.CFullAwardSys;
local szSql = [[select * from "T_Role_Full_Award" where "dwRoleId" = %s]];
local tbParam = 
{
	{
		Param = ParamType.dwRoleID;
	};
}

CLoginMode:AddMode(dwSystemID,szSql,tbParam)
