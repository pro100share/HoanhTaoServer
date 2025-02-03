-- 珍珑棋局消息文件

-- 请求星级最高的玩家的信息
define.OnRequestZhenlongStarMsg
{
	LineID = 0;
}
when{}
function OnRequestZhenlongStarMsg(LineID)
	CZhenlongChessMgr:SendStarInfo(LineID);
end;

-- 更新星级最高的玩家信息
define.OnZhenlongStarChgMsg
{
	PlayerInfo = {},
}
when{}
function OnZhenlongStarChgMsg(PlayerInfo)
	CZhenlongChessMgr:ChgStarInfo(PlayerInfo);
end
