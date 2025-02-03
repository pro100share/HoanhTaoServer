--NPC商店结构属性
_G.CCSNpcShopSystem = {}
function CCSNpcShopSystem:new()
	local obj = CSystem:new("CCSNpcShopSystem");
	obj.nState = 0;
	for i,v in pairs(CCSNpcShopSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;
function CCSNpcShopSystem:OnChangeLineBegin(dwNewLineID)
end

function CCSNpcShopSystem:Create()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	
	self.DecodeFun = {}
	self.DecodeFun[CSNpcShopMsgConfig.Buy] = function(objPlayer,objItemSys,ItemID,Opt) self:DecodeFunBuy(objPlayer,objItemSys,ItemID,Opt) end
	--self.DecodeFun[CSNpcShopMsgConfig.Sell] = function(objPlayer,objItemSys,ItemID,Opt) self:DecodeFunSell(objPlayer,objItemSys,ItemID,Opt) end
	-- self.DecodeFun[CSNpcShopMsgConfig.Back] = function(objPlayer,objItemSys,ItemID,Opt) self:DecodeFunBack(objPlayer,objItemSys,ItemID,Opt) end
	self.DecodeFun[CSNpcShopMsgConfig.SetState] = function(objPlayer,objItemSys,ItemID,Opt) self:DecodeFunSetState(objPlayer,objItemSys,ItemID,Opt) end
	-- self.DecodeFun[CSNpcShopMsgConfig.FixEquip] = function(objPlayer,objItemSys,ItemID,Opt) self:DecodeFunFixEquip(objPlayer,objItemSys,ItemID,Opt) end
	return true;
end

function CCSNpcShopSystem:DecodeFunBuy(objPlayer,objItemSys,ItemID,Opt)
	--local eventSys = objPlayer:GetSystem('CPlayerEventCenterSystem')
	local dwPriceType = 0;
	local buyItemCfg = nil;
	
	for priceType, goods in pairs(CrossSvrNpcShopConfig.ItemID) do
		for _, itemCfg in pairs(goods) do
			if itemCfg.ItemID == ItemID then
				dwPriceType = priceType;
				buyItemCfg = itemCfg;
			end
		end
	end
	
	--如果没有找到对应的商品配置
	if dwPriceType == 0 then return end
	
	-- 物品系统
	local objItemSys = objPlayer:GetSystem('CItemSystem')

	local addItemList = {};
	local tempTable = {
		dwItemEnum	= ItemID;
		dwItemNumber= Opt;
		dwBindType	= buyItemCfg.dwBindType;
	};
	table.insert(addItemList, tempTable);
	if not objItemSys:IsEnumItemListCanAddToPacket(addItemList) then
		objPlayer.CSCltNpcShopMsg{Type = CSNpcShopMsgConfig.NoPack}
		return false
	end
	
	local totalPrice = buyItemCfg.price * Opt;
	
	if dwPriceType == CrossSvrNpcShopConfig.MoneyType.Money then
		if objItemSys:IsPacketMoneyEnough(totalPrice) then
			objPlayer.CSCltNpcShopMsg{Type = CSNpcShopMsgConfig.BuySuccess}
			--减钱
			objItemSys:CostPacketMoney(totalPrice, _G.ItemSysOperType.CSBuyNpc)
			--eventSys:DoEvent(enumPlayerEventType.EventBuyShopItem,1)
			--后台记录
			--objPlayer:GetSystem('CPlayerEventCenterSystem'):DoEvent(enumPlayerEventType.EventNpcShopBuy)
			--CLogSystemManager:game_buy( objPlayer, objItemSys:GetAllMoney(),ItemID, Opt, costMoney )
		else
			objPlayer.CSCltNpcShopMsg{Type = CSNpcShopMsgConfig.MoneyNotEnough}
		end
	elseif dwPriceType == CrossSvrNpcShopConfig.MoneyType.BindGold then
		if objItemSys:IsBindGoldEnough(totalPrice) then
			objItemSys:CostBindGold(totalPrice, _G.ItemSysOperType.CSBuyNpc);
			-- CLogSystemManager:giftmoney_buy(objPlayer,
                -- objMallItem.dwItemEnum,
                -- dwNum,
                -- dwItemsPrice);
			-- objPlayer:
                -- GetSystem('CPlayerEventCenterSystem'):
                -- DoEvent(enumPlayerEventType.EventBindGoldBuy);
			objPlayer.CSCltNpcShopMsg{Type =
                CSNpcShopMsgConfig.BuySuccessByBindGold};
		else
			objPlayer.CSCltNpcShopMsg{Type = CSNpcShopMsgConfig.BindGoldNotEnough};
			return false;
		end
	elseif dwPriceType == CrossSvrNpcShopConfig.MoneyType.Gold then
		if objItemSys:IsGoldEnough(totalPrice) then
			objItemSys:CostGold(totalPrice, _G.ItemSysOperType.CSBuyNpc)
			-- CLogSystemManager:shop_buy(objPlayer,
                -- objMallItem.dwItemEnum,
                -- dwNum,
                -- dwItemsPrice);
			objPlayer.CSCltNpcShopMsg{Type =
                CSNpcShopMsgConfig.BuySuccessByGold};
			-- objPlayer:
                -- GetSystem('CPlayerEventCenterSystem'):
                -- DoEvent(enumPlayerEventType.EventGoldBuy,dwNum,objMallItem.dwItemEnum);
		else
			objPlayer.CSCltNpcShopMsg{Type = CSNpcShopMsgConfig.GoldNotEnough}
			return false
		end		
	end
	
	
	objItemSys:AddEnumItemListToPacket(addItemList, _G.ItemSysOperType.CSBuyNpc)
	
end
-- function CCSNpcShopSystem:DecodeFunSell(objPlayer,objItemSys,ItemID,Opt)
	-- local eventSys = objPlayer:GetSystem('CPlayerEventCenterSystem')
	-- local ItemOnPlayer = objItemSys:GetItem(ItemID)
	-- if not ItemOnPlayer then
		-- return;
	-- end
	-- local ItemMsg = SItemMessage:new()
	-- ItemOnPlayer:FillItemMessage(ItemMsg)
	-- for k,v in pairs (self.setBackList) do
		-- if v == ItemID then
			-- objPlayer.CltNpcShopMsg{Type = NpcShopMsgConfig.AlreadySell}
			-- return
		-- end
	-- end
	-- if CGlobalItemManager:IsCanSell(ItemMsg.dwItemEnum) then
		-- if objItemSys:IsItemLocked(ItemOnPlayer:GetInstID()) then
			-- objPlayer.CltNpcShopMsg{Type = NpcShopMsgConfig.Unlock}
			-- return
		-- end
		-- --加钱
		-- local tempItemNum = ItemOnPlayer:GetCount()
		-- local getMoney = CGlobalItemManager:GetSellPrice(ItemMsg.dwItemEnum) * tempItemNum
		-- if getMoney ~= 0 then
			-- objItemSys:AddPacketMoney(getMoney, _G.ItemSysOperType.SellNpc)
		-- end;
		-- --加入到回购表
		-- table.insert(self.setBackList,ItemOnPlayer.dwItemID)
		-- if Table:Count(self.setBackList) > CCSNpcShopSystem.dwCount then
			-- objItemSys:UnlockItem(self.setBackList[1]);
			-- objItemSys:DelObjItem(self.setBackList[1], _G.ItemSysOperType.SellNpc);
			-- table.remove(self.setBackList,1)
		-- end
		-- --删除物品
		-- objItemSys:MoveItemToStore(ItemOnPlayer:GetInstID())
		-- objItemSys:LockItem(ItemOnPlayer:GetInstID());
		-- eventSys:DoEvent(enumPlayerEventType.EventSellItem,1)
		-- --
		-- objPlayer.CltNpcShopMsg{Type = NpcShopMsgConfig.SellSuccess,Item = ItemMsg}
		-- CLogSystemManager:game_sell( objPlayer,objItemSys:GetAllMoney(), ItemOnPlayer:GetEnumID(), tempItemNum, getMoney )
	-- else
		-- objPlayer.CltNpcShopMsg{Type = NpcShopMsgConfig.NotForSell}
	-- end
-- end

function CCSNpcShopSystem:DecodeFunSetState(objPlayer,objItemSys,ItemID,Opt)
	self.nState = Opt;
end

function CCSNpcShopSystem:Destroy()
	return true
end;
--得到玩家当前商店状态，1为正在打开商店，0为没有打开商店
function CCSNpcShopSystem:GetState()
	return self.nState
end
function CCSNpcShopSystem:DecodeMsg(Type,ItemID,Opt)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local objItemSys = objPlayer:GetSystem("CItemSystem");
	if not objItemSys then
		return; 
	end;
	if self.DecodeFun[Type] then
		self.DecodeFun[Type](objPlayer,objItemSys,ItemID,Opt)
	end
end