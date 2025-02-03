--[[
功能：排行榜消息处理（服务器）
版本：v1.0
作者：郭肇义
时间：2012-04-05
]]

_define()

--客户端请求排行榜列表
define.GetChartListMsg
{
	user = NONE,
	Type = 0,
	Begin = 0,
	End = 0,
}
when{user = NONE}
GetChartListMsg = checkUser;
when{}
function GetChartListMsg(user,Type,Begin,End)
	local objChartSystem = user:GetSystem("CChartSystem")
	objChartSystem:SentChartList(Type,Begin,End)
	local objEventSystem = user:GetSystem("CPlayerEventCenterSystem")
	objEventSystem:DoEvent(enumPlayerEventType.EventRequestChartData)
end;
--客户端请求排行榜头像
define.GetChartHeadMsg
{
	user = NONE,
	Type = 0,
}
when{user = NONE}
GetChartHeadMsg = checkUser;
when{}
function GetChartHeadMsg(user,Type)
	local objChartSystem = user:GetSystem("CChartSystem")
	objChartSystem:SentChartHead(Type)
end;
--客户端请求排行榜名人堂信息
define.GetStarRankingMsg
{
	user = NONE,
	Page = 0,	
}
when{user = NONE}
GetStarRankingMsg = checkUser;
when{}
function GetStarRankingMsg(user,Page)
	local objChartSystem = user:GetSystem("CChartSystem")
	objChartSystem:SentStarRankingHead(Page)
end;
--客户端请求排行榜人物
define.GetChartRoleMsg
{
	user = NONE,
	RoleID = 0,
}
when{user = NONE}
GetChartRoleMsg = checkUser;
when{}
function GetChartRoleMsg(user,RoleID)
	local objChartSystem = user:GetSystem("CChartSystem")
	objChartSystem:SentChartRole(RoleID)
end;


--客户端请求装备信息
define.GetChartEquipInfoMsg
{
	user = NONE,
	RoleID = 0,
}
when{user = NONE}
GetChartEquipInfoMsg = checkUser;
when{}
function GetChartEquipInfoMsg(user,RoleID)
	local fnCallBack = function(dwRoleID,dwCode)
		if dwCode == -1 then
			user.OnGetChartEquipInfoMsg{RoleID = dwRoleID}
			user.OnGetChartStoneInfoMsg{RoleID = dwRoleID}
		end
	end
	local dwRoleID = user:GetInfo().dwRoleID
	GSRemoteCall(RoleID,"CChartSystem","SentEquipInfo",{dwRoleID},fnCallBack)
end;

--客户端请求坐骑信息
define.GetChartMountInfoMsg
{
	user = NONE,
	RoleID = 0,
}
when{user = NONE}
GetChartMountInfoMsg = checkUser;
when{}
function GetChartMountInfoMsg(user,RoleID)
	local fnCallBack = function(dwRoleID,dwCode)
		if dwCode == -1 then
			user.OnGetChartMountInfoMsg{}
		end
	end
	local dwRoleID = user:GetInfo().dwRoleID
	GSRemoteCall(RoleID,"CChartSystem","SentMountInfo",{dwRoleID},fnCallBack)
end;
------------------------------------------------------------------------------------------------
define.OnKSInitChartMsg
{

}
when{}
function OnKSInitChartMsg()
	CChartManager:OnKSInitChart()
end;

define.OnKSSyncChartMsg
{

}
when{}
function OnKSSyncChartMsg()
	CChartManager:OnKSSyncChart()
end;

define.OnKSUpdateChartListMsg
{
	Type = 0,
	Chart = {},
}
when{}
function OnKSUpdateChartListMsg(Type,Chart)
	local Temp = Chart local Chart = {}
	for k,v in pairs(Temp) do
		for _k,_v in pairs(v) do Chart[_k] = _v end
	end
	Chart = ChartParseList(Chart,ChartListMsgNtS)
	CChartManager:OnKSUpdateChartList(Type,Chart)
end;

define.OnKSUpdateChartHeadMsg
{
	Type = 0,
	Chart = {},
}
when{}
function OnKSUpdateChartHeadMsg(Type,Chart)
	Chart = ChartParseList(Chart,ChartHeadMsgNtS)
	CChartManager:OnKSUpdateChartHead(Type,Chart)
end;