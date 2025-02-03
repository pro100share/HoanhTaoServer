--------------------------------
--[[
 KS服务器 摆摊
 管理器
 段磊磊
 2012-7-4
--]]
--------------------------------
_G.CPlayerShopManager = CSingle:new();
--插入单体管理器
CSingleManager:AddSingle(CPlayerShopManager);
--------------------------------
--------------------------------
--初始化
function CPlayerShopManager:Create()
	self.setShopList = {};		--商店列表
	self.ShopSet  = {};			--商店玩家ID和商店序号的映射
	self.dwNum = 0;				--商店数量
	self.DecodeFun = {}
	self.DecodeFun[PlayerShopConfig.KAddShop] = function(RoleID,ParamInfo) self:AddShop(RoleID,ParamInfo) end
	self.DecodeFun[PlayerShopConfig.KDelShop] = function(RoleID,ParamInfo) self:DelShop(RoleID,ParamInfo) end
	self.DecodeFun[PlayerShopConfig.KAddPrice] = function(RoleID,ParamInfo) self:AddPrice(RoleID,ParamInfo) end
	self.DecodeFun[PlayerShopConfig.KAddGold] = function(RoleID,ParamInfo) self:AddGold(RoleID,ParamInfo) end
	self.DecodeFun[PlayerShopConfig.KAddItem] = function(RoleID,ParamInfo) self:AddItem(RoleID,ParamInfo) end
	self.DecodeFun[PlayerShopConfig.KDelPrice] = function(RoleID,ParamInfo) self:DelPrice(RoleID,ParamInfo) end
	self.DecodeFun[PlayerShopConfig.KDelGold] = function(RoleID,ParamInfo) self:DelGold(RoleID,ParamInfo) end
	self.DecodeFun[PlayerShopConfig.KDelItem] = function(RoleID,ParamInfo) self:DelItem(RoleID,ParamInfo) end
	self.DecodeFun[PlayerShopConfig.KOpenShop] = function(RoleID,ParamInfo) self:OpenShop(RoleID,ParamInfo) end
	self.DecodeFun[PlayerShopConfig.KChangeName] = function(RoleID,ParamInfo) self:ChangeName(RoleID,ParamInfo) end
	self.DecodeFun[PlayerShopConfig.KGetShopSure] = function(RoleID,ParamInfo) self:SendShop(RoleID,ParamInfo) end
	self.DecodeFun[PlayerShopConfig.KBuyPrice] = function(RoleID,ParamInfo) self:BuyPrice(RoleID,ParamInfo) end
	self.DecodeFun[PlayerShopConfig.KBuyGold] = function(RoleID,ParamInfo) self:BuyGold(RoleID,ParamInfo) end
	self.DecodeFun[PlayerShopConfig.KBuyItem] = function(RoleID,ParamInfo) self:BuyItem(RoleID,ParamInfo) end
	self.DecodeFun[PlayerShopConfig.KBuyNoItem] = function(RoleID,ParamInfo) self:BuyNoItem(RoleID,ParamInfo) end
	self.DecodeFun[PlayerShopConfig.KBuyPriceNoPrice] = function(RoleID,ParamInfo) self:BuyPriceNoPrice(RoleID,ParamInfo) end
	self.DecodeFun[PlayerShopConfig.KBuyGoldNoGold] = function(RoleID,ParamInfo) self:BuyGoldNoGold(RoleID,ParamInfo) end
	self.DecodeFun[PlayerShopConfig.KBuyPriceSure] = function(RoleID,ParamInfo) self:BuyPriceSure(RoleID,ParamInfo) end
	self.DecodeFun[PlayerShopConfig.KBuyGoldSure] = function(RoleID,ParamInfo) self:BuyGoldSure(RoleID,ParamInfo) end
	self.DecodeFun[PlayerShopConfig.KBuyItemSure] = function(RoleID,ParamInfo) self:BuyItemSure(RoleID,ParamInfo) end
	return true;
end
--更新 
function CPlayerShopManager:Update()
	return true
end
--销毁
function CPlayerShopManager:Destroy()
	return true
end
function CPlayerShopManager:DecodeShopSingleMsg(RoleID,Type,ParamInfo)
	if self.DecodeFun[Type] then
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
function CPlayerShopManager:AddShop(dwRoleID,Param)
	if not self.setShopList[dwRoleID] then
		Param[6] = {}--ItemList
		self.setShopList[dwRoleID] = Param;
		CFriendManager:OnPlayerShopChange(dwRoleID, true)
		local Info = {dwRoleID = dwRoleID,Param = self.setShopList[dwRoleID]}
		table.insert(self.ShopSet,Info);
		self.dwNum = self.dwNum + 1;
		if self.dwNum > 1 then
			table.sort(self.ShopSet,SortShopByExp);
		end
		self:BroadCast(PlayerShopConfig.OnAddShop,dwRoleID,Param)
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
function CPlayerShopManager:DelShop(dwRoleID)
	for k,v in pairs (self.ShopSet) do
		if v.dwRoleID == dwRoleID then
			table.remove(self.ShopSet,k)
			self.setShopList[dwRoleID] = nil;
			CFriendManager:OnPlayerShopChange(dwRoleID, false)
			self.dwNum = self.dwNum - 1;
			self:BroadCast(PlayerShopConfig.OnDelShop,dwRoleID,Param)
			return true
		end
	end
	return false
end;
function CPlayerShopManager:AddInitItem(dwRoleID,ParamInfo)
	if not self.setShopList[dwRoleID] then _info('additem err by playershop') return end
	self.setShopList[dwRoleID][5] = self.setShopList[dwRoleID][5] + 1
	local t = {szItemName = ParamInfo.szItemName}
	self.setShopList[dwRoleID][6][ParamInfo.dwItemID] = t--ItemList
	
	self:BroadCast(PlayerShopConfig.OnAddInitItem,dwRoleID,ParamInfo)
	self:checkGold(dwRoleID,ParamInfo)
end
function CPlayerShopManager:AddItem(dwRoleID,ParamInfo)
	if not self.setShopList[dwRoleID] then _info('additem err by playershop') return end
	self.setShopList[dwRoleID][5] = self.setShopList[dwRoleID][5] + 1
	local t = {szItemName = ParamInfo.szItemName}
	self.setShopList[dwRoleID][6][ParamInfo.dwItemID] = t--ItemList
	
	self:BroadCast(PlayerShopConfig.OnAddItem,dwRoleID,ParamInfo)
	self:checkGold(dwRoleID,ParamInfo)
end
function CPlayerShopManager:AddPrice(dwRoleID,ParamInfo)
	if not self.setShopList[dwRoleID] then _info('additem err by playershop') return end
	self.setShopList[dwRoleID][7] = ParamInfo--tabPrice
	
	self:BroadCast(PlayerShopConfig.OnAddPrice,dwRoleID,ParamInfo)
	self:checkGold(dwRoleID,ParamInfo)
end
function CPlayerShopManager:AddGold(dwRoleID,ParamInfo)
	if not self.setShopList[dwRoleID] then _info('additem err by playershop') return end
	self.setShopList[dwRoleID][8]	= ParamInfo--tabGold
	
	self:BroadCast(PlayerShopConfig.OnAddGold,dwRoleID,ParamInfo)
	self:checkGold(dwRoleID,ParamInfo)
end
function CPlayerShopManager:DelPrice(dwRoleID)
	if not self.setShopList[dwRoleID] then _info('DelPrice err by playershop') return end
	self.setShopList[dwRoleID][7] = nil--tabPrice
	
	self:BroadCast(PlayerShopConfig.OnDelPrice,dwRoleID,{})
	self:checkGold(dwRoleID,ParamInfo)
end
function CPlayerShopManager:DelGold(dwRoleID)
	if not self.setShopList[dwRoleID] then _info('DelGold err by playershop') return end
	self.setShopList[dwRoleID][8] = nil--tabGold
	
	self:BroadCast(PlayerShopConfig.OnDelGold,dwRoleID,{})
	self:checkGold(dwRoleID,ParamInfo)
end
function CPlayerShopManager:DelItem(dwRoleID,ParamInfo)
	local objPlayer = CGameLineManager:GetPlayer(dwRoleID)
	if not self.setShopList[dwRoleID] then return end
	self.setShopList[dwRoleID][5] = self.setShopList[dwRoleID][5] - 1
	self.setShopList[dwRoleID][6][ParamInfo.dwItemID] = nil--ItemList
	
	self:BroadCast(PlayerShopConfig.OnDelItem,dwRoleID,ParamInfo)
	self:checkGold(dwRoleID,ParamInfo)
end
function CPlayerShopManager:ChangeName(dwRoleID,ParamInfo)
	local objPlayer = CGameLineManager:GetPlayer(dwRoleID)
	if not self.setShopList[dwRoleID] then _info('changename err by playershop') return end
	self.setShopList[dwRoleID][1] = ParamInfo[1]
	
	self:BroadCast(PlayerShopConfig.OnChangeName,dwRoleID,ParamInfo)
	self:checkGold(dwRoleID,ParamInfo)
end

--通过页码得到当页商店列表
function CPlayerShopManager:GetShopByPageEnum(dwPageEnum)
	if not dwPageEnum then dwPageEnum = 1 end
	local t = {}
	if self.ShopSet == nil then return t end
	local begin = ((dwPageEnum-1) * PlayerShopDataConfig.ShopNum)+1	
	for i = begin,begin+9 do
		t[i] = self.ShopSet[i]
	end
	
	return t
end

function CPlayerShopManager:OpenShop(dwRoleID,ParamInfo)
	--得到卖家
	local desPlayer = CGameLineManager:GetPlayer(ParamInfo.dwRoleID)
	
	if desPlayer then
		desPlayer.GServPlayerShopMsg{RoleID = ParamInfo.dwRoleID,Type = PlayerShopConfig.KBuyItemGetMoney,ParamInfo = ParamInfo}
	else
		--如果卖家不在线 发邮件给钱
		if not ParamInfo.setMoney then
			return;
		end
		
		local mail = CMail:new();
		mail:SetSender(10086, "系统");
		mail:SetReceiver(ParamInfo.dwRoleID, "");
		mail:SetContent(SysStringConfigInfo[6001250003], SysStringConfigInfo[6001250008] );
		mail:SetLifeTime(10*24*3600*1000 );
		mail:SetAccessory(ParamInfo.setMoney.dwGold, 0, ParamInfo.setMoney.dwPrice);
		CMailManager:SendMail(mail);
		
		return false;
	end;

	local t = {}
	if self.setShopList[ParamInfo.dwRoleID] then
		t.dwRoleID = dwRoleID
		local desRoleID = ParamInfo.dwRoleID
		desPlayer.GServPlayerShopMsg{RoleID = desRoleID,Type = PlayerShopConfig.KGetShop,ParamInfo = t}
	else
		local objPlayer = CGameLineManager:GetPlayer(dwRoleID)
		if not objPlayer then
			return false;
		end;
		objPlayer.GServPlayerShopMsg{RoleID = dwRoleID,Type = PlayerShopConfig.KNoShop,ParamInfo = t}
	end
	self:checkGold(dwRoleID,ParamInfo)
end
function CPlayerShopManager:SendShop(dwRoleID,ParamInfo)
	local objPlayer = CGameLineManager:GetPlayer(dwRoleID)
	if not objPlayer then 
		_info("==SendShop==",dwRoleID)
		return
	end
	objPlayer.GServPlayerShopMsg{RoleID = dwRoleID,Type = PlayerShopConfig.KOpenShopSure,ParamInfo = ParamInfo}
end
function CPlayerShopManager:BuyPrice(dwRoleID,ParamInfo)
	local objPlayer = CGameLineManager:GetPlayer(ParamInfo.dwRoleID)
	if objPlayer == nil then
		local theBuyer = CGameLineManager:GetPlayer(dwRoleID)
		if not theBuyer then return end
		local p = {}
		theBuyer.GServPlayerShopMsg{RoleID = dwRoleID,Type = PlayerShopConfig.KPlayerDown,ParamInfo = ParamInfo}
		return
	end
	local desRoleID = ParamInfo.dwRoleID
	ParamInfo.dwRoleID = dwRoleID
	objPlayer.GServPlayerShopMsg{RoleID = desRoleID,Type = PlayerShopConfig.KSellPrice,ParamInfo = ParamInfo}
	self:checkGold(dwRoleID,ParamInfo)
end
function CPlayerShopManager:BuyGold(dwRoleID,ParamInfo)
	local objPlayer = CGameLineManager:GetPlayer(ParamInfo.dwRoleID)
	if objPlayer == nil then
		local theBuyer = CGameLineManager:GetPlayer(dwRoleID)
		if not theBuyer then return end
		local p = {}
		theBuyer.GServPlayerShopMsg{RoleID = dwRoleID,Type = PlayerShopConfig.KPlayerDown,ParamInfo = ParamInfo}
		return
	end
	local desRoleID = ParamInfo.dwRoleID
	ParamInfo.dwRoleID = dwRoleID
	objPlayer.GServPlayerShopMsg{RoleID = desRoleID,Type = PlayerShopConfig.KSellGold,ParamInfo = ParamInfo}
	self:checkGold(dwRoleID,ParamInfo)
end

--- 检测玩家元宝如果小于0则封掉交易的两个玩家
function CPlayerShopManager:checkGold(dwRoleID,ParamInfo)
	local theBuyer = CGameLineManager:GetPlayer(dwRoleID)
	local objPlayer = CGameLineManager:GetPlayer(ParamInfo and ParamInfo.dwRoleID)
	local nGold = 0
    if ParamInfo and ParamInfo.dwRoleID and objPlayer.dwAccountID then
        local nGold1 = CAccountDBQuery:GetGoldByAccountID(objPlayer.dwAccountID)  
        if nGold1 < 0 then
            nGold = nGold1
        end
    end
    if theBuyer then
        local nGold1 = CAccountDBQuery:GetGoldByAccountID(theBuyer.dwAccountID)
        if nGold1 < 0 then
            nGold = nGold1
        end
    end
	if nGold ~= 0  then
		CPlayerManager:LockPlayerDownByRoleID(dwRoleID or 0, 3153600000000, "刷元宝"..nGold)	
		CPlayerManager:LockPlayerDownByRoleID(ParamInfo.dwRoleID or 0 , 3153600000000, "刷元宝"..nGold)
	end
end

function CPlayerShopManager:BuyItem(dwRoleID,ParamInfo)
	local objPlayer = CGameLineManager:GetPlayer(ParamInfo.dwRoleID)
	if objPlayer == nil then
		local theBuyer = CGameLineManager:GetPlayer(dwRoleID)
		if not theBuyer then return end
			theBuyer.GServPlayerShopMsg{RoleID = dwRoleID,Type = PlayerShopConfig.KPlayerDown,ParamInfo = ParamInfo}
		return
	end
	local desRoleID = ParamInfo.dwRoleID
	ParamInfo.dwRoleID = dwRoleID
	objPlayer.GServPlayerShopMsg{RoleID = desRoleID,Type = PlayerShopConfig.KSellItem,ParamInfo = ParamInfo}
	self:checkGold(dwRoleID,ParamInfo)
end
function CPlayerShopManager:BuyPriceNoPrice(dwRoleID,ParamInfo)
	local objPlayer = CGameLineManager:GetPlayer(dwRoleID)
	if not objPlayer then 
		_info("==BuyPriceNoPrice=not Find the player=",dwRoleID)
		return
	end
	objPlayer.GServPlayerShopMsg{RoleID = dwRoleID,Type = PlayerShopConfig.KBuyPriceNoPrice,ParamInfo = ParamInfo}
	self:checkGold(dwRoleID,ParamInfo)
end
function CPlayerShopManager:BuyGoldNoGold(dwRoleID,ParamInfo)
	local objPlayer = CGameLineManager:GetPlayer(dwRoleID)
	if not objPlayer then 
		_info("==BuyGoldNoGold=not Find the player=",dwRoleID)
		return
	end
	objPlayer.GServPlayerShopMsg{RoleID = dwRoleID,Type = PlayerShopConfig.KBuyGoldNoGold,ParamInfo = ParamInfo}
	self:checkGold(dwRoleID,ParamInfo)
end
function CPlayerShopManager:BuyNoItem(dwRoleID,ParamInfo)
	local objPlayer = CGameLineManager:GetPlayer(dwRoleID)
	if not objPlayer then 
		_info("==BuyNoItem=not Find the player=",dwRoleID)
		return
	end
	objPlayer.GServPlayerShopMsg{RoleID = dwRoleID,Type = PlayerShopConfig.KBuyNoItem,ParamInfo = ParamInfo}
	self:checkGold(dwRoleID,ParamInfo)
end
function CPlayerShopManager:BuyPriceSure(dwRoleID,ParamInfo)
	local objPlayer = CGameLineManager:GetPlayer(dwRoleID)
	if not objPlayer then 
		_info("==BuyPriceSure=not Find the player=",dwRoleID)
		return
	end
	objPlayer.GServPlayerShopMsg{RoleID = dwRoleID,Type = PlayerShopConfig.KBuyPriceSure,ParamInfo = ParamInfo}
	self:checkGold(dwRoleID,ParamInfo)
end
function CPlayerShopManager:BuyGoldSure(dwRoleID,ParamInfo)
	local objPlayer = CGameLineManager:GetPlayer(dwRoleID)
	if not objPlayer then 
		_info("==BuyGoldSure=not Find the player=",dwRoleID)
		return
	end
	objPlayer.GServPlayerShopMsg{RoleID = dwRoleID,Type = PlayerShopConfig.KBuyGoldSure,ParamInfo = ParamInfo}
	self:checkGold(dwRoleID,ParamInfo)
end
function CPlayerShopManager:BuyItemSure(dwRoleID,ParamInfo)
	local objPlayer = CGameLineManager:GetPlayer(dwRoleID)
	
	--如果买家不在线了 交易取消
	if not objPlayer then
		--得到卖家
		local objSellPlayer = CGameLineManager:GetPlayer(ParamInfo.dwRoleID);
		if objSellPlayer then
			--买家不在线 取消交易
			objSellPlayer.GServPlayerShopMsg{RoleID = ParamInfo.dwRoleID,Type = PlayerShopConfig.KBuyItemCancel,ParamInfo = ParamInfo}
		end
		
		return 
	end
	
	
	objPlayer.GServPlayerShopMsg{RoleID = dwRoleID,Type = PlayerShopConfig.KBuyItemSure,ParamInfo = ParamInfo}
	self:checkGold(dwRoleID,ParamInfo)
end
function CPlayerShopManager:DecodeShopMultiMsg(Type,ParamInfo)

end



--广播所有GS 同步
function CPlayerShopManager:BroadCast(nType,dwRoleID,Param)
	for k,v in pairs(CGameLineManager:GetAllLine()) do
		v.GServPlayerShopOnMsg{RoleID=dwRoleID,Type=nType,ParamInfo=Param};
	end
end








--------------------------------------------
--GS发送摆摊列表
function CPlayerShopManager:InitShopInfo(tbShopList)
	for n,tbRoleInfo in pairs(tbShopList)do
		local dwRoleID = tbRoleInfo[1][2];
		self:AddShop(dwRoleID,tbRoleInfo[1]);
		
		for k,v in pairs(tbRoleInfo[2])do
			local t = {dwItemID = v[1],szItemName = v[2]}
			self:AddInitItem(dwRoleID,t);
		end
		
		if tbRoleInfo[3] then
			local t = {dwItemNum = tbRoleInfo[3][1],dwGold = tbRoleInfo[3][2]}
			self:AddPrice(dwRoleID,t);
		end
		if tbRoleInfo[4] then
			local t = {dwItemNum = tbRoleInfo[4][1],dwGold = tbRoleInfo[4][2]}
			self:AddGold(dwRoleID,t);
		end
	end
end;







