--[[ 	
	群侠录系统 --大侠录
	author lizc
	2014.1.6
--]]

--[[
字符串结构
	1=0,1,0,1,1,0,0,;2=1,1,1,0,0,1,;...
--]]
local function FormatGroupSlotStr(t)
	local retStr = "";
	for k , v in pairs(t) do
		retStr = retStr..k.."=";
		for _, state in pairs(v) do 
			retStr = retStr..state..","
		end
		retStr = retStr..";"
	end
	
	return retStr;
end


--初始化群侠组合
--表结构
--[[
	1代表槽位已经镶嵌 0代表未镶嵌
	
	{
		[1] = {0,0,0,1,1,0,1,},
		[2] = {1,1,1,0,0,},
		...
	}
--]]
function CQunXiaLuSystem:DaXiaInit()
	for k, v in pairs(_G.QunXiaLuDaXia) do
		if type(k) == "number" then
			self.setDaXiaSlot[k] = {};
			for index, _ in pairs(v.setSlot) do
				--状态置为0   1代表槽位已经镶嵌 0代表未镶嵌
				self.setDaXiaSlot[k][index] = 0
			end
		end
	end
end


--群侠组合同步槽位状态信息
function CQunXiaLuSystem:SynDaXiaSlot()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("error");
		return
	end;
	
	objPlayer.SynQunXiaLuDaXiaSlotMsg{setSlotState = self.setDaXiaSlot};
end


--群侠大侠 检测槽位是否可以镶嵌
function CQunXiaLuSystem:DaXiaCheckSlot(dwDaXiaIndex,dwSlotIndex)
	local bIsCanInlay = true;
	for k, v in pairs(self.setDaXiaSlot[dwDaXiaIndex]) do
		if k < dwSlotIndex and v == 0 then 
			bIsCanInlay = false;
			break;
		end
	end
	
	return bIsCanInlay;
end


--群侠大侠 镶嵌槽位
function CQunXiaLuSystem:DaXiaInlay(dwDaXiaIndex, dwSlotIndex, b_IsAutoBuy, b_IsUseGold)
	--检测是否拥有权限
	if not self:HasAuthority('QunXiaLuDaXiaLu') then
		return false;
	end
	
	local slotId = _G.QunXiaLuDaXia[dwDaXiaIndex].setSlot[dwSlotIndex];
	local slotCfg = _G.QunXiaDaXiaSlotConfig[slotId];
	if not slotCfg then
		_err("CQunXiaLuSystem:DaXiaInlay slotCfg dont exist!!")
		return
	end
	
	
	--检测系统内存里是否存在dwDaXiaIndex,和dwSlotIndex ，如果不存在 而且配置表里有 则为新增加了配置需要重新写到内存和数据库
	if not self.setDaXiaSlot[dwDaXiaIndex] then
		self.setDaXiaSlot[dwDaXiaIndex] = {};
		for k, _ in pairs(_G.QunXiaLuDaXia[dwDaXiaIndex].setSlot) do
			self.setDaXiaSlot[dwDaXiaIndex][k] = 0;
		end
	elseif not self.setDaXiaSlot[dwDaXiaIndex][dwSlotIndex] then
		self.setDaXiaSlot[dwDaXiaIndex][dwSlotIndex] = 0;
		--_info("CQunXiaLuSystem:DaXiaInlay self.setDaXiaSlot[dwDaXiaIndex][dwSlotIndex] not exist!!")
		--return
	end
	
	--检测如果已经镶嵌则返回
	if self.setDaXiaSlot[dwDaXiaIndex][dwSlotIndex] == 1 then
		return;
	end
	
	if not self:DaXiaCheckSlot(dwDaXiaIndex, dwSlotIndex) then 
		return;
	end
	
	--自动购买
	local autoBuyInfo = {};
		
	--检查镶嵌卡片是否足够
	local cardCfg = slotCfg.needItem.card;
	for cardId, cardCount in pairs(cardCfg) do
		local cardItemId = _G.QunXiaCardConfig[cardId].dwItemEnum;
		local b_IsEnough_1, n_Minus_1 = self.ItemSystem:CheckDelEnumItemInPacketCond(cardItemId, cardCount);
		if not b_IsEnough_1 then
			if b_IsAutoBuy then
				local t = {};
				t.dwItemEnum 	= cardItemId;
				t.dwItemNumber 	= n_Minus_1;
				table.insert(autoBuyInfo, t);
			else--材料不够而且不是自动购买则返回
				return;
			end;
		end
	end
	
	--检查镶嵌材料是否足够
	local itemCfg = slotCfg.needItem.item;
	for itemId, itemCount in pairs(itemCfg) do
		local b_IsEnough_1, n_Minus_1 = self.ItemSystem:CheckDelEnumItemInPacketCond(itemId, itemCount);
		if not b_IsEnough_1 then
			if b_IsAutoBuy then
				local t = {};
				t.dwItemEnum 	= itemId;
				t.dwItemNumber 	= n_Minus_1;
				table.insert(autoBuyInfo, t);
			else--材料不够而且不是自动购买则返回
				return;
			end;
		end
	end
	
	
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("error");
		return
	end;
	
	--------如果自动购买列表不为空则执行自动购买逻辑
	if #autoBuyInfo > 0 then
		local mallSystem = objPlayer:GetSystem("CMallSystem");
		if not mallSystem then
			_err("get mallSystem error!!!");
			return;
		end;
		if b_IsUseGold then
--			local n_Result, n_Cost = mallSystem:CanBuyItemListGold(autoBuyInfo);
--			if n_Result > 0 then return end;
			for k, v in pairs(autoBuyInfo) do
				local buySuc = mallSystem:BuyItemByIDGold(v.dwItemNumber, v.dwItemEnum)
				if not buySuc then
					_err("auto buy error!!!");
					return
				end;
			end;
		else
--			local n_Result, n_Cost = mallSystem:CanBuyItemListBindGold(autoBuyInfo);
--			if n_Result > 0 then return end;
			for k, v in pairs(autoBuyInfo) do
				local buySuc = mallSystem:BuyItemByIDBindGold(v.dwItemNumber, v.dwItemEnum)
				if not buySuc then
					_err("auto buy error!!!");
					return
				end;
			end;
		end
		--------检测背包中是否有足够物品
		for cardId, cardCount in pairs(cardCfg) do
			local cardItemId = _G.QunXiaCardConfig[cardId].dwItemEnum;
			local b_IsEnough_1, n_Minus_1 = self.ItemSystem:CheckDelEnumItemInPacketCond(cardItemId, cardCount);
			if not b_IsEnough_1 then
				return
			end
		end
		
		for itemId, itemCount in pairs(itemCfg) do
			local b_IsEnough_1, n_Minus_1 = self.ItemSystem:CheckDelEnumItemInPacketCond(itemId, itemCount);
			if not b_IsEnough_1 then
				return
			end
		end
	end;
	
	
	--扣除卡片
	for cardId, cardCount in pairs(cardCfg) do
		local cardItemId = _G.QunXiaCardConfig[cardId].dwItemEnum;
		self.ItemSystem:DelEnumItemInPacket(cardItemId, cardCount, false, _G.ItemSysOperType.QunXiaLu);
	end
	
	--扣除材料
	for itemId, itemCount in pairs(itemCfg) do
		self.ItemSystem:DelEnumItemInPacket(itemId, itemCount, false, _G.ItemSysOperType.QunXiaLu);
	end
	
	
	self.setDaXiaSlot[dwDaXiaIndex][dwSlotIndex] = 1;
	
	--更新数据库
	local db_Info = {};
	db_Info.szDaXiaSlot = FormatGroupSlotStr(self.setDaXiaSlot);
	self.objDBQuery:UpdateDaXiaSlotInfo(db_Info);
	
	--发送消息
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("error");
		return
	end;
	
	--群侠录群侠组合镶嵌槽位
	objPlayer.QunXialuDaXiaSlotChangeMsg{DaXiaIndex = dwDaXiaIndex, SlotIndex = dwSlotIndex}
	
	
	--计算属性
	local allAttr = self:GetAllAttr();
	
	--增加属性
	self.SkillSystem:NotifyQunXiaLuUpdate(allAttr);
	
	--完成广播
	self:CheckCopeletem();
end
	
--检测是否完成了所有大侠录槽位
function CQunXiaLuSystem:CheckCopeletem()	
	local bIsCompelete = true;
	
	for k, v in pairs(self.setDaXiaSlot) do
		for _, state in pairs(v) do
			if state == 0 then
				bIsCompelete = false;
				break
			end
		end
	end
	
	if bIsCompelete then
		local objPlayer = self:GetPlayer();
		if not objPlayer then
			_err("error");
			return
		end;
	
		local dwRoleID = objPlayer:GetRoleID();
		local szRoleName = objPlayer:GetName();
		
		--全服广播
		CGameApp.QunXiaLuDaXiaCompeleteMsg{RoleId = dwRoleID, RoleName = szRoleName};
	end
end
