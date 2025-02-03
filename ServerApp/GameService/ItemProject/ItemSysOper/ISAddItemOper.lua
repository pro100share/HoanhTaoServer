------------------------------------
------------------------------------
--道具系统内部的接口文件
--author lkj


------------------------------------------------
------------判断容器是否有足够空间容纳----------
------------------------------------------------
--判断是否有足够的空间，传入一组物品，
--表格：key为序号，value为表（dwItemEnum , dwItemNumber, dwBindType, dwLifeTime, dwBornTime）
function CItemSystem:IsEnumItemListCanAddTo(dwHolderClass, tabAddList)
	if type(tabAddList) ~= "table" then
		_info("itemsystem param type error!!!");
		return false;
	end;
	for _, v in ipairs(tabAddList) do
		if v.dwItemEnum and CGlobalItemManager:IsHaveThisItem(v.dwItemEnum) then
			if not v.dwItemNumber or v.dwItemNumber <= 0 then
				_err("v.dwItemNumber nil or <= 0!!!", v.dwItemNumber);
				return false;
			end;
		else
			_err("v.dwItemEnum nil or not exist!!!", v.dwItemEnum);
			return false;
		end;
	end;
	--获取容器
	local holder = self:GetHolder(dwHolderClass);
	--首先找出不能合并的，看看需要多少个空位
	local dwSlotNeeded = 0;
	local setCanMerge = {};
	for _, v in ipairs(tabAddList) do
		if CGlobalItemManager:IsCanMerge(v.dwItemEnum) then
			table.insert(setCanMerge, v);
		else
			if holder:IsCanAddEnumItem(v.dwItemEnum, 1) then
				dwSlotNeeded = dwSlotNeeded + v.dwItemNumber;
			else
				return false;
			end;
		end;
	end;
	--如果空位不够直接返回false，不用再尝试合并了。
	if not holder:IsSlotEnoughFor(dwSlotNeeded) then
		return false;
	end;
	--生成时间，如果参数中为空则用此值，判断合并用。
	local dwNowTime = GetCurTime();
	--合并表，相同的东西分类,避免出现配置重复造成判断合并结果错误。
	local setAddList = {};
	for _, tabMsg in ipairs(setCanMerge) do
		local dwItemEnum = tabMsg.dwItemEnum;
		local dwBindType = tabMsg.dwBindType or CGlobalItemManager:GetBindType(dwItemEnum);
		local dwLifeTime = tabMsg.dwLifeTime or CGlobalItemManager:GetLifeTime(dwItemEnum);
		local dwBornTime = tabMsg.dwBornTime or dwNowTime
		setAddList[dwItemEnum] = setAddList[dwItemEnum] or {};
		setAddList[dwItemEnum][dwBindType] = setAddList[dwItemEnum][dwBindType] or {};
		setAddList[dwItemEnum][dwBindType][dwLifeTime] = setAddList[dwItemEnum][dwBindType][dwLifeTime] or {};
		setAddList[dwItemEnum][dwBindType][dwLifeTime][dwBornTime] = setAddList[dwItemEnum][dwBindType][dwLifeTime][dwBornTime] or 0;
		setAddList[dwItemEnum][dwBindType][dwLifeTime][dwBornTime] = setAddList[dwItemEnum][dwBindType][dwLifeTime][dwBornTime] + tabMsg.dwItemNumber;
	end
	
	--先判断能合并多少，找出合并后仍需要新new出Item的。
	for dwItemEnum, v1 in pairs(setAddList) do
		for dwBindType, v2 in pairs(v1) do
			for dwLifeTime, v3 in pairs(v2) do
				for dwBornTime, dwAddNumber in pairs(v3) do
					local dwNewNumber = dwAddNumber;
					local setItemIDs = holder:GetItemIDSetByEnumID(dwItemEnum);
					for _, itemInstID in ipairs(setItemIDs) do
						if dwNewNumber <= 0 then break; end;
						if not self:IsItemLocked(itemInstID) then
							local objItem = self:GetItemInst(itemInstID);
							dwNewNumber = dwNewNumber - objItem:CanMergeHowMany(dwItemEnum, dwBindType, dwLifeTime, dwBornTime);
						end;
					end;
					if dwNewNumber > 0 then
						local a = math.floor(dwNewNumber / CGlobalItemManager:GetMaxRepeat(dwItemEnum));
						local b = dwNewNumber % CGlobalItemManager:GetMaxRepeat(dwItemEnum);
						dwSlotNeeded = dwSlotNeeded + (a + (b > 0 and 1 or 0));
						if not holder:IsCanAddEnumItem(dwItemEnum, dwSlotNeeded) then
							return false;
						end;
					end;
				end;
			end;
		end;
	end;
		
	return true;
end

--判断是否有足够的空间，传入一个物品的对象表，key为序号，value为objItem
function CItemSystem:IsObjItemListCanAddTo(tabItemList, dwHolderClass)
	--将道具对象需要检测的信息提取出来。
	local setAddTable = {};
	for _, objItem in pairs(tabItemList) do
		local msg = {};
		msg.dwItemEnum = objItem:GetEnumID();
		msg.dwItemNumber = objItem:GetCount();
		msg.dwBindType = objItem:GetBindType();
		msg.dwLifeTime = objItem:GetLifeTime();
		msg.dwBornTime = objItem:GetBornTime();
		table.insert(setAddTable, msg);
	end;
	return self:IsEnumItemListCanAddTo(dwHolderClass, setAddTable);
end


-------------------------------------------
------------增加道具相关接口---------------
-------------------------------------------

function CItemSystem:AddEnumItemListTo(dwHolderClass, setAddList, szType)
	local addTable = {};
	if not self:IsEnumItemListCanAddTo(dwHolderClass, setAddList) then return false end;
	--获取容器
	local holder = self:GetHolder(dwHolderClass);
	--生成时间，如果参数中为空则用此值，判断合并用。
	local dwNowTime = GetCurTime();
	for _, tabMsg in ipairs(setAddList) do
		--变量初始化
		local dwItemEnum = tabMsg.dwItemEnum;
		local dwNumber	 = tabMsg.dwItemNumber;
		local dwAddNum	 = dwNumber;
		local dwBindType = tabMsg.dwBindType or CGlobalItemManager:GetBindType(dwItemEnum);--默认赋值
		local dwLifeTime = tabMsg.dwLifeTime or CGlobalItemManager:GetLifeTime(dwItemEnum);
		local dwBornTime = tabMsg.dwBornTime or dwNowTime;
		local strDoodle	 = tabMsg.strDoodle or "";
		local setItemIDs = holder:GetItemIDSetByEnumID(dwItemEnum);
		
		
		for _, itemInstID in ipairs(setItemIDs) do
			if not self:IsItemLocked(itemInstID) then
				local objItem = self:GetItemInst(itemInstID);
				local mergeNum = objItem:CanMergeHowMany(dwItemEnum, dwBindType, dwLifeTime, dwBornTime);
				if mergeNum > 0 then
					table.insert(addTable, objItem:GetInstID());
					if mergeNum >= dwNumber then
						self:DoAddItemNum(objItem, dwNumber, szType);
						dwNumber = 0;
					else
						self:DoAddItemNum(objItem, mergeNum, szType);
						dwNumber = dwNumber - mergeNum;
					end;
					if objItem:IsEquip() then
						if tabMsg.setProperty then
							self:DoSetEquipProperty(objItem, tabMsg.setProperty);
						end;
						if tabMsg.dwStrongLevel then
							self:DoSetEquipStrongLevel(objItem, tabMsg.dwStrongLevel);
						end;
						if tabMsg.dwTianSheng then
							self:DoSetEquipTianSheng(objItem, tabMsg.dwTianSheng);
						end;
					end;
					if dwNumber <= 0 then break; end;
				end;
			end;
		end;
		if dwNumber > 0 then
			local a = math.floor(dwNumber / CGlobalItemManager:GetMaxRepeat(dwItemEnum));
			local b = dwNumber % CGlobalItemManager:GetMaxRepeat(dwItemEnum);
			for i=1, a do
				local objItem = CItem:New(dwItemEnum);
				objItem:SetCount(CGlobalItemManager:GetMaxRepeat(dwItemEnum));
				objItem:SetBindType(dwBindType);
				objItem:SetLifeTime(dwLifeTime);
				objItem:SetBornTime(dwBornTime);
				objItem:SetDoodle(strDoodle);
				if objItem:IsEquip() then
					if tabMsg.setProperty then
						objItem:SetProperty(tabMsg.setProperty);
					end;
					if tabMsg.dwStrongLevel then
						objItem:SetStrongLevel(tabMsg.dwStrongLevel);
					end;
					if tabMsg.dwTianSheng then
						objItem:SetTianSheng(tabMsg.dwTianSheng);
					end;
				end;
				self:AddObjItemToHolder(objItem, dwHolderClass, szType);
				table.insert(addTable, objItem:GetInstID());
			end;
			if b > 0 then
				local objItem = CItem:New(dwItemEnum);
				objItem:SetCount(b);
				objItem:SetBindType(dwBindType);
				objItem:SetLifeTime(dwLifeTime);
				objItem:SetBornTime(dwBornTime);
				if objItem:IsEquip() then
					if tabMsg.setProperty then
						objItem:SetProperty(tabMsg.setProperty);
					end;
					if tabMsg.dwStrongLevel then
						objItem:SetStrongLevel(tabMsg.dwStrongLevel);
					end;
					if tabMsg.dwTianSheng then
						objItem:SetTianSheng(tabMsg.dwTianSheng);
					end;
				end;
				self:AddObjItemToHolder(objItem, dwHolderClass, szType);
				table.insert(addTable, objItem:GetInstID());
			end;
		end;
		--通知其他系统增加道具
		self:DoItemEvent("NotifyItemAdded", dwItemEnum, dwAddNum);
        --日志记录
        self:LogAddItem(dwItemEnum, dwAddNum, szType, dwBindType);
	end;
	return addTable;
end;

--向指定容器添加一组道具对象
function CItemSystem:AddObjItemListTo(setAddList, dwHolderClass, szType)
	--将道具对象信息提取出来。
	local setAddTable = {};
	for _, objItem in pairs(setAddList) do
		local msg = {};
		msg.dwItemEnum = objItem:GetEnumID();
		msg.dwItemNumber = objItem:GetCount();
		msg.dwBindType = objItem:GetBindType();
		msg.dwLifeTime = objItem:GetLifeTime();
		msg.dwBornTime = objItem:GetBornTime();
		msg.strDoodle	= objItem:GetDoodle();
		if objItem:IsEquip() then
			if objItem:GetStrongLevel() > 0 then
				msg.dwStrongLevel = objItem:GetStrongLevel();
			end;
			if #objItem:GetProperty() > 0 then
				msg.setProperty = objItem:GetProperty();
			end;
			if objItem:GetTianSheng() > 0 then
				msg.dwTianSheng = objItem:GetTianSheng();
			end;
		end;
		table.insert(setAddTable, msg);
	end;
	return self:AddEnumItemListTo(dwHolderClass, setAddTable, szType);
end;


--添加一个道具实例到指定容器
function CItemSystem:AddObjItemToHolder(objItem, dwHolderClass, szType)
	local holder = self:GetHolder(dwHolderClass);
	local dwSlot = holder:GetOneEmptySlot();
	self:AddObjItemToHolderSlot(objItem, dwHolderClass, dwSlot, szType);
end;

--添加一个道具实例到指定容器、指定地方
function CItemSystem:AddObjItemToHolderSlot(objItem, dwHolderClass, dwSlot, szType)
	objItem:SetInstID(self:GetNextItemID());
	objItem:SetRoleID(self:GetPlayer():GetRoleID());
	objItem:SetPosInfo(dwHolderClass, dwSlot);
	self:DoAddItem(objItem);
	self:OperAdd(objItem, szType);
end;


--增加道具个数
function CItemSystem:DoAddItemNum(objItem, dwNumber, szType)
	objItem:AddNumber(dwNumber);
	self:OperUpd(objItem, _G.enItemUpdOper.eAdd, {dwNumber}, szType);
end;

--增加道具
function CItemSystem:DoAddItem(objItem)
	local dwHolderClass, dwSlot = objItem:GetPosInfo();
	local holder = self:GetHolder(dwHolderClass);
	self.ItemList[objItem:GetInstID()] = objItem;
	holder:AddItemToSlot(objItem, dwSlot);
end;

--创建系统时生成道具
function CItemSystem:DoCreateAddItem(objItem)
	local objPlayer = self:GetPlayer();
	local dwRoleID = objPlayer:GetRoleID();
	local dwHolderClass, dwSlot = objItem:GetPosInfo();
	local holder = self:GetHolder(dwHolderClass);
	if holder:IsSlotAlreadyHaveItem(dwSlot) then
		table.insert(self.tSameSlotItems, objItem);
	else
		self.ItemList[objItem:GetInstID()] = objItem;
		holder:AddItemToSlot(objItem, dwSlot);
		if objPlayer:GetSystem("CEquipIntensifySystem") then
			if objItem and objItem:IsEquip() and not objPlayer:GetSystem("CEquipIntensifySystem"):CheckInTable(_G.EquipIntensifyConfig.CanIntensifyTable, objItem:GetWearPos()) then 
				if objItem:GetStrongLevel() > 0 then
					objItem:SetStrongLevel(0);
					local SqlCmd = self.objDB:CreateUpdateCmd("T_Role_Item_Equip");
					SqlCmd.Wheres.dwRoleID = dwRoleID;
					SqlCmd.Wheres.dwItemID = objItem:GetInstID();
					SqlCmd.Fields.dwStrongLevel = 0;
					SqlCmd:execute();
				end;
			end;
		end;
	end;
end;

function CItemSystem:DoCreateAddItemOver()
	local objPlayer = self:GetPlayer();
	local dwRoleID = objPlayer:GetRoleID();
	for _, objItem in ipairs(self.tSameSlotItems) do
		local dwHolderClass, dwSlot = objItem:GetPosInfo();
		local holder = self:GetHolder(dwHolderClass);
		dwSlot = holder:GetOneEmptySlot();
		if dwSlot then
			objItem:SetPosInfo(dwHolderClass, dwSlot);
			self.ItemList[objItem:GetInstID()] = objItem;
			holder:AddItemToSlot(objItem, dwSlot);
			local SqlCmd;
			if objItem:IsEquip() then
				SqlCmd = self.objDB:CreateUpdateCmd("T_Role_Item_Equip");
			else
				SqlCmd = self.objDB:CreateUpdateCmd("T_Role_Item_Normal");
			end;
			SqlCmd.Wheres.dwRoleID = dwRoleID;
			SqlCmd.Wheres.dwItemID = objItem:GetInstID();
			SqlCmd.Fields.dwPosSlot = objItem:GetDBPosInfo();
			SqlCmd:execute();
		else
			_info("IS ERROR!!! slot have item and holder full!!!", dwHolderClass);
		end;
	end;
end;


