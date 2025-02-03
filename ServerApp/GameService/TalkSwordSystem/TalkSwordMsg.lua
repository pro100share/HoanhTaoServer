--[[
	[ \brief 离线战斗
	[ \author 沈祺
	[ \date 2014-07-3
	[ 玩家可以与离线角色进行战斗
	[ 战斗已战斗力高低分胜负
	[ 内含类似排行榜功能
	]]

--[[
	协议功能：返回玩家请求的华山论家数据 KS to GS
	消息名称：ReceivePlayerInfoMsg
	参数：
	1.user
	--玩家基本信息{Rank = 0,RewardRank = 0，ChallengeList = nil}
	2.PlayerInfo = {};	--玩家华山论家数据
	]]
define.ReceivePlayerInfoMsg
{
	user = NONE;
	PlayerInfo = {};
}
when{ user = NONE }
ReceivePlayerInfoMsg = checkKSUser
when{}
function ReceivePlayerInfoMsg(user, PlayerInfo)
	user:GetSystem("CTalkSwordSystem"):ReceivePlayerInfoMsg(PlayerInfo);
end

--[[
	协议功能：更新挑战列表 KS to GS
	消息名称：UpdateChallengeListMsg
	参数：
	1.user 						--玩家实例
	2.ChallengeList = nil;		--新的挑战列表			
	]]
define.UpdateChallengeListMsg
{
	user = NONE;
	ChallengeList = {};
}
when{ user = NONE }
UpdateChallengeListMsg = checkKSUser
when{}
function UpdateChallengeListMsg(user, ChallengeList)
	user:GetSystem("CTalkSwordSystem"):SetChallengeList(ChallengeList);
	user.ReFreshOthersInfoMsg{ ChallengeRoleInfo = ChallengeList };
end

--[[
	协议功能：接收战报 KS to GS
	消息名称：ReceiveReportMsg
	参数：
	1.user 					--玩家实例
	2.Report = nil;			--战报列表
	]]
define.ReceiveReportMsg
{
	user = NONE;
	Report = {};
}
when{ user = NONE }
ReceiveReportMsg = checkKSUser
when{}
function ReceiveReportMsg(user, Report)
	user:GetSystem("CTalkSwordSystem"):SyncReport(Report);
end

--[[
	协议功能：战斗结果 KS to GS
	消息名称：BattleResultMsg
	参数：
	1.user 				--玩家实例
	2.Info = {};		--胜负,经验,荣誉
	3.PlayerInfo ={}	--更新的数据
	]]
define.BattleResultMsg
{
	user = NONE;		
	Info = {};
	PlayerInfo = {};		
}
when{ user = NONE }
BattleResultMsg = checkKSUser
when{}
function BattleResultMsg(user, Info, PlayerInfo)
	user:GetSystem("CTalkSwordSystem"):BattleResult(Info,PlayerInfo);
end

--[[
	协议功能：接收奖励排名 KS to GS
	消息名称：ReceiveRewardRank
	参数：
	1.user 				--玩家实例
	2.RewardRank = 0;	--玩家奖励排名			
	]]
define.ReceiveRewardRankMsg
{
	user = NONE;
	RewardRank = 0;			
}
when{ user = NONE }
ReceiveRewardRankMsg = checkKSUser
when{}
function ReceiveRewardRankMsg(user, RewardRank )
	local oTalkSwordSystem = user:GetSystem("CTalkSwordSystem");
	oTalkSwordSystem.tRankRewardInfo.nRewardRank = RewardRank;
	oTalkSwordSystem.tRankRewardInfo.nRewardState = 0;
	oTalkSwordSystem.oDBQuery:UpdateDB();
	oTalkSwordSystem:SyncClientInfo();
end

--[[
	协议功能：排名公告 KS to GS
	消息名称：TSRankNoticeMsg
	参数：
	1.user 				--玩家实例
	2.NoticeInfo 		--公告数据
	]]
define.TSRankNoticeMsg
{
	user = NONE;	
	NoticeInfo = {};
}
when{ user = NONE }
TSRankNoticeMsg = checkKSUser
when{}
function TSRankNoticeMsg(user, NoticeInfo)
	CGameApp.TalkSwordRankNoticeMsg{NoticeInfo = NoticeInfo};
end

--[[
	协议功能：连斩公告
	消息名称：TalkSwordKillNoticeMsg
	参数：
	1.user 				--玩家实例
	2.NoticeInfo		--公告数据
	]]
define.TalkSwordRankNoticeMsg
{
	user = NONE;
	NoticeInfo = {};	
}
when{ user = NONE }
TalkSwordRankNoticeMsg = checkKSUser
when{}
function TalkSwordRankNoticeMsg(NoticeInfo)
    local setNet = {};
	for i, objPlayer in pairs(CPlayerManager.setAllPlayer) do
		if objPlayer:GetInfo().dwLevel >= 20 then
            table.insert(setNet, objPlayer.objNet);
		end
	end
    _groupcallout(setNet, "TalkSwordRankNoticeMsg", {NoticeInfo = NoticeInfo});
end

--[[
	协议功能：连斩公告 KS to GS
	消息名称：TSKillNoticeMsg
	参数：
	1.user 			--玩家实例
	2.NoticeInfo 	--连斩信息
	]]
define.TSKillNoticeMsg
{
	
	user = NONE;	
	NoticeInfo = {};
}
when{ user = NONE }
TSKillNoticeMsg = checkKSUser
when{}
function TSKillNoticeMsg(user, NoticeInfo)
	CGameApp.TalkSwordKillNoticeMsg{NoticeInfo = NoticeInfo};
end

--[[
	协议功能：连斩公告
	消息名称：TalkSwordKillNoticeMsg
	参数：
	1.user 			--玩家实例
	2.NoticeInfo	--连斩信息
	]]
define.TalkSwordKillNoticeMsg
{
	user = NONE;	
	NoticeInfo = {};
}
when{ user = NONE }
TalkSwordKillNoticeMsg = checkKSUser
when{}
function TalkSwordKillNoticeMsg(NoticeInfo)
    local setNet = {};
	for i, objPlayer in pairs(CPlayerManager.setAllPlayer) do
		if objPlayer:GetInfo().dwLevel >= 20 then
            table.insert(setNet, objPlayer.objNet);
		end
	end
    _groupcallout(setNet, "TalkSwordKillNoticeMsg", {NoticeInfo	= NoticeInfo});
end

--[[
	协议功能：申请华山论剑数据 GS to C
	消息名称：RequestUpdateDataMsg
	参数：
	1.user 			--玩家实例
	]]
define.RequestUpdateDataMsg
{
	user = NONE;			
}
when{ user = NONE }
RequestUpdateDataMsg = checkUser
when{}
function RequestUpdateDataMsg(user)
	user:GetSystem("CTalkSwordSystem"):SyncClientInfo();
end

--[[
	协议功能：申请增加挑战次数
	消息名称：RequestAddChallengeCountsMsg
	参数：
	1.user 		--玩家实例
	]]
define.RequestAddChallengeCountsMsg
{
	user = NONE;			
}
when{ user = NONE }
RequestAddChallengeCountsMsg = checkUser
when{}
function RequestAddChallengeCountsMsg(user)
	user:GetSystem("CTalkSwordSystem"):AddChallengeNum();
end

--[[
	协议功能：申请消除挑战CD时间
	消息名称：RequestReduceCoolingTimeMsg
	参数：
	1.user  	--玩家实例
	]]
define.RequestReduceCoolingTimeMsg
{
	user = NONE;			
}
when{ user = NONE }
RequestReduceCoolingTimeMsg = checkUser
when{}
function RequestReduceCoolingTimeMsg(user)
	user:GetSystem("CTalkSwordSystem"):ClearCDTime();
end

--[[
	协议功能：申请使用鼓舞
	消息名称：RequestAddAttackMsg
	参数：
	1.user 		--玩家实例
	2.Currency	--货币类型，0为元宝，1为礼金
	]]
define.RequestAddAttackMsg
{
	user = NONE;	
	Currency = 0;			
}
when{ user = NONE }
RequestAddAttackMsg = checkUser
when{}
function RequestAddAttackMsg(user, Currency)
	--鼓舞功能暂时关闭
	--user:GetSystem("CTalkSwordSystem"):RequestAddAttack(Currency);
end

--[[
	协议功能：申请领取奖励
	消息名称：RequestGetPrizeMsg
	参数：
	1.user 			--玩家实例
	]]
define.RequestGetPrizeMsg
{
	user = NONE;			
}
when{ user = NONE }
RequestGetPrizeMsg = checkUser
when{}
function RequestGetPrizeMsg(user)
	user:GetSystem("CTalkSwordSystem"):RequestGetReward();
end

--[[
	协议功能：申请挑战
	消息名称：RequestChallengeOthersMsg
	参数：	
	1.user 				--被挑战的玩家ID
	2.RoleID 			--被挑战的玩家ID
	3.Rank				--排名
	]]
define.RequestChallengeOthersMsg
{
	user = NONE;		
	RoleID = 0;
	Rank = 0;				
}
when{ user = NONE }
RequestChallengeOthersMsg = checkUser
when{}
function RequestChallengeOthersMsg(user, RoleID, Rank)
	user:GetSystem("CTalkSwordSystem"):Battle(RoleID, Rank);
end
