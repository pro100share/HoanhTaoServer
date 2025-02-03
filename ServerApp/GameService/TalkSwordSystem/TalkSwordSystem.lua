--[[
	[ \brief 离线战斗
	[ \author 沈祺
	[ \date 2014-07-3
	[ 玩家可以与离线角色进行战斗
	[ 战斗已战斗力高低分胜负
	[ 内含类似排行榜功能
	]]

--系统对象
_G.CTalkSwordSystem = {};

--临时配置文件
local tConfig = _G.TalkSwordConfig;
--临时脚本文件
local tScript = _G.TalkSwordScript;

--[[
	[ \brief 系统构造
	[ 系统构造
	[ \return object 系统对象
	]]
function CTalkSwordSystem:new()
	local obj = CSystem:new("CTalkSwordSystem");
	for i,v in pairs(CTalkSwordSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end
	end
	return obj;
end

--[[
	[ \brief 初始化数据结构
	[ 初始化数据结构
	[ \return bool 是否创建成功
	]]
function CTalkSwordSystem:Create()
	--基础信息
	self.tBaseInfo = {
		nRank = 0;		    --玩家排名
		nChallengeUse = 0;	--当日已挑战次数
		nChallengeAdd = 0;	--增加的挑战次数
		nCDTime = 0;		--冷却时间
		bFullTime = false;	--冷却时间是不是从满开始
		nAttackAdd = 0;		--鼓舞战斗力的次数
	};
	--战报信息
	self.tReport = {};
	--奖励榜单信息,是否领取,奖励榜单排名
	self.tRankRewardInfo = { nRewardState = 1; nRewardRank = 0;};
	--挑战列表
	self.tChallengeList = {};
	--控制KS与GS的交互,战斗中必须完成交互才可以进行下一次
	self.bPrepare = true;
	--向KS申请数据
	self:RequestPlayerInfo();
	self.oDBQuery = CTalkSwordDB:new(self:GetPlayer():GetDBQuery(), self);
	local oData = self:GetPlayer():GetLineData("CTalkSwordSystem")[1];
	if oData then
        self:SetTalkSwordInfo(oData);
    else
		--新号当前领奖状态为2
		self.tRankRewardInfo.nRewardState = 2;
		self.oDBQuery:InsertTalkSwordInfo();
	end

	return true;
end

--[[
	[ \brief 设置华山论剑信息
	[ \param object oData 递减时间
	]]
function CTalkSwordSystem:SetTalkSwordInfo(oData)
	self:SetBaseInfo(oData);
	self:SetReportInfo(oData);
	self:SetRankRewardInfo(oData);
end

--[[
	[ \brief 更新函数
	[ 这里主要处理CD时间
	[ \param number nInterval 递减时间
	]]
function CTalkSwordSystem:Update(nInterval)
	if self.tBaseInfo.nCDTime > 0 then
		self:UpdateCDTime(-nInterval/1000);
	end
end

--[[
	[ \brief 销毁对象,保存数据库
	]]
function CTalkSwordSystem:Destroy()
	self.oDBQuery:UpdateDB();
end

--[[
	[ \brief 进入场景
	]]
function CTalkSwordSystem:OnEnterScene()
	self.tBaseInfo.nCDTime = self.tBaseInfo.nCDTime - (_now() - 
							self:GetPlayer():GetInfo().tmDownlineTime) / 1000;
	if self.tBaseInfo.nCDTime <= 0 then
		self.tBaseInfo.nCDTime = 0;
		self.tBaseInfo.bFullTime = false;
		self.oDBQuery:UpdateDB();
	end
end

--[[
	[ \brief 换线检测
	]]
function CTalkSwordSystem:OnChangeLineCheck()
 	return self.bPrepare;
end 

--[[
	[ \brief 进入换线
	[ 进入换线
	]]
function CTalkSwordSystem:OnChangeLineBegin()
	self:GetPlayer():SetLineData("CTalkSwordSystem",{
			nRank = self.tBaseInfo.nRank;
			nChallengeUse = self.tBaseInfo.nChallengeUse;
			nChallengeAdd = self.tBaseInfo.nChallengeAdd;
			nCDTime = self.tBaseInfo.nCDTime;
			bFullTime = self.tBaseInfo.bFullTime;
			nAttackAdd = self.tBaseInfo.nAttackAdd;
			tReport = self.oDBQuery:MakeStringByTable(self.tReport);
			nRewardState = self.tRankRewardInfo.nRewardState;
			nRankReward = self.tRankRewardInfo.nRankReward;
			tChallengeList = self.tChallengeList;
	});
end

--[[
	[ \brief 升级事件
	[ 升级事件
	[ \param string sEventName 事件
	]]
function CTalkSwordSystem:OnEventCenter(sEventName)
	if sEventName == "EventLevelUp" then
		if self.tBaseInfo.nRank == 0 then
			self:RequestPlayerInfo();
        else
            -- 已经申请数据过
		end
	end
end

--[[
	[ \brief 客户端请求华山论剑数据
	]]
function CTalkSwordSystem:SyncClientInfo()
	self:GetPlayer().TalkSwordInitMsg{ BaseInfo = self.tBaseInfo, 
										RecordInfo = self.tReport,
										PrizeInfo = self.tRankRewardInfo,
										ChallengeList = self.tChallengeList};
end

--[[
	[ \brief 处理战斗结果
	[ \结果同步给客户端
	[ \param table tInfo 胜负,经验,荣誉
	[ \param table tPlayerInfo 玩家基础信息
	[ \更新玩家信息
	]]
function CTalkSwordSystem:BattleResult(tInfo, tPlayerInfo)
	local oPlayer = self:GetPlayer();
	--排名改变需要更新
	if tPlayerInfo.tChallengeList then
		self.tBaseInfo.nRewardRank = tPlayerInfo.nRewardRank;
		self.tBaseInfo.nRank = tPlayerInfo.nRank;
		self.tChallengeList = tPlayerInfo.tChallengeList
		oPlayer.ReFreshOthersInfoMsg{ ChallengeRoleInfo = self.tChallengeList };
	end
	if tInfo.nExp ~= 0 then
		self.tBaseInfo.nChallengeUse = self.tBaseInfo.nChallengeUse + 1;
		self:UpdateCDTime( tConfig.CoolTime * 60 );
		oPlayer:AddExp(tInfo.nExp);
		local oCrossSystem = oPlayer:GetSystem("CCrossSvrSystem");
		oCrossSystem:SetCrossHonor(oCrossSystem.dwHonor + tInfo.nHonor);
		oPlayer.ChallengeOthersResultMsg{ Info = tInfo };
	end
	oPlayer.ReFreshMyselfInfoMsg{ BaseInfo = self.tBaseInfo };
	self.oDBQuery:UpdateDB();
	--重置标志位
	self.bPrepare = true;
end

--[[
	[ \brief 申请增加挑战次数
	]]
function CTalkSwordSystem:AddChallengeNum()
	_assert(self:HasAuthority("CTalkSwordSystem"));
	_assert(self.tBaseInfo.nChallengeAdd < #tConfig.AddCountsGold);
	_assert(self:GetPlayer():GetSystem("CItemSystem"):CostGold(
                    tConfig.AddCountsGold[self.tBaseInfo.nChallengeAdd + 1],
                    _G.ItemSysOperType.TalkSword));

	self.tBaseInfo.nChallengeAdd = self.tBaseInfo.nChallengeAdd + 1;
	self:GetPlayer().TalkSwordAddChallengeCountsMsg{
									Counts = self.tBaseInfo.nChallengeAdd};
	self.oDBQuery:UpdateDB();
end

--[[
	[ \brief 申请增加战斗力
	[ \param number nCurrency 货币类型
	]]
function CTalkSwordSystem:RequestAddAttack(nCurrency)
	_assert(self:HasAuthority("CTalkSwordSystem"));
	_assert(self.tBaseInfo.nAttackAdd < #tConfig.AddAttackValue);

	local oPlayer = self:GetPlayer();
	local bOk = -1;
	if tScript:RequestAddAttack(self.tBaseInfo.nAttackAdd,
												nCurrency,oPlayer) then
		self.tBaseInfo.nAttackAdd = self.tBaseInfo.nAttackAdd + 1;
		bOk = self.tBaseInfo.nAttackAdd;
	end
	oPlayer.TalkSwordAddAttackMsg{ Counts = bOk };
	self.oDBQuery:UpdateDB();
end

--[[
	[ \brief 申请领取奖励
	]]
function CTalkSwordSystem:RequestGetReward()
	_assert(self:HasAuthority("CTalkSwordSystem"));
	_assert(self.tRankRewardInfo.nRewardState == 0);

	local tSetAddList = {};
	for i, tItem in ipairs(tScript:GetRewardItem(
										self.tRankRewardInfo.nRewardRank)) do
		local tempTabel = {
			dwItemEnum = tItem.ItemID;
			dwItemNumber = tItem.ItemNum;
			dwBindType = tItem.BindType;};
		table.insert(tSetAddList, tempTabel);
	end
	self:GetPlayer():GetSystem("CItemSystem"):
			AddEnumItemListToPacket(tSetAddList, _G.ItemSysOperType.TalkSword);

	self.tRankRewardInfo.nRewardState = 1;
	self:GetPlayer().TalkSwordGetPrizeMsg{ RewardState = 
											self.tRankRewardInfo.nRewardState,
											RewardRank = 
											self.tRankRewardInfo.nRewardRank };
	self.oDBQuery:UpdateDB();
end

--[[
	[ \brief 申请战斗
	[ \param number nRoleID 玩家ID
	[ \param number nRank 玩家当前排名
	]]
function CTalkSwordSystem:Battle(nRoleID, nRank)
	_assert(self.bPrepare);
	_assert(self:HasAuthority("CTalkSwordSystem"));
	_assert(self.tBaseInfo.nCDTime < tConfig.CoolTimeLimit * 60);
	_assert(tConfig.BaseCounts + self.tBaseInfo.nChallengeAdd >
				 								self.tBaseInfo.nChallengeUse);

	local nScore = self:GetPlayer():GetSystem("CSkillSystem"):
									CountBattleScoreInfo().dwAllScore;
	CKernelApp.RequestBattleMsg{
							PlayerInfo = {
								nChallengeRank = self.tBaseInfo.nRank,
								nChallengeRoleID = self:GetPlayer():
																GetRoleID();
								nInjuredRank = nRank,
								nInjuredRoleID = nRoleID,
								nAttack = math.ceil(nScore + (nScore * 
											tScript:GetExtraPercentage(
												self.tBaseInfo.nAttackAdd))),
								nLevel = self:GetPlayer():GetLevel();
										};
								};
	self.bPrepare = false;
end
