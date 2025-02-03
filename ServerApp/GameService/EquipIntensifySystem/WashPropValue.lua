--��ֵϴ������ ��ϴ����������ֵ����ֵ��

function CEquipIntensifySystem:WashPropValue(objPlayer, EquipID, ItemID)
	--Ȩ�޼��
	if not self:HasAuthority("EquipIntensify") then print("has no Authority") return end;
	--�õ�װ��ʵ��
	local equipInst = self.ItemSystem:GetItem(EquipID);
	local itemInst	= self.ItemSystem:GetItem(ItemID);
	--����Ƿ����
	if (not equipInst) or (not itemInst) then print("equipInst or itemInst dont exist") return end;
	--���EquipID�Ƿ���װ��
	if (not equipInst:IsEquip()) then print("equipInst is not equip") return end;
	--���װ����������
	if (not equipInst:IsAlive()) or (not itemInst:IsAlive()) then  print("equip or item is not alive") return end;
	--����Ƿ�����
	if self.ItemSystem:IsItemLocked(EquipID) or self.ItemSystem:IsItemLocked(ItemID) then print("equip or item is locked") return end;
	--���װ������λ��
	if not self:CheckInTable(_G.ResetAppendPropTypeConfig.CanIntensifyTable, equipInst:GetWearPos()) then print("equopInst wearpos wrong") return end;
	--�����Ʒʹ�õȼ��������ʹ�õȼ���װ����ʹ�õȼ����бȽϣ�
	--if equipInst:GetLevelNeeded() > itemInst:GetLevelNeeded() then print("equip level < item") return end;
	
	local equipPropTab = equipInst:GetProperty();
	local washPropConfig = _G.ResetAppendPropTypeConfig.WashAppendPropValueScroll[itemInst:GetEnumID()];
	
	for i,v in pairs(equipPropTab) do
		local myValue, scrollValue = equipPropTab[i].dwValue, _G.AddAppendPropValueConfig.MaxAppendPropValue
		--����ڴ������Աȼ�ֵ���Ի��� ˵�������������ᣬ��ʱ�����ٴ�ʹ�ü������Ծ�����
		if myValue > scrollValue then
			return 
		end
	end
	

	if washPropConfig then
		local scrollBindType = itemInst:GetBindType();
		self.ItemSystem:DelItemNumber(ItemID, 1, _G.ItemSysOperType.QiangHua);
		
		local successPro = math.random(1, 10000)
		if successPro <= washPropConfig.successRate then
			local equipPropID = equipInst:GetPropertyID();
			local propMax = 0;
			for i,v in pairs(equipPropTab) do
				local myValue, scrollValue = equipPropTab[i].dwValue, _G.AddAppendPropValueConfig.MaxAppendPropValue
				equipPropTab[i].dwValue = myValue < scrollValue and scrollValue or myValue;
			end
			
			self.ItemSystem:SetItemProperty(equipInst:GetInstID(), equipPropTab);
			
			if scrollBindType == _G.enItemBindType.eYes then
				self.ItemSystem:BindItem(equipInst:GetInstID());
			end
			
			local mountSystem = objPlayer:GetSystem("CMountSystem");
			if mountSystem then
				mountSystem:EquipChange(equipInst);
			end
			--�ɹ�
			objPlayer.EISys_WashPropScrollRetMsg{IsSuccess = 1};
			
			--�������
			local s_PlayerName = objPlayer:GetInfo().szRoleName;
			--���RoleID
			local n_PlayerRoleID = objPlayer:GetInfo().dwRoleID;
			--װ��������Ϣ
			local itemNetData = equipInst:GetNetData();
			--ȫ���㲥
			CGameApp.EISys_ScrollBroadCastMsg{PlayerName = s_PlayerName, PlayerRoleID = n_PlayerRoleID, ItemNetData = itemNetData, ScrollID = itemInst:GetEnumID()};
		else
			objPlayer.EISys_WashPropScrollRetMsg{IsSuccess = 0};
		end
	end;
end;