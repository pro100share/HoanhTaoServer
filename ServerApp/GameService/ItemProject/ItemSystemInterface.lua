------------------------------------
------------------------------------
--道具系统对外部的接口文件
--author lkj



------------------------------------------------------------
-----------------------一些Get/IS-接口----------------------
------------------------------------------------------------

--获取道具实例
function CItemSystem:GetItem(dwInstID)
	if type(dwInstID) ~= "number" then
		_info("itemsystem param type error!!!");
		return nil;
	end;
	return self:GetItemInst(dwInstID);
end;

--判断背包空位是否满足需求
function CItemSystem:IsPacketSlotEnoughFor(dwNeeded)
	if type(dwNeeded) ~= "number" then
		_info("itemsystem param type error!!!");
		return false;
	end;
	return self:GetPacket():IsSlotEnoughFor(dwNeeded);
end;

---设置装备位宝石铸造数
function CItemSystem:SetWearPosFoundryStoneNum(dwWearPos,foundryNum)
	self:GetStoneRoom():SetWearPosFoundryStoneNum(dwWearPos,foundryNum)
end
---初始化装备位的宝石铸造属性
function CItemSystem:InitWearPosFoundryStone(dwWearPos)
	self:initFoundryAttr(dwWearPos)
	self:GetStoneExTotalPower() ---传客户端宝石额外战斗力
end
--设置装备位的宝石铸造属性
function CItemSystem:SetWearPosFoundryStoneAttr(dwWearPos)
	self:setWearPosFoundryStoneAttr(dwWearPos)
end



---获取装备位宝石铸造数
function CItemSystem:GetWearPosFoundryStoneNum(dwWearPos)
	return self:GetStoneRoom():GetWearPosFoundryStoneNum(dwWearPos)
end
--是否装备武器
function CItemSystem:IsWornWeapon()
	return self:GetEquipHolder():GetItemIDBySlot(enItemWearPos.eWeapon) > 0;
end;

--获取身上穿戴装备数量
function CItemSystem:GetWornEquipNum()
	return self:GetEquipHolder():GetWornEquipNum();
end;

--获取穿戴位置的宝石数量
function CItemSystem:GetWearPosStoneNum(dwWearPos)
	if type(dwWearPos) ~= "number" then
		_info("itemsystem param type error!!!");
		return 0;
	end;
    return self:GetStoneRoom():GetWearPosStoneNum(dwWearPos);
end;

--获取装备容器中结婚信物的ID
function CItemSystem:GetKeepSakeID()
	return self:GetEquipHolder():GetItemIDBySlot(enItemWearPos.eKeepsake);
end;

--获取旧信物容器内所有物品ID
function CItemSystem:GetAllIDInKsRoom()
	return self:GetKeepsake():GetAllItemID();
end;

--获取所有护身宝甲熔炼容器里的道具实例
function CItemSystem:GetAllItemInAmulet()
	local setItems = {};
	for _, itemInstID in ipairs(self:GetAmulet():GetAllItemID()) do
		local itemInst = self:GetItemInst(itemInstID);
		if itemInst then
			table.insert(setItems, itemInst);
		end;
	end;
	
	return setItems;
end;

--获取背包中的所有道具实例
function CItemSystem:GetAllItemInPacket()
	local setItems = {};
	for _, itemInstID in ipairs(self:GetPacket():GetAllItemID()) do
		local itemInst = self:GetItemInst(itemInstID);
		if itemInst then
			table.insert(setItems, itemInst);
		end;
	end;
	
	return setItems;
end;

--获取分解容器中所有道具实例
function CItemSystem:GetAllItemInDecompose()
	local setItems = {};
	for _, itemInstID in ipairs(self:GetDecompose():GetAllItemID()) do
		local itemInst = self:GetItemInst(itemInstID);
		if itemInst then
			table.insert(setItems, itemInst);
		end;
	end;
	
	return setItems;
end;

--获取指定容器的指定位置区间的所有道具
function CItemSystem:GetAllItem_HolderA_SlotB_SlotC(HolderA, SlotB, SlotC)
	if type(HolderA) ~= "number" or type(SlotB) ~= "number" or type(SlotC) ~= "number" then
		_info("itemsystem param type error!!!");
		return {};
	end;
    local holder = self:GetHolder(HolderA);
    if not holder then
        _info("error holdertype:", HolderA);
        return {};
    end;
    local slotNum = holder:GetSlotNum();
    local setItems = {};
    if (SlotB <= 0) or (SlotC <=0) or (SlotB > slotNum) then
        _info("SlotB or SlotC error !!!", slotNum,  SlotB, SlotC);
        return setItems;
    end;
	if SlotC > slotNum then
		SlotC = slotNum;
	end;

	for _, itemInstID in ipairs(holder:GetItemID_SlotA_SlotB(SlotB, SlotC)) do
		local itemInst = self:GetItemInst(itemInstID);
		if itemInst then
			table.insert(setItems, itemInst);
		end;
	end;
	
	return setItems;
end;

--获取所有装备的总分
function CItemSystem:GetAllEquipScore()
	local dwTotalValue = 0;
	for _, equip in ipairs(self:GetAllPutOnEquip()) do
		dwTotalValue = dwTotalValue + equip:GetScore();
	end;
	
	return dwTotalValue;
end;
--获取所有宝石的总分
function CItemSystem:GetAllStoneScore()
	local dwTotalValue = 0;
	for _, stone in ipairs(self:GetAllStone()) do
		dwTotalValue = dwTotalValue + stone:GetScore();
	end;
	dwTotalValue = dwTotalValue+ self:GetJPScore() + self:GetFoundryScore();
	return dwTotalValue;
end;

------------------------------------------------------------
-------------------监听系统注册相关接口---------------------
------------------------------------------------------------

--注册其它系统到当前的装备监听接口
function CItemSystem:RegEvent(objSys)
	self.setSystemEvent[objSys] = true;
end;

--注销其它系统到当前的装备监听接口
function CItemSystem:UnRegEvent(objSys)
	self.setSystemEvent[objSys] = nil;
end;



------------------------------------------------------------
------------------------货币相关接口------------------------
------------------------------------------------------------

--获取所有金钱(仓库+背包中的)
function CItemSystem:GetAllMoney()
	return self:GetAllPacketMoney() + 
		self:GetStorageMoney();
end;

--背包中的银两是否足够花销
function CItemSystem:IsPacketMoneyEnough(money)
	if type(money) ~= "number" then
		_info("itemsystem param type error!!!");
		return false;
	end;
	return self:GetPacketMoney() >= money;
end;

--能否给背包中增加dwValue银两
function CItemSystem:IsCanAddPacketMoney(dwValue)
	if type(dwValue) ~= "number" then
		_info("itemsystem param type error!!!");
		return false;
	end;
    return (self:GetAllPacketMoney() + dwValue <= _G.InitConfig.dwMaxMoney)
end;

--增加背包中的银两
function CItemSystem:AddPacketMoney(dwValue, szType)
	if type(dwValue) ~= "number" then
		_info("itemsystem param type error!!!");
		return false;
	end;
	dwValue = math.ceil(dwValue);
	if dwValue <= 0 then
		_err("itemsystem AddMoney <= 0!!!", dwValue);
		return false
	end;
	
	if self:GetAllPacketMoney() + dwValue > _G.InitConfig.dwMaxMoney then
		self:OnError(6000610011);
        return false;
	end;
	
	self:UpdatePacketMoney(dwValue, szType);
	self:Synchronize();

	return true;
end;

--花销背包中的银两
function CItemSystem:CostPacketMoney(dwValue, szType)
	if type(dwValue) ~= "number" then
		_info("itemsystem param type error!!!");
		return false;
	end;
	dwValue = math.ceil(dwValue);
	if dwValue < 0 then
		_err("itemsystem CostMoney < 0!!!", dwValue);
		return false;
	end;
	
	if dwValue == 0 then return true end;
	
	if not self:IsPacketMoneyEnough(dwValue) then return false end;
	
	self:UpdatePacketMoney(- dwValue, szType);
	self:Synchronize();
	
	return true;
end;

--锁定背包中的一部分银两，玩家将不能使用这部分银两
function CItemSystem:LockPacketMoney(dwValue)
	if type(dwValue) ~= "number" then
		_info("itemsystem param type error!!!");
		return false;
	end;
	dwValue = math.ceil(dwValue);
	if dwValue <= 0 then return false end;
	
	if self:GetPacketMoney() >= dwValue then
		self:DoLockPacketMoney(dwValue);
		return true;
	else
		_info("want to lock money > have");
		return false;
	end;
end;

--解锁背包中的一部分银两，传入解锁的数量
function CItemSystem:UnlockPacketMoney(dwValue)
	if type(dwValue) ~= "number" then
		_info("itemsystem param type error!!!");
		return false;
	end;
	dwValue = math.ceil(dwValue);
	if dwValue <= 0 then return false end;
	if self:GetPacket():GetLockedMoney() >= dwValue then
		self:DoUnlockPacketMoney(dwValue);
		return true;
	else
		_info("want to unlock money > locked");
		return false;
	end;
end;


--获取礼金数量
function CItemSystem:GetBindGoldNum()
    return self:GetBindGold();
end;

--礼金是否足够花销
function CItemSystem:IsBindGoldEnough(dwValue)
	if type(dwValue) ~= "number" then
		_info("itemsystem param type error!!!");
		return false;
	end;
	return self:GetBindGold() >= dwValue;
end;

--能否增加dwValue礼金
function CItemSystem:IsCanAddBindGold(dwValue)
	if type(dwValue) ~= "number" then
		_info("itemsystem param type error!!!");
		return false;
	end;
    return (self:GetBindGold() + dwValue <= _G.InitConfig.dwMaxMoney)
end;

--增加礼金
function CItemSystem:AddBindGold(dwValue, nType)
	if type(dwValue) ~= "number" then
		_info("itemsystem param type error!!!");
		return false;
	end;
	dwValue = math.ceil(dwValue);
	if dwValue <= 0 then
		_err("itemsystem AddBindGold <= 0!!!", dwValue);
		return false;
	end;
	if dwValue >= 50000 then
		_err("itemsystem AddBindGold >= 5W!!!", dwValue);
	end;
	
	if self:GetBindGold() + dwValue > _G.InitConfig.dwMaxMoney then
		--提示玩家，背包中的金钱数量已达上限
		self:OnError(6000610011);
        return false;
	end;
	 --获得元宝日志记录,非充值获得
    if (not nType) or (type(nType) ~= "number") then
        _info("AddBindGold nType err!!!", nType);
		CLogSystemManager:giftmoney_income(self:GetPlayer(), self:GetBindGoldNum(), dwValue, 0)
    else
		CLogSystemManager:giftmoney_income(self:GetPlayer(), self:GetBindGoldNum(), dwValue, nType)
    end;
	
	self:UpdateBindGold(dwValue);
	
	self:Synchronize();
	return true;
end;

--花销礼金
function CItemSystem:CostBindGold(dwValue, nType)
	if type(dwValue) ~= "number" then
		_info("itemsystem param type error!!!");
		return false;
	end;
	dwValue = math.ceil(dwValue);
	if dwValue <= 0 then 
		_err("itemsystem CostBindGold <=0!!!", dwValue)
		return false;
	end;
	
	if not self:IsBindGoldEnough(dwValue) then return false end;
	
	self:UpdateBindGold(- dwValue);
	
	--通知事件中心
	self:GetPlayer():GetSystem('CPlayerEventCenterSystem'):DoEvent(enumPlayerEventType.EventCostBindGold, dwValue);
	
	self:Synchronize();

    CLogSystemManager:giftmoney_expend(self:GetPlayer(),
        self:GetBindGoldNum(),
        dwValue,
        nType);

	return true;
end;


--获取元宝数量
function CItemSystem:GetGoldNum()
    return self:GetAllGold();
end;

--元宝是否足够花销
function CItemSystem:IsGoldEnough(dwValue)
	if type(dwValue) ~= "number" then
		_info("itemsystem param type error!!!");
		return false;
	end;
	return self:GetGold() >= dwValue;
end;

--元宝充值
function CItemSystem:ChargeGold(dwValue)
	if type(dwValue) ~= "number" then
		_info("itemsystem param type error!!!");
		return false;
	end;
    dwValue = math.ceil(dwValue);
	--if dwValue <= 0 then---- zcs modi 2013-7-16
		--_err("itemsystem ChargeGold <=0 !!!", self:GetPlayer():GetAccountID(), dwValue);
		--return false;
	--end;
	if dwValue >= 100000 then
		_err("itemsystem ChargeGold >= 10W", self:GetPlayer():GetAccountID(), dwValue);
	end;
	
	if self:GetAllGold() + dwValue > _G.InitConfig.dwMaxMoney then
		--提示玩家，背包中的金钱数量已达上限
		self:OnError( 6000610002 );
		dwValue = _G.InitConfig.dwMaxMoney - self:GetAllGold();
		if dwValue <= 0 then return false end;
	end;
	
	self:UpdateGold(dwValue, true);
	
	self:Synchronize();
	return true;
end;

--能否增加dwValue元宝
function CItemSystem:IsCanAddGold(dwValue)
	if type(dwValue) ~= "number" then
		_info("itemsystem param type error!!!");
		return false;
	end;
    return (self:GetAllGold() + dwValue <= _G.InitConfig.dwMaxMoney)
end;

--增加元宝
function CItemSystem:AddGold(dwValue, szType)
	if type(dwValue) ~= "number" then
		_info("itemsystem param type error!!!");
		return false;
	end;
	dwValue = math.ceil(dwValue);
	if dwValue < 0 then
		_err("itemsystem AddGold < 0", self:GetPlayer():GetAccountID(), dwValue);
		return false
	end;
	if dwValue >= 10000 then
		_err("itemsystem AddGold >= 1W", self:GetPlayer():GetAccountID(), dwValue);
	end;
	
	if self:GetAllGold() + dwValue > _G.InitConfig.dwMaxMoney then
		--提示玩家，背包中的金钱数量已达上限
		self:OnError( 6000610002 );
		dwValue = _G.InitConfig.dwMaxMoney - self:GetAllGold();
		if dwValue <= 0 then return false end;
	end;
	
	self:UpdateGold(dwValue);
    
    --获得元宝日志记录,非充值获得
    if (not szType) or (type(szType) ~= "number") then
        _info("AddGold szType err!!!", szType);
    else
        CLogSystemManager:yb_income(self:GetPlayer(), self:GetAllGold(), dwValue, szType)
    end;
    
	
	self:Synchronize();
	return true;
end;

--花销元宝
function CItemSystem:CostGold(dwValue, szType)
	if type(dwValue) ~= "number" then
		_info("itemsystem param type error!!!");
		return false;
	end;
	dwValue = math.ceil(dwValue);
	if dwValue < 0 then
		_err("itemsystem CostGold < 0!!!", self:GetPlayer():GetAccountID(), dwValue);
		return false;
	end;
	
	_info("CItemSystem:CostGold--------------", dwValue, szType,self:GetPlayer():GetAccountID());
	
	if not self:IsGoldEnough(dwValue) then 
		if szType == _G.ItemSysOperType.Trade then
			_info("CItemSystem:CostGold========== gold dont enough by trade!!!", self:GetPlayer():GetAccountID())
		end
		
		if szType == _G.ItemSysOperType.PlayerShop then
			_info("CItemSystem:CostGold========== gold dont enough by playshop!!!", self:GetPlayer():GetAccountID())
		end
		return false 
	end;
	
	self:UpdateGold(- dwValue);
    
	--消耗元宝日志记录,非商城购买消耗
    if (not szType) or (type(szType) ~= "number") then
        _info("CostGold szType err!!!", szType);
    else
        if szType ~= _G.ItemSysOperType.BuyMall then
            CLogSystemManager:yb_expend(self:GetPlayer(), self:GetAllGold(), dwValue, szType)
        end;
    end;
    if (szType ~= _G.ItemSysOperType.PlayerShop) and (szType ~= _G.ItemSysOperType.Trade) then
		local objPlayer = self:GetPlayer()
		if objPlayer then
			local sysScript = objPlayer:GetSystem("CScriptSystem")
			sysScript:OnCostGold(-dwValue,_now(),nil,true)
		end
	end
	self:Synchronize();
	return true;
end;

--锁定玩家的一部分元宝，玩家将不能使用这部分元宝
function CItemSystem:LockGold(dwValue)
	if type(dwValue) ~= "number" then
		_info("itemsystem param type error!!!");
		return false;
	end;
	dwValue = math.ceil(dwValue);
	if dwValue <= 0 then return false end;
	if self:GetGold() >= dwValue then
		self:DoLockGold(dwValue);
		return true;
	else
		_info("want to lock gold > have");
		return false;
	end;
end;

--解锁玩家的元宝，传入解锁的数量
function CItemSystem:UnlockGold(dwValue)
	if type(dwValue) ~= "number" then
		_info("itemsystem param type error!!!");
		return false;
	end;
	dwValue = math.ceil(dwValue);
	if dwValue <= 0 then return false end;
	if self:GetLockedGold() >= dwValue then
		self:DoUnlockGold(dwValue);
		return true;
	else
		_info("want to unlock gold > locked");
		return false;
	end;
end;

--客户端请求存款，超过仓库容量的部分不会进行转移
function CItemSystem:SaveMoney(dwMoney)
	if type(dwMoney) ~= "number" then
		_info("itemsystem param type error!!!");
		return false;
	end;
	--检查转移的金钱数字
	dwMoney = math.ceil(dwMoney);
	if dwMoney <= 0 then return false end;
	
	if not self:IsPacketMoneyEnough(dwMoney) then
		dwMoney = self:GetPacketMoney();
	end;
	
	if self:GetStorageMoney() + dwMoney > _G.InitConfig.dwMaxMoney then
        self:OnError(6000610011);
        return false;
	end;
	
	self:DoSaveMoney(dwMoney);
	
	self:Synchronize();
	
	local objEventCenter = self:GetPlayer():GetSystem("CPlayerEventCenterSystem");
	if objEventCenter then
		objEventCenter:DoEvent(enumPlayerEventType.EventStorageUse);
	end
		
	return true;
end;

--客户端请求取款，超过背包容量的部分不会进行转移
function CItemSystem:TakeMoney(dwMoney)
	if type(dwMoney) ~= "number" then
		_info("itemsystem param type error!!!");
		return false;
	end;
	--检查转移的金钱数字
	dwMoney = math.ceil(dwMoney);
	if dwMoney <= 0 then return false end;
	
	if not self:IsStorageMoneyEnough(dwMoney) then
		dwMoney = self:GetStorageMoney();
	end;
	
	if self:GetAllPacketMoney() + dwMoney > _G.InitConfig.dwMaxMoney then
        self:OnError(6000610011);
        return false;
	end;
	
	self:DoTakeMoney(dwMoney);
	
	self:Synchronize();
	return true;
end;



------------------------------------------------------------
-----------------------GM操作接口---------------------------
------------------------------------------------------------

--GM设置所有装备强化
function CItemSystem:GM_EquipStrong(dwLevel)
	if type(dwLevel) ~= "number" then
		_info("itemsystem param type error!!!");
		return;
	end;
	local allEquip = self:GetAllPutOnEquip();
	if #allEquip > 0 then
		for _, equip in ipairs(allEquip) do
			self:DoSetEquipStrongLevel(equip, dwLevel);
		end;
		self:Synchronize();
	end;
end;

--GM设置所有装备升阶
function CItemSystem:GM_EquipUpGrade()
	local allEquip = self:GetAllPutOnEquip();
	if #allEquip > 0 then
		local bUpgd = false;
		for _, equip in ipairs(allEquip) do
			bUpgd = self:DoUpGradeEquip(equip) or bUpgd;
		end;
		if bUpgd then
			self:Synchronize();
		end;
	end;
end;

--GM设置所有装备品质
function CItemSystem:GM_EquipQuality(dwQuality)
	if type(dwQuality) ~= "number" then
		_info("itemsystem param type error!!!");
		return;
	end;
	local allEquip = self:GetAllPutOnEquip();
	if #allEquip > 0 then
		for _, equip in ipairs(allEquip) do
			local setProp = CGlobalItemManager:GetPropertyByQuality(equip:GetEnumID(), dwQuality);
			self:DoSetEquipProperty(equip, setProp);
		end;
		self:Synchronize();
	end;
end;

--GM设置所有装备天生属性
function CItemSystem:GM_EquipTianSheng(dwValue)
	if type(dwValue) ~= "number" then
		_info("itemsystem param type error!!!");
		return;
	end;
	local allEquip = self:GetAllPutOnEquip();
	if #allEquip > 0 then
		for _, equip in ipairs(allEquip) do
			self:DoSetEquipTianSheng(equip, dwValue);
		end;
		self:Synchronize();
	end;
end;

--GM命令扩展背包
function CItemSystem:GM_ExtendPacket()
	local packet = self:GetPacket();
	if packet:IsCanExtend() then
		local del = _G.InitConfig.dwMaxPacketSlotNum - packet:GetSlotNum();
		self:AddPacketSlotNum(del);
		
		self:Synchronize();
		return true;
	else
		return false;
	end;
end;



------------------------------------------------------------
---------------------道具相关设置接口-----------------------
------------------------------------------------------------

--绑定一个物品
function CItemSystem:BindItem(dwItemID)
	if type(dwItemID) ~= "number" then
		_info("itemsystem param type error!!!");
		return;
	end;
	local objItem = self:GetItemInst(dwItemID);
	if not objItem then return end;
	if self:IsItemLocked(dwItemID) then return end;
	if not objItem:IsBind() then
		self:DoBindItem(objItem);
		self:Synchronize();
	end;
end

--设置道具签名
function CItemSystem:SetItemDoodle(dwInstID, str)
	if type(dwInstID) ~= "number" then
		_info("itemsystem param type error!!!");
		return false;
	end;
	if type(str) ~= "string" then
		_info("itemsystem type(str) ~= string", str);
		return false;
	end;
	if self:IsItemLocked(dwInstID) then return false end;
	local itemInst = self:GetItemInst(dwInstID);
	if itemInst then
		self:DoSetItemDoodle(itemInst, str);
		self:Synchronize();
		return true;
	else
		_info("dwInstID not exist!!!:", dwInstID);
		return false;
	end;
end;


--设置装备强化属性
function CItemSystem:SetItemStrongLevel(dwInstID, dwLevel)
	if type(dwInstID) ~= "number" or type(dwLevel) ~= "number" then
		_info("itemsystem param type error!!!");
		return false;
	end;
	local equip = self:GetItemInst(dwInstID);
	if not equip then
		_info("dwInstID not exist!!!:", dwInstID);
		return false;
	end;
	if not equip:IsEquip() then
		_info("item not equip !!!:", dwInstID);
		return false;
	end;
	if self:IsItemLocked(dwInstID) then return false end;
	self:DoSetEquipStrongLevel(equip, dwLevel);
	
	self:Synchronize();
	return true;
end;

--装备升阶
function CItemSystem:ItemUpGrade(dwInstID)
	if type(dwInstID) ~= "number" then
		_info("itemsystem param type error!!!");
		return false;
	end;
	local equip = self:GetItemInst(dwInstID);
	if not equip then
		_info("dwInstID not exist!!!:", dwInstID);
		return false;
	end;
	if not equip:IsEquip() then
		_info("item not equip !!!:", dwInstID);
		return false;
	end;
	if self:IsItemLocked(dwInstID) then return false end;
	
	local bUpgd = self:DoUpGradeEquip(equip);
	if bUpgd then
		self:Synchronize();
	end;
	return bUpgd;
end;

--设置装备附加属性
function CItemSystem:SetItemProperty(dwInstID, setProp)
	if type(dwInstID) ~= "number" or type(setProp) ~= "table" then
		_info("itemsystem param type error!!!");
		return false;
	end;
	local equip = self:GetItemInst(dwInstID);
	if not equip then
		_info("dwInstID not exist!!!:", dwInstID);
		return false;
	end;
	if not equip:IsEquip() then
		_info("item not equip !!!:", dwInstID);
		return false;
	end;
	if self:IsItemLocked(dwInstID) then return false end;
	
	self:DoSetEquipProperty(equip, setProp);
	
	self:Synchronize();
	return true;
end;

--设置装备天生属性
function CItemSystem:SetItemTianSheng(dwInstID, dwValue)
	if type(dwInstID) ~= "number" or type(dwValue) ~= "number" then
		_info("itemsystem param type error!!!");
		return false;
	end;
	local equip = self:GetItemInst(dwInstID);
	if not equip then
		_info("dwInstID not exist!!!:", dwInstID);
		return false;
	end;
	if not equip:IsEquip() then
		_info("item not equip !!!:", dwInstID);
		return false;
	end;
	if self:IsItemLocked(dwInstID) then return false end;
	
	self:DoSetEquipTianSheng(equip, dwValue);
	
	self:Synchronize();
	return true;
end;



------------------------------------------------------------
----------------------耐久度相关接口------------------------
------------------------------------------------------------

--判断装备的耐久度是否需要提示修理
function CItemSystem:IsEquipNeedRepair()
	local allEquip = self:GetAllPutOnEquip();
	local fixMoney = 0
	for k, equip in ipairs (allEquip) do
		fixMoney = fixMoney + _G.EquipEndureRepairConfig.RepairCost(equip);
		if fixMoney > 0 then
			return true;
		end;
	end
	return false;
end

--修复所有穿戴的装备
function CItemSystem:RepairEquipsPutOn(bNotCostMoney)
	local allEquip = self:GetAllPutOnEquip();
	local fixMoney = 0
	for k, equip in ipairs (allEquip) do
		fixMoney = fixMoney + _G.EquipEndureRepairConfig.RepairCost(equip);
	end
	fixMoney = math.ceil(fixMoney);
	if fixMoney > 0 then
		if bNotCostMoney or self:IsPacketMoneyEnough(fixMoney) then
			for k, equip in ipairs(allEquip) do
				self:DoFixEquipEndure(equip);
			end
			if not bNotCostMoney then
				self:UpdatePacketMoney(- fixMoney, _G.ItemSysOperType.BuyNpc);
			end;
			self:Synchronize();
		else
			fixMoney = -fixMoney;
		end;
	end;
	
	return fixMoney;
end

--装备掉耐久
--dwMode:1--攻击；2--防御
function CItemSystem:DealWithSkillEndure(dwMode)
	local tbEquip = _G.EquipEndureConfig[dwMode];
		
	local dwTotleWeight = 0;
	local dwDownPos;
	local tbEndure;
	
	for pos,tbPer in pairs(tbEquip)do
		dwTotleWeight = dwTotleWeight + tbPer.dwWeight;
	end
	
	local dwRand = math.random(dwTotleWeight);
	dwTotleWeight = 0;
	
	for pos,tbPer in pairs(tbEquip)do
		dwTotleWeight = dwTotleWeight + tbPer.dwWeight;
		
		if dwRand < dwTotleWeight then
			dwDownPos = pos;
			tbEndure = tbPer;
			break;
		end
	end
	
	
	local dwItemID = self:GetEquipHolder():GetItemIDBySlot(dwDownPos);
	local equip = self:GetItemInst(dwItemID);
	if equip then
		local dwDownRand = math.random(tbEndure.dwMin, tbEndure.dwMax);
		self:DoDownEquipEndure(equip, dwDownRand);
	end;
end;


--死亡后身上穿的所有装备掉耐久
function CItemSystem:DeadDownEquipEndure(dwPKValue)    
	local fPer = PKConfig.fNowmalEndure;
	if dwPKValue > 0 then
		fPer = PKConfig.fEndure;
	end
	for _, equip in ipairs(self:GetAllPutOnEquip()) do
		local dwDownValue = math.floor(equip:GetConfigEndure() * fPer);
		self:DoDownEquipEndure(equip, dwDownValue);
	end;
	self:Synchronize();
end;



------------------------------------------------------------
--------------------获取道具个数相关接口--------------------
------------------------------------------------------------

--获得在背包容器中的指定配置ID道具的个数
function CItemSystem:GetEnumItemNumInPacket(dwEnumID)
	if type(dwEnumID) ~= "number" then
		_info("itemsystem param type error!!!");
		return 0, 0, 0;
	end;
	return self:GetEnumItemNumInHolder(enItemPosition.ePacket, dwEnumID);
end;

--获得在任务容器中的指定配置ID道具的个数
function CItemSystem:GetEnumItemNumInTaskRoom(dwEnumID)
	if type(dwEnumID) ~= "number" then
		_info("itemsystem param type error!!!");
		return 0, 0, 0;
	end;
	return self:GetEnumItemNumInHolder(enItemPosition.eTaskRoom, dwEnumID);
end;

--获取整个物品系统中指定配置ID道具的个数
function CItemSystem:GetEnumItemCounts(dwEnumID)
	if type(dwEnumID) ~= "number" then
		_info("itemsystem param type error!!!");
		return 0;
	end;
	local dwCounts = 0;
	local dwNumPacket, _, _ = self:GetEnumItemNumInHolder(enItemPosition.ePacket, dwEnumID);
	local dwNumStorage, _, _ = self:GetEnumItemNumInHolder(enItemPosition.eStorage, dwEnumID);
	dwCounts = dwNumPacket + dwNumStorage;
	return dwCounts;
end;



------------------------------------------------------------
----------------------添加道具相关接口----------------------
------------------------------------------------------------

--能否将列表中所有配置ID的道具添加到背包中
function CItemSystem:IsEnumItemListCanAddToPacket(setAddList)
	return self:IsEnumItemListCanAddTo(enItemPosition.ePacket, setAddList);
end;

--向背包中加入一组配置道具列表道具
-- bnotComposition true 不可叠加 false可叠加
function CItemSystem:AddEnumItemListToPacket(setAddList, szType, bnotComposition)
	--local nowTime = os.now();
	--print("======1======", nowTime)
		--判断格子数
	if bnotComposition then
		local holder = self:GetHolder(enItemPosition.ePacket);

		if not holder:IsSlotEnoughFor(#setAddList) then
			return false;
		end
	end
	local addTable = self:AddEnumItemListTo(enItemPosition.ePacket, setAddList, szType);
	
	if addTable then
		self:Synchronize();
	end;
	--print("======2======", os.now(), os.now() - nowTime);
	return addTable;
end;

--向结婚信物容器加入一组配置道具列表的道具
function CItemSystem:AddEnumItemListToKeepsake(setAddList, szType)
	local addTable = self:AddEnumItemListTo(enItemPosition.eKeepsake, setAddList, szType);
	
	if addTable then
		self:Synchronize();
	end;
	
	return addTable;
end;

--向任务道具容器加入一组配置道具列表的道具
function CItemSystem:AddEnumItemListToTaskRoom(setAddList, szType)
	local addTable = self:AddEnumItemListTo(enItemPosition.eTaskRoom, setAddList, szType);
	
	if addTable then
		self:Synchronize();
	end;
	
	return addTable;
end;

--向背包的固定位置添加一个道具
function CItemSystem:AddEnumItemToPacketSlot(sItemInfo, dwSlot, szType)
	return self:TryAddEnumItemToHolderSlot(sItemInfo, _G.enItemPosition.ePacket, dwSlot, szType);
end;

--向宝石容器的固定位置添加一个宝石
function CItemSystem:AddEnumItemToStoneRoomWearPos(sItemInfo, dwWearPos, szType)
    local dwSlot = self:GetStoneRoom():GetOneEmptySlot(dwWearPos);
    return self:TryAddEnumItemToHolderSlot(sItemInfo, _G.enItemPosition.eStone, dwSlot, szType);
end;

--尝试向容器的固定位置添加一个道具
function CItemSystem:TryAddEnumItemToHolderSlot(sItemInfo, dwHolderClass, dwSlot, szType)
	if (type(sItemInfo.dwItemEnum) ~= "number") or (not CGlobalItemManager:IsHaveThisItem(sItemInfo.dwItemEnum)) then
		_info("dwItemEnum error");
		return false;
	end;
	if (type(sItemInfo.dwItemNumber) ~= "number") or (sItemInfo.dwItemNumber <= 0) then
		_info("dwItemNumber error");
		return false;
	end;
	--首先判断增加个数有没有超出最大叠加个数
	if sItemInfo.dwItemNumber > CGlobalItemManager:GetMaxRepeat(sItemInfo.dwItemEnum) then
		_info("dwItemNumber > MaxRepeat:");
		return false;
	end;
    if type(dwSlot) ~= "number" then
        _info("dwSlot type error!!!");
        return false;
    end;
	
	local holder = self:GetHolder(dwHolderClass);
	local dwItemID = holder:GetItemIDBySlot(dwSlot);
	
	local dwItemEnum = sItemInfo.dwItemEnum;
	local dwItemNumber=sItemInfo.dwItemNumber;
	local dwBindType = sItemInfo.dwBindType or CGlobalItemManager:GetBindType(dwItemEnum);
	local dwLifeTime = sItemInfo.dwLifeTime or CGlobalItemManager:GetLifeTime(dwItemEnum);
	local dwBornTime = GetCurTime();
	
	local addItemID;
	
	if dwItemID > 0 then
		if self:IsItemLocked(dwItemID) then return false end;
		local objItem = self:GetItemInst(dwItemID);
		local dwCanMerge = objItem:CanMergeHowMany(dwItemEnum, dwBindType, dwLifeTime, dwBornTime);
		if dwCanMerge < dwItemNumber then--不够叠加
			return false;
		else
			self:DoAddItemNum(objItem, dwItemNumber, szType);
			addItemID = objItem:GetInstID();
		end;
	else
		local objItem = CItem:New(dwItemEnum);
		objItem:SetBindType(dwBindType);
		objItem:SetLifeTime(dwLifeTime);
		objItem:SetBornTime(dwBindType);
		if objItem:IsEquip() then
			if sItemInfo.setProperty then
				objItem:SetProperty(sItemInfo.setProperty);
			end;
			if sItemInfo.dwStrongLevel then
				objItem:SetStrongLevel(sItemInfo.dwStrongLevel);
			end;
			if sItemInfo.dwTianSheng then
				objItem:SetTianSheng(sItemInfo.dwTianSheng);
			end;
		end;
		if holder:IsCanAddItemToSlot(objItem, dwSlot) then
			self:AddObjItemToHolderSlot(objItem, dwHolderClass, dwSlot, szType)
			addItemID = objItem:GetInstID();
		else
			return false;
		end;
	end;
	--通知其他系统增加道具
	self:DoItemEvent("NotifyItemAdded", dwItemEnum, dwItemNumber);
    --日志记录
    self:LogAddItem(dwItemEnum, dwItemNumber, szType, dwBindType);
	
	self:Synchronize();
	return addItemID;
end;


--能否将列表中所有道具对象添加到背包中
function CItemSystem:IsObjItemListCanAddToPacket(setAddList)
	return self:IsObjItemListCanAddTo(setAddList, enItemPosition.ePacket);
end;

--向背包中加入一组道具实例对象
function CItemSystem:AddObjItemListToPacket(setAddList, szType)
	local addTable = self:AddObjItemListTo(setAddList, enItemPosition.ePacket, szType);
	
	if addTable then
		self:Synchronize();
	end;
	
	return addTable;
end;




------------------------------------------------------------
----------------------删除道具相关接口----------------------
------------------------------------------------------------

--用来查询指定存放位置（如背包）中指定配置ID的道具的个数
----返回值1	拥有个数是否足够
----返回值2	如果不够差多少
function CItemSystem:CheckDelEnumItemInPacketCond(dwEnumID, dwDelNum)
	return self:CheckDelEnumItemInHolderCond(enItemPosition.ePacket, dwEnumID, dwDelNum)
end;


--在背包容器中删除指定配置ID物品
--两个返回值,第一个返回值为删除是否成功，第二个返回值为是否删除了绑定的。
function CItemSystem:DelEnumItemInPacket(dwEnumID, dwNumber, bUseUnBindFirst, szType)
	local bIsEnough, _ =  self:CheckDelEnumItemInHolderCond(enItemPosition.ePacket, dwEnumID, dwNumber);
	if not bIsEnough then return false end;
	
	local res = self:DelEnumItemInHolder(enItemPosition.ePacket, dwEnumID, dwNumber, bUseUnBindFirst, szType)
	
	self:Synchronize();
	return bIsEnough, res;
end;
--检查包裹物品是否过时
function CItemSystem:CheckPacketItemIsNotTime(dwEnumID,bUseUnBindFirst,dwNumber)
	local bIsEnough, _ =  self:CheckDelEnumItemInHolderCond(enItemPosition.ePacket, dwEnumID, dwNumber);
	if not bIsEnough then 
		return false; 
	end;
	local res = self:CheckPacketItemIsNotTimeInHolder(enItemPosition.ePacket, dwEnumID, dwNumber, bUseUnBindFirst)
	return res;
end;

function CItemSystem:CheckPacketItemIsNotTimeInHolder(dwHolderClass, dwEnumID, dwNumber, bUseUnBindFirst)
	local setBindObjs, setUnBindObjs = self:GetEnumItemInstInHolder(dwHolderClass, dwEnumID);
	local bUseBind = false;
	if bUseUnBindFirst then
		for _, objItem in ipairs(setUnBindObjs) do
			if not self:IsItemLocked(objItem:GetInstID()) then
				local dwCount = objItem:GetCount();
				if dwNumber >= dwCount then
					if(not objItem:IsAlive()) then
						return true;
					end
					dwNumber = dwNumber - dwCount;
				else
					if(not objItem:IsAlive()) then
						return true;
					end
					break;
				end;
			end;
		end;
		if dwNumber > 0 then
			for _, objItem in ipairs(setBindObjs) do
				if not self:IsItemLocked(objItem:GetInstID()) then
					bUseBind = true;
					local dwCount = objItem:GetCount();
					if dwNumber >= dwCount then
						if(not objItem:IsAlive()) then
							return true;
						end
						dwNumber = dwNumber - dwCount;
					else
						if(not objItem:IsAlive()) then
							return true;
						end
						break;
					end;
				end;
			end;
		end;
	else
		for _, objItem in ipairs(setBindObjs) do
			if not self:IsItemLocked(objItem:GetInstID()) then
				bUseBind = true;
				local dwCount = objItem:GetCount();
				if dwNumber >= dwCount then
					if(not objItem:IsAlive()) then
						return true;
					end
					dwNumber = dwNumber - dwCount;
				else
					if(not objItem:IsAlive()) then
						return true;
					end
					break;
				end;
			end;
		end;
		if dwNumber > 0 then
			for _, objItem in ipairs(setUnBindObjs) do
				if not self:IsItemLocked(objItem:GetInstID()) then
					local dwCount = objItem:GetCount();
					if dwNumber >= dwCount then
						if(not objItem:IsAlive()) then
							return true;
						end
						dwNumber = dwNumber - dwCount;
					else
						if(not objItem:IsAlive()) then
							return true;
						end
						break;
					end;
				end;
			end;
		end;
	end;
	return false;
end
--在任务容器中删除指定配置ID物品
--两个返回值,第一个返回值为删除是否成功，第二个返回值为是否删除了绑定的。
function CItemSystem:DelEnumItemInTaskRoom(dwEnumID, dwNumber, bUseUnBindFirst, szType)
	local bIsEnough, _ =  self:CheckDelEnumItemInHolderCond(enItemPosition.eTaskRoom, dwEnumID, dwNumber);
	if not bIsEnough then return false end;
	
	local res = self:DelEnumItemInHolder(enItemPosition.eTaskRoom, dwEnumID, dwNumber, bUseUnBindFirst, szType)
	
	self:Synchronize();
	return bIsEnough, res;
end;


--直接删除指定道具实例
function CItemSystem:DelObjItem(dwInstID, szType)
	if (type(dwInstID) ~= "number") then
		_info("itemsystem param type error!!!");
		return false;
	end;
	local objItem = self:GetItemInst(dwInstID);
	if objItem then
		if self:IsItemLocked(dwInstID) then return false end;
		self:DoDelItem(objItem, szType);
		--通知其它系统删除了某一个物品
		self:DoItemEvent("NotifyItemDelete", objItem:GetEnumID(), objItem:GetCount());
        
        --记录日志
        self:LogDelItem(objItem:GetEnumID(), objItem:GetCount(), szType, objItem:GetBindType());
        
		self:Synchronize();
		return true;
	else
		_info("Item not exist!", dwInstID);
		return false;
	end;
end;

--减少道具实例的个数
function CItemSystem:DelItemNumber(dwInstID, dwNumber, szType)
	if (type(dwInstID) ~= "number") or (type(dwNumber) ~= "number") then
		_info("itemsystem param type error!!!");
		return false;
	end;
	if dwNumber <= 0 then
		_info("Param dwNumber Error:", dwNumber);
		return false;
	end
	local objItem = self:GetItemInst(dwInstID);
	if not objItem then
		_info("Item not Exist:");
		return false;
	end
	if self:IsItemLocked(dwInstID) then return false end;
	local dwCount = objItem:GetCount();
	if dwCount < dwNumber then
		return false;
	elseif dwCount == dwNumber then--直接删除整个道具。。。
		self:DoDelItem(objItem, szType);
	else
		self:DoDelItemNum(objItem, dwNumber, szType);
	end;
	--通知其它系统删除了某一个物品
	self:DoItemEvent("NotifyItemDelete", objItem:GetEnumID(), dwNumber);

    --记录日志
    self:LogDelItem(objItem:GetEnumID(), dwNumber, szType, objItem:GetBindType());
	
	self:Synchronize();
	return true;
end;



------------------------------------------------------------
----------------------使用道具相关接口----------------------
------------------------------------------------------------

--使用一个物品的操作，将会根据物品的功能来使用
--bIgnProc(忽略读条时间)
function CItemSystem:UseItem(dwItemID, bIgnProc)
	if (type(dwItemID) ~= "number") then
		_info("itemsystem param type error!!!");
		return false;
	end;
	
	local objItem = self:GetItemInst(dwItemID);
	if not objItem then
		return false
	end;
	
	--地图禁止使用的检测
	local objSelf = self:GetPlayer();
	if not objSelf then
		return;
	end
	local objMap = objSelf:GetSystem("CMapSystem"):GetCurMap();
	if not objMap then
		return;
	end
	local tbForbidList = ForbidUseRuleConfig[objMap.MapID];
	if tbForbidList then
		if tbForbidList[objItem:GetEnumID()] then
			return;
		end
	end
	
	if self:IsItemLocked(dwItemID) then return false end;
	--常规检查
	if not self:UseItemCommonCheck(objItem) then
		return false;
	end
	--脚本检查
	local script = objItem:GetScript();
	local scripSys = self:GetPlayer():GetSystem("CScriptSystem");
	local res1 = script:CheckForUse(self, objItem, scripSys);
	if not res1 then
		return false;
	else
		-- if type(res1) ~= 'number' then
			-- _info("item script checkforuse return not number!!!", objItem:GetEnumID());
		-- end;
		if res1 > 0 and not bIgnProc then
			self:GetPlayer().ItemUseTimerBeginMsg{ItemID = objItem:GetInstID(), Time = res1 };
			return false;
		end;
	end;
	
	if self:DoUseItem(objItem) then
		self:Synchronize();
		return true;
	end;
	
	return false;
end


--使用在指定容器中指定配置ID道具
function CItemSystem:UseEnumItemInHolder(dwEnumID, dwHolderClass)
	if (type(dwEnumID) ~= "number") or (not CGlobalItemManager:IsHaveThisItem(dwEnumID)) then
		_info("itemsystem param type error!!!");
		return false;
	end;
	local setBindObjs, setUnBindObjs = self:GetEnumItemInstInHolder(dwHolderClass, dwEnumID);
	if #setBindObjs > 0 then
		return self:UseItem(setBindObjs[1]:GetInstID());
	end;
	if #setUnBindObjs > 0 then
		return self:UseItem(setUnBindObjs[1]:GetInstID());
	end;
	return false;
end;

--使用在背包中指定配置ID道具
function CItemSystem:UseEnumItemInPacket(dwEnumID)    
	return self:UseEnumItemInHolder(dwEnumID, enItemPosition.ePacket);
end;

---批量使用背包中指定位置的道具
function CItemSystem:MassUseItem(dwItemID,dwNum)
	if(dwNum > 99) then
		dwNum = 99;
	end
	local objPlayer = self:GetPlayer()
	if( not objPlayer ) then
		_info("error : CItemSystem:MassUseItem(dwSlot) objPlayer is error",objPlayer)
		return false;
	end
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	if(not sysScript) then
		_info("error : CItemSystem:MassUseItem(dwSlot) sysScript is error",sysScript)
		return false;
	end
	if(type(dwItemID) ~= "number") then
		_info("error : CItemSystem:MassUseItem(dwSlot) dwItemID is error",dwItemID)
		return false;
	end
	local objItem = self:GetItemInst(dwItemID);
	if(objItem == nil) then
		_info("error : CItemSystem:MassUseItem(dwSlot) objItem is error",objItem,dwItemID)
		sysScript:Notice(4000110039)
		return false;
	end
	local dwHolder, _ = objItem:GetPosInfo();
	if( dwHolder ~= _G.enItemPosition.ePacket ) then
		_info("error : CItemSystem:MassUseItem(dwSlot) dwItemID is error",dwItemID)
		sysScript:Notice(4000110039)
		return false;
	end
	
	if( objItem:GetCount() < dwNum  ) then
		sysScript:Notice(4000110038)
		return false;
	end
	if( dwNum < 1 ) then
		sysScript:Notice(4000110038)
		return false;
	end
	local dwEnumID = objItem:GetEnumID();
	local isTrue = false;
	for k,v in pairs (_G.MassItemUseConfig) do
		if( v == dwEnumID) then
			isTrue = true;
			break;
		end
	end
	if( not isTrue) then
		sysScript:Notice(4000110037)
		return false; 
	end
	
	if self:IsItemLocked(dwItemID) then
		_info("MassUseItem is lock")
		return false;
	end;
	--常规检查
	if not self:UseItemCommonCheck(objItem) then
		_info("MassUseItem is UseItemCommonCheck")
		return false;
	end
	
	self:DoMassUseItem(objItem,dwNum);
	self:Synchronize();
	return true;
end

------------------------------------------------------------
----------------------移动道具相关接口----------------------
------------------------------------------------------------

--移动道具到背包
function CItemSystem:MoveItemToPacket(dwInstID)
	return self:TryMoveItemToHolderSlot(dwInstID, _G.enItemPosition.ePacket, nil)
end;

--移动道具到背包指定位置
function CItemSystem:MoveItemToPacketSlot(dwInstID, dwSlot)
	return self:TryMoveItemToHolderSlot(dwInstID, _G.enItemPosition.ePacket, dwSlot);
end;

--移动道具到npc商店容器
function CItemSystem:MoveItemToStore(dwInstID)
	return self:TryMoveItemToHolderSlot(dwInstID, _G.enItemPosition.eStore, nil)
end;

--移动道具到信物容器
function CItemSystem:MoveItemToKeepSake(dwInstID)
	return self:TryMoveItemToHolderSlot(dwInstID, _G.enItemPosition.eKeepsake, nil)
end;

--移动道具到摆摊容器
function CItemSystem:MoveItemToBooth(dwInstID)
	return self:TryMoveItemToHolderSlot(dwInstID, _G.enItemPosition.eBooth, nil)
end;

--移动道具到坐骑装备容器
function CItemSystem:MoveItemToHorseEquip(dwInstID)
	return self:TryMoveItemToHolderSlot(dwInstID, _G.enItemPosition.eHorseEquip, nil)
end;

--移动道具到坐骑装备容器指定位置
function CItemSystem:MoveItemToHorseEquipSlot(dwInstID, dwSlot)
	return self:TryMoveItemToHolderSlot(dwInstID, _G.enItemPosition.eHorseEquip, dwSlot)
end;

--移动道具到护身宝甲容器
function CItemSystem:MoveItemToAmulet(dwInstID)
	return self:TryMoveItemToHolderSlot(dwInstID, _G.enItemPosition.eAmulet, nil)
end;

--戴上结婚信物
function CItemSystem:WearKeepsake(dwInstID)
	return self:TryMoveItemToHolderSlot(dwInstID, _G.enItemPosition.ePutOn, _G.enItemWearPos.eKeepsake);
end;

--尝试移动道具到指定容器指定位置
function CItemSystem:TryMoveItemToHolderSlot(dwInstID, dwToHolder, dwToSlot)
	if (type(dwInstID) ~= "number") then
		_info("itemsystem param type error!!!");
		return false;
	end;
	if dwToSlot and (type(dwToSlot) ~= "number") then
		_info("itemsystem param type error!!!");
		return false;
	end;
	local itemInst = self:GetItemInst(dwInstID);
	if not itemInst then
		_info("dwInstID not exist!!!");
		return false;
	end;
	if self:IsItemLocked(dwInstID) then return false end;
	
	local dwFromHolder, dwFromSlot = itemInst:GetPosInfo();
	local fromHolder = self:GetHolder(dwFromHolder);
	local toHolder = self:GetHolder(dwToHolder);
	
	if dwFromHolder ~= dwToHolder then
		dwToSlot = dwToSlot or toHolder:GetOneEmptySlot();
		
		if dwToHolder == enItemPosition.eStorage then
			local objEventCenter = self:GetPlayer():GetSystem("CPlayerEventCenterSystem");
			if objEventCenter then
				objEventCenter:DoEvent(enumPlayerEventType.EventStorageUse);
			end
		end
	else
		if dwToSlot == dwFromSlot then
			_info("move to same slot")
			return;
		end
	end;
	
	if not dwToSlot or dwToSlot <= 0 then
		_info("not dwToSlot or dwToSlot <= 0");
		return false;
	end;	
	
	if not toHolder:IsCanAddItemToSlot(itemInst, dwToSlot) then
		return false;
	end;
	
	local targetItem = self:GetItemInst(toHolder:GetItemIDBySlot(dwToSlot));
	if targetItem then--如果目标上有道具，先合并
		if self:IsItemLocked(toHolder:GetItemIDBySlot(dwToSlot)) then return false end;
		if not self:MergeItemAToItemB(itemInst, targetItem) then--不能合并
			--交换位置
			if fromHolder:IsCanAddItemToSlot(targetItem, dwFromSlot) then
				self:SwapItemAWithItemB(itemInst, targetItem);
			else
				return false;
			end;
		end;
	else
		self:MoveItemToHolderSlot(itemInst, fromHolder, dwFromSlot, toHolder, dwToSlot);
	end;
	
	self:Synchronize();
	return true;
end;

--尝试移动成组道具到护身宝甲容器
function CItemSystem:TryMoveItemListToAmulet(setItemList)
	if (type(setItemList) ~= "table") then
		_info("itemsystem param type error!!!");
		return false;
	end;
    local toHolder = self:GetAmulet();
    for _,  dwInstID in ipairs(setItemList) do
		if (type(dwInstID) ~= "number") then
			_info("itemsystem param type error!!!");
			return false;
		end;
        local itemInst = self:GetItemInst(dwInstID);
        if not itemInst then
            _info("dwInstID not exist!!!:", dwInstID);
            return false;
        end;
		if self:IsItemLocked(dwInstID) then return false end;
        local dwFromHolder, dwFromSlot = itemInst:GetPosInfo();
        local fromHolder = self:GetHolder(dwFromHolder);
        if fromHolder == toHolder then
            _info("fromHolder == toHolder");
            return false;
        end;
        local dwToSlot = toHolder:GetOneEmptySlot();
        if not toHolder:IsCanAddItemToSlot(itemInst, dwToSlot) then
            return false;
        end;
        
        self:MoveItemToHolderSlot(itemInst, fromHolder, dwFromSlot, toHolder, dwToSlot);
    end;
	
	self:Synchronize();
	return true;
end;

------------------------------------------------------------
-------------------------道具拆分---------------------------
------------------------------------------------------------

--拆分道具操作有效性检查
function CItemSystem:CheckSplitItem(dwItemID, dwSplitNum, dwHolderClass)	
	--获取旧物品对象
	local objItem = self:GetItemInst(dwItemID);
	if not objItem then
		_info("Split Item Not Found", dwItemID)
		return 0;
	end;
	
	if self:IsItemLocked(dwItemID) then return 0 end;
	
	--判断容器
	local dwHolder, _ = objItem:GetPosInfo();
	dwHolderClass = dwHolderClass or dwHolder;--如果没有指定拆分到的容器，那么在当前容器拆分。
	local holder = self:GetHolder(dwHolderClass);
	
	if not holder:IsCanAddItemToSlot(objItem) then
		self:OnError(6000610004, dwItemID, 0);
		_info("cannot addItem to holder", dwItemID, dwHolderClass);
		return 0;
	end;
	
	--判断拆分个数
	if objItem:GetCount() < dwSplitNum then
		self:OnError(6000610010, dwItemID, 0);
		_info("objItem:GetCount() < dwSplitNum");
		return 0, nil, nil;
	elseif objItem:GetCount() == dwSplitNum then
		return 1, objItem, dwHolderClass
	else
		return 2, objItem, dwHolderClass;
	end;
end;

--客户端拆分物品请求
function CItemSystem:SplitItem(dwItemID, dwSplitNum)
	return self:TrySplitItemToHolder(dwItemID, dwSplitNum, nil);
end;

--拆分一个物品到摆摊容器中
function CItemSystem:SplitItemToBooth(dwItemID, dwSplitNum)
	return self:TrySplitItemToHolder(dwItemID, dwSplitNum, enItemPosition.eBooth);
end;

--拆分指定数量的一个物品到护身宝甲熔炼容器中
function CItemSystem:SplitItemToAmulet(dwItemID, dwSplitNum)
	return self:TrySplitItemToHolder(dwItemID, dwSplitNum, enItemPosition.eAmulet);
end;

--拆分道具到指定容器中
function CItemSystem:TrySplitItemToHolder(dwItemID, dwSplitNum, dwHolderClass)
	if (type(dwItemID) ~= "number") or (type(dwSplitNum) ~= "number") then
		_info("itemsystem param type error!!!");
		return false;
	end;
	--检查拆分数量有效性
	if dwSplitNum <= 0 then
		_info("dwSplitNum <= 0");
		return false;
	end;
	local resType, objItem, dwHolderClass = self:CheckSplitItem(dwItemID, dwSplitNum, dwHolderClass)
	if resType == 0 then return false end;
	
	if resType == 1 then
		if self:TryMoveItemToHolderSlot(dwItemID, dwHolderClass, nil) then
			return dwItemID;
		else
			return false;
		end;
	else
		local newItemID = self:SplitItemTo(objItem, dwSplitNum, dwHolderClass);
		self:Synchronize();
		return newItemID;
	end;
end;

------------------------------------------------------------
-----------------------扩展容器接口-------------------------
------------------------------------------------------------

--扩展容器
function CItemSystem:TryExtendHolder(dwHolderClass)
	local holder = self:GetHolder(dwHolderClass);
	--判断是否可以扩展
	if (not holder) or (not holder:IsCanExtend()) then return end;
	--检查扩展所需材料是否足够
	local dwItemEnum, dwNumberNeeded = _G.G_CountExtendUsed(holder:GetSlotNum(), dwHolderClass);
	local res, _ = self:CheckDelEnumItemInPacketCond(dwItemEnum, dwNumberNeeded);

	if res then
		self:DelEnumItemInHolder(enItemPosition.ePacket, dwItemEnum, dwNumberNeeded, false, _G.ItemSysOperType.Used)
		self:ExtendHolder(dwHolderClass);
		self:Synchronize();
		
		if dwHolderClass == enItemPosition.ePacket then
			local objEventCenter = self:GetPlayer():GetSystem("CPlayerEventCenterSystem");
			if objEventCenter then
				objEventCenter:DoEvent(enumPlayerEventType.EventPacketExtend);
			end
		end
		return true;
	else
		self:OnError(6000610015);
		return false;
	end;
end;



------------------------------------------------------------
-----------------------整理容器接口-------------------------
------------------------------------------------------------
function CItemSystem:TryPackUpHolder(dwHolderClass)
	if self:IsHaveLockedItem() then 
        self:GetPlayer().OnPackUpCompleteMsg{
            Error = 6000510029;
            PosType = 0;
        };
        return false;
    end
	
	self:DoPackUpHolder(dwHolderClass);
	self:Synchronize(true);
	self:GetPlayer().OnPackUpCompleteMsg{
        Error = 0; PosType = dwHolderClass;
    };
	return true;
end;

------------------------------------------------------------
------------------------道具锁定接口------------------------
------------------------------------------------------------
--锁定
function CItemSystem:LockItem(nItemInstID)
	if self:GetItemInst(nItemInstID) then
		self.setLockedItem[nItemInstID] = true;
	end;
end;
--解锁
function CItemSystem:UnlockItem(nItemInstID)
	self.setLockedItem[nItemInstID] = nil;
end;
--判断是否锁定
function CItemSystem:IsItemLocked(nItemInstID)
	return self.setLockedItem[nItemInstID];
end;
--判断是否有锁定道具
function CItemSystem:IsHaveLockedItem()	
	for k, v in pairs(self.setLockedItem) do
		local dwHolderClass, dwSlot = self:GetItemInst(k):GetPosInfo();
		if dwHolderClass == _G.enItemPosition.ePacket or dwHolderClass == _G.enItemPosition.eStorage then
			return true;
		end;
	end;
	return false;
end;

------------------------------------------------------------
-------------------------日志接口---------------------------
------------------------------------------------------------
--增加道具记录日志
function CItemSystem:LogAddItem(dwItemEnum, dwAddNum, szType, dwBindType)
	if CGlobalItemManager:GetParentType(dwItemEnum) == 2 then
		if CGlobalItemManager:GetChildType(dwItemEnum) == 10 or CGlobalItemManager:GetChildType(dwItemEnum) == 20 then
			return;
		end;
	end;
    if (not szType) or (type(szType) ~= "number") then
        _info("LogAddItem szType err!!!", szType);
    else
		-- 全部
		CLogSystemManager:item_log(self:GetPlayer(), dwItemEnum, szType, dwAddNum);
		 -- 非购买记录
        if szType ~= _G.ItemSysOperType.BuyNpc and szType ~= _G.ItemSysOperType.BuyMall then
            local totalNum = self:GetEnumItemCounts(dwItemEnum);
            CLogSystemManager:item_income(self:GetPlayer(), dwItemEnum, dwAddNum, szType , dwBindType, totalNum);
        end;
    end;
end;

--删除道具记录日志
function CItemSystem:LogDelItem(dwItemEnum, dwDelNum, szType, dwBindType)
	if CGlobalItemManager:GetParentType(dwItemEnum) == 2 then
		if CGlobalItemManager:GetChildType(dwItemEnum) == 10 or CGlobalItemManager:GetChildType(dwItemEnum) == 20 then
			return;
		end;
	end;
    if (not szType) or (type(szType) ~= "number") then
        _info("LogDelItem szType err!!!", szType);
    else
		-- 全部
		CLogSystemManager:item_log(self:GetPlayer(), dwItemEnum, szType, -dwDelNum);
		-- 商城物品日志
        if CMallManager:IsGoldItem(dwItemEnum) then
            local totalNum = self:GetEnumItemCounts(dwItemEnum);
            CLogSystemManager:item_use(self:GetPlayer(), dwItemEnum, dwDelNum, totalNum, 1, dwBindType, szType);
        end;
    end;
end;



------------------------------------------------------------
---------------------代码不得不保留的-----------------------
------------------------------------------------------------

--提示在客户端飞物品的图标，参数是表：key是序号，value是dwItemEnum，物品配置ID
function CItemSystem:FlyItemIconToPacket(ItemEnums)
	self:GetPlayer().FlyItemIconToPacketMsg{Items = ItemEnums};
end



--获取装备的网络数据传输结构，key是dwWearPos，value是SItemMessage结构
function CItemSystem:GetEquipsNetData()
	local setItemMsg = {};
	for _, equip in ipairs(self:GetAllPutOnEquip()) do
		local sItemMsg = equip:GetNetData();
		--equip:FillItemMessage( sItemMsg );
		setItemMsg[equip:GetWearPos()] = sItemMsg;
	end
	return setItemMsg;
end

--获取宝石的网络结构
function CItemSystem:GetStoneNetData()
	local setStoneMsg = {};
	for _, objStone in ipairs(self:GetAllStone()) do
		local sItemMsg = objStone:GetNetData();
		table.insert(setStoneMsg,sItemMsg)
	end
	
	return setStoneMsg;
end;


------------------------------------------------------------
---------------查看其他玩家获得装备信息接口-----------------
------------------------------------------------------------
function CItemSystem:GetAllEquipsNetData()
	local equipMsg = {};
	for _, equip in ipairs(self:GetAllPutOnEquip()) do
		table.insert(equipMsg, equip:GetNetData());
	end;
	return equipMsg;
end;


--物品网络数据对应数字key的表
local ItemKeyTable = {
	dwItemID = 1;
	dwRoleID = 2;
	--合并以下三个参数
	dwPosition = 3;--self.dwPosition;
	dwPosPage = 4;--self.dwPosPage;
	dwPosSlot = 5;--self.dwPosSlot;
	dwPosPageSlot = 6;
	
	dwItemEnum =7;
	dwItemNumber = 8;
	dwBindType = 9;
	dwDestroyType = 10;
	--附加属性列表需要特别计算
	--sItemMsg.dwQuality = nil;
	setProperty = 11;
	--强化信息需要特别计算
	setStrongInfo = 12;
	--强化奖励需要特殊计算
	setStrongReward = 13;
	dwTianSheng = 14;
	--赋值宝石信息
	setStoneInfo = 15;
	strHusbandName = 16;
	strWifeName = 17;
	dwMarryTime = 18;
	dwBornTime = 19;
	dwLifeTime = 20;
};

---将物品数据的key转换成数字
function CItemSystem:KeyNameToNumber( itemMsgs )
	local itemList = {};
	for k,it in pairs(itemMsgs) do
		if type(it) == "table" then
			local item = {};
			local propList = {};
			--转换物品的附加属性表为数字 setProperty = 11
			for i,prop in pairs(it.setProperty) do
				local p = { prop.dwPropertyType, prop.dwValue };
				table.insert(propList, p);
			end
			--拷贝已知数字key的数据到新表中
			for name,value in pairs(it) do
				if ItemKeyTable[name] then
					item[ ItemKeyTable[name] ] = value;
				else--防止出现未知数据没有拷贝过去的情况
					item[name] = value;
				end
			end
			--转换物品的附加属性表为数字 setProperty = 11
			item[11] = propList;
			--table.insert(itemList, item);
			itemList[k] = item;
		end
	end
	--print("data 001 =====", #itemMsgs, #_encode(itemMsgs));
	--print("data 002 =====", #_encode(itemList));
	return itemList;
end

--获取最大堆叠数量
function CItemSystem:GetMaxRepeat(dwEnumID)
	return CGlobalItemManager:GetMaxRepeat(dwEnumID);
end;
