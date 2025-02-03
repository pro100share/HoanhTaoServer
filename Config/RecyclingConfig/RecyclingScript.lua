--[[
    [ \brief 回收系统脚本文件
    [ \author 路广华,李中昌
    [ \date 2014-7-31
  ]]

--脚本文件对象
_G.RecyclingScript = {};
--定义配置文件
local tCFG = _G.RecyclingConfig;

--[[
   [ \brief 获取活动的奖励
   [ \param number nID 活动ID
   [ \param number nStatus 活动的剩余次数
   [ \param number nLevel 玩家等级
   [ \return table 奖励表
   ]]
function RecyclingScript:GetPrize(nID, nStatus, nLevel)
	local tTable = tCFG.Resources[nID].Resources;
	local nMaxCount = tCFG.Resources[nID].MaxCount;
	local nNowCount = nMaxCount - nStatus + 1;
	local nExpFb = _G.RoleUpLevelConfig[nLevel].dwFuBenExp;
	local nExpHuan = _G.RoleUpLevelConfig[nLevel].dwTaskExpHuan;
	local tConfigList = tCFG.PicList;
	local tNewTable = {
		[1] = {
			Gas = 12000 * nStatus;
		};
		[2] = {
			Gas = 1;
			Exp = 1;
			Money = 1;
			Reputation = (340 + nLevel * 3) * nStatus;
		};
		[3] = {
			Gas = 150 + nLevel * 3 * nStatus;
			Exp = nExpHuan * 0.2 * 2 * nStatus;
			Money = nLevel * 45 * 2 * nStatus;
		};
		[4] = {
			Exp = nExpFb * (5 + math.floor(nLevel / 10) * 0.1);
		};
		[5] = {
			Exp = nExpFb * (7 + math.floor(nLevel / 10) * 0.1);
		};
		[6] = {
			Exp = nExpFb * (4 + math.floor(nLevel / 10) * 0.1);
		};
		[7] = {
			Exp = nExpFb * (8 + math.floor(nLevel / 10) * 0.2);
		};
		[8] = {
			Exp = nExpFb * (6.8 + math.floor(nLevel / 10) * 0.1);
		};
		[9] = {
			Exp = nExpFb * (8.3 + math.floor(nLevel / 10) * 0.1);
		};
		[10] = {
			Exp = nExpFb * (9 + math.floor(nLevel / 10) * 0.1);
		};
		[11] = {
			Exp = nExpFb * (4.5 + math.floor(nLevel / 10) * 0.1);
		};
	};
	
	for i, v in pairs(tNewTable) do
		if nID == i then
			if v.Gas ~= nil then
				if i == 2 then
					for j = nNowCount, nMaxCount do
						v.Gas = v.Gas + (260 + nLevel / 4 * 10) * (1 + j * 0.01);
					end
				end
				tTable[tConfigList.Gas] = math.floor(v.Gas);
			end
			if v.Exp ~= nil then
				if i == 2 then
					for j = nNowCount, nMaxCount do
						v.Exp = v.Exp + nExpHuan * (1 + j * 0.01);
					end
				end
				tTable[tConfigList.Exp] = math.floor(v.Exp);
			end
			if v.Money ~= nil then
				if i == 2 then
					for j = nNowCount, nMaxCount do
						v.Money = v.Money + (5000 + nLevel * (100 + nLevel * 3)) * (1 + j * 0.1);
					end
				end
				tTable[tConfigList.Money] = math.floor(v.Money);
			end
			if v.Reputation ~= nil then
				tTable[tConfigList.Reputation] = math.floor(v.Reputation);
			end
		end
	end
    return tTable;
end

--[[
   [ \brief 获取活动的奖励
   [ \param number nID 活动ID
   [ \param number nMoneyType 钱的类型
   [ \param number nCount 活动剩余次数
   [ \param number nLevel 玩家等级
   [ \return number 需要多少钱
   ]]
function RecyclingScript:GetNeedMoney(nID, nMoneyType, nCount, nLevel)
    local tResources = tCFG.Resources[nID];
    local tInfo = {};
    for i = 1, 3 do
        tInfo[i] = tResources.Money[i] * nCount;
    end
	-- tInfo[nMoneyType] = tResources.Money[nMoneyType] * nCount;
    if nID == 2 or nID == 3 then
        tInfo[1] = RecyclingScript:GetPrize(nID, 
                            nCount, nLevel)[tCFG.PicList.Money] * 2;
    end
    return tInfo[nMoneyType];
end

--[[
   [ \brief 测试value是否在表tab中
   [ \param table tTab 搜索的表
   [ \param table nValue 测试的值
   [ \return true 表示值在表中，false 表示值不在表中 
   ]]
function RecyclingScript:TableFind(tTab, nValue)
    for k,v in pairs(tTab) do
        if v == nValue then
            return true;
        else
            -- 进行下次循环
        end
    end

    return false;
end

--[[
   [ \brief 测试表中的项数
   [ \param table tTab 搜索的表
   [ \return number 表中元素个数
   ]]
function RecyclingScript:TableCounts(tTab)
    local nCount = 0;
    for i, v in pairs(tTab) do
        nCount = nCount + 1;
    end

    return nCount;
end

--[[
   [ \brief 统计每个活动的剩余次数
   [ \param table tCount 存储剩余次数的表
   [ \param object oPlayer 玩家对象
   ]]
function RecyclingScript:UpdateCount(tCount, oPlayer)
    for k, v in ipairs(tCFG.Resources) do
        tCount[k] = v.GSUpdate(v, oPlayer) > 0 and
            v.GSUpdate(v, oPlayer) or nil;
    end
end

--[[
   [ \brief 根据钱的类型返回追回的百分比
   [ \param number nMoneyType 钱的类型
   [ \return number 百分比
   ]]
function RecyclingScript:GetPercent(nMoneyType)
    if nMoneyType == tCFG.MoneyType.Money then
        return tCFG.Percent.TheMore;
    else
        return tCFG.Percent.ThePerfect;
    end
end
   
--[[
   [ \brief 获取剩余的活动次数
   [ \return number 剩余的活动次数
   ]]
function RecyclingScript:GetLastNumber()
    local nCount = 0;
    for k,v in pairs(CRecyclingSystem.tActivityInfo) do
        if v.nStatus ~= 0 then
            nCount = nCount + 1;
        else
        -- 进行下次循环
        end
    end

    return nCount;
end
