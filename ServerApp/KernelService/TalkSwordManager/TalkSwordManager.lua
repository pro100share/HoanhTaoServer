--[[
    [ \brief 离线战斗
    [ \author 沈祺
    [ \date 2014-07-3
    [ 玩家可以与离线角色进行战斗
    [ 战斗已战斗力高低分胜负
    [ 内含类似排行榜功能
    [ \KS管理器只管理 "排行榜" "奖励榜"
    ]]

--管理器对象
_G.CTalkSwordManager = CSingle:new();
--注册管理器
CSingleManager:AddSingle(CTalkSwordManager);
--临时配置表缓存
local tConfig = _G.TalkSwordConfig;
--临时脚本缓存
local tScript = _G.TalkSwordScript;
--华山论剑系统宏定义
CTalkSwordManager.DEFINE = {
	--排行榜最大数量
	RANKMAX = 500;
	--奖励榜单最大数量
	REWARDRANKMAX = 100;
};

--[[
	[ \brief 管理器初始化
	[ 管理器初始化
	[ return bool 初始化是否成功
	]]
function CTalkSwordManager:Create()
	--[[排名榜单 [排名] = {nRole或机器人编号,名称,战斗力,头像ID,是否是机器人,
								职业ID,连斩,等级}]]
	self.tRank = {};
	--[[排名榜单缓存,提高遍历效率[nRole] = {排名,名称,战斗力,头像ID,
											是否是机器人,职业ID,连斩,等级};]]
	self.tRankCache = {};
	--奖励榜单[nRole] = {排名};只保存玩家不保存机器人
	self.tRankReward = {};
	--数据库对象
	self.objDB = CPlayerDBQuery:GetDBQuery()
	self:DBCmdInit();
	if #self:InitRankDB() == 0 then --通过数据库取排行榜数据
		--新服:无华山论剑数据需要通过机器人创建一个排行榜
		self:InitRank();	--拿机器人填充排行榜单
	end
	self:InitRankRewardDB();
	self:InitRankCache();--此时Rank必然有数据否则报错

	--注册奖励榜单更新任务
	CAlarmClock:AddTask({dwTime = tConfig.PrizeRefreshTime}, 
						CAlarmTaskCycleType.eDay, 1, 0, 
						function ()
							self:UpdateRewardList()
						end,
						{})
	--定时清空每个玩家华山论剑信息
	CAlarmClock:AddTask({dwTime = tConfig.AttackDisabled}, 
						CAlarmTaskCycleType.eDay, 1, 0, 
						function() 
							self:ResetPracticeTimes();
						end,
						{})
	return true;
end

--[[
	[ \brief 排名公告
	[ 挑战者胜利后的公告信息
	[ \param number nWinRank 挑战成功胜利的玩家交换后的排名
	[ \param string sFailName 战斗失败的玩家名称
	]]
function CTalkSwordManager:RankNotice(nWinRank, sFailName)
	if nWinRank > tConfig.NoticeRank then
		return;
	end
	local tInfo = {};
	tInfo[1] = nWinRank;
	tInfo[2] = self.tRank[nWinRank].sPlayerName;
	tInfo[3] = self.tRank[nWinRank].nRoleID;
	tInfo[4] = sFailName;
	if CPlayerManager:GetPlayerByRoleID(self.tRank[nWinRank].nRoleID) then
		CPlayerManager:GetPlayerByRoleID(
			self.tRank[nWinRank].nRoleID).TSRankNoticeMsg{ NoticeInfo = tInfo};
	end
end

--[[
	[ \brief 获得榜单玩家信息
	[ \param number nRank 排名
	]]
function CTalkSwordManager:GetRankPlayerInfo(nRank, nRoleID, nAttack, nLevel)
	local oPlayerInfo = self:GetPlayerInfo(nRank);
	if not oPlayerInfo.nRoleID then
		--挑战者未上榜
		oPlayerInfo = self:MakeRankInfo(nRoleID, nAttack, nLevel);
	else
		oPlayerInfo.nAttack = nAttack
	end
	return oPlayerInfo;
end

--[[
	[ \brief 战斗逻辑
	[ \param table tInfo 挑战数据
    [       {number nChallengeRank 挑战者排名
	[       number nInjuredRank 被挑战者名次
	[       number nInjuredRoleID 被挑战者RoleID
	[       number nAttack 挑战者战斗力}
	]]
function CTalkSwordManager:Battle(tInfo)
	local oPlayerInfo1 = self:GetRankPlayerInfo(tInfo.nChallengeRank,
							tInfo.nChallengeRoleID,tInfo.nAttack,tInfo.nLevel);
	local oChallengePlayer = CPlayerManager:GetPlayerByRoleID(
														oPlayerInfo1.nRoleID);
	local oPlayerInfo2 = self:GetPlayerInfo(tInfo.nInjuredRank);
	if tInfo.nInjuredRoleID ~= oPlayerInfo2.nRoleID then
		oChallengePlayer.UpdateChallengeListMsg{
				ChallengeList = self:GetChallengeList(tInfo.nChallengeRank)};
		return;
	end
	local tBattleInfo = tScript:Battle(tInfo.nAttack,oPlayerInfo2.nAttack);
	if tBattleInfo.bWin == 0 then
		self:Win(tInfo, oPlayerInfo1, oPlayerInfo2 ,tBattleInfo);
	else
		self:Fail(tInfo, oPlayerInfo1, oPlayerInfo2 ,tBattleInfo);
	end
	oChallengePlayer.BattleResultMsg{ Info = tBattleInfo, PlayerInfo = 
								self:UpdatePlayerInfo(oPlayerInfo1.nRoleID)};
end

--[[
	[ \brief 战斗胜利
	[ \param table tInfo 挑战信息
	[ \param object oPlayerInfo1 挑战玩家信息
	[ \param object oPlayerInfo2 被挑战玩家信息
	[ \param table tBattleInfo 战斗信息
	]]
function CTalkSwordManager:Win(tInfo, oPlayerInfo1, oPlayerInfo2 ,tBattleInfo)
	--同步战报
	self:SysReport({tInfo.nChallengeRoleID,oPlayerInfo2.sPlayerName,
					tBattleInfo.bWin,tInfo.nInjuredRank,0,
					tInfo.nChallengeRank});
	self:SysReport({oPlayerInfo2.nRoleID,oPlayerInfo1.sPlayerName,
							tBattleInfo.bWin,tInfo.nChallengeRank,1,
							tInfo.nInjuredRank});
	--清空失败者连斩
	self:CloseContinuousKill(tInfo.nInjuredRank,oPlayerInfo1.sPlayerName,
													oPlayerInfo1.nRoleID);
	--胜利交换名次,必须是低名次挑战高名次
	if tInfo.nChallengeRank > tInfo.nInjuredRank then
		--交换排名
		self:SwapRank(oPlayerInfo1,tInfo.nInjuredRank);
		local tUpdatePlayerInfo1 = self:UpdatePlayerInfo(oPlayerInfo1.nRoleID);
		local tUpdatePlayerInfo2 = self:UpdatePlayerInfo(oPlayerInfo2.nRoleID);
		self:RankNotice(tUpdatePlayerInfo1.nRank,oPlayerInfo2.sPlayerName);
		local oInjuredPlayer = CPlayerManager:GetPlayerByRoleID(
														oPlayerInfo2.nRoleID);
		--被挑战者是否在线
		if oInjuredPlayer then
			--被挑战的玩家没有奖励
			oInjuredPlayer.BattleResultMsg{ Info = {nExp = 0, nHonor = 0}, 
											PlayerInfo = tUpdatePlayerInfo2 };
		end
		--增加胜利者连斩,有可能不在榜内，往上打
		self:AddContinuousKill(tInfo.nInjuredRank,1,oPlayerInfo2.sPlayerName);
	else
		--增加胜利者连斩,有可能不在榜内,往下打
		self:AddContinuousKill(tInfo.nChallengeRank,1,oPlayerInfo2.sPlayerName);
	end
end

--[[
	[ \brief 战斗失败
	[ \param table tInfo 挑战信息
	[ \param object oPlayerInfo1 挑战玩家信息
	[ \param object oPlayerInfo2 被挑战玩家信息
	[ \param table tBattleInfo 战斗信息
	]]
function CTalkSwordManager:Fail(tInfo, oPlayerInfo1, oPlayerInfo2, tBattleInfo)
	--清空失败者连斩
	self:CloseContinuousKill(tInfo.nChallengeRank,oPlayerInfo2.sPlayerName,
														oPlayerInfo1.nRoleID);
	--同步战报
	self:SysReport({tInfo.nChallengeRoleID,oPlayerInfo2.sPlayerName,
								tBattleInfo.bWin,tInfo.nChallengeRank,0,
								tInfo.nChallengeRank});
	self:SysReport({oPlayerInfo2.nRoleID,oPlayerInfo1.sPlayerName,
								tBattleInfo.bWin,tInfo.nInjuredRank,1,
								tInfo.nInjuredRank});
end

--[[
	[ \同步给GS战报信息,GS写入DB保存战报
	[ 如果被挑战者不在线,由KS写入数据库,在线则同步
	[ \param table tInfo 战报结构信息
	[ [1] = 挑战者ID
	[ [2] = 挑战者排名
	[ [3] = 另一个玩家的名字
	[ [4] = 是否胜利
	[ [5] = 当前玩家是否是挑战者
	[ [6] = 自己的当前排名
	]]
function CTalkSwordManager:SysReport(tInfo)
	local tReport = {};
	tReport[1] = tInfo[2];
	tReport[2] = tInfo[3];
	tReport[3] = tInfo[4];
	tReport[4] = tInfo[5];
	tReport[5] = tInfo[6];

	local oPlayer = CPlayerManager:GetPlayerByRoleID(tInfo[1]);
	if oPlayer then
		oPlayer.ReceiveReportMsg{ Report = tReport};
	else
		self:UpdateReportDB(tReport,tInfo[1]);
	end
end

--[[
	[ \brief 交换排名
	[ \param number tPlayerInfo 胜利人信息
	[ \param number nFailRank 失败人的排名
	[ \return bool 交换是否成功
	]]
function CTalkSwordManager:SwapRank(tPlayerInfo, nFailRank)
	--挑战者未上榜
	if not self.tRankCache[tPlayerInfo.nRoleID] then
		--组织排行榜缓存.保证两组数据同步
		tPlayerInfo.nRank = nFailRank;
		self.tRankCache[self.tRank[nFailRank].nRoleID] = nil;
		local tInfo = {};
		table.copy(tInfo, tPlayerInfo);
		self.tRankCache[tPlayerInfo.nRoleID] = tInfo;
		--组织排行榜数据
		self.tRank[nFailRank] = tInfo;
	else
		--组织排行榜数据
		local tInfo = {};
		local tInfo1 = {};
		table.copy(tInfo, tPlayerInfo);
		table.copy(tInfo1, self.tRank[nFailRank]);
		tInfo.nRank = nFailRank;
		tInfo1.nRank = tPlayerInfo.nRank;
		self.tRank[tPlayerInfo.nRank] = tInfo1;
		self.tRank[nFailRank] = tInfo;
		--组织排行榜缓存.保证两组数据同步
		self.tRankCache[tInfo.nRoleID].nRank = nFailRank;
		self.tRankCache[tInfo1.nRoleID].nRank = tInfo1.nRank;
		--更新被挑战者数据
		self:SaveBaseInfoDB(tPlayerInfo.nRank);
	end
	self:SaveBaseInfoDB(nFailRank);
	return true;
end
