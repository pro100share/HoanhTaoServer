--[[
    [\brief 战旗系统公用函数
    [\author 刘昊，王凌波
    [\date 2014-7-15
    [客户端和服务器公用函数，实现配置文件读取和计算
  ]]

_G.BannerFunctions = {};

--[[
    [\brief 获取批量使用允许的最大值
    [\return number 批量使用允许的最大值
  ]]
BannerFunctions.GetMaxNum = function()
    return BannerConfig.nMaxNum;
end

--[[
    [\brief 获取自动升阶的间隔时间
    [\return number 自动升阶的间隔时间(单位：毫秒)
  ]]
BannerFunctions.GetInterval = function()
    return BannerConfig.nInterval;
end

--[[
    [\brief 获取开启自动赐福升阶的阶数
    [\return number 开启自动赐福升阶的阶数
  ]]
BannerFunctions.GetAutoBlessPhase = function()
    return BannerConfig.nAutoBlessPhase;
end

--[[
    [\brief 获取开始广播的阶段
    [\return number 开始广播的阶段
  ]]
BannerFunctions.GetCastBeginPhase = function()
    return BannerConfig.nCastBeginPhase;
end

--[[
    [\brief 获取插战旗时消耗的物品的id
    [\return number 插战旗时消耗的物品的id
  ]]
BannerFunctions.GetUseBannerID = function()
    return BannerConfig.nUseBannerID;
end

--[[
    [\brief 获取插战旗时消耗的物品的数量
    [\return number 插战旗时消耗的物品的数量
  ]]
BannerFunctions.GetUseBannerNum = function()
    return BannerConfig.nUseBannerNum;
end

--[[
    [\brief 获取开启插战旗功能的阶数
    [\return number 开启插战旗功能的阶数
  ]]
BannerFunctions.GetFlagMinPhase = function()
    return BannerConfig.nFlagMinPhase;
end

--[[
    [\brief 获取战旗的冷却时间
    [\return number 战旗的冷却时间(单位：毫秒)
  ]]
BannerFunctions.GetCoolTime = function(nLevel)
    return BannerConfig.LevelList[nLevel].nTime;
end

--[[
    [\brief 获取现在到达的铸造等级
    [\param number nEXP 铸造值
    [\param boolean bBless 是否在赐福升阶
    [\return number nLevel 铸造等级:1~40
  ]]
BannerFunctions.GetLevel = function(nEXP, bBless)
    local tList = BannerConfig.LevelList;
    -- 如果是第一级的铸造值
    if nEXP == tList[1].nEXP then return 1; end
    -- 如果已超出最大铸造值
    if nEXP >= tList[#tList].nEXP then return #tList; end
    -- 对比各等级的铸造值
    local nLevel;
    for k, v in ipairs(tList) do
        if nEXP < v.nEXP then
            nLevel = k - 1;
            if bBless then 
                nLevel = nLevel - 1;
            end
            break;
        end
    end
    return nLevel;
end

--[[
    [\brief 获取现在到达的铸造阶段
    [\param number nLevel 铸造等级
    [\return number 铸造阶段:1~8
  ]]
BannerFunctions.GetPhase = function(nLevel)
    return math.ceil(nLevel / 5);
end

--[[
    [\brief 获取显示等级
    [\param number nLevel 铸造等级
    [\return number 等级
  ]]
BannerFunctions.GetShowLevel = function(nLevel)
    return (nLevel % 5) == 0 and 5 or (nLevel % 5);
end


--[[
    [\brief 获取铸造所需物品id
    [\param number nLevel 铸造等级
    [\return number 所需物品id
  ]]
BannerFunctions.GetForgeID = function(nLevel)
    return BannerConfig.LevelList[nLevel].nItemID;
end

--[[
    [\brief 获取铸造时每消耗一个物品增加的铸造值
    [\param number nLevel 铸造等级
    [\return number 每消耗一个物品增加的铸造值
  ]]
BannerFunctions.GetAddEXP = function(nLevel)
    return BannerConfig.LevelList[nLevel].nAddEXP;
end

--[[
    [\brief 获取要达到该等级所需要的经验值
    [\param number nLevel 铸造等级
    [\return number 该等级最大的铸造值
  ]]
BannerFunctions.GetLevelNeedEXP = function(nLevel)
    return BannerConfig.LevelList[nLevel].nEXP;
end

--[[
    [\brief 获取该等级防御能力百分比
    [\param number nLevel 铸造等级
    [\return number 该等级防御能力百分比(去掉百分号的值)
  ]]
BannerFunctions.GetDefenseRate = function(nLevel)
    return BannerConfig.LevelList[nLevel].nRate;
end

--[[
    [\brief 获取该等级战旗插旗的持续时间
    [\param number nLevel 铸造等级
    [\return number 该等级战旗插旗的持续时间(单位：毫秒)
  ]]
BannerFunctions.GetDuration = function(nLevel)
    return BannerConfig.LevelList[nLevel].nTime;
end

--[[
    [\brief 获取该等级战旗作用半径
    [\param number nLevel 铸造等级
    [\return number 该等级战旗作用半径(计算而非显示用)
  ]]
BannerFunctions.GetRadius = function(nLevel)
    return BannerConfig.LevelList[nLevel].nRadius;
end

--[[
    [\brief 获取该等级战旗作用半径
    [\param number nLevel 铸造等级
    [\return number 该等级战旗作用半径(客户端显示用)
  ]]
BannerFunctions.GetRadius_m = function(nLevel)
    return BannerConfig.LevelList[nLevel].nRadius;
end

--[[
    [\brief 获取该等级属性加成集合
    [\param number nLevel 铸造等级
    [\return table 该等级属性加成集合
  ]]
BannerFunctions.GetAttr = function(nLevel)
    return BannerConfig.LevelList[nLevel].tAttr;
end

--[[
    [\brief 获取该等级Buff效果
    [\param number nLevel 铸造等级
    [\return table 该等级Buff效果
  ]]
BannerFunctions.GetBuffEffect = function(nLevel)
    return BannerConfig.BuffEffect[nLevel];
end

--[[
    [\brief 获取赐福所需物品id
    [\param number nPhase 赐福开始时所处阶段
    [\return number 赐福所需物品id
  ]]
BannerFunctions.GetBlessID = function(nPhase)
    return BannerConfig.PhaseList[nPhase].nItemID;
end

--[[
    [\brief 获取一次赐福所需物品数量
    [\param number nPhase 赐福开始时所处阶段
    [\return number 一次赐福所需物品数量
  ]]
BannerFunctions.GetBlessNum = function(nPhase)
    return BannerConfig.PhaseList[nPhase].nItemNum;
end

--[[
    [\brief 获取购买单个赐福材料所需的元宝数
    [\param number nPhase 赐福开始时所处阶段
    [\return number 购买单个赐福材料所需的元宝数
  ]]
BannerFunctions.GetGold = function(nPhase)
    local nItemID = BannerConfig.PhaseList[nPhase].nItemID;
    local nType = _G.MallItemTypeConfig.Equip;
    -- 在商城配置表里查询
    for k, v in pairs(_G.MallConfig.Goods) do
        if nItemID == v.dwItemEnum and v.type == nType then 
            return v.dwPrice;
        end
    end
end

--[[
    [\brief 获取购买单个赐福材料所需的礼金数
    [\param number nPhase 赐福开始时所处阶段
    [\return number 购买单个赐福材料所需的礼金数
  ]]
BannerFunctions.GetBindGold = function(nPhase)
    local nItemID = BannerConfig.PhaseList[nPhase].nItemID;
    local nType = _G.MallItemTypeConfig.BindGold;
    -- 在商城配置表里查询
    for k, v in pairs(_G.MallConfig.Goods) do
        if nItemID == v.dwItemEnum and v.type == nType then 
            return v.dwPrice;
        end
    end
end

--[[
    [\brief 获取每次赐福所需银两的数量
    [\param number nPhase 赐福开始时所处阶段
    [\return number 每次赐福所需银两的数量
  ]]
BannerFunctions.GetMoney = function(nPhase)
    return BannerConfig.PhaseList[nPhase].nMoney;
end

--[[
    [\brief 获取进入特定赐福范围后每次赐福成功几率
    [\param number nPhase 赐福开始时所处阶段
    [\return number 赐福成功几率
  ]]
BannerFunctions.GetBlessRate = function(nPhase)
    return BannerConfig.PhaseList[nPhase].nRate;
end

--[[
    [\brief 获取特定赐福范围
    [\param number nPhase 赐福开始时所处阶段
    [\return table 赐福范围
  ]]
BannerFunctions.GetRange = function(nPhase)
    return BannerConfig.PhaseList[nPhase].tRange;
end
