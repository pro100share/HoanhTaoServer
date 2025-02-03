
--玩家宝石存放的地方
_G.CStoneRoom = {}
setmetatable(CStoneRoom, {__index = CItemBaseHolder});

--构造函数
function CStoneRoom:New(dwHolderClass, objItemSystem)
	local obj = {};
	
	--变量
	----容器类型
	obj.dwHolderClass = dwHolderClass;
	----道具系统
	obj.objItemSystem = objItemSystem;
		
	--需维护的表
	----位置对应道具ID表
	obj.setSlotToItemID		        = {};
    ----栏位数
    obj.dwSlotNum                   = _G.enItemWearPos.eMount4*10;
    ----装备位置对应石头个数表
    obj.setWearPosStoneNum          = {};
	---装备位对应宝石铸造数表
	obj.setWearPosFoundryStoneNum = {};
	
	--初始化
	for i=_G.enItemWearPos.eWeapon, _G.enItemWearPos.eMount4*10 do
		obj.setSlotToItemID[i]      = 0;
	end;
    for i=_G.enItemWearPos.eWeapon, _G.enItemWearPos.eMount4 do
		obj.setWearPosStoneNum[i]   = 0;
		obj.setWearPosFoundryStoneNum[i] = 0;
	end;

	setmetatable(obj, {__index = CStoneRoom});
	
	return obj;
end

---获取装备位宝石铸造数
function CStoneRoom:GetWearPosFoundryStoneNum(dwWearPos)
	return self.setWearPosFoundryStoneNum[dwWearPos]
end
---设置装备位宝石铸造数
function CStoneRoom:SetWearPosFoundryStoneNum(dwWearPos,foundryNum)
	self.setWearPosFoundryStoneNum[dwWearPos] = foundryNum
end



--获得装备位置的宝石个数
function CStoneRoom:GetWearPosStoneNum(dwWearPos)
    return self.setWearPosStoneNum[dwWearPos];
end;

--获得装备位置的宝石ID集合
function CStoneRoom:GetWearPosStoneIDSet(dwWearPos)
    local set = {};
    if self:GetWearPosStoneNum(dwWearPos) > 0 then
        for pos = ((dwWearPos-1)*10 + 1), (dwWearPos*10 - 1) do
            local dwInstID = self.setSlotToItemID[pos];
            if dwInstID > 0 then
                table.insert(set, dwInstID);
            end;
        end;
    end;
    return set;
end;

--------------------------------------------
--------------容器公有接口重载--------------
--------------------------------------------



--获取一个装备为空的格子
function CStoneRoom:GetOneEmptySlot(dwWearPos)
    if not dwWearPos or dwWearPos <= 0 then
        _err("dwWearPos err!!!:", dwWearPos);
        return nil;
    end;
    for pos = ((dwWearPos-1)*10 + 1), (dwWearPos*10 - 1) do
        if self.setSlotToItemID[pos] == 0 then
            return pos;
        end;
    end;
end;


--向指定位置增加物品
function CStoneRoom:AddItemToSlot(objItem, dwSlot)
	if self:IsSlotAlreadyHaveItem(dwSlot) then
		_err("IS ERROR!!! slot have item!!!", self:GetClass());
	end;
	self.setSlotToItemID[dwSlot] = objItem:GetInstID();
	local dwWearPos = math.floor(dwSlot / 10) + 1;
    self.setWearPosStoneNum[dwWearPos] = self.setWearPosStoneNum[dwWearPos] + 1;
	self.objItemSystem:StoneAdd(dwWearPos, objItem);
end;

--删除物品
function CStoneRoom:DelItem(objItem)
	local _, dwSlot = objItem:GetPosInfo();
    self.setSlotToItemID[dwSlot] = 0;
    local dwWearPos = math.floor(dwSlot / 10) + 1;
	self.setWearPosStoneNum[dwWearPos] = self.setWearPosStoneNum[dwWearPos] - 1;
	self.objItemSystem:StoneDel(dwWearPos, objItem);
end;

---------------------------
--容器禁用接口重载

--获取空栏位的个数
function CStoneRoom:GetEmptySlotNum()
	return 0;
end;

--空闲位置是否满足需要
function CStoneRoom:IsSlotEnoughFor(dwNeeded)
	return false;
end;

--是否能够将配置 ID的道具放入容器
function CStoneRoom:IsCanAddEnumItem(dwEnumID, dwSlotNeeded)
	return false;
end;

--将一个格子的物品移动到另一个格子
function CStoneRoom:MoveItemFromXToY(dwSlotX, dwSlotY)
    _err("function use error!!!");
end;

--设置格子上存储的道具信息
function CStoneRoom:SetSlotItemInfo(dwSlot, dwItemID)
	_err("function use error!!!");
end;

--获取容器中某一配置ID的实例ID集合
function CStoneRoom:GetItemIDSetByEnumID(dwEnumID)
	return {};
end;

--用newItem替换oldItem
function CStoneRoom:UpdateSlotItem(dwSlot, oldItem, newItem)
    _err("function use error!!!");
end

--objItemA和objItemB互换
function CStoneRoom:SwapItemAWithItemB(objItemA, dwSlotA, objItemB, dwSlotB)
	_err("function use error!!!");
end;



