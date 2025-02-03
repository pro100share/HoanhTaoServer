--极值洗炼卷轴 （洗附加属性数值到极值）

function CEquipIntensifySystem:WashPropValue(objPlayer, EquipID, ItemID)
	--权限检查
	if not self:HasAuthority("EquipIntensify") then print("has no Authority") return end;
	--得到装备实例
	local equipInst = self.ItemSystem:GetItem(EquipID);
	local itemInst	= self.ItemSystem:GetItem(ItemID);
	--检测是否存在
	if (not equipInst) or (not itemInst) then print("equipInst or itemInst dont exist") return end;
	--检测EquipID是否是装备
	if (not equipInst:IsEquip()) then print("equipInst is not equip") return end;
	--检测装备生命周期
	if (not equipInst:IsAlive()) or (not itemInst:IsAlive()) then  print("equip or item is not alive") return end;
	--检测是否锁定
	if self.ItemSystem:IsItemLocked(EquipID) or self.ItemSystem:IsItemLocked(ItemID) then print("equip or item is locked") return end;
	--检测装备穿戴位置
	if not self:CheckInTable(_G.ResetAppendPropTypeConfig.CanIntensifyTable, equipInst:GetWearPos()) then print("equopInst wearpos wrong") return end;
	--检测物品使用等级（卷轴的使用等级和装备的使用等级进行比较）
	--if equipInst:GetLevelNeeded() > itemInst:GetLevelNeeded() then print("equip level < item") return end;
	
	local equipPropTab = equipInst:GetProperty();
	local washPropConfig = _G.ResetAppendPropTypeConfig.WashAppendPropValueScroll[itemInst:GetEnumID()];
	
	for i,v in pairs(equipPropTab) do
		local myValue, scrollValue = equipPropTab[i].dwValue, _G.AddAppendPropValueConfig.MaxAppendPropValue
		--如果在此书属性比极值属性还大 说明用了其他卷轴，此时不能再次使用极致属性卷轴了
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
			--成功
			objPlayer.EISys_WashPropScrollRetMsg{IsSuccess = 1};
			
			--玩家姓名
			local s_PlayerName = objPlayer:GetInfo().szRoleName;
			--玩家RoleID
			local n_PlayerRoleID = objPlayer:GetInfo().dwRoleID;
			--装备网络信息
			local itemNetData = equipInst:GetNetData();
			--全服广播
			CGameApp.EISys_ScrollBroadCastMsg{PlayerName = s_PlayerName, PlayerRoleID = n_PlayerRoleID, ItemNetData = itemNetData, ScrollID = itemInst:GetEnumID()};
		else
			objPlayer.EISys_WashPropScrollRetMsg{IsSuccess = 0};
		end
	end;
end;