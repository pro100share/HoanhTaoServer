--[[
功能：KS摆摊系统消息处理
作者：
时间：2012-07-04
]]
--单播消息
define.KServPlayerShopSingleMsg
{
	RoleID = -1,
	Type = PlayerShopConfig.Invaild,
	ParamInfo = {},
}
when{ }
function KServPlayerShopSingleMsg(RoleID,Type,ParamInfo)
	CPlayerShopManager:DecodeShopSingleMsg(RoleID,Type,ParamInfo);
end

--GS发送，一组摆摊的数据，用于断线回连
define.KServPlayerShopListMsg
{
	ShopList = {};
}
when{}
function KServPlayerShopListMsg(ShopList)
	CPlayerShopManager:InitShopInfo(ShopList);
end;
