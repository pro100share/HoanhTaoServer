

function CEquipIntensifySystem:AppointLevel(objPlayer, EquipID, ItemID)
	--权限检查
	if not self:HasAuthority("EquipIntensify") then return end;
	--得到装备实例
	local equipInst = self.ItemSystem:GetItem(EquipID);
	local itemInst	= self.ItemSystem:GetItem(ItemID);
	--检测是否存在
	if (not equipInst) or (not itemInst) then return end;
	--检测EquipID是否是装备
	if (not equipInst:IsEquip()) then return end;
	--检测装备生命周期
	if (not equipInst:IsAlive()) or (not itemInst:IsAlive()) then return end;
	--检测装备穿戴位置
	if not self:CheckInTable(_G.EquipIntensifyConfig.CanIntensifyTable, equipInst:GetWearPos()) then return end;
	--检测是否锁定
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
		--成功
		objPlayer.EISys_AppointLevelSucMsg{};
		
		--玩家姓名
		local s_PlayerName = objPlayer:GetInfo().szRoleName;
		--玩家RoleID
		local n_PlayerRoleID = objPlayer:GetInfo().dwRoleID;
		--装备网络信息
		local itemNetData = equipInst:GetNetData();
		--全服广播
		CGameApp.EISys_ScrollBroadCastMsg{PlayerName = s_PlayerName, PlayerRoleID = n_PlayerRoleID, ItemNetData = itemNetData, ScrollID = itemInst:GetEnumID()};
	end;
end;


