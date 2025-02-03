
--玩家的背包
_G.CPacket = {}
setmetatable(CPacket, {__index = CItemBaseHolder});

--构造函数
function CPacket:New(dwHolderClass)
	local obj = {};
	
	--变量
	----容器类型
	obj.dwHolderClass = dwHolderClass;
	
	----栏位数
	obj.dwSlotNum		= 0;
	----空栏位个数
	obj.dwEmpSlotNum 	= 0;
	
	----银两
	obj.dwMoney			= 0;	--背包中携带的银两数
	obj.dwLockedMoney	= 0;	--锁定银两
	
	
	--需维护的表
	----位置对应道具ID表
	obj.setSlotToItemID		= {};
	----配置ID对应道具ID表
	obj.setEnumIDToItemID	= {};
	----CDType对应道具ID表
	obj.setCDTypeToItemID	= {};
	
	setmetatable(obj, {__index = CPacket});
	
	return obj;
end



--设置数据
function CPacket:SetData(dwSlotNum, dwMoney)
	self.dwSlotNum		= dwSlotNum;
	self.dwMoney		= dwMoney; 
	
	self.dwEmpSlotNum	= self.dwSlotNum;
	
	for i=1, self.dwSlotNum do
		self.setSlotToItemID[i] = 0;
	end;
end;

--取得数据
function CPacket:GetData()
	return self.dwSlotNum, self.dwMoney;
end;




--背包是否能够扩展
function CPacket:IsCanExtend()
	if self:GetSlotNum() < _G.InitConfig.dwMaxPacketSlotNum then
		return true;
	else
		return false;
	end;
end;

--背包增加栏位
function CPacket:AddSlotNum(dwSlotNum)
	for i=self.dwSlotNum + 1, self.dwSlotNum + dwSlotNum do
		self.setSlotToItemID[i] = 0;
	end;
	self.dwSlotNum = self.dwSlotNum + dwSlotNum;
	self.dwEmpSlotNum = self.dwEmpSlotNum + dwSlotNum;
end;



--锁定玩家一部分的钱，玩家将不能再使用这部分的银两
function CPacket:LockMoney(dwValue)
	self.dwLockedMoney = self.dwLockedMoney + dwValue;
end

--解锁玩家的银两，传入解锁的数量
function CPacket:UnlockMoney(dwValue)
	self.dwLockedMoney = self.dwLockedMoney - dwValue;
end

--获取可使用银两数
function CPacket:GetMoney()
	return self.dwMoney - self.dwLockedMoney;
end

--获取锁定银两
function CPacket:GetLockedMoney()
	return self.dwLockedMoney;
end;

--获取所有银两，包括锁定的
function CPacket:GetAllMoney()
	return self.dwMoney;
end;

--更新银两数
function CPacket:UpdateMoney(dwValue, szType )    --nolog
	self.dwMoney = self.dwMoney + dwValue;
end






--------------------------------------------
--------------容器公有接口重载--------------
--------------------------------------------

--获取容器中某一CD类型的实例ID集合
function CPacket:GetItemIDSetByCDType(dwCDType)
	return self.setCDTypeToItemID[dwCDType] or {};
end;

--向指定位置增加物品
function CPacket:AddItemToSlot(objItem, dwSlot)
	if self:IsSlotAlreadyHaveItem(dwSlot) then
		_err("IS ERROR!!! slot have item!!!", self:GetClass());
	end;
	local dwItemID	= objItem:GetInstID();
	local dwEnumID	= objItem:GetEnumID();
	local CDType	= objItem:GetCDType();
	self.setSlotToItemID[dwSlot] = dwItemID;
	self.dwEmpSlotNum = self.dwEmpSlotNum - 1;
	self.setEnumIDToItemID[dwEnumID] = self.setEnumIDToItemID[dwEnumID] or {};
	table.insert(self.setEnumIDToItemID[dwEnumID], dwItemID);	
	if CDType ~= 0 then
		self.setCDTypeToItemID[CDType] = self.setCDTypeToItemID[CDType] or {};
		table.insert(self.setCDTypeToItemID[CDType], dwItemID);
	end;
end;

--删除物品
function CPacket:DelItem(objItem)
	local _, dwSlot = objItem:GetPosInfo();
	local dwItemID	= objItem:GetInstID();
	local dwEnumID	= objItem:GetEnumID();
	local CDType	= objItem:GetCDType();
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
	
	if CDType ~= 0 then
		local pos1;
		for k, v in ipairs(self.setCDTypeToItemID[CDType]) do
			if v == dwItemID then
				pos1 = k;
				break;
			end;
		end;
		table.remove(self.setCDTypeToItemID[CDType], pos1)
	end;
end;

--用newItem替换oldItem
function CPacket:UpdateSlotItem(dwSlot, oldItem, newItem)
	local dwEnumIDOld = oldItem:GetEnumID();
	local dwItemIDOld = oldItem:GetInstID();
	local dwCDTypeOld = oldItem:GetCDType();
	local dwEnumIDNew = newItem:GetEnumID();
	local dwItemIDNew = newItem:GetInstID();
	local dwCDTypeNew = newItem:GetCDType();
	--先删除旧的信息
	local pos;
	for k, v in ipairs(self.setEnumIDToItemID[dwEnumIDOld]) do
		if v == dwItemIDOld then
			pos = k;
			break;
		end;
	end;
	table.remove(self.setEnumIDToItemID[dwEnumIDOld], pos);
	
	if dwCDTypeOld ~= 0 then
		local pos1;
		for k, v in ipairs(self.setCDTypeToItemID[dwCDTypeOld]) do
			if v == dwItemIDOld then
				pos1 = k;
				break;
			end;
		end;
		table.remove(self.setCDTypeToItemID[dwCDTypeOld], pos1)
	end;
	
	--再增加新的信息
	self.setSlotToItemID[dwSlot] = dwItemIDNew;
	self.setEnumIDToItemID[dwEnumIDNew] = self.setEnumIDToItemID[dwEnumIDNew] or {};
	table.insert(self.setEnumIDToItemID[dwEnumIDNew], dwItemIDNew);
	
	if dwCDTypeNew ~= 0 then
		self.setCDTypeToItemID[dwCDTypeNew] = self.setCDTypeToItemID[dwCDTypeNew] or {};
		table.insert(self.setCDTypeToItemID[dwCDTypeNew], dwItemIDNew);
	end;
end;


