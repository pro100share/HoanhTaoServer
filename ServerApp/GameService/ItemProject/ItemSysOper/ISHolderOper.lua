------------------------------------
------------------------------------
--道具系统内部的接口文件
--author lkj



--获取容器对象
function CItemSystem:GetHolder(dwHolderClass)
	return self.setHolders[dwHolderClass];
end;


--获取背包对象
function CItemSystem:GetPacket()
	return self:GetHolder(enItemPosition.ePacket);
end;

--获取仓库对象
function CItemSystem:GetStorage()
	return self:GetHolder(enItemPosition.eStorage);
end;

--获取装备容器对象
function CItemSystem:GetEquipHolder()
	return self:GetHolder(enItemPosition.ePutOn);
end;

--获取卖给NPC商店的道具容器
function CItemSystem:GetStore()
	return self:GetHolder(enItemPosition.eStore);
end;

--获取护身宝甲熔炼容器对象
function CItemSystem:GetAmulet()
	return self:GetHolder(enItemPosition.eAmulet);
end;

--获取结婚信物容器对象
function CItemSystem:GetKeepsake()
	return self:GetHolder(enItemPosition.eKeepsake);
end;

--获取宝石容器对象
function CItemSystem:GetStoneRoom()
    return self:GetHolder(enItemPosition.eStone);
end;

--获取分解容器对象
function CItemSystem:GetDecompose()
	return self:GetHolder(enItemPosition.eDecompose);
end;


--增加背包格子数
function CItemSystem:AddPacketSlotNum(dwNum)
	self:GetPacket():AddSlotNum(dwNum);
	self:OperSys(_G.enItemSysUpdOper.ePacketSlotNum, self:GetPacket():GetSlotNum());
end;

--增加仓库格子数
function CItemSystem:AddStorageSlotNum(dwNum)
	self:GetStorage():AddSlotNum(dwNum);
	self:OperSys(_G.enItemSysUpdOper.eStorageSlotNum, self:GetStorage():GetSlotNum());
end;

--客户端请求扩展背包或者仓库
function CItemSystem:ExtendHolder(dwHolderClass)
	if dwHolderClass == _G.enItemPosition.ePacket then
		self:AddPacketSlotNum(_G.InitConfig.dwPacketExtendOnceNum);
	elseif dwHolderClass == _G.enItemPosition.eStorage then
		self:AddStorageSlotNum(_G.InitConfig.dwStorageExtendOnceNum);
	else
		_err("extend err holder");
	end;
end



--获得在指定容器中的指定配置ID道具的个数
function CItemSystem:GetEnumItemNumInHolder(dwHolderClass, dwEnumID)
	local holder = self:GetHolder(dwHolderClass);
	local setItemIDs = holder:GetItemIDSetByEnumID(dwEnumID);
	local dwCounts = 0;
	local dwBindNum = 0;
	local dwUnBindNum = 0;
	for _, dwItemID in ipairs(setItemIDs) do
		if not self:IsItemLocked(dwItemID) then
			local objItem = self:GetItemInst(dwItemID);
			if objItem:IsAlive() then
				dwCounts = dwCounts + objItem:GetCount();
				if objItem:IsBind() then
					dwBindNum = dwBindNum + objItem:GetCount();
				else
					dwUnBindNum = dwUnBindNum + objItem:GetCount();
				end;
			end;
		end;
	end;
	return dwCounts, dwBindNum, dwUnBindNum;
end;

--获取在指定容器中的指定配置ID道具的实例
function CItemSystem:GetEnumItemInstInHolder(dwHolderClass, dwEnumID)
	local holder = self:GetHolder(dwHolderClass);
	local setItemIDs = holder:GetItemIDSetByEnumID(dwEnumID);
	local setBindObjs = {};
	local setUnBindObjs = {};
	for _, dwItemID in ipairs(setItemIDs) do
		local objItem = self:GetItemInst(dwItemID);
		if objItem:IsAlive() then
			if objItem:IsBind() then
				table.insert(setBindObjs, objItem);
			else
				table.insert(setUnBindObjs, objItem);
			end;
		end;
	end;
	return setBindObjs, setUnBindObjs;
end;


--移动道具到指定容器指定位置
function CItemSystem:MoveItemToHolderSlot(itemInst, fromHolder, dwFromSlot, toHolder, dwToSlot)
	if fromHolder == toHolder then
		toHolder:MoveItemFromXToY(dwFromSlot, dwToSlot);
	else
		fromHolder:DelItem(itemInst);
		toHolder:AddItemToSlot(itemInst, dwToSlot);
	end;
	
	self:DoSetItemPosInfo(itemInst, toHolder:GetClass(), dwToSlot);
end;



--整理容器
function CItemSystem:DoPackUpHolder(dwHolderClass)
	local holder = self:GetHolder(dwHolderClass);
	local setAllItemIDs = holder:GetAllItemID();
	local setAllObjItems = {};
	for _, dwInstID in ipairs(setAllItemIDs) do
		local objItem = self:GetItemInst(dwInstID);
		setAllObjItems[dwInstID] = objItem;
	end;
	
	
	local tbRslOpeList = _G.SortHolderItem(setAllObjItems);
	--先删除
	for _, v in ipairs(tbRslOpeList[_G.enItemSysOper.eDel]) do
		local objItem = self:GetItemInst(v[1]);
		self:DoDelItem(objItem, "combine");
	end;
	local posChange = {};
	for _, v in ipairs(tbRslOpeList[_G.enItemSysOper.eUpd]) do
		local objItem = self:GetItemInst(v[1]);
		if objItem then
			if v[2] == enItemUpdOper.eAdd then
				self:DoAddItemNum(objItem, v[3][1], "combine");
			elseif v[2] == enItemUpdOper.eDel then
				self:DoDelItemNum(objItem, v[3][1], "combine");
			else--enItemUpdOper.ePosn
				table.insert(posChange, {objItem, v[3][2]});
			end;
		end;
	end;
	if #posChange > 0 then
		--先清空之前的位置信息
		for _, v in ipairs(posChange) do
			local _, dwSlot = v[1]:GetPosInfo();
			holder:SetSlotItemInfo(dwSlot, 0);
		end;
		for _, v in ipairs(posChange) do
			local dwSlot = v[2];
			holder:SetSlotItemInfo(dwSlot, v[1]:GetInstID());
			--设置新的位置信息
			self:DoSetItemPosInfo(v[1], dwHolderClass, dwSlot);
		end;
	end;
end;



