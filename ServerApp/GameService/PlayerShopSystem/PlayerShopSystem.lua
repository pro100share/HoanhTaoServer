--[[
功能：摆摊系统类（服务器）
作者：段磊磊
时间：2012-2-20
--]]

_G.CPlayerShopSystem = {}
-------------------------------
function CPlayerShopSystem:new()
	local obj = CSystem:new("CPlayerShopSystem");
	obj.setItemList = {}; 	--摆摊物品列表
	obj.szRoleName = ''		--玩家名字
	obj.szShopName = ''		--商店名字
	obj.dwItemNum = 0		--物品数量
	obj.dwPlayerLv = 0   	--玩家等级

	obj.dwSerial = 0 		--自增物品序列号，防物品变化
	obj.szSearchItemName = '' --当前搜索的项目名称
	obj.objItemSys = nil    --物品系统
	obj.dwRoleID = nil		--玩家ID
	obj.setSystem = {};
	for i,v in pairs(CPlayerShopSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end
function CPlayerShopSystem:Create()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local objDB = objPlayer:GetDBQuery();
	-- 创建数据库对象
	self.objDBQuery = CPlayerShopSystemDBOper:new(objDB,self);
	if not self.objDBQuery then
		return false;
	end;
	self.objItemSys = objPlayer:GetSystem("CItemSystem");
	self.dwRoleID = objPlayer:GetRoleID();
	------------------------------------
	self.tabDataList = objPlayer:GetLineData("CPlayerShopSystem")
	------------------------------------
	self.DecodeFun = {}
	self.DecodeFun[PlayerShopConfig.KShowShopList] = function(objPlayer,ParamInfo) self:KFunShopList(objPlayer,ParamInfo) end
	self.DecodeFun[PlayerShopConfig.KShowShopListBegin] = function(objPlayer,ParamInfo) self:KFunShopListBegin(objPlayer,ParamInfo) end
	self.DecodeFun[PlayerShopConfig.KNoShop] = function(objPlayer,ParamInfo) self:KFunNoShop(objPlayer,ParamInfo) end
	self.DecodeFun[PlayerShopConfig.KGetShop] = function(objPlayer,ParamInfo) self:KFunGetShop(objPlayer,ParamInfo) end
	self.DecodeFun[PlayerShopConfig.KOpenShopSure] = function(objPlayer,ParamInfo) self:KFunOpenShopSure(objPlayer,ParamInfo) end
	self.DecodeFun[PlayerShopConfig.KSellPrice] = function(objPlayer,ParamInfo) self:KFunSellPrice(objPlayer,ParamInfo) end
	self.DecodeFun[PlayerShopConfig.KSellGold] = function(objPlayer,ParamInfo) self:KFunSellGold(objPlayer,ParamInfo) end
	self.DecodeFun[PlayerShopConfig.KSellItem] = function(objPlayer,ParamInfo) self:KFunSellItem(objPlayer,ParamInfo) end
	self.DecodeFun[PlayerShopConfig.KBuyPriceNoPrice] = function(objPlayer,ParamInfo) self:KFunBuyPriceNoPrice(objPlayer,ParamInfo) end
	self.DecodeFun[PlayerShopConfig.KBuyGoldNoGold] = function(objPlayer,ParamInfo) self:KFunBuyGoldNoGold(objPlayer,ParamInfo) end
	self.DecodeFun[PlayerShopConfig.KBuyNoItem] = function(objPlayer,ParamInfo) self:KFunNoItem(objPlayer,ParamInfo) end
	self.DecodeFun[PlayerShopConfig.KPlayerDown] = function(objPlayer,ParamInfo) self:KFunPlayerDown(objPlayer,ParamInfo) end
	self.DecodeFun[PlayerShopConfig.KBuyPriceSure] = function(objPlayer,ParamInfo) self:KFunBuyPriceSure(objPlayer,ParamInfo) end
	self.DecodeFun[PlayerShopConfig.KBuyGoldSure] = function(objPlayer,ParamInfo) self:KFunBuyGoldSure(objPlayer,ParamInfo) end
	self.DecodeFun[PlayerShopConfig.KBuyItemSure] = function(objPlayer,ParamInfo) self:KFunBuyItemSure(objPlayer,ParamInfo) end
	self.DecodeFun[PlayerShopConfig.KBuyItemCancel] = function(objPlayer,ParamInfo) self:KFunBuyItemCancel(objPlayer,ParamInfo) end
	self.DecodeFun[PlayerShopConfig.KBuyItemGetMoney] = function(objPlayer,ParamInfo) self:KFunBuyItemGetMoney(objPlayer,ParamInfo) end
	---------------------------------------------------------------------
	self.DecodeFun[PlayerShopConfig.AddPrice] = function(objPlayer,ParamInfo) self:FunAddPrice(objPlayer,ParamInfo) end
	self.DecodeFun[PlayerShopConfig.AddGold] = function(objPlayer,ParamInfo) self:FunAddGold(objPlayer,ParamInfo) end
	self.DecodeFun[PlayerShopConfig.AddItem] = function(objPlayer,ParamInfo) self:FunAddItem(objPlayer,ParamInfo) end
	self.DecodeFun[PlayerShopConfig.DownPrice] = function(objPlayer,ParamInfo) self:FunDownPrice(objPlayer,ParamInfo) end
	self.DecodeFun[PlayerShopConfig.DownGold] = function(objPlayer,ParamInfo) self:FunDownGold(objPlayer,ParamInfo) end
	self.DecodeFun[PlayerShopConfig.DownItem] = function(objPlayer,ParamInfo) self:FunDownItem(objPlayer,ParamInfo) end
	self.DecodeFun[PlayerShopConfig.OpenShop] = function(objPlayer,ParamInfo) self:FunOpenShop(objPlayer,ParamInfo) end
	self.DecodeFun[PlayerShopConfig.BuyItem] = function(objPlayer,ParamInfo) self:FunBuyItem(objPlayer,ParamInfo) end
	self.DecodeFun[PlayerShopConfig.BuyPrice] = function(objPlayer,ParamInfo) self:FunBuyPrice(objPlayer,ParamInfo) end
	self.DecodeFun[PlayerShopConfig.BuyGold] = function(objPlayer,ParamInfo) self:FunBuyGold(objPlayer,ParamInfo) end
	self.DecodeFun[PlayerShopConfig.Flush] = function(objPlayer,ParamInfo) self:FunFlush(objPlayer,ParamInfo) end
	self.DecodeFun[PlayerShopConfig.ShowShopList] = function(objPlayer,ParamInfo) self:FunShowShopList(objPlayer,ParamInfo) end
	self.DecodeFun[PlayerShopConfig.SearchMoney] = function(objPlayer,ParamInfo) self:FunSearchMoney(objPlayer,ParamInfo) end
	self.DecodeFun[PlayerShopConfig.SearchGold] = function(objPlayer,ParamInfo) self:FunSearchGold(objPlayer,ParamInfo) end
	self.DecodeFun[PlayerShopConfig.SearchItem] = function(objPlayer,ParamInfo) self:FunSearchItem(objPlayer,ParamInfo) end
	self.DecodeFun[PlayerShopConfig.ChangeName] = function(objPlayer,ParamInfo) self:FunChangeName(objPlayer,ParamInfo) end
	self.DecodeFun[PlayerShopConfig.Close] = function(objPlayer,ParamInfo) self:FunClose(objPlayer,ParamInfo) end

	return true
end
------------------------
--上架银两
function CPlayerShopSystem:FunAddPrice(objPlayer,ParamInfo)
	self:AddPrice(ParamInfo.dwItemNum,ParamInfo.dwGold)
end
--上架元宝
function CPlayerShopSystem:FunAddGold(objPlayer,ParamInfo)
	self:AddGold(ParamInfo.dwItemNum,ParamInfo.dwPrice)
end
--上架物品
function CPlayerShopSystem:FunAddItem(objPlayer,ParamInfo)
	self:AddItem(ParamInfo.dwItemID,ParamInfo.dwItemNum,ParamInfo.dwGold,ParamInfo.dwPrice)
end
--下架银两
function CPlayerShopSystem:FunDownPrice(objPlayer,ParamInfo)
	self:DelPrice()
end
--下架元宝
function CPlayerShopSystem:FunDownGold(objPlayer,ParamInfo)
	self:DelGold()
end
--下架物品
function CPlayerShopSystem:FunDownItem(objPlayer,ParamInfo)
	self:DelItem(ParamInfo.dwSerial,ParamInfo.dwItemID)
end
--打开目标玩家摊位
function CPlayerShopSystem:FunOpenShop(objPlayer,ParamInfo)
	local t = {dwRoleID = ParamInfo.dwRoleID}
	CKernelApp.KServPlayerShopSingleMsg{RoleID = self.dwRoleID,Type = PlayerShopConfig.KOpenShop,ParamInfo = t}
end
--购买摊位物品
function CPlayerShopSystem:FunBuyItem(objPlayer,ParamInfo)
	_info("CPlayerShopSystem:FunBuyItem===========1", self:GetPlayer():GetAccountID())
	local itemSys = objPlayer:GetSystem('CItemSystem')
	if not itemSys:IsPacketMoneyEnough(ParamInfo.objItem.dwPrice) then
		objPlayer.CltPlayerShopMsg{Type = PlayerShopConfig.NoMoney}
		return 'NoMoney'
	end
	if not itemSys:IsGoldEnough(ParamInfo.objItem.dwGold) then
		objPlayer.CltPlayerShopMsg{Type = PlayerShopConfig.NoGold}
		return 'NoGold'
	end
	itemSys:LockPacketMoney(ParamInfo.objItem.dwPrice)
	itemSys:LockGold(ParamInfo.objItem.dwGold)
	CKernelApp.KServPlayerShopSingleMsg{RoleID = self.dwRoleID,Type = PlayerShopConfig.KBuyItem,ParamInfo = ParamInfo}
	_info("CPlayerShopSystem:FunBuyItem===========2", self:GetPlayer():GetAccountID())
end
--购买摊位银两
function CPlayerShopSystem:FunBuyPrice(objPlayer,ParamInfo)
	local itemSys = objPlayer:GetSystem('CItemSystem')
	if not itemSys:IsGoldEnough(ParamInfo.objItem[2]) then
		objPlayer.CltPlayerShopMsg{Type = PlayerShopConfig.NoGold}
		return 'NoGold'
	end
	itemSys:LockGold(ParamInfo.objItem[2])
	CKernelApp.KServPlayerShopSingleMsg{RoleID = self.dwRoleID,Type = PlayerShopConfig.KBuyPrice,ParamInfo = ParamInfo}
end
--购买摊位元宝
function CPlayerShopSystem:FunBuyGold(objPlayer,ParamInfo)
	local itemSys = objPlayer:GetSystem('CItemSystem')
	if not itemSys:IsPacketMoneyEnough(ParamInfo.objItem[2]) then
		objPlayer.CltPlayerShopMsg{Type = PlayerShopConfig.NoMoney}
		return 'NoMoney'
	end
	itemSys:LockPacketMoney(ParamInfo.objItem[2])
	CKernelApp.KServPlayerShopSingleMsg{RoleID = self.dwRoleID,Type = PlayerShopConfig.KBuyGold,ParamInfo = ParamInfo}
end
--刷新商店列表
function CPlayerShopSystem:FunFlush(objPlayer,ParamInfo)
	local shopNum = 0
	if CPlayerShopManager.ShopSet then
		shopNum = #CPlayerShopManager.ShopSet
	end
	local t2 = {[1] = shopNum}
	objPlayer.CltPlayerShopMsg{Type = PlayerShopConfig.FlushTotalNum,ParamInfo = t2}
	local t = CPlayerShopManager:GetShopByPageEnum(1)
	objPlayer.CltPlayerShopMsg{Type = PlayerShopConfig.ShowShopListSure,ParamInfo = t}
	self.szSearchItemName = ''
end
--获取商店列表
function CPlayerShopSystem:FunShowShopList(objPlayer,ParamInfo)
	if self.szSearchItemName == '' then
		local t = CPlayerShopManager:GetShopByPageEnum(ParamInfo[1])
		objPlayer.CltPlayerShopMsg{Type = PlayerShopConfig.ShowShopListSure,ParamInfo = t}
	else
		local t = self:GetSearchShopByPageEnum(ParamInfo[1])
		objPlayer.CltPlayerShopMsg{Type = PlayerShopConfig.ShowShopListSure,ParamInfo = t}
	end
end
--搜索银两物品
function CPlayerShopSystem:FunSearchMoney(objPlayer,ParamInfo)
	local t = {}
	self:SearchShopByMoney()
	t = self:GetSearchShopByPageEnum(1)
	local t2 = {[1] = #self.setSearchShop}
	objPlayer.CltPlayerShopMsg{Type = PlayerShopConfig.FlushTotalNum,ParamInfo = t2}
	objPlayer.CltPlayerShopMsg{Type = PlayerShopConfig.SearchMoneySure,ParamInfo = t}
end
--搜索元宝
function CPlayerShopSystem:FunSearchGold(objPlayer,ParamInfo)
	local t = {}
	self:SearchShopByGold()
	t = self:GetSearchShopByPageEnum(1)
	local t2 = {[1] = #self.setSearchShop}
	objPlayer.CltPlayerShopMsg{Type = PlayerShopConfig.FlushTotalNum,ParamInfo = t2}
	objPlayer.CltPlayerShopMsg{Type = PlayerShopConfig.SearchGoldSure,ParamInfo = t}
end
--搜索物品
function CPlayerShopSystem:FunSearchItem(objPlayer,ParamInfo)
	local t = {}
	if ParamInfo.nType == 0 then
		self:SearchShopByItem(ParamInfo.szItemName)
	elseif ParamInfo.nType == 1 then
		self:SearchShopByPlayer(ParamInfo.szItemName)
	end
	t[1] = self:GetSearchShopByPageEnum(1)
	t[2] = ParamInfo.nType
	local t2 = {[1] = #self.setSearchShop}
	objPlayer.CltPlayerShopMsg{Type = PlayerShopConfig.FlushTotalNum,ParamInfo = t2}
	objPlayer.CltPlayerShopMsg{Type = PlayerShopConfig.SearchItemSure,ParamInfo = t}
end
--改变商店名字
function CPlayerShopSystem:FunChangeName(objPlayer,ParamInfo)
	self:ChangeShopName(ParamInfo.szShopName)
end
--关闭商店列表 清除数据结构
function CPlayerShopSystem:FunClose(objPlayer,ParamInfo)
	self.setShop = nil
	self.setSearchShop = nil
	self.szSearchItemName = ''
end
----------------------
function CPlayerShopSystem:DecodeShopMsg(Type,ParamInfo)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("CPlayerShopSystem:DecodeShopMsg no player Type::",Type)
		return false;
	end;
--	print('Type =',Type)
	if self.DecodeFun[Type] then
		self.DecodeFun[Type](objPlayer,ParamInfo)
	end
end
function CPlayerShopSystem:KFunNoShop(objPlayer,ParamInfo)
	local t = {}
	objPlayer.CltPlayerShopMsg{Type = PlayerShopConfig.NoShop,ParamInfo = t}
end
function CPlayerShopSystem:KFunGetShop(objPlayer,ParamInfo)
	self:GetMyShop(ParamInfo)
end
function CPlayerShopSystem:KFunOpenShopSure(objPlayer,ParamInfo)
	objPlayer.CltPlayerShopMsg{Type = PlayerShopConfig.OpenShopSure,ParamInfo = ParamInfo}
	objPlayer:GetSystem('CPlayerEventCenterSystem'):DoEvent(enumPlayerEventType.EventShowShop)
end
function CPlayerShopSystem:KFunSellPrice(objPlayer,ParamInfo)
	self:SellPrice(ParamInfo.dwRoleID,ParamInfo)
end
function CPlayerShopSystem:KFunSellGold(objPlayer,ParamInfo)
	self:SellGold(ParamInfo.dwRoleID,ParamInfo)
end
function CPlayerShopSystem:KFunSellItem(objPlayer,ParamInfo)
	self:SellItem(ParamInfo.dwRoleID,ParamInfo)
end
function CPlayerShopSystem:KFunBuyPriceNoPrice(objPlayer,ParamInfo)
	self:unlockPacket(objPlayer,ParamInfo)
	objPlayer.CltPlayerShopMsg{Type = PlayerShopConfig.BuyPriceNoPrice,ParamInfo = ParamInfo}
	CKernelApp.KServPlayerShopSingleMsg{RoleID = self.dwRoleID,Type = PlayerShopConfig.KOpenShop,ParamInfo = ParamInfo}
end
function CPlayerShopSystem:KFunBuyGoldNoGold(objPlayer,ParamInfo)
	self:unlockPacket(objPlayer,ParamInfo)
	objPlayer.CltPlayerShopMsg{Type = PlayerShopConfig.BuyGoldNoGold,ParamInfo = ParamInfo}
	CKernelApp.KServPlayerShopSingleMsg{RoleID = self.dwRoleID,Type = PlayerShopConfig.KOpenShop,ParamInfo = ParamInfo}
end
function CPlayerShopSystem:KFunNoItem(objPlayer,ParamInfo)
	self:unlockPacket(objPlayer,ParamInfo)
	objPlayer.CltPlayerShopMsg{Type = PlayerShopConfig.BuyNoItem,ParamInfo = ParamInfo}
	CKernelApp.KServPlayerShopSingleMsg{RoleID = self.dwRoleID,Type = PlayerShopConfig.KOpenShop,ParamInfo = ParamInfo}
end
function CPlayerShopSystem:KFunPlayerDown(objPlayer,ParamInfo)
	local t = {}
	self:unlockPacket(objPlayer,ParamInfo)
	objPlayer.CltPlayerShopMsg{Type = PlayerShopConfig.PlayerDown,ParamInfo = t}
end

function CPlayerShopSystem:unlockPacket(objPlayer,ParamInfo)
	local objItemSys = objPlayer:GetSystem('CItemSystem')
	if ParamInfo.objItem then
		if ParamInfo.objItem.dwPrice then
			objItemSys:UnlockPacketMoney(ParamInfo.objItem.dwPrice)
		end
		if ParamInfo.objItem.dwGold then
			objItemSys:UnlockGold(ParamInfo.objItem.dwGold)
		end
		if ParamInfo.objItem[2]  then
			objItemSys:UnlockGold(ParamInfo.objItem[2])
			objItemSys:UnlockPacketMoney(ParamInfo.objItem[2])
		end
	end
end
function CPlayerShopSystem:KFunBuyPriceSure(objPlayer,ParamInfo)
	self:BuyPriceSure(ParamInfo)
end
function CPlayerShopSystem:KFunBuyGoldSure(objPlayer,ParamInfo)
	self:BuyGoldSure(ParamInfo)
end

--买家不在线交易取消
function CPlayerShopSystem:KFunBuyItemCancel(objPlayer,ParamInfo)
	--买方不在线 物品返还给卖方
	local objItemSys = objPlayer:GetSystem('CItemSystem')
	local newItem = CItem:New(ParamInfo.objItem.dwItemEnum)
	newItem:FillByItemMessage(ParamInfo.objItem)
	local ItemList = {newItem}
	local Info = ParamInfo.Info
	
	if objItemSys:IsObjItemListCanAddToPacket(ItemList) then
		objItemSys:AddObjItemListToPacket(ItemList, _G.ItemSysOperType.PlayerShop)
	else
		local mail = CMail:new();
		mail:SetSender( -10086, "系统");
		mail:SetReceiver( objPlayer:GetRoleID(), objPlayer:GetInfo().szRoleName);
		mail:SetContent( SysStringConfigInfo[6001250003],SysStringConfigInfo[6001250008]);
		mail:SetLifeTime( 10*24*3600*1000 );
		mail:SetAccessory( 0, 0, 0, {ParamInfo.objItem} );
		CMailManager:SendMail( mail );
		--objPlayer.CltPlayerShopMsg{Type = PlayerShopConfig.BuyItemSureByMail,ParamInfo = Info}
	end
end

function CPlayerShopSystem:KFunBuyItemSure(objPlayer,ParamInfo)
	_info("CPlayerShopSystem:KFunBuyItemSure=========", ParamInfo.objShopItem.dwGold, self:GetPlayer():GetAccountID())
	--购买方获得物品
	local objItemSys = objPlayer:GetSystem('CItemSystem')
	local newItem = CItem:New(ParamInfo.objItem.dwItemEnum)
	newItem:FillByItemMessage(ParamInfo.objItem)
	local ItemList = {newItem}
	local Info = ParamInfo.Info
	objItemSys:UnlockPacketMoney(ParamInfo.objShopItem.dwPrice);
	if ParamInfo.objShopItem.dwPrice ~= 0 then
		objItemSys:CostPacketMoney(ParamInfo.objShopItem.dwPrice, _G.ItemSysOperType.PlayerShop)
	end;
	objItemSys:UnlockGold(ParamInfo.objShopItem.dwGold)
	if ParamInfo.objShopItem.dwGold ~= 0 then
		objItemSys:CostGold(ParamInfo.objShopItem.dwGold, _G.ItemSysOperType.PlayerShop)
	end;
	CLogSystemManager:deal( objPlayer, 2, ParamInfo.objShopItem.dwPrice,ParamInfo.objShopItem.dwGold, {}, '',
	nil, 0,0, ItemList, '', ParamInfo.dwRoleID )
	if objItemSys:IsObjItemListCanAddToPacket(ItemList) then
		objItemSys:AddObjItemListToPacket(ItemList, _G.ItemSysOperType.PlayerShop)
	else
		local mail = CMail:new();
		mail:SetSender( -10086, SysStringConfigInfo[6001250002] );
		mail:SetReceiver( objPlayer:GetRoleID(), objPlayer:GetInfo().szRoleName);
		mail:SetContent( SysStringConfigInfo[6001250005],SysStringConfigInfo[6001250006]);
		mail:SetLifeTime( 10*24*3600*1000 );
		mail:SetAccessory( 0, 0, 0, {ParamInfo.objItem} );
		CMailManager:SendMail( mail );
		objPlayer.CltPlayerShopMsg{Type = PlayerShopConfig.BuyItemSureByMail,ParamInfo = Info}
	end
	objPlayer.CltPlayerShopMsg{Type = PlayerShopConfig.BuyItemSure,ParamInfo = Info}
	local t = {dwRoleID = ParamInfo.dwRoleID, setMoney = ParamInfo.objShopItem}
	CKernelApp.KServPlayerShopSingleMsg{RoleID = self.dwRoleID,Type = PlayerShopConfig.KOpenShop,ParamInfo = t}
	objPlayer:GetSystem('CPlayerEventCenterSystem'):DoEvent(enumPlayerEventType.EventPlayerShopBuy)
end

--卖方得钱
function CPlayerShopSystem:KFunBuyItemGetMoney(objPlayer,Param)
	if not Param.setMoney then
		return
	end
	
	local objItemSys = objPlayer:GetSystem("CItemSystem")
	
	if Param.setMoney.dwPrice ~= 0 then
		self:AddPacketMoney(Param.setMoney.dwPrice);
	end;
	if Param.setMoney.dwGold ~= 0 then
		if objItemSys:IsCanAddGold(Param.setMoney.dwGold) then
			objItemSys:AddGold(Param.setMoney.dwGold, _G.ItemSysOperType.PlayerShop);
			_info("CPlayerShopSystem:SellItem====== addgold", Param.setMoney.dwGold, self:GetPlayer():GetAccountID())
		else
			local mail = CMail:new();
			mail:SetSender( -10086, SysStringConfigInfo[6001250002] );
			mail:SetReceiver( objPlayer:GetRoleID(), objPlayer:GetName());
			mail:SetContent( SysStringConfigInfo[6001250005], SysStringConfigInfo[6001250007] );
			mail:SetLifeTime( 10*24*3600*1000 );
			mail:SetAccessory(Param.setMoney.dwGold);
			CMailManager:SendMail( mail );
		end
	end;
end

function CPlayerShopSystem:AddPacketMoney(nNumber)
	_assert(nNumber >= 0);
    local objPlayer = self:GetPlayer();
	local objItemSys = objPlayer:GetSystem("CItemSystem")
	if objItemSys:IsCanAddPacketMoney(nNumber) then
		objItemSys:AddPacketMoney(nNumber, _G.ItemSysOperType.PlayerShop);
	else
        objPlayer.OnErrorMsg{ Error=6000610012 };

		local mail = CMail:new();
		mail:SetSender( -10086, SysStringConfigInfo[6001250002] );
		mail:SetReceiver( objPlayer:GetRoleID(), objPlayer:GetName() );
		mail:SetContent( SysStringConfigInfo[6001250005], SysStringConfigInfo[6001250004] );
		mail:SetLifeTime( 10*24*3600*1000 );
		mail:SetAccessory( 0, 0, nNumber );
		CMailManager:SendMail( mail );
	end
end

---------------------
function CPlayerShopSystem:DecodeShopMsgKS(Type,ParamInfo)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	if self.DecodeFun[Type] then
		self.DecodeFun[Type](objPlayer,ParamInfo)
	end
end

function CPlayerShopSystem:AddSys(objSystem)
	self.setSystem[objSystem.szName] = objSystem
end
function CPlayerShopSystem:ChangeState(bState)
	for k,System in pairs (self.setSystem) do
		System:OnPlayerShopChange(bState)
	end
end

function CPlayerShopSystem:Destroy()
	CPlayerShopManager:DelShop(self.dwRoleID)
	return true
end
function CPlayerShopSystem:Init()
	local setItems = self.objItemSys:GetAllItem_HolderA_SlotB_SlotC(_G.enItemPosition.eBooth, 1, 10);
	local errT = {};
	for _, itemInst in ipairs(setItems) do
		errT[itemInst:GetInstID()] = true;
	end;
	local tabDataList = self.tabDataList
	if tabDataList and tabDataList[1] then
		if tabDataList[1].szShopName and tabDataList[1].szShopName ~= "" then
			self.szShopName = tabDataList[1].szShopName;
		end;
		for k,v in ipairs (tabDataList[1]) do
			if tabDataList[1][k][1] then
				if self.objItemSys:GetItem(tabDataList[1][k][1]) then
					errT[tabDataList[1][k][1]] = nil;
					self:AddItem(tabDataList[1][k][1],nil,tabDataList[1][k][2],tabDataList[1][k][3],self.szShopName ,true);
				else
					if tabDataList[1][k][1] == PlayerShopDataConfig.dwPriceID then
						self:AddPrice(tabDataList[1][k][3],tabDataList[1][k][2],self.szShopName,true);
					elseif tabDataList[1][k][1] == PlayerShopDataConfig.dwGoldID then
						self:AddGold(tabDataList[1][k][2],tabDataList[1][k][3],self.szShopName,true);
					end
				end
			end
		end
	end
	for k, _ in pairs(errT) do
		self:AddItem(k,nil,99999999,99999999,self.szShopName ,true, true);
	end;
end

function CPlayerShopSystem:OnEnterScene()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	self.szRoleName = objPlayer:GetInfo().szRoleName;
	self.szShopName = PlayerShopDataConfig.DefaultShopName;
	------------------------
	self:Init() -- 初始化自己数据库里的物品，执行增加商店和上架操作。
	--------------------------
	self.dwPlayerLv = objPlayer:GetInfo().dwLevel;
	local Info = {szShopName = self.szShopName}
	objPlayer.CltPlayerShopMsg{Type = PlayerShopConfig.ShopName,ParamInfo = Info}
end
function CPlayerShopSystem:OnChangeLineBegin(dwNewLineID)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local t = {}
	local n = 1
	for k,v in pairs (self.setItemList) do
		t[n] = {}
		t[n][1] = v.dwItemID
		t[n][2] = v.dwGold
		t[n][3] = v.dwPrice
		n = n+1
	end
	if self.tabPrice then
		t[n] = {}
		t[n][1] = PlayerShopDataConfig.dwPriceID
		t[n][2] = self.tabPrice[2]
		t[n][3] = self.tabPrice[1]
		n = n+1
	end
	if self.tabGold then
		t[n] = {}
		t[n][1] = PlayerShopDataConfig.dwGoldID
		t[n][2] = self.tabGold[1]
		t[n][3] = self.tabGold[2]
		n = n+1
	end
	t.szShopName = self.szShopName
	objPlayer:SetLineData("CPlayerShopSystem",t);
	self.setItemList = {}; 	--摆摊物品列表
	self.szRoleName = ''		--玩家名字
	self.szShopName = ''		--商店名字
	self.dwItemNum = 0		--物品数量
	self.dwSerial = 0 		--自增物品序列号，防物品变化
	self.szSearchItemName = '' --当前搜索的物品名称
	CPlayerShopManager:DelShop(self.dwRoleID)
	local Info = {}
	objPlayer.CltPlayerShopMsg{Type = PlayerShopConfig.ChangeLine,ParamInfo = Info}
end
function CPlayerShopSystem:OnChangeLineEnd()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	self.tabDataList = objPlayer:GetLineData("CPlayerShopSystem")
	local tabDataList = self.tabDataList
	if tabDataList and tabDataList[1] then
		self.szShopName = tabDataList[1].szShopName;
		for k,v in ipairs (tabDataList[1]) do
			if tabDataList[1][k][1] then
				if self.objItemSys:GetItem(tabDataList[1][k][1]) then
					self:AddItem(tabDataList[1][k][1],nil,tabDataList[1][k][2],tabDataList[1][k][3],self.szShopName ,true);
				else
					if tabDataList[1][k][1] == PlayerShopDataConfig.dwPriceID then
						self:AddPrice(tabDataList[1][k][3],tabDataList[1][k][2],self.szShopName ,true);
					elseif tabDataList[1][k][1] == PlayerShopDataConfig.dwGoldID then
						self:AddGold(tabDataList[1][k][2],tabDataList[1][k][3],self.szShopName ,true);
					end
				end
			end
		end
	end
	self.dwPlayerLv = objPlayer:GetInfo().dwLevel;
	local Info = {szShopName = self.szShopName}
	objPlayer.CltPlayerShopMsg{Type = PlayerShopConfig.ShopName,ParamInfo = Info}
end

function CPlayerShopSystem:EnterGame()
end
-----------------------------------------------------------------
----函数名称：CPlayerShop:AddItemInfo(dwItemObjID,dwGold,dwPrice)
----函数功能：添加一个物品到玩家商店
----函数参数：dwItemID：物品objID，dwGold：元宝价格，dwPrice：价格
-----------------------------------------------------------------
function CPlayerShopSystem:AddItemInfo(dwItemID,dwSerial,dwGold,dwPrice,szShopName)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local iteminfo = {};--分配
	iteminfo.dwItemID = dwItemID;
	iteminfo.dwSerial = dwSerial;
	iteminfo.dwGold = dwGold;
	iteminfo.dwPrice = dwPrice;
	local szItemName = self.objItemSys:GetItem(dwItemID):GetName();
	iteminfo.szItemName = szItemName;
	if self.szShopName ~= '' then
		iteminfo.szShopName =self.szShopName;
	else
		iteminfo.szShopName = PlayerShopDataConfig.DefaultShopName;
		self.szShopName = iteminfo.szShopName
	end
	self.setItemList[dwSerial] = iteminfo;
	objPlayer:GetSystem('CPlayerEventCenterSystem'):DoEvent(enumPlayerEventType.EventAddShop)
end
---------
---public
---------
----函数功能：上架银两
function CPlayerShopSystem:AddPrice(dwItemNum,dwGold,szShopName,nFlag)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	if self.tabPrice then
		local t = {}
		objPlayer.CltPlayerShopMsg{Type = PlayerShopConfig.UnLock,ParamInfo = t}
		return
	end
	local objItemSys = objPlayer:GetSystem('CItemSystem')
	if nFlag or objItemSys:IsPacketMoneyEnough(dwItemNum) then
		self.tabPrice = {dwItemNum,dwGold}
		local Info = self.tabPrice
		if not nFlag then
			objItemSys:CostPacketMoney(dwItemNum, _G.ItemSysOperType.PlayerShop)
			self.objDBQuery:AddItemInfo(PlayerShopDataConfig.dwPriceID,dwGold,dwItemNum,szShopName)
		end
		if self.dwItemNum == 0 then
			CPlayerShopManager:AddShop(self.dwRoleID,objPlayer,0)
		end
		objPlayer.CltPlayerShopMsg{Type = PlayerShopConfig.AddPriceSure,ParamInfo = Info}
		local t = {dwItemNum = dwItemNum,dwGold = dwGold}
		CKernelApp.KServPlayerShopSingleMsg{RoleID = self.dwRoleID,Type = PlayerShopConfig.KAddPrice,ParamInfo = t}
	else
	--	_info('no enough money')
	end
end
----函数功能：上架元宝
function CPlayerShopSystem:AddGold(dwItemNum,dwPrice,szShopName,nFlag)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	if self.tabGold then 
		local t = {}
		objPlayer.CltPlayerShopMsg{Type = PlayerShopConfig.UnLock,ParamInfo = t}
		return 
	end

	local objItemSys = objPlayer:GetSystem('CItemSystem')
	if nFlag or objItemSys:IsGoldEnough(dwItemNum) then
		self.tabGold = {dwItemNum,dwPrice}
		local Info = self.tabGold
		if not nFlag then
			objItemSys:CostGold(dwItemNum, _G.ItemSysOperType.PlayerShop)
			self.objDBQuery:AddItemInfo(PlayerShopDataConfig.dwGoldID,dwItemNum,dwPrice,szShopName)
		end
		if self.dwItemNum == 0 then
			CPlayerShopManager:AddShop(self.dwRoleID,objPlayer,0)
		end
		objPlayer.CltPlayerShopMsg{Type = PlayerShopConfig.AddGoldSure,ParamInfo = Info}
		local t = {dwItemNum = dwItemNum,dwGold = dwGold}
		CKernelApp.KServPlayerShopSingleMsg{RoleID = self.dwRoleID,Type = PlayerShopConfig.KAddGold,ParamInfo = t}
	else
	--	_info('no enough gold')
	end
end
----函数功能：上架一个物品到玩家商店
function CPlayerShopSystem:AddItem(dwItemID,dwItemNum,dwGold,dwPrice,szShopName,nFlag, bErr)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	if self.dwItemNum == PlayerShopDataConfig.ItemNum then
		objPlayer.CltPlayerShopMsg{Type = PlayerShopConfig.ShopFull}
		return false
	end
	local objItemSys = objPlayer:GetSystem('CItemSystem')
	local objItem = objItemSys:GetItem(dwItemID)
	----检查是否是锁定物品
	if objItemSys:IsItemLocked(dwItemID) and (not nFlag) then
		objPlayer.CltPlayerShopMsg{Type = PlayerShopConfig.AddLockItem,ParamInfo = {}}
		return;
	end
	for k,v in pairs (self.setItemList) do
		if v.dwItemID == dwItemID then
		--	_info('this item is on sell already')
			objPlayer.CltPlayerShopMsg{Type = PlayerShopConfig.InSell}
			return
		end
	end
	if objItem then
		if objItem:IsBind() or (not objItem:IsCanSell()) then
		--	_info('bind or not for sell')
			objPlayer.CltPlayerShopMsg{Type = PlayerShopConfig.NotForSell}
			return
		end
		if not nFlag then
			dwItemID = objItemSys:SplitItemToBooth(objItem:GetInstID(), dwItemNum);
			if not dwItemID then
				objPlayer.CltPlayerShopMsg{Type = PlayerShopConfig.NotForSell}
				_info('PlayerShop AddItem Failed')
				return;
			end
			self.objDBQuery:AddItemInfo(dwItemID,dwGold,dwPrice,szShopName)
		end
		--容错
		if bErr then
			self.objDBQuery:AddItemInfo(dwItemID,dwGold,dwPrice,szShopName)
		end;
		self.dwSerial = self.dwSerial + 1;
		self:AddItemInfo(dwItemID,self.dwSerial,dwGold,dwPrice,szShopName);
		self.dwItemNum = self.dwItemNum + 1;
		--锁定物品
		objItemSys:LockItem(dwItemID);
		local Info  =
		{
			dwSerial = self.dwSerial,
			dwItemID = dwItemID,
			dwGold = dwGold,
			dwPrice = dwPrice,
		};
		if self.dwItemNum == 1 then
			CPlayerShopManager:AddShop(self.dwRoleID,objPlayer)
		end
		objPlayer.CltPlayerShopMsg{Type = PlayerShopConfig.AddItemSure,ParamInfo = Info}
		local t = {dwItemID = dwItemID,szItemName = objItem:GetName()}
		CKernelApp.KServPlayerShopSingleMsg{RoleID = self.dwRoleID,Type = PlayerShopConfig.KAddItem,ParamInfo = t}
	else
		--上架失败，不存在物品
		objPlayer.CltPlayerShopMsg{Type = PlayerShopConfig.AddNoItem,ParamInfo = Info}
	end
end
--下架银两
function CPlayerShopSystem:DelPrice()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local objItemSys = objPlayer:GetSystem('CItemSystem')
	if not self.tabPrice then return end
	if self.dwItemNum == 0 then
		CPlayerShopManager:DelShop(self.dwRoleID)
	end
	local Info = {}
	CKernelApp.KServPlayerShopSingleMsg{RoleID = self.dwRoleID,Type = PlayerShopConfig.KDelPrice,ParamInfo = Info}
	self.objDBQuery:DelItemInfo(PlayerShopDataConfig.dwPriceID)
	objPlayer.CltPlayerShopMsg{Type = PlayerShopConfig.DownPriceSure,ParamInfo = Info}
	self:AddPacketMoney(self.tabPrice[1])
	self.tabPrice = nil
end
function CPlayerShopSystem:DelGold()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local objItemSys = objPlayer:GetSystem('CItemSystem')
	if not self.tabGold then return end
	if self.dwItemNum == 0 then
		CPlayerShopManager:DelShop(self.dwRoleID)
	end
	local Info = {}
	CKernelApp.KServPlayerShopSingleMsg{RoleID = self.dwRoleID,Type = PlayerShopConfig.KDelGold,ParamInfo = Info}
	self.objDBQuery:DelItemInfo(PlayerShopDataConfig.dwGoldID)
	objPlayer.CltPlayerShopMsg{Type = PlayerShopConfig.DownGoldSure,ParamInfo = Info}
	objItemSys:AddGold(self.tabGold[1], _G.ItemSysOperType.PlayerShop);
	self.tabGold = nil
end
----函数功能：下架一个物品
function CPlayerShopSystem:DelItem(dwSerial,dwItemID)
	---
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local objItemSys = objPlayer:GetSystem('CItemSystem')
	if not self.setItemList[dwSerial] then
		objPlayer.CltPlayerShopMsg{Type = PlayerShopConfig.DownNoItem}
		return false
	end
	if self.setItemList[dwSerial].dwItemID ~= dwItemID then
		--物品位置和物品ID不匹配
		objPlayer.CltPlayerShopMsg{Type = PlayerShopConfig.DownNoItem}
		return false
	end
	local Info =
	{
		dwSerial  = dwSerial,
		dwItemID = self.setItemList[dwSerial].dwItemID,
	}
	local objItem = objItemSys:GetItem(self.setItemList[dwSerial].dwItemID)
	--下架的物品不存在
	if not objItem then
		objPlayer.CltPlayerShopMsg{Type = PlayerShopConfig.DownNoItem}
		return false
	end
	local ItemList =
	{
		objItem
	}
	--背包已满了
	if not objItemSys:IsPacketSlotEnoughFor(1) then
		objPlayer.CltPlayerShopMsg{Type = PlayerShopConfig.DownNoPack,ParamInfo = Info}
		return false
	end


	--下架成功
	local tempdwItemID = self.setItemList[dwSerial].dwItemID
	self.setItemList[dwSerial] = nil
	self.dwItemNum = self.dwItemNum - 1;
	if self.dwItemNum == 0 and self.tabPrice == nil and self.tabGold == nil then
		CPlayerShopManager:DelShop(self.dwRoleID)
	end
	local t = {dwItemID = tempdwItemID}
	CKernelApp.KServPlayerShopSingleMsg{RoleID = self.dwRoleID,Type = PlayerShopConfig.KDelItem,ParamInfo = t}
	self.objDBQuery:DelItemInfo(tempdwItemID)
	objPlayer.CltPlayerShopMsg{Type = PlayerShopConfig.DownItemSure,ParamInfo = Info}
	objItemSys:UnlockItem(objItem:GetInstID());
	objItemSys:MoveItemToPacket(objItem:GetInstID())
end

function CPlayerShopSystem:SellPrice(dwRoleID,Param)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	if not self.tabPrice then
		local t = {dwRoleID = self.dwRoleID}
		CKernelApp.KServPlayerShopSingleMsg{RoleID = dwRoleID,Type = PlayerShopConfig.KBuyPriceNoPrice,ParamInfo = Param}
		return 'BuyNoPrice'
	end
	
	if Param.objItem[2] ~= self.tabPrice[2] then
		CKernelApp.KServPlayerShopSingleMsg{RoleID = dwRoleID,Type = PlayerShopConfig.KBuyPriceNoPrice,ParamInfo = Param}
		return ;
	end
	
	local objItemSys = objPlayer:GetSystem('CItemSystem')
	objItemSys:AddGold(Param.objItem[2], _G.ItemSysOperType.PlayerShop);

	local Info =
	{
		dwTime = GetCurTime(1),
		szRoleName = Param.szRoleName,
		dwSerial = Param.dwSerial,
		szItemName = CGlobalItemManager:GetName(PlayerShopDataConfig.dwPriceID),
		dwItemNum = Param.objItem[1],
		dwSellNum = Param.objItem[2],
	}
	--从摊位中删除
	local t2 = {}
	t2.tabPrice = {}
	t2.tabPrice[1] = self.tabPrice[1]
	t2.tabPrice[2] = self.tabPrice[2]
	t2.Info = Info
	t2.dwRoleID = self.dwRoleID
	self.tabPrice = nil
	local t = {}
	CKernelApp.KServPlayerShopSingleMsg{RoleID = self.dwRoleID,Type = PlayerShopConfig.KDelPrice,ParamInfo = t}
	if self.dwItemNum == 0 and self.tabPrice == nil and self.tabGold == nil then
		CPlayerShopManager:DelShop(self.dwRoleID)
	end
	objPlayer.CltPlayerShopMsg{Type = PlayerShopConfig.SellPrice,ParamInfo = Info}
	self.objDBQuery:DelItemInfo(PlayerShopDataConfig.dwPriceID)

	CKernelApp.KServPlayerShopSingleMsg{RoleID = dwRoleID,Type = PlayerShopConfig.KBuyPriceSure,ParamInfo = t2}
end
function CPlayerShopSystem:SellGold(dwRoleID,Param)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	if not self.tabGold then
		CKernelApp.KServPlayerShopSingleMsg{RoleID = dwRoleID,Type = PlayerShopConfig.KBuyGoldNoGold,ParamInfo = Param}
		return 'BuyNoGold'
	end
	
	if Param.objItem[2] ~= self.tabGold[2] then
		return ;
	end
	
	local objItemSys = objPlayer:GetSystem('CItemSystem')
	self:AddPacketMoney(Param.objItem[2]);


	local Info =
	{
		dwTime = GetCurTime(1),
		szRoleName = Param.szRoleName,
		dwSerial = Param.dwSerial,
		szItemName = CGlobalItemManager:GetName(PlayerShopDataConfig.dwGoldID),
		dwItemNum = Param.objItem[1],
		dwSellNum = Param.objItem[2],
	}
	--从摊位中删除
	local t2 = {}
	t2.tabGold = {}
	t2.tabGold[1] = self.tabGold[1]
	t2.tabGold[2] = self.tabGold[2]
	t2.Info = Info
	t2.dwRoleID = self.dwRoleID
	self.tabGold = nil
	local t = {}
	CKernelApp.KServPlayerShopSingleMsg{RoleID = self.dwRoleID,Type = PlayerShopConfig.KDelGold,ParamInfo = t}
	if self.dwItemNum == 0 and self.tabPrice == nil and self.tabGold == nil then
		CPlayerShopManager:DelShop(self.dwRoleID)
	end
	objPlayer.CltPlayerShopMsg{Type = PlayerShopConfig.SellGold,ParamInfo = Info}
	self.objDBQuery:DelItemInfo(PlayerShopDataConfig.dwGoldID)

	CKernelApp.KServPlayerShopSingleMsg{RoleID = dwRoleID,Type = PlayerShopConfig.KBuyGoldSure,ParamInfo = t2}
end
function CPlayerShopSystem:SellItem(dwRoleID,Param)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	
	local tbItem = self.setItemList[Param.dwSerial];
	
	if not tbItem then
		CKernelApp.KServPlayerShopSingleMsg{RoleID = dwRoleID,Type = PlayerShopConfig.KBuyNoItem,ParamInfo = Param}
		return 'BuyNoItem'
	end
	if tbItem.dwItemID ~= Param.dwItemID then
		CKernelApp.KServPlayerShopSingleMsg{RoleID = dwRoleID,Type = PlayerShopConfig.KBuyNoItem,ParamInfo = Param}
		return 'BuyNoItem'
	end
	
	if tbItem.dwGold ~= Param.objItem.dwGold then
		return 'BuyGoldError';
	end
	if tbItem.dwPrice ~= Param.objItem.dwPrice then
		return 'BuyPriceError';
	end
	
	local objItemSys = objPlayer:GetSystem('CItemSystem')
	
	local Info =
	{
		dwTime = GetCurTime(1),
		szRoleName = Param.szRoleName,
		dwSerial = Param.dwSerial,
		szItemName = objItemSys:GetItem(self.setItemList[Param.dwSerial].dwItemID):GetName(),
		dwItemNum = objItemSys:GetItem(self.setItemList[Param.dwSerial].dwItemID):GetCount(),
	}

	local objItem = objItemSys:GetItem(self.setItemList[Param.dwSerial].dwItemID)
	--出售方删除物品
	objItemSys:UnlockItem(self.setItemList[Param.dwSerial].dwItemID);
	local isDelSucc = objItemSys:DelObjItem(self.setItemList[Param.dwSerial].dwItemID, _G.ItemSysOperType.PlayerShop);
	--删除失败就不执行
	if not isDelSucc then
		return;
	end

	--从摊位中删除
	local tempdwItemID = self.setItemList[Param.dwSerial].dwItemID
	self.setItemList[Param.dwSerial] = nil
	local t = {dwItemID = tempdwItemID}
	CKernelApp.KServPlayerShopSingleMsg{RoleID = self.dwRoleID,Type = PlayerShopConfig.KDelItem,ParamInfo = t}
	self.dwItemNum = self.dwItemNum - 1;
	if self.dwItemNum == 0 and self.tabPrice == nil and self.tabGold == nil then
		CPlayerShopManager:DelShop(self.dwRoleID)
	end
	objPlayer.CltPlayerShopMsg{Type = PlayerShopConfig.SellItem,ParamInfo = Info}
	self.objDBQuery:DelItemInfo(tempdwItemID)
	local ItemMsg = SItemMessage:new();
	objItem:FillItemMessage(ItemMsg);
	local t2 = {}
	t2.objShopItem = {}
	t2.objShopItem.dwPrice = Param.objItem.dwPrice
	t2.objShopItem.dwGold = Param.objItem.dwGold
	t2.objItem = ItemMsg
	t2.Info = Info
	t2.dwRoleID = self.dwRoleID
	CKernelApp.KServPlayerShopSingleMsg{RoleID = dwRoleID,Type = PlayerShopConfig.KBuyItemSure,ParamInfo = t2}
	objPlayer:GetSystem('CPlayerEventCenterSystem'):DoEvent(enumPlayerEventType.EventPlayerShopSell)
end

function CPlayerShopSystem:BuyGoldSure(ParamInfo)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	--购买方获得元宝
	local objItemSys = objPlayer:GetSystem('CItemSystem')
	local Info = ParamInfo.Info
	objItemSys:UnlockPacketMoney(ParamInfo.tabGold[2])
	objItemSys:CostPacketMoney(ParamInfo.tabGold[2], _G.ItemSysOperType.PlayerShop);
	objItemSys:AddGold(ParamInfo.tabGold[1], _G.ItemSysOperType.PlayerShop)
	CLogSystemManager:deal( objPlayer, 2, ParamInfo.tabGold[2],0,{}, '',
	nil, 0,ParamInfo.tabGold[1], {}, '', ParamInfo.dwRoleID )
	objPlayer.CltPlayerShopMsg{Type = PlayerShopConfig.BuyGoldSure,ParamInfo = Info}
	local t = {dwRoleID = ParamInfo.dwRoleID}
	CKernelApp.KServPlayerShopSingleMsg{RoleID = self.dwRoleID,Type = PlayerShopConfig.KOpenShop,ParamInfo = t}
end
function CPlayerShopSystem:BuyPriceSure(ParamInfo)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	--购买方获得银两
	local objItemSys = objPlayer:GetSystem('CItemSystem')
	local Info = ParamInfo.Info
	objItemSys:UnlockGold(ParamInfo.tabPrice[2])
	objItemSys:CostGold(ParamInfo.tabPrice[2], _G.ItemSysOperType.PlayerShop);
	self:AddPacketMoney(ParamInfo.tabPrice[1]);
	CLogSystemManager:deal( objPlayer, 2, 0,ParamInfo.tabPrice[2],{}, '',
	nil, ParamInfo.tabPrice[1],0, {}, '', ParamInfo.dwRoleID )
	objPlayer.CltPlayerShopMsg{Type = PlayerShopConfig.BuyPriceSure,ParamInfo = Info}
	local t = {dwRoleID = ParamInfo.dwRoleID}
	CKernelApp.KServPlayerShopSingleMsg{RoleID = self.dwRoleID,Type = PlayerShopConfig.KOpenShop,ParamInfo = t}
end

-----------------------------------------------------------------
----函数名称：CPlayerShop:GetItem(dwItemObjID)
----函数功能：得到玩家商店一个物品
----函数参数：dwItemObjID：物品objID
-----------------------------------------------------------------
function CPlayerShopSystem:GetItem(dwSerial)
	if self.setItemList[dwSerial] then
		return self.setItemList[dwSerial]
	else
		--没有这个物品
		return false;
	end
end
function CPlayerShopSystem:OpenShop(dwRoleID)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local objOther = objPlayer:GetOtherPlayer(dwRoleID,3)
	if not objOther then
		return
	end
	local objOtherItemSys = objOther:GetSystem('CItemSystem')
	local objOtherShopSys = objOther:GetSystem('CPlayerShopSystem')
	local Info = {}
	Info.ItemList = {}

	for k,v in pairs (objOtherShopSys.setItemList) do
		local objItem = objOtherItemSys:GetItem(v.dwItemID)
		local ItemMsg = SItemMessage:new();
		objItem:FillItemMessage(ItemMsg);
		local ItemInfo =
		{
			Item = ItemMsg,
			dwSerial = v.dwSerial,
			dwGold = v.dwGold,
			dwPrice = v.dwPrice,
			dwItemID = v.dwItemID,
		}
		table.insert(Info.ItemList,ItemInfo)
	end
	Info.dwRoleID = dwRoleID
	Info.szShopName = objOtherShopSys.szShopName
	Info.tabPrice = objOtherShopSys.tabPrice
	Info.tabGold = objOtherShopSys.tabGold
	objPlayer.CltPlayerShopMsg{Type = PlayerShopConfig.OpenShopSure,ParamInfo = Info}
end

function CPlayerShopSystem:ChangeShopName(szShopName)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local tempItemNum = 0
	self.szShopName = szShopName;
	for k,v in pairs (self.setItemList) do
		self.setItemList[k].szShopName = szShopName
		tempItemNum = tempItemNum + 1
	end
	--by quying
	--if (tempItemNum == 0) and (not self.tabGold) and (not self.tabPrice) then return end;
	self.objDBQuery:ChangeShopName(szShopName)
	local Info = {szShopName = self.szShopName}
	objPlayer.CltPlayerShopMsg{Type = PlayerShopConfig.ShopName,ParamInfo = Info}
	local t = {}
	t[1] = self.szShopName
	local dwRoleID = self.dwRoleID
	CKernelApp.KServPlayerShopSingleMsg{RoleID = dwRoleID,Type = PlayerShopConfig.KChangeName,ParamInfo = t}
end

function CPlayerShopSystem:SearchShopByPlayer(szPlayerName)
	self.szSearchItemName = szPlayerName
	local Index = 0
	self.setSearchShop = {}
	for k,v in ipairs (CPlayerShopManager.ShopSet) do
		if string.find(v.Param[3],szPlayerName) then
			Index = Index + 1
			local ShopInfo = {}
			ShopInfo[1] = v.Param[1]
			ShopInfo[2] = v.Param[2]
			ShopInfo[3] = v.Param[3]
			ShopInfo[4] = v.Param[4]
			ShopInfo[5] = v.Param[5]
			ShopInfo[7] = v.Param[7]
			ShopInfo[8] = v.Param[8]
			self.setSearchShop[Index] = ShopInfo
			break
		end
	end
end
function CPlayerShopSystem:SearchShopByMoney()
	self.szSearchItemName = 'Money'
	local Index = 0
	self.setSearchShop = {}
	for k,v in ipairs (CPlayerShopManager.ShopSet) do
		if v.Param[7] ~= nil then
			Index = Index + 1
			local ShopInfo = {}
			ShopInfo[1] = v.Param[1]
			ShopInfo[2] = v.Param[2]
			ShopInfo[3] = v.Param[3]
			ShopInfo[4] = v.Param[4]
			ShopInfo[5] = v.Param[5]
			ShopInfo[7] = v.Param[7]
			ShopInfo[8] = v.Param[8]
			self.setSearchShop[Index] = ShopInfo
		end
	end
end
function CPlayerShopSystem:SearchShopByGold()
	self.szSearchItemName = 'Gold'
	local Index = 0
	self.setSearchShop = {}
	for k,v in ipairs (CPlayerShopManager.ShopSet) do
		if v.Param[8] ~= nil then
			Index = Index + 1
			local ShopInfo = {}
			ShopInfo[1] = v.Param[1] ---摆摊名字
			ShopInfo[2] = v.Param[2]
			ShopInfo[3] = v.Param[3]
			ShopInfo[4] = v.Param[4] ---玩家等级
			ShopInfo[5] = v.Param[5]
			ShopInfo[7] = v.Param[7]
			ShopInfo[8] = v.Param[8]
			self.setSearchShop[Index] = ShopInfo
		end
	end
end
function CPlayerShopSystem:SearchShopByItem(szItemName)
	self.szSearchItemName = szItemName
	local Index = 0
	self.setSearchShop = {}
	for k,v in ipairs (CPlayerShopManager.ShopSet) do
		for i,Item in pairs (v.Param[6]) do
			if string.find(Item.szItemName,szItemName) then
				Index = Index + 1
				local ShopInfo = {}
				ShopInfo[1] = v.Param[1]
				ShopInfo[2] = v.Param[2]
				ShopInfo[3] = v.Param[3]
				ShopInfo[4] = v.Param[4]
				ShopInfo[5] = v.Param[5]
				ShopInfo[7] = v.Param[7]
				ShopInfo[8] = v.Param[8]
				self.setSearchShop[Index] = ShopInfo
				break
			end
		end
	end
end
function CPlayerShopSystem:GetSearchShopByPageEnum(dwPageEnum)
	local t = {}
	if self.setSearchShop == nil then return t end
	local begin = ((dwPageEnum-1) * PlayerShopDataConfig.ShopNum)+1
	for i = begin,begin+9 do
		if self.setSearchShop[i] then
			t[i] = self.setSearchShop[i]
		end
	end
	return t
end
function CPlayerShopSystem:GetMyShop(ParamInfo)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local objItemSys = objPlayer:GetSystem('CItemSystem')
	local Info = {}
	Info.ItemList = {}

	for k,v in pairs (self.setItemList) do
		local objItem = objItemSys:GetItem(v.dwItemID)
		if objItem then
			local ItemMsg = SItemMessage:new();
			objItem:FillItemMessage(ItemMsg);
			local ItemInfo =
			{
				Item = ItemMsg,
				dwSerial = v.dwSerial,
				dwGold = v.dwGold,
				dwPrice = v.dwPrice,
				dwItemID = v.dwItemID,
			}
			table.insert(Info.ItemList,ItemInfo)
		end
	end
	Info.dwRoleID = objPlayer:GetRoleID()
	Info.szShopName = self.szShopName
	Info.tabPrice = self.tabPrice
	Info.tabGold = self.tabGold
	local desRoleID = ParamInfo.dwRoleID
	CKernelApp.KServPlayerShopSingleMsg{RoleID = desRoleID,Type = PlayerShopConfig.KGetShopSure,ParamInfo = Info}
end


--当前是否正在摆摊
function CPlayerShopSystem:IsShoping()
	if self.tabPrice then
		return true;
	end

	if self.tabGold then
		return true;
	end

	for n,tbItemInfo in pairs(self.setItemList)do
		return true;
	end

	return false;
end;

--获取当前摆摊的所有数据，用于断线回连
function CPlayerShopSystem:GetMyShopInfo()
	local tbShopInfo = {};
	--摊位基本信息
	tbShopInfo[1] = {};
	tbShopInfo[1][1] = self.szShopName;
	tbShopInfo[1][2] = self.dwRoleID;
	tbShopInfo[1][3] = self.szRoleName;
	tbShopInfo[1][4] = self.dwPlayerLv;
	tbShopInfo[1][5] = self.dwItemNum;

	--摊位的物品信息
	tbShopInfo[2] = {};
	for n,tbItemInfo in pairs(self.setItemList)do
		local tb = {};
		tb[1] = tbItemInfo.dwItemID;
		tb[2] = tbItemInfo.szItemName;
		tbShopInfo[2][n] = tb;
	end

	--售卖货币
	tbShopInfo[3] = self.tabPrice;

	--售卖元宝
	tbShopInfo[4] = self.tabGold;

	return tbShopInfo;
end;

--数据库类
-----------------------------------------------------
-----------------------------------------------------
_G.CPlayerShopSystemDBOper = {};
function CPlayerShopSystemDBOper:new(objDB,objUser)
	local obj = {};
	obj.objDBQuery = objDB;
	obj.objUser = objUser;   --对应的玩家
	for i, v in pairs(CPlayerShopSystemDBOper) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end
--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
function CPlayerShopSystemDBOper:AddItemInfo(dwItemID,dwGold,dwPrice,szShopName)
	if not self.objDBQuery then
		_info("self.objDBQuery is null by CPlayerShopSystemDBOper");
		return false;
	end;
	if not self.objUser then
		_info("self.objUser is null by CPlayerShopSystemDBOper");
		return false;
	end;
	local objPlayer = self.objUser:GetPlayer();
	if not objPlayer then
		_info("objPlayer is null by CPlayerShopSystemDBOper");
		return false;
	end;
    local dwRoleID = objPlayer:GetRoleID();
	if dwRoleID == 0 then
		_info("dwRoleID == 0 by CPlayerShopSystemDBOper");
		return false;
	end;
	local SqlCmd = self.objDBQuery:CreateInsertCmd('T_Role_PlayerShopItem');
	SqlCmd.Fields.dwRoleID					= dwRoleID;
	if szShopName == nil then
		szShopName =self.objUser.szShopName;
	end
	SqlCmd.Fields.szShopName				= "";
	SqlCmd.Fields.dwItemID					= dwItemID;
	SqlCmd.Fields.bPriceType				= dwGold;
	SqlCmd.Fields.dwPrice					= dwPrice;
	SqlCmd:execute()
	---------------------
	local SqlCmd1 = self.objDBQuery:CreateUpdateCmd('T_Role_PlayerShopName');
	SqlCmd1.Wheres.dwRoleID					= dwRoleID;
	SqlCmd1.Fields.szShopName				= szShopName;
	SqlCmd1:execute()

	return true;
end

function CPlayerShopSystemDBOper:DelItemInfo(dwItemID)
	if not self.objDBQuery then
		_info("self.objDBQuery is null by CPlayerShopSystemDBOper");
		return false;
	end;
	if not self.objUser then
		_info("self.objUser is null by CPlayerShopSystemDBOper");
		return false;
	end;
	local objPlayer = self.objUser:GetPlayer();
	if not objPlayer then
		_info("objPlayer is null by CPlayerShopSystemDBOper");
		return false;
	end;
    local dwRoleID = objPlayer:GetRoleID();
	if dwRoleID == 0 then
		_info("dwRoleID == 0 by CPlayerShopSystemDBOper");
		return false;
	end;
	local SqlCmd = self.objDBQuery:CreateDeleteCmd('T_Role_PlayerShopItem');
	SqlCmd.Wheres.dwRoleID = dwRoleID;
	SqlCmd.Wheres.dwItemID = dwItemID;
	SqlCmd:execute()
	return true;
end

function CPlayerShopSystemDBOper:ChangeShopName(szShopName)
	if not self.objDBQuery then
		_info("self.objDBQuery is null by CPlayerShopSystemDBOper");
		return false;
	end;
	if not self.objUser then
		_info("self.objUser is null by CPlayerShopSystemDBOper");
		return false;
	end;
	local objPlayer = self.objUser:GetPlayer();
	if not objPlayer then
		_info("objPlayer is null by CPlayerShopSystemDBOper");
		return false;
	end;
    local dwRoleID = objPlayer:GetRoleID();
	if dwRoleID == 0 then
		_info("dwRoleID == 0 by CPlayerShopSystemDBOper");
		return false;
	end;
	---------------------
	local SqlCmd = self.objDBQuery:CreateUpdateCmd('T_Role_PlayerShopName');
	SqlCmd.Wheres.dwRoleID					= dwRoleID;
	if szShopName == nil then
		szShopName =self.objUser.szShopName;
	end
	SqlCmd.Fields.szShopName				= szShopName;
	SqlCmd:execute()
	----------------------
	return true;
end
