--[[ 	
	Ⱥ��¼ϵͳ --Ⱥ�����
	author lizc
	2014.1.3
--]]


--[[
�ַ����ṹ
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


--��ʼ��Ⱥ�����
--��ṹ
--[[
	1�����λ�Ѿ���Ƕ 0����δ��Ƕ
	
	{
		[1] = {0,0,0,1,1,0,1,},
		[2] = {1,1,1,0,0,},
		...
	}
--]]
function CQunXiaLuSystem:GroupInit()
	for k, v in pairs(_G.QunXiaLuCombination) do
		if type(k) == "number" then
			self.setGroupSlot[k] = {};
			for index, _ in pairs(v.setSlot) do
				--״̬��Ϊ0   1�����λ�Ѿ���Ƕ 0����δ��Ƕ
				self.setGroupSlot[k][index] = 0
			end
		end
	end
end


--Ⱥ�����ͬ����λ״̬��Ϣ
function CQunXiaLuSystem:SynGroupSlot()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("error");
		return
	end;
	
	objPlayer.SynQunXiaLuGroupSlotMsg{setSlotState = self.setGroupSlot};
end


--Ⱥ����� ��Ƕ��λ
function CQunXiaLuSystem:GroupInlay(dwGroupIndex, dwSlotIndex, b_IsAutoBuy, b_IsUseGold)
	-- print("CQunXiaLuSystem:GroupInlay dwGroupIndex, dwSlotIndex, b_IsAutoBuy, b_IsUseGold", dwGroupIndex, dwSlotIndex, b_IsAutoBuy, b_IsUseGold);
	--����Ƿ�ӵ��Ȩ��
	if not self:HasAuthority('QunXiaLuZuHe') then
		return false;
	end
	-- print("CQunXiaLuSystem:GroupInlay======2")
	
	local slotId = _G.QunXiaLuCombination[dwGroupIndex].setSlot[dwSlotIndex];
	local slotCfg = _G.QunXiaZuHeSlotConfig[slotId];
	if not slotCfg then
		_err("CQunXiaLuSystem:GroupInLay slotCfg dont exist!!")
		return
	end
	
	
	--���ϵͳ�ڴ����Ƿ����dwGroupIndex,��dwSlotIndex ����������� �������ñ����� ��Ϊ��������������Ҫ����д���ڴ�����ݿ�
	if not self.setGroupSlot[dwGroupIndex] then
		self.setGroupSlot[dwGroupIndex] = {};
		for k, _ in pairs(_G.QunXiaLuCombination[dwGroupIndex].setSlot) do
			self.setGroupSlot[dwGroupIndex][k] = 0;
		end
	elseif not self.setGroupSlot[dwGroupIndex][dwSlotIndex] then
		_info("CQunXiaLuSystem:GroupInLay self.setGroupSlot[dwGroupIndex][dwSlotIndex] not exist!!")
		return
	end
	
	--�������Ѿ���Ƕ�򷵻�
	if self.setGroupSlot[dwGroupIndex][dwSlotIndex] == 1 then
		return;
	end
	-- print("CQunXiaLuSystem:GroupInlay======3")
	--�Զ�����
	local autoBuyInfo = {};
		
	--�����Ƕ��Ƭ�Ƿ��㹻
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
			else--���ϲ������Ҳ����Զ������򷵻�
				return;
			end;
		end
	end
	-- print("CQunXiaLuSystem:GroupInlay======4")
	--�����Ƕ�����Ƿ��㹻
	local itemCfg = slotCfg.needItem.item;
	for itemId, itemCount in pairs(itemCfg) do
		local b_IsEnough_1, n_Minus_1 = self.ItemSystem:CheckDelEnumItemInPacketCond(itemId, itemCount);
		if not b_IsEnough_1 then
			if b_IsAutoBuy then
				local t = {};
				t.dwItemEnum 	= itemId;
				t.dwItemNumber 	= n_Minus_1;
				table.insert(autoBuyInfo, t);
			else--���ϲ������Ҳ����Զ������򷵻�
				return;
			end;
		end
	end
	
	-- print("CQunXiaLuSystem:GroupInlay======5")
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("error");
		return
	end;
	
	--------����Զ������б�Ϊ����ִ���Զ������߼�
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
		--------��ⱳ�����Ƿ����㹻��Ʒ
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
		-- print("CQunXiaLuSystem:GroupInlay======6")
	end;
	
	
	--�۳���Ƭ
	for cardId, cardCount in pairs(cardCfg) do
		local cardItemId = _G.QunXiaCardConfig[cardId].dwItemEnum;
		self.ItemSystem:DelEnumItemInPacket(cardItemId, cardCount, false, _G.ItemSysOperType.QunXiaLu);
	end
	
	--�۳�����
	for itemId, itemCount in pairs(itemCfg) do
		self.ItemSystem:DelEnumItemInPacket(itemId, itemCount, false, _G.ItemSysOperType.QunXiaLu);
	end
	
	
	self.setGroupSlot[dwGroupIndex][dwSlotIndex] = 1;
	
	--�������ݿ�
	local db_Info = {};
	db_Info.szGroupSlot = FormatGroupSlotStr(self.setGroupSlot);
	self.objDBQuery:UpdateGroupSlotInfo(db_Info);
	
	--������Ϣ
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("error");
		return
	end;
	
	--Ⱥ��¼Ⱥ�������Ƕ��λ
	objPlayer.QunXialuGroupSlotChangeMsg{GroupIndex = dwGroupIndex, SlotIndex = dwSlotIndex}
	
	
	--������Ⱥ���Ƿ���Ƕ��� ����������������
	local bIsComplete = true;
	for k, v in pairs(self.setGroupSlot[dwGroupIndex]) do 
		if v == 0 then
			bIsComplete = false;
			break;
		end
	end
	
	if bIsComplete then
		local dwRoleID = objPlayer:GetRoleID();
		local szRoleName = objPlayer:GetName();
		
		--ȫ���㲥
		CGameApp.QunXiaLuGroupCompeleteMsg{RoleId = dwRoleID, RoleName = szRoleName, GroupIndex = dwGroupIndex};
	end
	
	--��������
	local allAttr = self:GetAllAttr();
	
	--��������
	self.SkillSystem:NotifyQunXiaLuUpdate(allAttr);
end
	
