
--玩家身上穿的装备存放的地方
_G.CEquipPutOnRoom = {}
setmetatable(CEquipPutOnRoom, {__index = CItemBaseHolder});

--构造函数
function CEquipPutOnRoom:New(dwHolderClass, objItemSystem)
	local obj = {};
	
	--变量
	----容器类型
	obj.dwHolderClass = dwHolderClass;
	----道具系统
	obj.objItemSystem = objItemSystem;
	
	----装备件数
	obj.dwEquipNum	= 0;
	
	
	--需维护的表
	----位置对应道具ID表
	obj.setSlotToItemID		= {};
    ----栏位数
    obj.dwSlotNum           = _G.enItemWearPos.eKeepsake;
	
	--初始化
	for i=_G.enItemWearPos.eWeapon, _G.enItemWearPos.eKeepsake do
		obj.setSlotToItemID[i] = 0;
	end;

	setmetatable(obj, {__index = CEquipPutOnRoom});
	
	return obj;
end



--获取穿戴装备个数
function CEquipPutOnRoom:GetWornEquipNum()
	return self.dwEquipNum;
end;



--------------------------------------------
--------------容器公有接口重载--------------
--------------------------------------------


--是否能够将道具放入指定位置
function CEquipPutOnRoom:IsCanAddItemToSlot(objItem, dwSlot)
	return objItem:IsEquip() and (objItem:GetWearPos() == dwSlot) and self.objItemSystem:WornEquipCommonCheck(objItem);
end;


--向指定位置增加物品
function CEquipPutOnRoom:AddItemToSlot(objItem, dwSlot)
	if self:IsSlotAlreadyHaveItem(dwSlot) then
		_err("IS ERROR!!! slot have item!!!", self:GetClass());
	end;
	self.setSlotToItemID[dwSlot] = objItem:GetInstID();
	if dwSlot >= _G.enItemWearPos.eWeapon and dwSlot <= _G.enItemWearPos.ePendant then
		self.dwEquipNum = self.dwEquipNum + 1;
	end;
	self.objItemSystem:EquipChange(dwSlot);
end;

--删除物品
function CEquipPutOnRoom:DelItem(objItem)
	local _, dwSlot = objItem:GetPosInfo();
	self.setSlotToItemID[dwSlot] = 0;
	if dwSlot >= _G.enItemWearPos.eWeapon and dwSlot <= _G.enItemWearPos.ePendant then
		self.dwEquipNum = self.dwEquipNum - 1;
	end;
	self.objItemSystem:EquipChange(dwSlot);
end;

--用newItem替换oldItem
function CEquipPutOnRoom:UpdateSlotItem(dwSlot, oldItem, newItem)
	self.setSlotToItemID[dwSlot] = newItem:GetInstID();
	self.objItemSystem:EquipChange(dwSlot);
end;


---------------------------
--容器禁用接口重载

--获取空栏位的个数
function CEquipPutOnRoom:GetEmptySlotNum()
	return 0;
end;

--空闲位置是否满足需要
function CEquipPutOnRoom:IsSlotEnoughFor(dwNeeded)
	return false;
end;

--是否能够将配置 ID的道具放入容器
function CEquipPutOnRoom:IsCanAddEnumItem(dwEnumID, dwSlotNeeded)
	return false;
end;

--获取一个空的格子
function CEquipPutOnRoom:GetOneEmptySlot()
	return nil;
end;

--将一个格子的物品移动到另一个格子
function CEquipPutOnRoom:MoveItemFromXToY(dwSlotX, dwSlotY)
	_err("function use error!!!");
end;

--设置格子上存储的道具信息
function CEquipPutOnRoom:SetSlotItemInfo(dwSlot, dwItemID)
	_err("function use error!!!");
end;

--获取容器中某一配置ID的实例ID集合
function CEquipPutOnRoom:GetItemIDSetByEnumID(dwEnumID)
	return {};
end;

--objItemA和objItemB互换
function CEquipPutOnRoom:SwapItemAWithItemB(objItemA, dwSlotA, objItemB, dwSlotB)
	_err("function use error!!!");
end;



