----------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------结婚信物相关------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
--购买结婚信物
function CMarriageSystem:BuyKeepsake(level)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_info("error can not get player by CMarriageSystem:BuyKeepsake");
		return;
	end;
	local itemEnumID = _G.MarriageConfig["Goods_" .. level .. "_ItemID"];
	if not itemEnumID then
		return;
	end;
	local price = CGlobalItemManager:GetBuyPrice(itemEnumID);
	--判断钱够不够
	if not self.ItemSystem:IsPacketMoneyEnough(price) then
		return;
	end;
	--判断背包有没有空位
	if not self.ItemSystem:IsPacketSlotEnoughFor(1) then
		return;
	end;
	--扣钱
	self.ItemSystem:CostPacketMoney(price, _G.ItemSysOperType.BuyKeepsake);
	--加道具
	local addItemList = {};
	local tempTable = {
		dwItemEnum	= itemEnumID;
		dwItemNumber= 1;
		dwBindType	= enItemBindType.eYes;
	};
	table.insert(addItemList, tempTable);
	local newItemInstID = self.ItemSystem:AddEnumItemListToPacket(addItemList, _G.ItemSysOperType.BuyKeepsake)
	--购买成功给客户端反馈
	objPlayer.MarSys_BuySuccessMsg{NewItemInstID = newItemInstID[1]};
end;

--信物更换
function CMarriageSystem:ChangeKeepsake(dwItemEnumID)
    local objPlayer = self:GetPlayer();
    local selfName = objPlayer:GetInfo().szRoleName;
    --要求只保留一个旧信物，所以先删除之前的信物
	local oldoldItemTable = self.ItemSystem:GetAllIDInKsRoom();
	for i=1, #oldoldItemTable do
		self.ItemSystem:DelObjItem(oldoldItemTable[i], _G.ItemSysOperType.Marriage);
	end;
	--加新的结婚信物到结婚信物容器中
	local addItemList = {};
	local tempTable = {
		dwItemEnum = dwItemEnumID;
		dwItemNumber=1;
		dwBindType = enItemBindType.eYes;
	}
	table.insert(addItemList, tempTable);
	local newItemInstID = self.ItemSystem:AddEnumItemListToKeepsake(addItemList, _G.ItemSysOperType.Marriage);
	--直接装备上,会换下旧的求婚信物并将旧的信物放入结婚信物容器中
	self.ItemSystem:WearKeepsake(newItemInstID[1]);
	--更新新的结婚信物的婚姻信息
	local newItemInst = self.ItemSystem:GetItem(newItemInstID[1]);
	if self.bIsMale then
		self.ItemSystem:SetItemDoodle(newItemInst:GetInstID(), string.format("%s;%s;%s", selfName, self.MateName, tostring(self.MarriedTime)));
	else
		self.ItemSystem:SetItemDoodle(newItemInst:GetInstID(), string.format("%s;%s;%s", self.MateName, selfName, tostring(self.MarriedTime)));
	end;
	--更新新的技能
	local skillSystem = objPlayer:GetSystem("CSkillSystem");
    --俩主动
    local level = newItemInst:GetLevel();
    skillSystem:ChangeSkill(_G.MarriageConfig.Goods_SkillID1, level);
    skillSystem:ChangeSkill(_G.MarriageConfig.Goods_SkillID2, level);
end;

--更换结婚信物
function CMarriageSystem:ChangeNewKeepsake(itemInstID)
	if not self.Married then return end;
	--得到新信物信息
	local itemInst      = self.ItemSystem:GetItem(itemInstID);
	if not itemInst then return end;
	if itemInst:GetParentType() * 1000 + itemInst:GetChildType() ~= 1060 then return end;
	--得到旧的求婚信物ID
	local oldItemInstID = self.ItemSystem:GetKeepSakeID();
	local oldItemInst   = self.ItemSystem:GetItem(oldItemInstID);
	if not oldItemInst then return end;
	if itemInst:GetLevel() <= oldItemInst:GetLevel() then return end;
	--得到角色性别
	local itemEnumID    = itemInst:GetEnumID();
	local itemEnumIDAfter;
    local itemEnumIDAfterMate;
	if self.bIsMale then
		itemEnumIDAfter     = _G.MarriageConfig["Goods_" .. itemEnumID .. "_After_ItemID1"];
        itemEnumIDAfterMate = _G.MarriageConfig["Goods_" .. itemEnumID .. "_After_ItemID2"];
	else
        itemEnumIDAfterMate = _G.MarriageConfig["Goods_" .. itemEnumID .. "_After_ItemID1"];
		itemEnumIDAfter     = _G.MarriageConfig["Goods_" .. itemEnumID .. "_After_ItemID2"];
	end;
	--删除完整的新信物
	self.ItemSystem:DelObjItem(itemInstID, _G.ItemSysOperType.Marriage);
    
    --更换信物
	self:ChangeKeepsake(itemEnumIDAfter);

    --通知KS结婚信物更换
    CKernelApp.MarMgr_ChangeKeepsakeMsg{RoleID = self.MateRoleID, ItemEnumID = itemEnumIDAfterMate};
	--通知客户端信物被更换
	self:NoticeKeepsakeBeChanged();
end;


--通知客户端信物被更换
function CMarriageSystem:NoticeKeepsakeBeChanged()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_info("error can not get player by CMarriageSystem:NoticeKeepsakeBeChanged");
		return;
	end;
	objPlayer.MarSys_NoticeKeepsakeBeChangedMsg{};
end;

--在线时结婚信物被更换
function CMarriageSystem:KeepsakeBeChangedOnline(dwItemEnum)
    --结婚信物更换
    self:ChangeKeepsake(dwItemEnum);
	--通知客户端信物被更换
	self:NoticeKeepsakeBeChanged();
end;

--离线时结婚信物被更换
function CMarriageSystem:KeepsakeBeChangedOffLine(dwItemEnum)
    --结婚信物更换
    self:ChangeKeepsake(dwItemEnum);
end;

--客户端要取回旧信物
function CMarriageSystem:RepossessKeepsake(b_PutPacket)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_info("error can not get player by CMarriageSystem:RepossessKeepsake");
		return;
	end;
	if b_PutPacket then
		--检测背包是否有空位
		if not self.ItemSystem:IsPacketSlotEnoughFor(1) then
			b_PutPacket = false;
		end;
	end;
	--检测是否有未取回信物
	local oldItemTable = self.ItemSystem:GetAllIDInKsRoom();
	if not oldItemTable[1] then return end;
	--得到装备实例
	local oldItemInst = self.ItemSystem:GetItem(oldItemTable[1]);
	if b_PutPacket then
		--将装备实例挪到背包
		self.ItemSystem:MoveItemToPacket(oldItemInst:GetInstID());
	else
		local mail = CMail:new();
		mail:SetSender(-9999, _G.MarriageError[54]);
		mail:SetReceiver(objPlayer:GetRoleID(), objPlayer:GetInfo().szRoleName);
		mail:SetContent(_G.MarriageError[55], _G.MarriageError[56]);
		mail:SetLifeTime(SMailInfo.life*24*3600*1000);
		local t_Item = {};
		local itemMessage = SItemMessage:new();
		oldItemInst:FillItemMessage(itemMessage);
		table.insert(t_Item, itemMessage);
		mail:SetAccessory(0, 0, 0, t_Item);
		CMailManager:SendMail(mail);
		self.ItemSystem:DelObjItem(oldItemTable[1], _G.ItemSysOperType.Divorce);
	end;
	self.HasKeepSakeNotTake = nil;
end;



