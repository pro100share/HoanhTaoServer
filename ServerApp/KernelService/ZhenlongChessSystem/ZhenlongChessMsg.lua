-- ���������Ϣ�ļ�

-- �����Ǽ���ߵ���ҵ���Ϣ
define.OnRequestZhenlongStarMsg
{
	LineID = 0;
}
when{}
function OnRequestZhenlongStarMsg(LineID)
	CZhenlongChessMgr:SendStarInfo(LineID);
end;

-- �����Ǽ���ߵ������Ϣ
define.OnZhenlongStarChgMsg
{
	PlayerInfo = {},
}
when{}
function OnZhenlongStarChgMsg(PlayerInfo)
	CZhenlongChessMgr:ChgStarInfo(PlayerInfo);
end
