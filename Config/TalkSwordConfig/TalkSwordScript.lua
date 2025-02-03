--[[
	[ \brief 华山论剑 脚本文件
	[ \author 原志勇
	[ \date 2014-7-22
--]]

--脚本文件对象
_G.TalkSwordScript = {};
--定义配置文件
local tConfig = _G.TalkSwordConfig;

--[[
	[ \brief 通过排名获得奖励物品
	[ \param number nRank 奖励排名
	[ \return table tItem 奖励物品
	]]
function TalkSwordScript:GetRewardItem(nRank)
	for i=1,#tConfig.PrizeInterval do
		--头尾判断
		if i == 1 and i == nRank then
			return tConfig.Prize[i];
		end
		if tConfig.PrizeInterval[i] >= nRank then
			return tConfig.Prize[i];
		end
	end
	--如果排名大于所有K值排名证明未上榜给予最低奖励
	return tConfig.Prize[#tConfig.PrizeInterval];
end

--[[
	[ \brief 通过鼓舞次数获得对应战斗力加成半分比
	[ \param number nCount 鼓舞次数
	]]
function TalkSwordScript:GetExtraPercentage(nCount)
	if nCount == 0 then
		return 0;
	else
		return tConfig.AddAttackValue[nCount] / 100;
	end
end

--[[
   [ \brief 获得当前排名的挑战列表,暂定为5个
   [ \param number nRank 当前玩家的华山论剑排名
   [ \return table 返回当前排名应该挑战的5个排名玩家
   ]]
function TalkSwordScript:GetChallengeListNum(nRank)
	local tList = {};
	local tTop6 = {6,5,4,3,2,1};
	local nBase = self:GetChallengeNum(nRank);
	
	if nRank > 5 then
		tList = {nRank - nBase, nRank - nBase * 2, nRank - nBase * 3, 
			nRank - nBase * 4, nRank - nBase * 5};
	else
		--前5名特殊处理
		for i, v in pairs(tTop6) do
			if nRank == v then
				--移除表中自身的名次
				table.remove(tTop6,i);
			end
			tList = tTop6;
		end
	end
	
	return tList;
end

--[[
   [ \brief 获取排名检测系数
   [ \param number nRank 当前玩家的华山论剑排名
   [ \return number 返回当前排名系数
   ]]
function TalkSwordScript:GetChallengeNum(nRank)
	local nBase = 1;
	local tRankInterval = tConfig.RankInterval;
	
	for i, v in pairs(tRankInterval) do
		if nRank >= i then
			if nBase < v then
				nBase = v;
			end
		end
	end
	
	if nRank >= 100 then
		nBase = nBase - math.random(5);
	end
	
	return nBase;
end

--[[
   [ \brief 检测战斗胜负
   [ \param number nBattleScore1 挑战者战斗力
   [ \param number nBattleScore2 被挑战者战斗力
   [ \return table tInfo={bWin = 胜负(1为负，0为胜),nExp = 经验,nHonor = 荣誉}
   ]]
function TalkSwordScript:Battle(nBattleScore1, nBattleScore2)
	local tInfo = {};
	--获得战力差
	local nBattle = math.floor(nBattleScore1 - nBattleScore2);
	--获得战力差系数
	local nBase = self:GetRewardnBase(nBattle);
	local bWin = 1;
	local nExp = 0;
	local nHonor = 0;
	local dwRand = math.random(10000);
	local tChallengePrize = tConfig.ChallengePrize;
	--获得赢的概率
	local nPer = tChallengePrize[nBase].Per;
	--获得奖励列表
	local tReward = tChallengePrize[nBase].Reward;
	
	--战力差为负数时概率为（1-赢的概率）
	if nBattle < 0 then
		nPer = 1 - nPer;
	end
	
	if dwRand <= nPer * 10000 then
		bWin = 0;
		nExp = tReward[1].Exp;
		nHonor = tReward[1].Honor;
	else
		nExp = tReward[2].Exp;
		nHonor = tReward[2].Honor;
	end
	
	tInfo.bWin = bWin;
	tInfo.nExp = nExp;
	tInfo.nHonor = nHonor;
	return tInfo;
end

--[[
   [ \brief 获得战力差系数
   [ \param number nBattle 战力差
   [ \return number 最大系数
   ]]
function TalkSwordScript:GetRewardnBase(nBattle)
	local tChallengeValue = tConfig.ChallengeValue;
	local nBase = 0;
	for i, v in pairs(tChallengeValue) do
		--负值取正
		if nBattle < 0 then
			nBattle = math.abs(nBattle);
		end
		--获得条件下差值最大系数
		if nBattle >= v then
			if nBase < i then
				nBase = i;
			end
		end
	end
	return nBase;
end

--[[
   [ \brief 检测鼓舞是否成功
   [ \param number nCount 第几次鼓舞
   [ \param number nCurrency 货币类型，0为元宝，1为礼金
   [ \param object oPlayer 玩家对象
   [ \reutrn bool 是否鼓舞成功
   ]]
function TalkSwordScript:RequestAddAttack(nCount, nCurrency, oPlayer)
	local ItemSys = oPlayer:GetSystem("CItemSystem");
	local ScriptSys = oPlayer:GetSystem("CScriptSystem");
	--获得所需元宝
	local nGoldValue = tConfig.AddAttackGold[nCount].Gold;
	--获得所需礼金
	local nBindGoldValue = tConfig.AddAttackGold[nCount].BindGold;
	--元宝成功概率
	local nGoldPer = tConfig.GoldPer[nCount] * 10000;
	--礼金成功概率
	local nBindGoldPer = tConfig.BindGoldPer[nCount] * 10000;
	local dwRand = math.random(10000);
	
	--花费元宝
	if nCurrency == 0 then
		if ItemSys:IsGoldEnough(nGoldValue) then
			ItemSys:CostGold(nGoldValue, _G.ItemSysOperType.TalkSword);
			if dwRand <= nGoldPer then
				return true;
			end
		else
			ScriptSys:Notice(9000110019);
		end
	end
	
	--花费礼金
	if nCurrency == 1 then
		if ItemSys:IsBindGoldEnough(nBindGoldValue) then
			ItemSys:CostBindGold(nBindGoldValue, _G.ItemSysOperType.TalkSword);
			if dwRand <= nBindGoldPer then
				return true;
			end
		else
			ScriptSys:Notice(9000110018);
		end
	end
	return false;
end

--[[
   [ \brief 获得玩家排名等级
   [ \param number nRank 玩家的排名
   [ \return number 奖励等级
   ]]
function TalkSwordScript:GetPrizeLevel(nRank)
	if nRank > tConfig.PrizeInterval[#tConfig.PrizeInterval] then 
		return #tConfig.PrizeInterval;
	end
	for k,v in ipairs(tConfig.PrizeInterval) do
		if nRank <= v then
			return k;
		end
	end
end

--[[
   [ \brief 获得技能ID
   [ \param number nJob 职业
   [ \return number 技能ID
   ]]
function TalkSwordScript:GetSkillID(nJob)
	return tConfig.SkillInfo[nJob][math.random(1,3)];
end

--[[
   [ \brief 获得伤害
   [ \param number nAttack1 自己的战斗力
   [ \param number nSkillID1 自己的技能ID
   [ \param number nAttack2 对手的战斗力
   [ \param number nSkillID2 对手的技能ID
   [ \param number bWin 是否自己获胜（0：获胜；1：失败）
   [ \return number 自己的伤害
   [ \return number 对手的伤害
   ]]
function TalkSwordScript:GetHarm(nAttack1, nSkillID1, nAttack2, nSkillID2, bWin)
	local nHarm1 = self:GetSkillHarm(nSkillID1);
	local nHarm2 = self:GetSkillHarm(nSkillID2);
	if bWin == 0 then
		nHarm1 = nHarm1 + tConfig.WinJiaChang;
	else
		nHarm2 = nHarm2 + tConfig.WinJiaChang;
	end
	local nAttackCha = nAttack1 - nAttack2;
	local k = self:GetAttackHarmLevel(nAttackCha)
	nHarm1 = nHarm1 + TalkSwordScript:GetAttackHarm(nAttackCha);
	nHarm2 = nHarm2 + TalkSwordScript:GetAttackHarm(-nAttackCha);
	return nHarm1, nHarm2;
end

--[[
   [ \brief 获得战斗力差值的加成
   [ \param number nValue 战斗力差值
   [ \return number 战斗力加成
   ]]
function TalkSwordScript:GetAttackHarm(nValue)
	return tConfig.AttackJiaCheng[self:GetAttackHarmLevel(nValue)];
end

--[[
   [ \brief 通过差值获取加成等级
   [ \param number nValue 战斗力差值
   [ \return number 战斗力伤害加成
   ]]
function TalkSwordScript:GetAttackHarmLevel(nValue)
	if nValue > tConfig.AttackChaZhi[#tConfig.AttackChaZhi] then
		return #tConfig.AttackChaZhi; 
	end
	for k, v in ipairs(tConfig.AttackChaZhi) do
		if nValue <= v then 
			return k;
		end
	end	
end

--[[
   [ \brief 通过技能获取技能加成
   [ \param number nSkillID 技能ID
   [ \return number 技能伤害加成
   ]]
function TalkSwordScript:GetSkillHarm(nSkillID)
	return tConfig.SkillHarm[self:GetSkillLevel(nSkillID)];
end

--[[
   [ \brief 通过技能获取技能等级
   [ \param number nSkillID 技能ID
   [ \return number 技能的等级
   ]]
function TalkSwordScript:GetSkillLevel(nSkillID)
	for k, v in ipairs(tConfig.SkillInfo) do
		for key, value in ipairs(v) do
			if value == nSkillID then
				return key;
			end
		end
	end
end

--[[
   [ \brief 获得玩家的职业
   [ \param number IconsID 头像ID
   [ \return number 职业编号
   ]]
function TalkSwordScript:GetZhiYe(IconsID)
	return math.floor(IconsID / 1000);
end

--[[
   [ \brief 获得玩家套装等级
   [ \param number nLevel 等级
   [ \return number 套装等级
   ]]
function TalkSwordScript:GetSuitLevel(nLevel)
	if nLevel > tConfig.ModelSuitLevel[#tConfig.ModelSuitLevel] then
		return #tConfig.ModelSuitLevel;
	end
	for k, v in ipairs(tConfig.ModelSuitLevel) do
		if nLevel <= v then
			return k;
		end
	end
end
