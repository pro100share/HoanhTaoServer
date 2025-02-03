--[[
	[ \brief 离线战斗
	[ \author 沈祺
	[ \date 2014-07-3
	[ 玩家可以与离线角色进行战斗
	[ 战斗已战斗力高低分胜负
	[ 内含类似排行榜功能
	[ \管理器接口文件
	]]

--临时配置表缓存
local tConfig = _G.TalkSwordConfig;
--临时脚本缓存
local tScript = _G.TalkSwordScript;

--[[
	[ \brief 组织排行榜缓存数据结构
	[ 结构为[nRole] = {排名,nRole,名称,战斗力,头像ID,是否是机器人};
	[ 提高遍历效率
	]]
function CTalkSwordManager:InitRankCache()
	for nRank,tPlayerInfo in ipairs(self.tRank) do
		tPlayerInfo.nRank = nRank;
		self.tRankCache[tPlayerInfo.nRoleID] = {};
		self.tRankCache[tPlayerInfo.nRoleID] = tPlayerInfo;
	end
end

--[[
	[ \brief 初始化排行榜单
	[ 通过配表初始化榜单
	[ 第一次功能初始化
	[ 组织一组服务器需要的数据,
	[ 在这里服务器需要为配变的机器人添加标志位来标志是否是机器人
	]]
function CTalkSwordManager:InitRank()
	--根据榜单最大数量创建初始化排行榜
	for i=1,CTalkSwordManager.DEFINE.RANKMAX do
		local tRobot = tConfig.Robot[i];
		--创建第一次榜单
		self.tRank[#self.tRank + 1] = tRobot;
		--将此数据插入数据库
		self.objDB:execute(self.RankDB.DBCmdInsert,
							#self.tRank,tRobot.nRoleID,tRobot.sPlayerName,
							tRobot.nAttack,tRobot.nIconID,
							tRobot.nContinuousKill,tRobot.nProfessionID,
							tRobot.nIsRobot,tRobot.nLevel);
	end
end

--[[
	[ \brief 根据排行获得对应玩家数据
	[ \param number nRank 名次
	[ \return table tInfo 返回当前玩家信息
	]]
function CTalkSwordManager:GetPlayerInfo(nRank)
	_assert(nRank > 0,"err nRank by CTalkSwordManager:GetPlayerInfo");

	local tInfo = {};
	if self.tRank[nRank] then
		table.copy(tInfo,self.tRank[nRank]);
	end
	return tInfo;
end

--[[
	[ \brief 通过RoleID创建一个榜单INFO
	[ 同事需要组织Cache
	[ \param number nRoleID 玩家ID
	[ \param number nBattleScore 战斗力
	[ \param number nLevel 玩家等级
	[ \return table tPlayerInfo 组织的榜单数据
	]]
function CTalkSwordManager:MakeRankInfo(nRoleID, nBattleScore, nLevel)
	local oPlayer = CPlayerManager:GetPlayerByRoleID(nRoleID);
	local tInfo = {};
	tInfo.nRank = CTalkSwordManager.DEFINE.RANKMAX + 1;
	tInfo.nRoleID = nRoleID;
	tInfo.sPlayerName = oPlayer:GetName();
	tInfo.nAttack = nBattleScore;
	tInfo.nIconID = oPlayer:GetIncoID();
	tInfo.nContinuousKill = 0;
	tInfo.nProfessionID = oPlayer:GetInfo().dwProf;
	tInfo.nIsRobot = 1;
	tInfo.nLevel = nLevel;
	return tInfo;
end

--[[
	[ \brief 通过脚本获取挑战列表排名
	[ \param number nRank 需要获取列表信息的排名
	[ \return table tList 挑战列表 [] = {[1] = 排名,[2] = 10, [3] = 5};  
	]]
function CTalkSwordManager:GetChallengeList(nRank)
	local tList = tScript:GetChallengeListNum(nRank);
	local tListInfo = {};
	for i=1,#tList do
		local tInfo = self.tRank[tList[i]];
		tInfo.nRank = tList[i];
		tListInfo[i] = tInfo;
	end
	return tListInfo;
end

--[[
	[ \brief 组织现在时间排行榜信息,使之改变为奖励列表
	[ 定时结算奖励榜单信息并存储数据库
	]]
function CTalkSwordManager:UpdateRewardList()
	local sDBCmd = "";
	if next(self.tRankReward) == nil then
		--没值,插入DB
		sDBCmd = self.RewardRankDB.DBCmdInsert;
	else
		--有值,更新DB
		sDBCmd = self.RewardRankDB.DBCmdUpdate;
	end
	self.tRankReward = {};
	-- 遍历榜单内的玩家,更新奖励榜
	for nRoleID,tPlayerInfo in pairs(self.tRankCache) do
		-- 这里如果是玩家
		if tPlayerInfo.nIsRobot then
			if CPlayerManager:GetPlayerByRoleID(nRoleID) then
				CPlayerManager:GetPlayerByRoleID(nRoleID).ReceiveRewardRankMsg{
											 RewardRank = tPlayerInfo.nRank };
			end
			self.tRankReward[nRoleID] = tPlayerInfo.nRank;
			self.objDB:execute(sDBCmd,tPlayerInfo.nRoleID, tPlayerInfo.nRank, 
														tPlayerInfo.nRoleID);
		end
	end
	-- 遍历不在榜且在线的玩家,更新奖励状态
	for k,v in pairs(CPlayerManager.setAllPlayer) do
		if not self.tRankCache[v:GetRoleID()] then --不在榜单内
			CPlayerManager:GetPlayerByRoleID(v:GetRoleID()).
				ReceiveRewardRankMsg{RewardRank = 
							CTalkSwordManager:UpdatePlayerInfo(RoleID).nRank };
		end
	end
	-- 统一清空玩家领取状态数据
	self.objDB:execute(self.RoleTalkSword.DBCmdRewardState, 0);
end

--[[
	[ \brief 玩家申请自己的数据
	[ 针对一个玩家
	[ \param nRoleID
	]]
function CTalkSwordManager:UpdatePlayerInfo(nRoleID)
	local tPlayerInfo = {};
	tPlayerInfo.nRewardRank = CTalkSwordManager.DEFINE.RANKMAX + 1;
	if self.tRankReward[nRoleID] then
		tPlayerInfo.nRewardRank  = self.tRankReward[nRoleID];
	else
		--nil,该玩家不在奖励榜单中给默认奖励
	end
	tPlayerInfo.nRank = CTalkSwordManager.DEFINE.RANKMAX + 1;
	if self.tRankCache[nRoleID] then
		tPlayerInfo.nRank = self.tRankCache[nRoleID].nRank;
	else
		--nil 未上榜
	end
	tPlayerInfo.tChallengeList = self:GetChallengeList(tPlayerInfo.nRank);
	
	return tPlayerInfo;
end

--[[
	[ \brief 组织战报数据拼接字符串
	[ \param table tReport 战报信息
	[ \return string sReport 战报拼出来的字符串
	]]
function CTalkSwordManager:MakeStringByTable(tReport)
	local sReport = "";
	if not tReport then
		return sReport;
	end
	for i,tInfo in ipairs(tReport) do
		for n,v in ipairs(tInfo)do
			local sSpace = ",";
			if n ~= #tInfo then
				sReport = sReport..v..sSpace;
			else
				sReport = sReport..v;
			end
		end
		sReport = sReport..";";
	end
	return sReport;
end;

--[[
	[ \brief 定时清空每个玩家华山论剑信息
	]]
function CTalkSwordManager:ResetPracticeTimes()
	CPlayerDBQuery:GetDBQuery():execute(self.RoleTalkSword.DBCmdClean,0,0,0);
	-- 在线的玩家重置系统中的属性
	for i,objLine in pairs(CGameLineManager:GetAllLine()) do
		objLine.GSRemoteCallMsg{System = "CTalkSwordSystem",Func = 
														"ResetPracticeTimes"};
	end
end

--[[
	[ \brief 增加连斩次数
	[ \param number nRank 玩家排名
	[ \param number nNum 增加的次数
	[ \param string sFailName 被挑战者名称
	[ \return bool 是否成功
	]]
function CTalkSwordManager:AddContinuousKill(nRank, nNum, sFailName)
	if not self.tRank[nRank] or self.tRank[nRank].nIsRobot == 0 then
		return false;
	end
	self.tRank[nRank].nContinuousKill = self.tRank[nRank].nContinuousKill + 
																		nNum;
	self:SaveBaseInfoDB(nRank);
	if self.tRank[nRank].nContinuousKill < tConfig.Kill[1] then
		return false;
	end
	local tInfo = {};
	for i,v in ipairs(tConfig.Kill) do
		if self.tRank[nRank].nContinuousKill == v then
			tInfo[1] = self.tRank[nRank].nContinuousKill;
			tInfo[2] = self.tRank[nRank].sPlayerName;
			tInfo[3] = self.tRank[nRank].nRoleID;
			tInfo[4] = sFailName;
			tInfo[5] = 0;
		end
	end
	if #tInfo == 0 then
		return false;
	end
	if not CPlayerManager:GetPlayerByRoleID(self.tRank[nRank].nRoleID) then
		return false;
	end
	CPlayerManager:GetPlayerByRoleID(
			self.tRank[nRank].nRoleID).TSKillNoticeMsg{ NoticeInfo = tInfo };
	return true;
end

--[[
	[ brief 清空连战次数
	[ \param number nRank 战斗失败的玩家排名
	[ \param string sName 战斗胜利的玩家名称
	[ \param number nRoleID 战斗胜利的玩家名称
	[ \return bool 是否成功
	]]
function CTalkSwordManager:CloseContinuousKill(nRank, sName, nRoleID)
	if not self.tRank[nRank] then
		return false;
	end
	if self.tRank[nRank].nContinuousKill > tConfig.Kill[1] then
		local tInfo = {};
		tInfo[1] = self.tRank[nRank].nContinuousKill;
		tInfo[2] = self.tRank[nRank].sPlayerName;
		tInfo[3] = nRoleID;
		tInfo[4] = sName;
		tInfo[5] = 1;
		if CPlayerManager:GetPlayerByRoleID(self.tRank[nRank].nRoleID) then
			CPlayerManager:GetPlayerByRoleID(
				self.tRank[nRank].nRoleID).TSKillNoticeMsg{ NoticeInfo = tInfo};
		end
	end
	self.tRank[nRank].nContinuousKill = 0;
	self:SaveBaseInfoDB(nRank);
	return true;
end
