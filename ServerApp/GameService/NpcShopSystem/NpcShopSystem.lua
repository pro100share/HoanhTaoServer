--NPC商店结构属性
_G.CNpcShopSystem = {}
CNpcShopSystem.dwCount = 6
function CNpcShopSystem:new()
	local obj = CSystem:new("CNpcShopSystem");
	obj.setBackList = {};
	obj.nState = 0;
	for i,v in pairs(CNpcShopSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;
function CNpcShopSystem:OnChangeLineBegin(dwNewLineID)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local t = {}
	t[1] = self.setBackList;
	objPlayer:SetLineData("CNpcShopSystem",t);
end

function CNpcShopSystem:Create()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local tabDataList = {}
	tabDataList = objPlayer:GetLineData("CNpcShopSystem")
	if tabDataList then
		if tabDataList[1] then
			if tabDataList[1][1] then
				self.setBackList = tabDataList[1][1]
			end
		end;
	end
	self.DecodeFun = {}
	self.DecodeFun[NpcShopMsgConfig.Buy] = function(objPlayer,objItemSys,ItemID,Opt) self:DecodeFunBuy(objPlayer,objItemSys,ItemID,Opt) end
	self.DecodeFun[NpcShopMsgConfig.Sell] = function(objPlayer,objItemSys,ItemID,Opt) self:DecodeFunSell(objPlayer,objItemSys,ItemID,Opt) end
	self.DecodeFun[NpcShopMsgConfig.Back] = function(objPlayer,objItemSys,ItemID,Opt) self:DecodeFunBack(objPlayer,objItemSys,ItemID,Opt) end
	self.DecodeFun[NpcShopMsgConfig.SetState] = function(objPlayer,objItemSys,ItemID,Opt) self:DecodeFunSetState(objPlayer,objItemSys,ItemID,Opt) end
	self.DecodeFun[NpcShopMsgConfig.FixEquip] = function(objPlayer,objItemSys,ItemID,Opt) self:DecodeFunFixEquip(objPlayer,objItemSys,ItemID,Opt) end
	return true;
end
function CNpcShopSystem:GetBuyPriceByID(ItemID)
	local dwBuyPrice = -1
	for k,v in pairs(NpcShopItemPriceConfig) do
		if k == ItemID then
			return v
		end
	end
	return dwBuyPrice
end
function CNpcShopSystem:DecodeFunBuy(objPlayer,objItemSys,ItemID,Opt)
	local eventSys = objPlayer:GetSystem('CPlayerEventCenterSystem')
	local dwBuyPrice = self:GetBuyPriceByID(ItemID)
	if dwBuyPrice <= 0 then objPlayer.CltNpcShopMsg{Type = NpcShopMsgConfig.NotSuccess} return end;
	local costMoney = dwBuyPrice * Opt
	if objItemSys:IsPacketMoneyEnough(costMoney) then
		local addItemList = {};
		local tempTable = {
			dwItemEnum	= ItemID;
			dwItemNumber= Opt;
		};
		table.insert(addItemList, tempTable);
		if objItemSys:IsEnumItemListCanAddToPacket(addItemList) then
			objPlayer.CltNpcShopMsg{Type = NpcShopMsgConfig.BuySuccess}
			objItemSys:AddEnumItemListToPacket(addItemList, _G.ItemSysOperType.BuyNpc)
			--减钱
			objItemSys:CostPacketMoney(costMoney, _G.ItemSysOperType.BuyNpc)
			eventSys:DoEvent(enumPlayerEventType.EventBuyShopItem,1)
			--后台记录
			objPlayer:GetSystem('CPlayerEventCenterSystem'):DoEvent(enumPlayerEventType.EventNpcShopBuy)
			CLogSystemManager:game_buy( objPlayer, objItemSys:GetAllMoney(),ItemID, Opt, costMoney )
		else
			objPlayer.CltNpcShopMsg{Type = NpcShopMsgConfig.NoPack}
		end
	else
		objPlayer.CltNpcShopMsg{Type = NpcShopMsgConfig.MoneyNotEnough}
	end
end
function CNpcShopSystem:DecodeFunSell(objPlayer,objItemSys,ItemID,Opt)
	local eventSys = objPlayer:GetSystem('CPlayerEventCenterSystem')
	local ItemOnPlayer = objItemSys:GetItem(ItemID)
	if not ItemOnPlayer then
		return;
	end
	local ItemMsg = SItemMessage:new()
	ItemOnPlayer:FillItemMessage(ItemMsg)
	for k,v in pairs (self.setBackList) do
		if v == ItemID then
			objPlayer.CltNpcShopMsg{Type = NpcShopMsgConfig.AlreadySell}
			return
		end
	end
	if CGlobalItemManager:IsCanSell(ItemMsg.dwItemEnum) then
		if objItemSys:IsItemLocked(ItemOnPlayer:GetInstID()) then
			objPlayer.CltNpcShopMsg{Type = NpcShopMsgConfig.Unlock}
			return
		end
		--加钱
		local tempItemNum = ItemOnPlayer:GetCount()
		local getMoney = CGlobalItemManager:GetSellPrice(ItemMsg.dwItemEnum) * tempItemNum
		if getMoney ~= 0 then
            if not objItemSys:AddPacketMoney(getMoney, _G.ItemSysOperType.SellNpc) then
                return;
            end
			
		end;
		--加入到回购表
		table.insert(self.setBackList,ItemOnPlayer.dwItemID)
		if Table:Count(self.setBackList) > CNpcShopSystem.dwCount then
			objItemSys:UnlockItem(self.setBackList[1]);
			objItemSys:DelObjItem(self.setBackList[1], _G.ItemSysOperType.SellNpc);
			table.remove(self.setBackList,1)
		end
		--删除物品
		objItemSys:MoveItemToStore(ItemOnPlayer:GetInstID())
		objItemSys:LockItem(ItemOnPlayer:GetInstID());
		eventSys:DoEvent(enumPlayerEventType.EventSellItem,1)
		--
		objPlayer.CltNpcShopMsg{Type = NpcShopMsgConfig.SellSuccess,Item = ItemMsg}
		CLogSystemManager:game_sell( objPlayer,objItemSys:GetAllMoney(), ItemOnPlayer:GetEnumID(), tempItemNum, getMoney )
	else
		objPlayer.CltNpcShopMsg{Type = NpcShopMsgConfig.NotForSell}
	end
end
function CNpcShopSystem:DecodeFunBack(objPlayer,objItemSys,ItemID,Opt)
	if #self.setBackList == 0 then
		return
	end
	local ItemOnBackList = {}
	for k,v in pairs (self.setBackList) do
		if v == ItemID then
			ItemOnBackList = objItemSys:GetItem(ItemID)
			break
		end
	end
	local dwSellPrice = CGlobalItemManager:GetSellPrice(ItemOnBackList:GetEnumID());
	local costMoney = dwSellPrice * ItemOnBackList:GetCount()
	if objItemSys:IsPacketMoneyEnough(costMoney) then
		local ItemInfo = {ItemOnBackList}
		if objItemSys:IsObjItemListCanAddToPacket(ItemInfo) then
			local ItemOnPlayer = objItemSys:GetItem(ItemID)
			objItemSys:UnlockItem(ItemOnPlayer:GetInstID());
			objItemSys:MoveItemToPacket(ItemOnPlayer:GetInstID());
			
			--减钱
			if costMoney ~= 0 then
				objItemSys:CostPacketMoney(costMoney, _G.ItemSysOperType.BuyNpc)
			end;
			for k,v in pairs (self.setBackList) do
				if v == ItemID then
					table.remove(self.setBackList,k)
					break
				end
			end
			local Info = {dwItemID = ItemID}
			objPlayer.CltNpcShopMsg{Type = NpcShopMsgConfig.BackSuccess,Item = Info}
			--后台记录
			local tempItemNum = ItemOnPlayer:GetCount()
			CLogSystemManager:game_buy( objPlayer, objItemSys:GetAllMoney(),ItemOnPlayer:GetEnumID(), tempItemNum, costMoney )
		else
			objPlayer.CltNpcShopMsg{Type = NpcShopMsgConfig.NoPackForBack}
		end
	else
		objPlayer.CltNpcShopMsg{Type = NpcShopMsgConfig.MoneyNotEnoughForBack}
	end
end
function CNpcShopSystem:DecodeFunSetState(objPlayer,objItemSys,ItemID,Opt)
	self.nState = Opt;
end
function CNpcShopSystem:DecodeFunFixEquip(objPlayer,objItemSys,ItemID,Opt)
	local fixMoney = objItemSys:RepairEquipsPutOn();
	if fixMoney > 0 then
		objPlayer.CltNpcShopMsg{Type = NpcShopMsgConfig.FixEquipFinish}
		
		objPlayer:GetSystem('CPlayerEventCenterSystem'):DoEvent(enumPlayerEventType.EventRepair)
	elseif fixMoney == 0 then
		objPlayer.CltNpcShopMsg{Type = NpcShopMsgConfig.FixEquipNoNeed}
	else
		objPlayer.CltNpcShopMsg{Type = NpcShopMsgConfig.FixEquipNoMoney}
	end
end
function CNpcShopSystem:Destroy()
	return true
end;
--得到玩家当前商店状态，1为正在打开商店，0为没有打开商店
function CNpcShopSystem:GetState()
	return self.nState
end
function CNpcShopSystem:DecodeMsg(Type,ItemID,Opt)
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
