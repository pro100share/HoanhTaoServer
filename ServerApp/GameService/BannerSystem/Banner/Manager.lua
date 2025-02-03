--[[
	[\brief 战旗管理器
	[\author 王凌波
	[\date 2014-7-16
  ]]

-- 新建战旗管理器
_G.CBannerManager = CSingle:new();
CSingleManager:AddSingle(CBannerManager, true);

--[[
    [\brief 创建战旗管理器
    [\return boolean 创建是否成功
  ]]
function CBannerManager:Create()
    -- 初始化战旗集合
    -- key-插旗的玩家的ID，value-战旗对象
    self.tAllBanners = {};
    -- 初始化受影响玩家集合
    -- key-受战旗影响的玩家ID，value-所有影响该玩家的战旗的最大等级
    self.tAffected = {};

    return true;
end

--[[
    [\brief 更新战旗管理器
    [\return boolean 更新是否成功
  ]]
function CBannerManager:Update()
    self:CheckTime();
    self:UpdateAffect();
    return true;
end

--[[
    [\brief 销毁战旗管理器
  ]]
function CBannerManager:Destroy()
    for _, v in pairs(self.tAllBanners) do
        v:Delete();
    end
    self.tAllBanners = nil;
    self.tAffected = nil;
end
