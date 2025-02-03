--[[
    [\brief 英雄令公用函数
    [\author 王凌波
    [\date 2014-7-1
    [客户端和服务器公用函数，实现配置文件读取和计算
  ]]

_G.HeroTokenFunctions = {};

--[[
    [\brief 获取特定系列的系列名称
    [\param number nSeriesIndex 系列索引
    [\return number 系列名称
  ]]
HeroTokenFunctions.GetSeriesName = function(nSeriesIndex) 
    return HeroTokenConfig.Series[nSeriesIndex].sName;
end

--[[
    [\brief 获取特定系列的令牌信息集合
    [\param number nSeriesIndex 系列索引
    [\return table 令牌信息集合
  ]]
HeroTokenFunctions.GetTokens = function(nSeriesIndex) 
    return HeroTokenConfig.Series[nSeriesIndex].tTokens;
end

--[[
    [\brief 获取某一令牌的信息
    [\param number nSeriesIndex 系列索引
    [\param number nTokenIndex 令牌索引
    [\return table 令牌信息
  ]]
HeroTokenFunctions.GetAToken = function(nSeriesIndex, nTokenIndex)
    return HeroTokenConfig.Series[nSeriesIndex].tTokens[nTokenIndex];
end

--[[
    [\brief 获取某一令牌的id
    [\param number nSeriesIndex 系列索引
    [\param number nTokenIndex 令牌索引
    [\return number 令牌id
  ]]
HeroTokenFunctions.GetTokenId = function(nSeriesIndex, nTokenIndex)
    return HeroTokenConfig.Series[nSeriesIndex].tTokens[nTokenIndex].nId;
end

--[[
    [\brief 获取某一令牌的镶嵌需求数量
    [\param number nSeriesIndex 系列索引
    [\param number nTokenIndex 令牌索引
    [\return number 镶嵌需求数量
  ]]
HeroTokenFunctions.GetNeedCount = function(nSeriesIndex, nTokenIndex)
    return HeroTokenConfig.Series[nSeriesIndex].tTokens[nTokenIndex].nCount;
end

--[[
    [\brief 获取某一令牌的属性加成
    [\param number nSeriesIndex 系列索引
    [\param number nTokenIndex 令牌索引
    [\return table 属性加成
  ]]
HeroTokenFunctions.GetTokenAttr = function(nSeriesIndex, nTokenIndex)
    return HeroTokenConfig.Series[nSeriesIndex].tTokens[nTokenIndex].tAttr;
end

--[[
    [\brief 获取特定系列已镶嵌令牌的属性总加成
    [\param table tEnbeded 令牌镶嵌状态集合
    [\param number nSeriesIndex 系列索引
    [\return table tSeriesAttr 属性总加成
  ]]
HeroTokenFunctions.GetSeriesAttr = function(tEnbeded, nSeriesIndex) 
    local tSeriesAttr = {};
    for _, v in pairs(HeroTokenConfig.UI.Shunxu) do 
        tSeriesAttr[v] = 0;
    end
    -- 遍历该系列的每一令牌
    for k, v in pairs(tEnbeded[nSeriesIndex]) do
        -- 如果已镶嵌
        if v then
            for k1, v1 in pairs(
                HeroTokenFunctions.GetTokenAttr(nSeriesIndex, k)) do 
                tSeriesAttr[k1] = (tSeriesAttr[k1] or 0) + v1;
            end
        end
    end
    return tSeriesAttr;
end

--[[
    [\brief 获取所有已镶嵌令牌的属性总加成
    [\param table tEnbeded 令牌镶嵌状态集合
    [\return table tTotalAttr 属性总加成
  ]]
HeroTokenFunctions.GetTotalAttr = function(tEnbeded)
    -- 赋初始值
    local tTotalAttr = {};
    for _, v in pairs(HeroTokenConfig.UI.Shunxu) do 
        tTotalAttr[v] = 0;
    end
    -- 遍历每一系列
    for k, v in pairs(tEnbeded) do
        -- 遍历每一令牌
        for k1, v1 in pairs(v) do
            -- 如果已镶嵌
            if v1 then
                for k2, v2 in pairs(HeroTokenFunctions.GetTokenAttr(k, k1)) do 
                    tTotalAttr[k2] = (tTotalAttr[k2] or 0) + v2;
                end
            end
        end
    end
    return tTotalAttr;
end

--[[
    [\brief 镶嵌前的检测
    [\param boolean bIsClient true即客户端，false即服务器
    [\param table tEnbeded 令牌镶嵌状态集合
    [\param number nSeriesIndex 系列索引
    [\param number nTokenIndex 令牌索引
    [\param class CSystem 服务器专用，英雄令系统
    [\return table tResult 检测的结果集(key-bEnbeded, value-是否已镶嵌;
                                        key-bItemEnough, value-物品是否足够)
  ]]
HeroTokenFunctions.CheckEnbed = function(
    bIsClient, tEnbeded, nSeriesIndex, nTokenIndex, CSystem) 
    local tResult = {};
    -- 检测是否已镶嵌
    tResult.bEnbeded = tEnbeded[nSeriesIndex][nTokenIndex];
    -- 检测镶嵌所需物品是否足够
    local nId = HeroTokenFunctions.GetTokenId(nSeriesIndex, nTokenIndex);
    local nCount = HeroTokenFunctions.GetNeedCount(nSeriesIndex, nTokenIndex);
    if bIsClient then 
        tResult.bItemEnough = nCount <= CItemSystem:
            GetItemNumber(nId, enItemPosition.ePacket);
    else
        tResult.bItemEnough = CSystem:GetPlayer():GetSystem("CItemSystem"):
            CheckDelEnumItemInPacketCond(nId, nCount);
    end
    return tResult;
end

--[[
    [\brief 根据配置文件初始化本地令牌镶嵌状态集合
    [\本系统中无效初值与有效初值一致，所以统一成一个方法
    [\return table tTable 令牌镶嵌状态集合
  ]]
HeroTokenFunctions.InitTable = function() 
    local tTable = {};
    for k, v in pairs(HeroTokenConfig.Series) do
        -- 初始化系列
        tTable[k] = {};
        for k1, _ in pairs(v.tTokens) do
            -- 初始化令牌
            tTable[k][k1] = false;
        end
    end
    return tTable;
end

--[[
    [\brief 将数字字串转换成数字
    [\param string sStr 数字字串
    [\return number nNum 对应的数字
  ]]
HeroTokenFunctions.StringToNumber = function(sStr)
    local nNum, nLength = 0, #sStr;
    for i=nLength, 1, -1 do
        nNum = nNum + (string.byte(sStr, i) - 48) 
            * math.pow(10, nLength - i);
    end
    return nNum;
end

--[[
    [\brief 将记录已镶嵌的字串转换成本地集合
    [\param string sEnbeded 记录已镶嵌的字串，如："1:1,3,15,2:2,5,"
    [\return table tEnbeded 令牌镶嵌状态集合，返回nil，表示因无字串而无此状态表
  ]]
HeroTokenFunctions.StringToTable = function(sEnbeded) 
    if not sEnbeded then return nil; end
    local tEnbeded = HeroTokenFunctions.InitTable();
    local nLength  = string.len(sEnbeded);
    local nBegin   = 1;
    local nSeriesIndex;
    -- 构建本地记录令牌镶嵌状态的table
    for i=1, nLength do 
        local sChar = string.sub(sEnbeded, i, i);
        if sChar == ":" then 
            -- 构建系列
            nSeriesIndex = HeroTokenFunctions.StringToNumber(
                string.sub(sEnbeded, nBegin, i-1));
            nBegin = i + 1;
        elseif sChar == "," then
            -- 构建令牌
            local nToken = HeroTokenFunctions.StringToNumber(
                string.sub(sEnbeded, nBegin, i-1));
            tEnbeded[nSeriesIndex][nToken] = true;
            nBegin = i + 1;
        end
    end
    return tEnbeded;
end

--[[
	[ \brief 通过印章经验表获得战斗值
	[ \param table tAll 拥有的奖品表  = {[印章ID] = 经验}
	[ \return number nFightNum 战斗值
    ]]
HeroTokenFunctions.GetAttack = function(tAll) 
	local nFightNum = 0;
	-- 战斗力参数
	local tFactor = {dwHPMax = 0.4, dwMPMax = 0.24, dwAttack = 1.2, 
        dwDefense = 1, dwFlee = 2, dwCrit = 2.5, dwPoJiaValue= 1.5, dwPoJiaDiKang = 1.2,dwCritDown = 2.5,}; 
	for k, v in pairs(tAll) do
		nFightNum = math.floor(nFightNum + v * tFactor[k]);
	end
	return nFightNum;
end
