--坐骑装备相关 add by lkj 05/10/2012

local TypeToPos = {
	[70] = 1;
	[71] = 2;
	[72] = 3;
	[73] = 4;
};
local function IsMountEquip(itemInst)
	if itemInst:GetParentType() ~= 1 then return false end;
	if itemInst:GetChildType() < 70 or itemInst:GetChildType() > 73 then return false end;
	return true, TypeToPos[itemInst:GetChildType()];
end;

--给指定坐骑穿上某件装备
function CMountSystem:PutOnEquip(n_MountInstID, n_ItemInstID)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("CMountSystem:PutOnEquip() get player err!!!");
		return;
	end;
	local newEquipInst = self.ItemSystem:GetItem(n_ItemInstID);
	if not newEquipInst then return end;
	local mountInst = self:GetMountInst(n_MountInstID);
	if not mountInst then return end;
	--装备类型检测
	local b_IsMountEquip, n_EquipPos = IsMountEquip(newEquipInst);
	if not b_IsMountEquip then return end;
	--装备需要等级检测
	if newEquipInst:GetLevelNeeded() > mountInst:GetFianlyLevel() then return	end;
	if (newEquipInst:GetQuality() >= _G.enQualityType.ePink) and (not newEquipInst:IsBind()) then
		self.ItemSystem:BindItem(n_ItemInstID);
	end;
	--检测通过穿装备
	local oldEquipID = mountInst.t_Equip[n_EquipPos];
	local oldEquipInst = self.ItemSystem:GetItem(oldEquipID);
	--更新新的坐骑装备
	mountInst.t_Equip[n_EquipPos] = n_ItemInstID;
	if oldEquipInst then
		local _, dwSlot = oldEquipInst:GetPosInfo();
		self.ItemSystem:MoveItemToHorseEquipSlot(n_ItemInstID, dwSlot);
	else
		self.ItemSystem:MoveItemToHorseEquip(n_ItemInstID);
	end;
	self:InsertDirty(n_MountInstID);
	self.b_ImmediatelySave = true;
	if n_MountInstID == self.n_ActiveMountID then
		self:AttributeChange();
	end;
	objPlayer.MountSys_SynchronizeEquipMsg{
		MountInstID = n_MountInstID;
		EquipPos	= n_EquipPos;
		EquipID		= n_ItemInstID;
	};
end;
--给指定坐骑脱下某件装备
function CMountSystem:PutOffEquip(n_MountInstID, n_EquipPos, n_PosPage, n_PosSlot)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("CMountSystem:PutOffEquip() get player err!!!");
		return;
	end;
	local mountInst = self:GetMountInst(n_MountInstID);
	if not mountInst then return end;
	local n_EquipID = mountInst.t_Equip[n_EquipPos];
	local equipInst = self.ItemSystem:GetItem(n_EquipID);
	if not equipInst then return end;
	--检测要放入的位置的有效性
	--说明是向指定位置脱下装备
	if n_PosPage > 0 and n_PosSlot > 0 then
		if not self.ItemSystem:MoveItemToPacketSlot(equipInst:GetInstID(), n_PosPage * n_PosSlot) then return end;
	else
		if not self.ItemSystem:MoveItemToPacket(equipInst:GetInstID()) then return end;
	end;
	--脱下装备
	mountInst.t_Equip[n_EquipPos] = 0;
	
	self:InsertDirty(n_MountInstID);
	self.b_ImmediatelySave = true;
	if n_MountInstID == self.n_ActiveMountID then
		self:AttributeChange();
	end;
	objPlayer.MountSys_SynchronizeEquipMsg{
		MountInstID = n_MountInstID;
		EquipPos	= n_EquipPos;
		EquipID		= 0;
	};
end;
--强化装备变化
function CMountSystem:EquipChange(equipInst)
	local mountInst = self:GetMountInst(self.n_ActiveMountID);
	if mountInst then
		for k, v in pairs (mountInst.t_Equip) do
			if v == equipInst.dwItemID then
				self:AttributeChange();
				break;
			end;
		end;
	end;
end;



