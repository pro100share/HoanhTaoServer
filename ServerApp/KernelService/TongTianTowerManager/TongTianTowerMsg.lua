-- ͨ������Ϣ�ļ�

-- �������а����Ϣ
define.OnRequestTongTianTowerChartMsg
{
	LineID = 0;
}
when{}
function OnRequestTongTianTowerChartMsg(LineID)
	CTongTianTowerMgr:SendInfo(LineID);
end;

-- �����Ǽ���ߵ������Ϣ
define.TongTianTowerUpdateChartMsg
{
	tChart = {},
}
when{}
function TongTianTowerUpdateChartMsg(tChart)
	CTongTianTowerMgr:Update(tChart);
end
