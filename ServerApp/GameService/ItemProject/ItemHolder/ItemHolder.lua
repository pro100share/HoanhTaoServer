
--道具容器工厂
_G.CItemHolder = {};

local functionMap = {
    --背包
	[_G.enItemPosition.ePacket]		= function(itemSystem) return CPacket:New(_G.enItemPosition.ePacket) 	end;
    --仓库
	[_G.enItemPosition.eStorage]	= function(itemSystem) return CStorage:New(_G.enItemPosition.eStorage) 	end;
    --装备
	[_G.enItemPosition.ePutOn]		= function(itemSystem) return CEquipPutOnRoom:New(_G.enItemPosition.ePutOn, itemSystem)    end;
    --在NPC商店
	[_G.enItemPosition.eStore]		= function(itemSystem) return CItemBaseHolder:New(_G.enItemPosition.eStore,     _G.ItemSystemSlotNumConfig.buyBack) end;
    --玩家摆摊
	[_G.enItemPosition.eBooth]		= function(itemSystem) return CItemBaseHolder:New(_G.enItemPosition.eBooth,     _G.ItemSystemSlotNumConfig.onSell)  end;
    --玩家旧信物
	[_G.enItemPosition.eKeepsake]	= function(itemSystem) return CItemBaseHolder:New(_G.enItemPosition.eKeepsake,  _G.ItemSystemSlotNumConfig.oldKpsk) end;
    --玩家存放任务物品的空间
	[_G.enItemPosition.eTaskRoom]	= function(itemSystem) return CItemBaseHolder:New(_G.enItemPosition.eTaskRoom,  _G.ItemSystemSlotNumConfig.task)    end;
    --玩家存放护身宝甲熔炼炉的空间
	[_G.enItemPosition.eAmulet]		= function(itemSystem) return CItemBaseHolder:New(_G.enItemPosition.eAmulet,    _G.ItemSystemSlotNumConfig.amulet)  end;
    --玩家坐骑装备存放的空间
	[_G.enItemPosition.eHorseEquip]	= function(itemSystem) return CItemBaseHolder:New(_G.enItemPosition.eHorseEquip, 4) end;
    --玩家镶嵌石头存放的空间
	[_G.enItemPosition.eStone]		= function(itemSystem) return CStoneRoom:New(_G.enItemPosition.eStone, itemSystem) end;
	--玩家要分解的装备存放的空间
	[_G.enItemPosition.eDecompose]		= function(itemSystem) return CItemBaseHolder:New(_G.enItemPosition.eDecompose, _G.ItemSystemSlotNumConfig.decompose) end;
};

function CItemHolder:New(class, itemSystem)
	local objHolder = functionMap[class](itemSystem);
	return objHolder;
end;



--道具系统的物品容器基类
_G.CItemBaseHolder = {};

function CItemBaseHolder:New(dwHolderClass, dwSlotNum)
	local obj = {};
	
	--变量
	----容器类型
	obj.dwHolderClass = dwHolderClass;
	
	--需维护的表
	----位置对应道具ID表
	obj.setSlotToItemID		= {};
    ----栏位数
    obj.dwSlotNum           = dwSlotNum;
    ----空栏位个数
	obj.dwEmpSlotNum 	    = dwSlotNum;
    ----栏位初始化
    for i=1, dwSlotNum do
        obj.setSlotToItemID[i] = 0;
    end;
	----配置ID对应道具ID表
	obj.setEnumIDToItemID	= {};
	
	setmetatable(obj, {__index = CItemBaseHolder});
	
	return obj;
end;




--获取自己的容器类型
function CItemBaseHolder:GetClass()
	return self.dwHolderClass;
end;

--获取栏位个数
function CItemBaseHolder:GetSlotNum()
	return self.dwSlotNum;
end;

--获取空栏位的个数
function CItemBaseHolder:GetEmptySlotNum()
	return self.dwEmpSlotNum;
end;

--是否能够将道具放入指定位置
function CItemBaseHolder:IsCanAddItemToSlot(objItem, dwSlot)
    if dwSlot then
		return dwSlot <= self:GetSlotNum();
	else
		return self:GetEmptySlotNum() > 0 ;
	end;
end;

--空闲位置是否满足需要
function CItemBaseHolder:IsSlotEnoughFor(dwNeeded)
	return self:GetEmptySlotNum() >= dwNeeded;
end;

--是否能够将配置 ID的道具放入容器
function CItemBaseHolder:IsCanAddEnumItem(dwEnumID, dwSlotNeeded)
	return self:IsSlotEnoughFor(dwSlotNeeded);
end;

--容器是否能够扩展
function CItemBaseHolder:IsCanExtend()
	return false;
end;


--获取一个空的格子
function CItemBaseHolder:GetOneEmptySlot()
	local dwSlot;
	if self:GetEmptySlotNum() > 0 then
		for k, v in ipairs(self.setSlotToItemID) do
			if v == 0 then
				dwSlot = k;
				break;
			end;
		end;
	end;
	return dwSlot;
end;



--将一个格子的物品移动到另一个格子
function CItemBaseHolder:MoveItemFromXToY(dwSlotX, dwSlotY)
	self.setSlotToItemID[dwSlotY] = self.setSlotToItemID[dwSlotX];
	self.setSlotToItemID[dwSlotX] = 0;
end;

--设置格子上存储的道具信息
function CItemBaseHolder:SetSlotItemInfo(dwSlot, dwItemID)
	self.setSlotToItemID[dwSlot] = dwItemID;
end;


--获取某一个格子的物品ID
function CItemBaseHolder:GetItemIDBySlot(dwPos)
	return self.setSlotToItemID[dwPos];
end



--获取容器中某一配置ID的实例ID集合
function CItemBaseHolder:GetItemIDSetByEnumID(dwEnumID)
	return self.setEnumIDToItemID[dwEnumID] or {};
end;

--获取容器中某一CD类型的实例ID集合
function CItemBaseHolder:GetItemIDSetByCDType(dwCDType)
	return {};
end;


--获取容器中所有道具的ID集合
function CItemBaseHolder:GetAllItemID()
	local setItemID = {};
	for k, v in ipairs(self.setSlotToItemID) do
		if v > 0 then
			table.insert(setItemID, v);
		end;
	end;
	return setItemID;
end;

--获取容器中所有道具的ID集合
function CItemBaseHolder:GetItemID_SlotA_SlotB(slotA, slotB)
	local setItemID = {};
    for i=slotA, slotB do
        if self.setSlotToItemID[i] > 0 then
            table.insert(setItemID, self.setSlotToItemID[i]);
        end;
    end;
	return setItemID;
end;


--指定位置是否有物品
function CItemBaseHolder:IsSlotAlreadyHaveItem(dwSlot)
	if self.setSlotToItemID[dwSlot] then
		return self.setSlotToItemID[dwSlot] > 0;
	else
		return true;
	end;
end;

--向指定位置增加物品
function CItemBaseHolder:AddItemToSlot(objItem, dwSlot)
	if self:IsSlotAlreadyHaveItem(dwSlot) then
		_err("IS ERROR!!! slot have item!!!", self:GetClass());
	end;
	local dwItemID	= objItem:GetInstID();
	local dwEnumID	= objItem:GetEnumID();
	self.setSlotToItemID[dwSlot] = dwItemID;
    self.dwEmpSlotNum = self.dwEmpSlotNum - 1;
	self.setEnumIDToItemID[dwEnumID] = self.setEnumIDToItemID[dwEnumID] or {};
	table.insert(self.setEnumIDToItemID[dwEnumID], dwItemID);	
end;

--删除物品
function CItemBaseHolder:DelItem(objItem)
	local _, dwSlot = objItem:GetPosInfo();
	local dwItemID	= objItem:GetInstID();
	local dwEnumID	= objItem:GetEnumID();
	self.setSlotToItemID[dwSlot] = 0;
    self.dwEmpSlotNum = self.dwEmpSlotNum + 1;
	local pos;
	for k, v in ipairs(self.setEnumIDToItemID[dwEnumID]) do
		if v == dwItemID then
			pos = k;
			break;
		end;
	end;
	table.remove(self.setEnumIDToItemID[dwEnumID], pos);	
end;

--用newItem替换oldItem
function CItemBaseHolder:UpdateSlotItem(dwSlot, oldItem, newItem)
	--先删除旧的信息
	local dwEnumIDOld = oldItem:GetEnumID();
	local dwItemIDOld = oldItem:GetInstID();
	local dwEnumIDNew = newItem:GetEnumID();
	local dwItemIDNew = newItem:GetInstID();
	local pos;
	for k, v in ipairs(self.setEnumIDToItemID[dwEnumIDOld]) do
		if v == dwItemIDOld then
			pos = k;
			break;
		end;
	end;
	table.remove(self.setEnumIDToItemID[dwEnumIDOld], pos);	
	--再增加新的信息
	self.setSlotToItemID[dwSlot] = dwItemIDNew;
	self.setEnumIDToItemID[dwEnumIDNew] = self.setEnumIDToItemID[dwEnumIDNew] or {};
	table.insert(self.setEnumIDToItemID[dwEnumIDNew], dwItemIDNew);
end;

--objItemA和objItemB互换
function CItemBaseHolder:SwapItemAWithItemB(objItemA, dwSlotA, objItemB, dwSlotB)
	self.setSlotToItemID[dwSlotA] = objItemB:GetInstID();
	self.setSlotToItemID[dwSlotB] = objItemA:GetInstID();
end;



