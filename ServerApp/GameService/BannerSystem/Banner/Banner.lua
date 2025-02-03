--[[
	[\brief 战旗类
	[\author 王凌波
	[\date 2014-7-16
  ]]

-- 战旗类
_G.CBanner = {};

--[[
    [\brief 新建战旗
    [\return oBanner 战旗对象
  ]]
function CBanner:new()
    local oBanner = {};
    for k, v in pairs(self) do
        if type(v) == "function" then
          oBanner[k] = v;
        end
    end
    return oBanner;
end

--[[
    [\brief 战旗初始化，设置各属性
    [\param number nTime 插旗起始时间
    [\param number nMapID 战旗所在地图的ID
    [\param number nX 战旗的x轴坐标
    [\param number nY 战旗的y轴坐标
    [\param number nLevel 战旗等级
    [\param number nLook 战旗外观编号
    [\param string sRoleName 插旗的玩家的姓名
    [\param boolean bInDupl 战旗是否在副本里标志位
  ]]
function CBanner:Init(nTime, nMapID, nX, nY, nLevel, nLook, sRoleName, bInDupl)
    self:SetTime(nTime);
    self:SetMapID(nMapID);
    self:SetPos(nX, nY);
    self:SetLevel(nLevel);
    self:SetLook(nLook);
    self:SetRoleName(sRoleName);
    self:SetInDupl(bInDupl);
    self:SetNPC();
end

--[[
    [\brief 销毁战旗
  ]]
function CBanner:Delete()
    local objMap = CMapManager:GetMap(self.nMapID)
    if not objMap then return end
    CScriptManager:DelNpcObj(self.nMapID, self.NPC);
    self.NPC = nil;
end

--[[
    [\brief 设置插旗的起始时间
    [\param number nTime 起始时间
  ]]
function CBanner:SetTime(nTime)
    self.nTime = nTime;
end

--[[
    [\brief 设置战旗所在地图的ID
    [\param number nTime 地图的ID
  ]]
function CBanner:SetMapID(nMapID)
    self.nMapID = nMapID;
end

--[[
    [\brief 设置战旗的坐标位置
    [\param number nX x轴坐标
    [\param number nY y轴坐标
  ]]
function CBanner:SetPos(nX, nY)
    self.nX = nX;
    self.nY = nY;
end

--[[
    [\brief 设置战旗等级
    [\param number nLevel 战旗等级
  ]]
function CBanner:SetLevel(nLevel)
    self.nLevel = nLevel;
end

--[[
    [\brief 设置战旗外观编号
    [\param number nLevel 战旗外观编号
  ]]
function CBanner:SetLook(nLook)
    self.nLook = nLook;
end

--[[
    [\brief 设置插旗玩家姓名
    [\param string sRoleName 插旗玩家姓名
  ]]
function CBanner:SetRoleName(sRoleName)
    self.sRoleName = sRoleName;
end

--[[
    [\brief 设置战旗是否在副本里标志位
    [\param boolean sRoleName 插旗玩家姓名
  ]]
function CBanner:SetInDupl(bInDupl)
    self.bInDupl = bInDupl;
end

--[[
    [\brief 设置NPC
  ]]
function CBanner:SetNPC()
    local nNPCID = self.nLook + 130000;
    self.NPC = CScriptManager:AddNpcToMap(
        self.nMapID, 
        nNPCID, 
        self.nX, 
        self.nY, 
        5.5, 
        self.sRoleName, 
        _G.NPCData[nNPCID].Title);
end
