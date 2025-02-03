--[[
	[\brief 英雄令系统
	[\author 王凌波
	[\date 2014-7-2
  ]]

-- 英雄令系统
_G.CHeroTokenSystem = {};

-- 公用函数
local ShareFunction = _G.HeroTokenFunctions;

--[[
    [\brief 新建系统
    [\return table oObj 英雄令系统对象
  ]]
function CHeroTokenSystem:new()
	local oObj = CSystem:new("CHeroTokenSystem");
	for k, v in pairs(self) do
		if type(v) == "function" then
			oObj[k] = v;
		end
	end    
	return oObj;
end

--[[
	[\brief 创建系统
	[\param boolean bIsChangeLine 是否在换线
  ]]
function CHeroTokenSystem:Create(bIsChangeLine)
    -- 初始化系统属性
    self.sAuthority = "HeroToken";
    -- 初始化DB操作器
    self.oDB = CHeroTokenSystemDB:new(self:
        GetPlayer():GetDBQuery(), self);
    if not self.oDB then
        _err("not self.oDB in CHeroTokenSystem:Create");
        return false;
    end
    -- 读取数据库数据，存入缓存
    local Data = self:GetPlayer():GetLineData("CHeroTokenSystem")[1];
    self.tCache = {tEnbeded = Data.tEnbeded};

	return true;
end

--[[
	[\brief 销毁系统
  ]]
function CHeroTokenSystem:Destroy()
	self.oDB = nil;
end

--[[
	[\brief 进入场景
  ]]
function CHeroTokenSystem:OnEnterScene()
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
function CHeroTokenSystem:OnChangeLineBegin()
	self:GetPlayer():SetLineData("CHeroTokenSystem", 
        {tEnbeded = self.tEnbeded});
end

--[[
    [\brief 换线结束
    [进入剧情副本需要初始化系统
  ]]
function CHeroTokenSystem:OnChangeLineEnd(nNewLineID)
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
function CHeroTokenSystem:EventGetAuthority(szAuthName)
    -- 如果没有权限
    if szAuthName ~= self.sAuthority then return; end

    self:Open();
    self:Synchronize();
end


