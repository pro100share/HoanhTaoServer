--[[
	[\brief 战骑诀系统
	[\author 王凌波
	[\date 2014-6-19
  ]]

-- 战骑诀系统
_G.CZhanQiJueSystem = {};

--[[
    [\brief 新建战骑诀系统
  ]]
function CZhanQiJueSystem:new()
  	local obj = CSystem:new("CZhanQiJueSystem");
  	for k, v in pairs(self) do
  		if type(v) == "function" then
  			obj[k] = v;
  		end
  	end
  	return obj;
end

--[[
	[\brief 创建系统
	[\param boolean bIsChangeLine 是否在换线
  ]]
function CZhanQiJueSystem:Create(bIsChangeLine)
    -- 本系统权限字串
    self.sAuthority = "ZhanQiJue";
    -- 本系统数据库操作器
	  self.oDB = CZhanQiJueSystemDB:new(self:GetPlayer():GetDBQuery(), self);
    if not self.oDB then
        _err("not self.oDB in CZhanQiJueSystem:Create");
        return false;
    end
    -- 读取数据库
    local Data = self:GetPlayer():GetLineData("CZhanQiJueSystem")[1];
    self.tCache = {nEXP = Data.dwEXP; bBless = Data.bBless};

	  return true;
end

--[[
	[\brief 销毁系统
  ]]
function CZhanQiJueSystem:Destroy()
	self.oDB = nil;
end

--[[
	[\brief 进入场景
  ]]
function CZhanQiJueSystem:OnEnterScene()
    if self:HasAuthority(self.sAuthority) then 
        self:Open();
        self:Synchronize();
    else
        self:Close();
    end
end

--[[
	[\brief 换线开始
  ]]
function CZhanQiJueSystem:OnChangeLineBegin()
	self:GetPlayer():SetLineData("CZhanQiJueSystem", 
        {dwEXP = self.nEXP, bBless = self.bBless});
end

--[[
    [\brief 换线结束
    [进入剧情副本需要初始化系统
  ]]
function CZhanQiJueSystem:OnChangeLineEnd(nNewLineID)
    if self:HasAuthority(self.sAuthority) then 
        self:Open();
        self:Synchronize();
    else
        self:Close();
    end
end

--[[
    [\brief 开放权限时调用
  ]]
function CZhanQiJueSystem:EventGetAuthority(szAuthName)
    --如果是本系统权限字串
    if szAuthName == self.sAuthority then
        self:Open();
        self:Synchronize();
    end
end

--[[
    [\brief 设置赐福状态
    [\param boolean bBless 赐福状态布尔值
  ]]
function CZhanQiJueSystem:SetBless(bBless) 
    self.bBless = bBless;
end
