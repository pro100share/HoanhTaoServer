
--[[
功能：服务器大事件数据管理消息(KS)
版本：v1.0
作者：粟宇征
时间：2012-12-05
]]

_define()

--GS服务器请求添加
define.KSRequestSeverEventDataMsg
{
	ResID = 0,
	Data = {},
}
when{}
function KSRequestSeverEventDataMsg(ResID,Data)
	local tabInfo = CSeverEventDataManager:GetTabData()
	local tempTabInfo = {};
	tempTabInfo.tabData = tabInfo;
	tempTabInfo.Data = Data;
	local objPlayer = CGameLineManager:GetPlayer(ResID)
	if not objPlayer then return end
	objPlayer.OnKSGetSeverEventDataMsg{ TabInfo = tempTabInfo }
end;

--GS服务器添加数据
define.KSAddSeverEventDataMsg
{
	ResID = 0,
	Data = {},
}
when{}
function KSAddSeverEventDataMsg(ResID,Data)
	CSeverEventDataManager:WriteDB(Data);
end;
