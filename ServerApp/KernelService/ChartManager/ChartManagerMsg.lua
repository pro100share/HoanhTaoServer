--[[
功能：排行榜消息处理（服务器）
版本：v1.0
作者：郭肇义
时间：2012-04-05
]]

_define()

--初始化排行榜列表
define.KSInitChartListMsg
{
	Line = 0,
}
when{}
function KSInitChartListMsg(Line)
	local objLine = CGameLineManager:GetLine(Line)
	for _,eType in pairs(ChartSwitch) do
		local tabData = CChartManager:GetChartList(eType)
		local tabDataMsg = ChartParseList(tabData,ChartListMsgStN)
		local tabTempMsg = {{},{},{},{},{}}
		for i,v in pairs(tabDataMsg) do tabTempMsg[(i%5)+1][i] = v end
		objLine.OnKSUpdateChartListMsg{ Type = eType,Chart = tabTempMsg }
		local tabData = CChartManager:GetChartHead(eType)
		local tabDataMsg = ChartParseList(tabData,ChartHeadMsgStN)
		objLine.OnKSUpdateChartHeadMsg{ Type = eType,Chart = tabDataMsg }
	end
	objLine.OnKSInitChartMsg{}
end;

--更新排行榜列表
define.KSUpdateChartListMsg
{
	ID = 0;
}
when{}
function KSUpdateChartListMsg(ID)
	CChartManager:UpdateChart(ID)
end;

--更新排行榜数据
define.KSUpdateChartDataMsg
{
	Role = {},
	Data = {},
}
when{}
function KSUpdateChartDataMsg(Role,Data)
	CChartManager:SetChartData(Role,Data)
end;
