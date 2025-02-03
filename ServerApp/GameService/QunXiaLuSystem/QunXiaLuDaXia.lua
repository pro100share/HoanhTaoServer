--[[ 	
	Ⱥ��¼ϵͳ --����¼
	author lizc
	2014.1.6
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
function CQunXiaLuSystem:DaXiaInit()
	for k, v in pairs(_G.QunXiaLuDaXia) do
		if type(k) == "number" then
			self.setDaXiaSlot[k] = {};
			for index, _ in pairs(v.setSlot) do
				--״̬��Ϊ0   1�����λ�Ѿ���Ƕ 0����δ��Ƕ
				self.setDaXiaSlot[k][index] = 0
			end
		end
	end
end


--Ⱥ�����ͬ����λ״̬��Ϣ
function CQunXiaLuSystem:SynDaXiaSlot()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("error");
		return
	end;
	
	objPlayer.SynQunXiaLuDaXiaSlotMsg{setSlotState = self.setDaXiaSlot};
end


--Ⱥ������ ����λ�Ƿ������Ƕ
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


--Ⱥ������ ��Ƕ��λ
function CQunXiaLuSystem:DaXiaInlay(dwDaXiaIndex, dwSlotIndex, b_IsAutoBuy, b_IsUseGold)
	--����Ƿ�ӵ��Ȩ��
	if not self:HasAuthority('QunXiaLuDaXiaLu') then
		return false;
	end
	
	local slotId = _G.QunXiaLuDaXia[dwDaXiaIndex].setSlot[dwSlotIndex];
	local slotCfg = _G.QunXiaDaXiaSlotConfig[slotId];
	if not slotCfg then
		_err("CQunXiaLuSystem:DaXiaInlay slotCfg dont exist!!")
		return
	end
	
	
	--���ϵͳ�ڴ����Ƿ����dwDaXiaIndex,��dwSlotIndex ����������� �������ñ����� ��Ϊ��������������Ҫ����д���ڴ�����ݿ�
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
	
	--�������Ѿ���Ƕ�򷵻�
	if self.setDaXiaSlot[dwDaXiaIndex][dwSlotIndex] == 1 then
		return;
	end
	
	if not self:DaXiaCheckSlot(dwDaXiaIndex, dwSlotIndex) then 
		return;
	end
	
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
	
	
	self.setDaXiaSlot[dwDaXiaIndex][dwSlotIndex] = 1;
	
	--�������ݿ�
	local db_Info = {};
	db_Info.szDaXiaSlot = FormatGroupSlotStr(self.setDaXiaSlot);
	self.objDBQuery:UpdateDaXiaSlotInfo(db_Info);
	
	--������Ϣ
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("error");
		return
	end;
	
	--Ⱥ��¼Ⱥ�������Ƕ��λ
	objPlayer.QunXialuDaXiaSlotChangeMsg{DaXiaIndex = dwDaXiaIndex, SlotIndex = dwSlotIndex}
	
	
	--��������
	local allAttr = self:GetAllAttr();
	
	--��������
	self.SkillSystem:NotifyQunXiaLuUpdate(allAttr);
	
	--��ɹ㲥
	self:CheckCopeletem();
end
	
--����Ƿ���������д���¼��λ
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
		
		--ȫ���㲥
		CGameApp.QunXiaLuDaXiaCompeleteMsg{RoleId = dwRoleID, RoleName = szRoleName};
	end
end
