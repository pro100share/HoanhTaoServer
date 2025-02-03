--[[
	  [\brief 战旗系统主文件
	  [\author 王凌波
	  [\date 2014-7-16
  ]]

-- 战旗系统
_G.CBannerSystem = {};

-- 战旗配置文件
local tConfig = _G.BannerConfig;
-- 战旗公用函数
local tFunc = _G.BannerFunctions;

--[[
    [\brief 新建系统
    [\return object oSystem 战旗系统
  ]]
function CBannerSystem:new()
    local oSystem = CSystem:new("CBannerSystem");
    for k, v in pairs(self) do
        if type(v) == "function" then
          oSystem[k] = v;
        end
    end
    return oSystem;
end

--[[
    [\brief 创建系统
    [\param boolean bIsChangeLine 是否在换线
    [\return boolean 是否创建成功
  ]]
function CBannerSystem:Create(bIsChangeLine)
    self.bAllDataReady = false
    -- 初始化权限字串
    self.sAuthority = "Banner";
    -- 初始化DB操作器
    local oPlayer = self:GetPlayer();
    self.oDB = CBannerSystemDB:new(oPlayer:GetDBQuery(), self);
    if not self.oDB then
        _err("not self.oDB in CBannerSystem:Create");
        return false;
    end
    -- 初始化数据库缓存
    local Data = oPlayer:GetLineData("CBannerSystem")[1];
    self.tCache = {nEXP = Data.dwEXP,
        bBless = Data.bBless, 
        bConsume = Data.bConsume, 
        nLook = Data.dwLook,
        nStartTime = Data.dwStartTime};
    self:Open()
    return true;
end

--[[
    [\brief 客户端进入游戏登入所有场景之后
  ]]
function CBannerSystem:OnEnterScene()
    if self:HasAuthority(self.sAuthority) then 
        -- self:Open();
        self:AddAttribute()
        self:Synchronize()
    else
        -- self:Close();
    end
    self.bAllDataReady = true
end

--[[
    [\brief 销毁系统
  ]]
function CBannerSystem:Destroy()
    self.oDB = nil;
end

--[[
    [\brief 换线开始
  ]]
function CBannerSystem:OnChangeLineBegin()
    self:GetPlayer():SetLineData("CBannerSystem", 
        {dwEXP = self.nEXP, 
            bBless = self.bBless, 
            bConsume = self.bConsume, 
            dwLook = self.nLook,
            dwStartTime = self.nStartTime});
end

--[[
    [\brief 换线结束
  ]]
function CBannerSystem:OnChangeLineEnd()
    local oPlayer = self:GetPlayer();
    CBannerManager.tAffected[oPlayer:GetRoleID()] = nil;
    _G.BannerScript:DelBuff(oPlayer);

    if self:HasAuthority(self.sAuthority) then 
        self:Open();
        self:AddAttribute()
        self:Synchronize();
    else
        self:Close();
    end
end

--[[
    [\brief 开放权限时调用
  ]]
function CBannerSystem:EventGetAuthority(szAuthName)
    if szAuthName == self.sAuthority then 
        self:Open();
        self:AddAttribute()
        self:Synchronize();
    else
        -- 无需打开系统
    end
end

--[[
    [\brief 玩家属性发生变化时调用
  ]]
function CBannerSystem:EventDefenseChange()
    if self:HasAuthority(self.sAuthority) and self.bAllDataReady then
        self:GetPlayer().Banner_DefenseChangeMsg{
            nDefense = self:GetAddDefense()};
    else
        -- 无需向客户端发送加成防御值
    end
end

--[[
    [\brief 设置系统的铸造值和是否赐福布尔值
    [\param number nEXP 铸造值
    [\param number bBless 是否在赐福布尔值
  ]]
function CBannerSystem:SetEXPAndBless(nEXP, bBless)
    local nTotalMax = tFunc.GetLevelNeedEXP(#tConfig.LevelList);
    self.nEXP = (nEXP > nTotalMax) and nTotalMax or nEXP;
    self.bBless = bBless;
end

--[[
    [\brief 设置是否消耗材料插旗布尔值
    [\param boolean bConsume 是否消耗材料插旗布尔值
  ]]
function CBannerSystem:SetConsume(bConsume)
    self.bConsume = bConsume;
end

--[[
    [\brief 设置战旗外观编号:1~5
    [\param number nLook 战旗外观编号
  ]]
function CBannerSystem:SetLook(nLook)
    self.nLook = nLook;
end

--[[
    [\brief 设置插旗起始时间
    [\param number nStartTime 插旗起始时间
  ]]
function CBannerSystem:SetStartTime(nStartTime)
    self.nStartTime = nStartTime;
end

--[[
    [\brief 获取战旗系统当前等级
    [\return number 战旗系统当前等级
  ]]
function CBannerSystem:getLevel()
    return tFunc.GetLevel(self.nEXP, self.bBless)
end
