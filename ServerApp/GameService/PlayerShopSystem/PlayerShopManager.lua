--------------------------------
--[[
 服务器 摆摊
 管理器
 段磊磊
 2012-2-20
--]]
--------------------------------
_G.CPlayerShopManager = CSingle:new();
--插入单体管理器
CSingleManager:AddSingle(CPlayerShopManager,true);
--------------------------------
--------------------------------
--初始化
function CPlayerShopManager:Create()
	self.setShopList = {};		--商店列表
	self.ShopSet  = {};			--商店玩家ID和商店序号的映射
	self.dwNum = 0;				--商店数量
	
	self.DecodeFun = {}
	self.DecodeFun[PlayerShopConfig.OnAddShop] = function(RoleID,ParamInfo) self:OnAddShop(RoleID,ParamInfo) end
	self.DecodeFun[PlayerShopConfig.OnDelShop] = function(RoleID,ParamInfo) self:OnDelShop(RoleID,ParamInfo) end
	self.DecodeFun[PlayerShopConfig.OnAddInitItem] = function(RoleID,ParamInfo) self:OnAddInitItem(RoleID,ParamInfo) end
	self.DecodeFun[PlayerShopConfig.OnAddItem] = function(RoleID,ParamInfo) self:OnAddItem(RoleID,ParamInfo) end
	self.DecodeFun[PlayerShopConfig.OnDelItem] = function(RoleID,ParamInfo) self:OnDelItem(RoleID,ParamInfo) end
	self.DecodeFun[PlayerShopConfig.OnAddPrice] = function(RoleID,ParamInfo) self:OnAddPrice(RoleID,ParamInfo) end
	self.DecodeFun[PlayerShopConfig.OnDelPrice] = function(RoleID,ParamInfo) self:OnDelPrice(RoleID,ParamInfo) end
	self.DecodeFun[PlayerShopConfig.OnAddGold] = function(RoleID,ParamInfo) self:OnAddGold(RoleID,ParamInfo) end
	self.DecodeFun[PlayerShopConfig.OnDelGold] = function(RoleID,ParamInfo) self:OnDelGold(RoleID,ParamInfo) end
	self.DecodeFun[PlayerShopConfig.OnChangeName] = function(RoleID,ParamInfo) self:OnChangeName(RoleID,ParamInfo) end
	return true;
end
--更新 
function CPlayerShopManager:Update(dwInterval)
	return true
end
--销毁
function CPlayerShopManager:Destroy()
	return true
end
-----------------------------------------------------------------
----函数名称：CPlayerShopManager:AddShop(SPlayerShop)
----函数功能：添加一个玩家商店到管理器
----函数参数：商店结构CPlayerShop
-----------------------------------------------------------------
function CPlayerShopManager:AddShop(dwRoleID,objPlayer,nFlag)
	local objPlayerShopSys = objPlayer:GetSystem('CPlayerShopSystem')
	local t = {}
	t[1] = objPlayerShopSys.szShopName
	t[2] = dwRoleID
	t[3] = objPlayer:GetInfo().szRoleName
	t[4] = objPlayer:GetInfo().dwLevel
	t[5] = 0
	CKernelApp.KServPlayerShopSingleMsg{RoleID = dwRoleID,Type = PlayerShopConfig.KAddShop,ParamInfo = t}
end;
-----------------------------------------------------------------
----函数名称：CPlayerShopManager:GetShop(dwRoleID)
----函数功能：从管理器得到一个玩家商店结构
----函数参数：玩家objID
-----------------------------------------------------------------
function CPlayerShopManager:GetShop(dwRoleID)
	if self.setShopList[dwRoleID] then
		return self.setShopList[dwRoleID];
	else
		return false;
	end
end
-----------------------------------------------------------------
----函数名称：CPlayerShopManager:DelShop(dwRoleID)
----函数功能：从管理器删除一个玩家商店
----函数参数：商店结构CPlayerShop
-----------------------------------------------------------------
function CPlayerShopManager:DelShop(dwRoleID)
	local t = {}
	CKernelApp.KServPlayerShopSingleMsg{RoleID = dwRoleID,Type = PlayerShopConfig.KDelShop,ParamInfo = t}
end;

--KS回连的处理
function CPlayerShopManager:OnKSReConnect()
	--print("===CPlayerShopManager onKSReConnect===")
	local tbSendList = {};
	local dwNumber = 0;
	local tbAllRole = CMapManager:GetPlayer();
	for n,objPlayer in pairs(tbAllRole)do
		local objShopSys = objPlayer:GetSystem("CPlayerShopSystem");
		if objShopSys and objShopSys:IsShoping() then
			table.insert(tbSendList,objShopSys:GetMyShopInfo());
			dwNumber = dwNumber + 1;
			if dwNumber > 5 then
				CKernelApp.KServPlayerShopListMsg{ShopList = tbSendList};
				tbSendList = {};
				dwNumber = 0;
			end
		end
	end
	if dwNumber > 0 then
		CKernelApp.KServPlayerShopListMsg{ShopList = tbSendList};
	end
end;
-----------------------------------------------------------------------------------------------------2013-5-9修改
--通过页码得到当页商店列表
function CPlayerShopManager:GetShopByPageEnum(dwPageEnum)
	if not dwPageEnum then dwPageEnum = 1 end
	local t = {}
	if self.ShopSet == nil then return t end
	local begin = ((dwPageEnum-1) * PlayerShopDataConfig.ShopNum)+1	
	for i = begin,begin+9 do
		if not self.ShopSet[i] then break end
		t[i] = {}
		t[i][1] = self.ShopSet[i].Param[1]
		t[i][2] = self.ShopSet[i].Param[2]
		t[i][3] = self.ShopSet[i].Param[3]
		t[i][4] = self.ShopSet[i].Param[4]
		t[i][5] = self.ShopSet[i].Param[5]
		t[i][6] = {}
		t[i][7] = self.ShopSet[i].Param[7]
		t[i][8] = self.ShopSet[i].Param[8]
	end
	return t
end

---------------------------------------------广播消息响应
function CPlayerShopManager:DecodeShopMsgOnKS(Type,RoleID,ParamInfo)
	if self.DecodeFun and self.DecodeFun[Type] then
		self.DecodeFun[Type](RoleID,ParamInfo)
	end
end
-----------------------------------------------------------------
----函数名称：CPlayerShopManager:GetShopNum()
----函数功能：得到玩家商店数量
----函数参数：商店结构CPlayerShop
-----------------------------------------------------------------
function CPlayerShopManager:GetShopNum()
	return self.dwNum;
end
-----------------------------------------------------------------
----函数名称：CPlayerShopManager:AddShop(SPlayerShop)
----函数功能：添加一个玩家商店到管理器
----函数参数：商店结构CPlayerShop
-----------------------------------------------------------------
local function SortShopByExp(a,b) 
	if a and b then
		return a.Param[4] > b.Param[4]
	end
end
function CPlayerShopManager:OnAddShop(dwRoleID,Param)
	if not self.setShopList[dwRoleID] then
		Param[6] = {}--ItemList
		self.setShopList[dwRoleID] = Param;
		--CFriendManager:OnPlayerShopChange(dwRoleID, true)
		local Info = {dwRoleID = dwRoleID,Param = self.setShopList[dwRoleID]}
		table.insert(self.ShopSet,Info);
		self.dwNum = self.dwNum + 1;
		if self.dwNum > 1 then
			table.sort(self.ShopSet,SortShopByExp);
		end
		return true
	else
		return false
	end
end;
-----------------------------------------------------------------
----函数名称：CPlayerShopManager:DelShop(dwRoleID)
----函数功能：从管理器删除一个玩家商店
----函数参数：商店结构CPlayerShop
-----------------------------------------------------------------
function CPlayerShopManager:OnDelShop(dwRoleID)
	for k,v in pairs (self.ShopSet) do
		if v.dwRoleID == dwRoleID then
			table.remove(self.ShopSet,k)
			self.setShopList[dwRoleID] = nil;
			--CFriendManager:OnPlayerShopChange(dwRoleID, false)
			self.dwNum = self.dwNum - 1;
			return true
		end
	end
	return false
end;
function CPlayerShopManager:OnAddInitItem(dwRoleID,ParamInfo)
	local t = {szItemName = ParamInfo.szItemName}
	self.setShopList[dwRoleID][6][ParamInfo.dwItemID] = t--ItemList
end
function CPlayerShopManager:OnAddItem(dwRoleID,ParamInfo)
	if not self.setShopList[dwRoleID] then _info('additem err by playershop') return end
	self.setShopList[dwRoleID][5] = self.setShopList[dwRoleID][5] + 1
	local t = {szItemName = ParamInfo.szItemName}
	self.setShopList[dwRoleID][6][ParamInfo.dwItemID] = t--ItemList
end
function CPlayerShopManager:OnAddPrice(dwRoleID,ParamInfo)
	if not self.setShopList[dwRoleID] then _info('additem err by playershop') return end
	self.setShopList[dwRoleID][7] = ParamInfo--tabPrice
end
function CPlayerShopManager:OnAddGold(dwRoleID,ParamInfo)
	if not self.setShopList[dwRoleID] then _info('additem err by playershop') return end
	self.setShopList[dwRoleID][8]	= ParamInfo--tabGold
end
function CPlayerShopManager:OnDelPrice(dwRoleID)
	if not self.setShopList[dwRoleID] then _info('DelPrice err by playershop') return end
	self.setShopList[dwRoleID][7] = nil--tabPrice
end
function CPlayerShopManager:OnDelGold(dwRoleID)
	if not self.setShopList[dwRoleID] then _info('DelGold err by playershop') return end
	self.setShopList[dwRoleID][8] = nil--tabGold
end
function CPlayerShopManager:OnDelItem(dwRoleID,ParamInfo)
	if not self.setShopList[dwRoleID] then return end
	self.setShopList[dwRoleID][5] = self.setShopList[dwRoleID][5] - 1
	self.setShopList[dwRoleID][6][ParamInfo.dwItemID] = nil--ItemList
end
function CPlayerShopManager:OnChangeName(dwRoleID,ParamInfo)
	if not self.setShopList[dwRoleID] then _info('changename err by playershop') return end
	self.setShopList[dwRoleID][1] = ParamInfo[1]
end


