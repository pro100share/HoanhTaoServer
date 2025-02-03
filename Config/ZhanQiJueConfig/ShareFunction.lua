--[[
    [\brief 战骑决公用函数
    [\author 王凌波, 裴雪阳
    [\date 2014-6-20
    [客户端和服务器公用函数，实现配置文件读取和计算
  ]]

_G.ZhanQiJueFunctions = {};

--[[
    [\brief 获取内丹索引 (已经修炼满了的)
    [\param number nEXP 修炼值
    [\param boolean bBless 是否在赐福
    [\return number 内丹索引:1~80
  ]]
ZhanQiJueFunctions.GetDanIndex = function(nEXP, bBless) 
    local DanList = ZhanQiJueConfig.DanList;
    local nDanIndex;
    local len = #DanList;
    for i = 1, len do
        if nEXP < DanList[i].nMaxEXP then
            nDanIndex = i - 1;
            if bBless then
                nDanIndex = nDanIndex - 1;
            end
            break;
        end
    end
    if nEXP >= DanList[len].nMaxEXP then nDanIndex = len; end 
    return nDanIndex;
end

--[[
    [\brief 获取阶段
    [\param number nEXP 修炼值
    [\param boolean bBless 是否在赐福
    [\return number nPhase 阶段:1~10
    [\return number nIndex 一阶中的索引:1~8
  ]]
ZhanQiJueFunctions.GetPhaseAndIndex = function(nEXP, bBless)
    local nDanIndex = ZhanQiJueFunctions.GetDanIndex(nEXP, bBless);
    local nPhase = math.ceil(nDanIndex / 8);
    local nIndex = nDanIndex - (nPhase - 1) * 8;
    return nPhase, nIndex;
end

--[[
    [\brief 获取等级属性加成
    [\param number nEXP 修炼值
    [\param boolean bBless 是否在赐福
    [\return table 属性加成
  ]]
ZhanQiJueFunctions.GetAttr = function(nEXP, bBless)
    local nDanIndex = ZhanQiJueFunctions.GetDanIndex(nEXP, bBless);
    return ZhanQiJueConfig.DanList[nDanIndex].Attr;
end

--[[
    [\brief 获取该内丹最大修炼值
    [\param number nDanIndex 内丹索引
    [\return number 该内丹最大修炼值
  ]]
ZhanQiJueFunctions.GetMaxEXPByIndex = function(nDanIndex) 
    return ZhanQiJueConfig.DanList[nDanIndex].nMaxEXP;
end

--[[
    [\brief 获取修炼内丹时所需物品id
    [\param number nDanIndex 内丹索引
    [\return number 修炼该内丹所需物品id
  ]]
ZhanQiJueFunctions.GetDanNeedId = function(nDanIndex) 
    return ZhanQiJueConfig.DanList[nDanIndex].nId;
end

--[[
    [\brief 获取修炼内丹时，每次修炼所需物品数量
    [\param number nDanIndex 内丹索引
    [\return number 每次修炼所需物品数量
  ]]
ZhanQiJueFunctions.GetDanNeedNum = function(nDanIndex) 
    return ZhanQiJueConfig.DanList[nDanIndex].nNum;
end

--[[
    [\brief 获取修炼内丹时，每次增加的修炼值
    [\param number nDanIndex 内丹索引
    [\return number 每次增加的修炼值
  ]]
ZhanQiJueFunctions.GetPlus = function(nDanIndex) 
    return ZhanQiJueConfig.DanList[nDanIndex].nPlus;
end

--[[
    [\brief 获取修炼内丹时，每次暴击增加的修炼值
    [\param number nDanIndex 内丹索引
    [\return number 每次暴击增加的修炼值
  ]]
ZhanQiJueFunctions.GetBonus = function(nDanIndex) 
    return ZhanQiJueConfig.DanList[nDanIndex].nBonus;
end

--[[
    [\brief 获取暴击几率
    [\param number nDanIndex 内丹索引
    [\return number 暴击几率
  ]]
ZhanQiJueFunctions.GetBonusChance = function(nDanIndex) 
    return ZhanQiJueConfig.DanList[nDanIndex].nBonusChance;
end

--[[
    [\brief 获取该阶段赐福所需物品id
    [\param number nPhase 阶段
    [\return number 该阶段赐福所需物品id
  ]]
ZhanQiJueFunctions.GetBlessNeedId = function(nPhase)
    return ZhanQiJueConfig.BlessList[nPhase].nId;
end

--[[
    [\brief 获取该阶段赐福时，每次赐福所需物品数量
    [\param number nPhase 阶段
    [\return number 每次赐福所需物品数量
  ]]
ZhanQiJueFunctions.GetBlessNeedNum = function(nPhase) 
    return ZhanQiJueConfig.BlessList[nPhase].nNum;
end

--[[
    [\brief 获取该阶段赐福几率
    [\param number nPhase 阶段
    [\return number 赐福几率
  ]]
ZhanQiJueFunctions.GetBlessRate = function(nPhase) 
    return ZhanQiJueConfig.BlessList[nPhase].nRate;
end

--[[
    [\brief 获取该阶段特定赐福几率的赐福值范围
    [\param number nPhase 阶段
    [\return table 赐福值范围
  ]]
ZhanQiJueFunctions.GetBlessRange = function(nPhase) 
    return ZhanQiJueConfig.BlessList[nPhase].tRange;
end

--[[
    [\brief 修炼检测
    [\param boolean bIsClient 是即客户端，不是即服务器
    [\param number nEXP 现有的修炼值
    [\param boolean bBless 是否在赐福
    [\param class CSystem 服务器专用，战骑诀系统
    [\return table tResult 检测的结果集(key-bLimitAvoid, value-修炼值是否超限;
                                        key-bItemEnough, value-物品是否足够)
  ]]
ZhanQiJueFunctions.CheckPractice = function(bIsClient, nEXP, bBless, CSystem)
    local DanList       = ZhanQiJueConfig.DanList;
    local nDanIndex     = ZhanQiJueFunctions.GetDanIndex(nEXP, bBless);
    local nDanNeedId    = DanList[nDanIndex].nId;
    local nDanNeedNum   = ZhanQiJueFunctions.GetDanNeedNum(nDanIndex);
    local tResult       = {bLimitAvoid = false, bItemEnough = false};
    -- 检测修炼值是否超限
    if nEXP >= DanList[#DanList].nMaxEXP then
        tResult.bLimitAvoid = true;
        return tResult;
    end
    -- 检测物品是否足够
    if bIsClient then 
        tResult.bItemEnough = nDanNeedNum <= CItemSystem:
            GetItemNumber(nDanNeedId, enItemPosition.ePacket);
    else
        tResult.bItemEnough = CSystem:GetPlayer():GetSystem("CItemSystem"):
            CheckDelEnumItemInPacketCond(nDanNeedId, nDanNeedNum);
    end
    return tResult;
end

--[[
    [\brief 赐福检测
    [\param boolean bIsClient 是即客户端，不是即服务器
    [\param number nPhase 赐福开始时所处阶段
    [\param number nBlessEXP 现有的赐福值
    [\param class CSystem 服务器专用，战骑诀系统
    [\return table tResult 检测的结果集(key-bLimitAvoid, value-赐福值值是否超限;
                                        key-bItemEnough, value-物品是否足够)
  ]]
ZhanQiJueFunctions.CheckBless = function(bIsClient, nPhase, nBlessEXP, CSystem) 
    local nBlessNeedId = ZhanQiJueFunctions.GetBlessNeedId(nPhase);
    local nBlessNeedNum = ZhanQiJueFunctions.GetBlessNeedNum(nPhase);
    local tResult = {bLimitAvoid = false, bItemEnough = false};
    -- 检测修炼值是否超限
    if nBlessEXP >= _G.TianGuanCiFuConfig.MaxZhanQiJueValue then
        tResult.bLimitAvoid = true;
        return tResult;
    end
    -- 检测物品是否足够
    if bIsClient then
        tResult.bItemEnough = nBlessNeedNum <= CItemSystem:
            GetItemNumber(nBlessNeedId, enItemPosition.ePacket);
    else
        tResult.bItemEnough = CSystem:GetPlayer():GetSystem("CItemSystem"):
            CheckDelEnumItemInPacketCond(nBlessNeedId, nBlessNeedNum);
    end
    return tResult;
end
