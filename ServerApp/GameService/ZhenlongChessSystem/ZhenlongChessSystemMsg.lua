--珍珑棋局消息

--珍珑棋局挑战消息
define.ZhenlongChessChallengeMsg
{
	user			= NONE,		
	BossIndex		= 0, 			--boss索引
	IsCostGold		= false;		--是否花费金币挑战
	IsBully			= false;		--是否是扫荡
}
when {user = NONE}
ZhenlongChessChallengeMsg = checkUser;
when{}
function ZhenlongChessChallengeMsg(user, BossIndex, IsCostGold, IsBully)
	local zhenlongChessSystem = user:GetSystem("CZhenlongChessSystem");
	if zhenlongChessSystem then
		-- print("ZhenlongChessChallengeMsg====", BossIndex, IsCostGold, IsBully)
		zhenlongChessSystem:ChallengeBoss(BossIndex, IsCostGold, IsBully);
	end
end

--领取星级奖励
define.ZhenlongChessReqStarAwardMsg
{
	user		= NONE,
	StarLevel	= 0,
}
when {user = NONE}
ZhenlongChessReqStarAwardMsg = checkUser;
when{}
function ZhenlongChessReqStarAwardMsg(user, StarLevel)
	local zhenlongChessSystem = user:GetSystem("CZhenlongChessSystem");
	if zhenlongChessSystem then
		zhenlongChessSystem:ReqStarAward(StarLevel);
	end
end

-- ks返回的星级最高的玩家信息
define.ZhenlongChessStarInfoChgMsg
{
	StarPlayerInfo = {},
}
when{}
function ZhenlongChessStarInfoChgMsg(StarPlayerInfo)
	CZhenlongChessChartManager:UpdateStarLevel(StarPlayerInfo);
end

--客户端请求星级最高的玩家信息
define.ReqZhenlongChessPlayerInfoMsg
{
	user		= NONE,
}
when {user = NONE}
ReqZhenlongChessPlayerInfoMsg = checkUser;
when{}
function ReqZhenlongChessPlayerInfoMsg(user)
	user.SyncZhenlongChessPlayerInfoMsg{PlayerInfo = 
		CZhenlongChessChartManager:GetStarPlayInfo()};
end
