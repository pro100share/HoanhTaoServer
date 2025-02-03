-- 通天塔消息文件

-- 请求排行榜的信息
define.OnRequestTongTianTowerChartMsg
{
	LineID = 0;
}
when{}
function OnRequestTongTianTowerChartMsg(LineID)
	CTongTianTowerMgr:SendInfo(LineID);
end;

-- 更新星级最高的玩家信息
define.TongTianTowerUpdateChartMsg
{
	tChart = {},
}
when{}
function TongTianTowerUpdateChartMsg(tChart)
	CTongTianTowerMgr:Update(tChart);
end
