

function CEquipIntensifySystem:AppointLevel(objPlayer, EquipID, ItemID)
	--Ȩ�޼��
	if not self:HasAuthority("EquipIntensify") then return end;
	--�õ�װ��ʵ��
	local equipInst = self.ItemSystem:GetItem(EquipID);
	local itemInst	= self.ItemSystem:GetItem(ItemID);
	--����Ƿ����
	if (not equipInst) or (not itemInst) then return end;
	--���EquipID�Ƿ���װ��
	if (not equipInst:IsEquip()) then return end;
	--���װ����������
	if (not equipInst:IsAlive()) or (not itemInst:IsAlive()) then return end;
	--���װ������λ��
	if not self:CheckInTable(_G.EquipIntensifyConfig.CanIntensifyTable, equipInst:GetWearPos()) then return end;
	--����Ƿ�����
	if self.ItemSystem:IsItemLocked(EquipID) or self.ItemSystem:IsItemLocked(ItemID) then return end;
	
	local level = _G.EquipIntensifyConfig.AppointLevel[itemInst:GetEnumID()];
	if level then
		if equipInst:GetStrongLevel() >= level then return end;
		self.ItemSystem:DelItemNumber(ItemID, 1, _G.ItemSysOperType.QiangHua);
		self.ItemSystem:SetItemStrongLevel(EquipID, level);
		if itemInst:IsBind() and (not equipInst:IsBind()) then
			self.ItemSystem:BindItem(EquipID);
		end;
		local mountSystem = objPlayer:GetSystem("CMountSystem");
		if mountSystem then
			mountSystem:EquipChange(equipInst);
		end;
		--�ɹ�
		objPlayer.EISys_AppointLevelSucMsg{};
		
		--�������
		local s_PlayerName = objPlayer:GetInfo().szRoleName;
		--���RoleID
		local n_PlayerRoleID = objPlayer:GetInfo().dwRoleID;
		--װ��������Ϣ
		local itemNetData = equipInst:GetNetData();
		--ȫ���㲥
		CGameApp.EISys_ScrollBroadCastMsg{PlayerName = s_PlayerName, PlayerRoleID = n_PlayerRoleID, ItemNetData = itemNetData, ScrollID = itemInst:GetEnumID()};
	end;
end;


