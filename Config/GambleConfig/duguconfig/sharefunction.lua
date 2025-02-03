--[[
	--功法独孤九剑客户端服务器公用函数
	--作者：王凌波
	--时间：2014-5-19
]]--

local Functions = {};

--[[
	[\brief 计算修炼等级
	[通过历练值计算修炼等级
	[\param number dwEXP 历练值
	[\return number 修炼等级:1~90
  ]]
Functions.LevelCal = function(dwEXP)
	local tList = DuGuConfig.EXPList;
	local nLevel = 1;
	-- 找到dwEXP对应的nLevel
	local nMaxLevel = DuGuConfig.nMaxLevel;
	if dwEXP == 0 then 
		return 1;
	end
	for i=2, nMaxLevel do
		if dwEXP < tList[i] then
			nLevel = i - 1;
			break;
		end
	end
	-- 如果dwEXP超出最大范围，按最大级算
	local dwMaxEXP = tList[nMaxLevel];
	if dwEXP >= dwMaxEXP then
		nLevel = nMaxLevel;
	end
	return nLevel;
end

--[[
	[\brief 计算修炼阶段
	[通过历练值计算修炼阶段
	[\param number dwEXP 历练值
	[\return number 修炼阶段:1~9
	[\return number 客户端显示的修炼等级:0~9
  ]]

Functions.PhaseCal = function(dwEXP) 
	local nLevel = Functions.LevelCal(dwEXP);
	local temp = nLevel * 0.1;
	local nPhase = math.ceil(temp);
	local nShowLevel = nLevel - math.floor(temp) * 10 - 1;
	if nShowLevel < 0 then nShowLevel = 9; end
	return nPhase, nShowLevel;
end

--[[
	[\brief 计算由历练值产生的属性加成
	[\param number dwEXP 历练值
	[\return table 属性加成
  ]]
Functions.IncreaseCal = function(dwEXP)
	local nLevel = Functions.LevelCal(dwEXP); 
	local tInfo = {};
	for k,v in pairs(DuGuConfig.AttrList[nLevel]) do
		tInfo[k] =  v;
	end
	return tInfo;
end

--[[
	[\brief 计算由剑套装产生的属性加成
	[\param number nActSwordId 剑套装id
	[\return table 属性加成
  ]]
Functions.SwordIncreaseCal = function(nActSwordId) 
	local tList = DuGuConfig.SwordAttrList;
	local tIncrease = {};

	-- TODO，在避免0的取值时可以优化，首先数据库中不存0，然后代码中不赋予0意义
	if nActSwordId == 0 then return tIncrease; end

	for i=1, nActSwordId do 
		for k, v in pairs(tList[i]) do
			tIncrease[k] = tIncrease[k] or 0;
			tIncrease[k] = tIncrease[k] + v;
		end
	end

	return tIncrease;
end

--[[
	[\brief 总属性加成
	[\param number dwEXP 历练值
	[\param number nActSwordId 剑套装id
	[\return table 总属性加成
  ]]
Functions.TotalIncreaseCal = function(dwEXP, nActSwordId)
	local tTotal = Functions.IncreaseCal(dwEXP);
	local tSword = Functions.SwordIncreaseCal(nActSwordId);
	for k, v in pairs(tSword) do
		tTotal[k] = tTotal[k] or 0;
		tTotal[k] = tTotal[k] + v;
	end
	return tTotal;
end

--[[
	[\brief 计算技能几率
	[\param number dwEXP 历练值
	[\return number 技能几率
  ]]
Functions.ChanceCal = function(dwEXP)
	local nLevel 	= Functions.LevelCal(dwEXP);
	local tList 	= DuGuConfig.SkillList;
	local tLevel 	= tList.tLevel;
	local nChance 	= 0;
	for k, v in pairs(tLevel) do
		if nLevel >= v.nPracLVMin and nLevel <= v.nPracLVMax then
			nChance = v.nChance;
			break;
		end
	end
	return nChance;
end

--[[
	[\brief 计算技能Buff的tips的索引
	[\param number nActSwordId 剑套装id
	[\return number 技能Buff的tips的索引
  ]]
Functions.BuffTipsCal = function(nActSwordId)
	return DuGuConfig.BuffTipsList[nActSwordId] or 1;
end

--[[
	[\brief 技能是否开启
	[\param number dwEXP 历练值
	[\return boolean 技能是否开启的布尔值
  ]]
Functions.IsSkillAvailable = function(dwEXP)
	local tList 	= DuGuConfig.SkillList;
	local nObjLevel = tList.tLevel[1].nPracLVMin;
	local nLevel 	= Functions.LevelCal(dwEXP);
	local bIsAvailable = false;
	if nLevel >= nObjLevel then
		bIsAvailable = true;
	end
	return bIsAvailable;
end

_G.DuGuFunctions = Functions;
