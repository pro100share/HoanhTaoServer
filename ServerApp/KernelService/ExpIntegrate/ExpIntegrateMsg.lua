--[[
���ܣ��齱ϵͳ��Ϣ��
���ߣ����в�
ʱ�䣺2013-910
--]]


--GS�������Ͼ������Ϣ(ȫ�����ȼ�)
define.OnReqExpIntegrateMsg
{
	LineID = 0;
}
when{}
function OnReqExpIntegrateMsg(LineID)
	CExpIntegrateMgr:SendInfoToGS(LineID);
end;


--GS�������ȫ�����ȼ�
define.OnExpInteMaxlLevelMsg
{
	MaxLevel = 0,
}
when{}
function OnExpInteMaxlLevelMsg(MaxLevel)
	CExpIntegrateMgr:SyncMaxLevel(MaxLevel)
end

