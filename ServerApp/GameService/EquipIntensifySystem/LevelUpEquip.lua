----------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------装备升阶逻辑-------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------
--服务器响应客户端装备升阶请求
function CEquipIntensifySystem:LevelUpEquip(QuestTable)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("cannot find objPlayer by CEquipIntensifySystem:LevelUpEquip");
		return;
	end;
	--参数有效性检查
	--权限检测
	if not self:HasAuthority("EquipUpgrade") then return end;
	--得到装备实例
	local itemInst = self.ItemSystem:GetItem(QuestTable.ItemInstId);
	local enumId = itemInst:GetEnumID()
	local quality = itemInst:GetQuality();
	--检测ItemInstId是否存在
	if not itemInst then return end;
	local name = itemInst:GetName()
	--检测ItemInstId是否是装备
	if not itemInst:IsEquip() then return end;
	--检测装备生命周期
	if not itemInst:IsAlive() then return end;
	--检测装备强化等阶
	if itemInst:GetStrongLevel() < _G.LevelUpEquipConfig.StrongLevel then
		return;
	end;
	--检测装备穿戴位置
	if not self:CheckInTable(_G.LevelUpEquipConfig.CanIntensifyTable, itemInst:GetWearPos()) then return end;
	--检测等阶是否已满
	if itemInst:GetNextItem() == 0 then return end;
	--记录是否为坐骑装备并且升阶后无法穿戴需要脱下
	local b_PutOffMountEquip = nil;
	local n_MountInstID = 0;
	local n_Slot = 0;
	--检测升阶成功后是否能穿戴
	if QuestTable.IsMountEquip then
		local mountSystem = objPlayer:GetSystem("CMountSystem");
		if not mountSystem then
			_err("cannot get MountSystem");
			return;
		end;
		local mountInst = nil;
		--找出是哪个坐骑的哪件装备
		for k, v in pairs(mountSystem.t_Mount) do
			if mountInst then break end;
			for slot, n_EquipID in pairs(v.t_Equip) do
				if n_EquipID == itemInst:GetInstID() then 
					n_MountInstID = k;
					mountInst = v;
					n_Slot = slot;
					break;
				end;
			end;
		end;
		if not mountInst or n_Slot == 0 then return end;
		if CGlobalItemManager:GetLevelNeeded(itemInst:GetNextItem()) > mountInst:GetLevel() then
			b_PutOffMountEquip = true;
			if not self.ItemSystem:IsPacketSlotEnoughFor(1) then return end;
		end;
	else
		if CGlobalItemManager:GetLevelNeeded(itemInst:GetNextItem()) > objPlayer:GetInfo().dwLevel then
			if not self.ItemSystem:IsPacketSlotEnoughFor(1) then return end;
		end;
	end;
	--如果升阶后等级不够不可穿戴且背包空位为0
	local selfLevel = objPlayer:GetInfo().dwLevel;
	local isWear  = self.ItemSystem:IsEquipWorn(itemInst);
	local isBelow = CGlobalItemManager:GetLevelNeeded(itemInst:GetNextItem()) > selfLevel;
	local isFull  = not self.ItemSystem:IsPacketSlotEnoughFor(1);
	if isWear and isBelow and isFull then return end;
	
	--运算出强化装备的数据
	local needMoney		 = math.ceil(_G.LevelUpEquipConfig.NeedMoney(itemInst) * self.nDiscount_LevelUp);	--强化需要金钱
	local needSJStoneNum = _G.LevelUpEquipConfig.NeedSJStoneNum(itemInst); 									--强化需要升阶石个数
	local needBXStoneNum = QuestTable.IsUseBXStone and _G.LevelUpEquipConfig.NeedBXStoneNum(itemInst) or 0; --强化需要冰星石个数
	local needFHStoneNum = QuestTable.IsUseFHStone and _G.LevelUpEquipConfig.NeedFHStoneNum(itemInst) or 0; --强化需要封魂石个数
	--检测背包中是否有足够银两
	if not self.ItemSystem:IsPacketMoneyEnough(needMoney) then return end;
	--检测背包中是否有足够升阶石
	local b_IsEnough_1, n_Minus_1 = self.ItemSystem:CheckDelEnumItemInPacketCond(_G.LevelUpEquipConfig.SJStoneId, needSJStoneNum);
	--用于自动购买
	local autoBuyInfo = {};
	if not b_IsEnough_1 then
		if QuestTable.IsAutoBuy then
			local t = {};
			t.dwItemEnum 	= _G.LevelUpEquipConfig.SJStoneId;
			t.dwItemNumber 	= n_Minus_1;
			table.insert(autoBuyInfo, t);
		else--材料不够而且不是自动购买则返回
			return;
		end;
	end;
	
	--如果自动购买列表不为空则执行自动购买逻辑
	if #autoBuyInfo > 0 then
		local mallSystem = objPlayer:GetSystem("CMallSystem");
		if not mallSystem then
			_err("get mallSystem error!!!");
			return;
		end;
		
		if QuestTable.IsUseGold then
			for k, v in pairs(autoBuyInfo) do
				local buySuc = mallSystem:BuyItemByIDGold(v.dwItemNumber, v.dwItemEnum)
				if not buySuc then
					_err("auto buy error!!!");
					return
				end;
			end;
		else
			for k, v in pairs(autoBuyInfo) do
				local buySuc = mallSystem:BuyItemByIDBindGold(v.dwItemNumber, v.dwItemEnum)
				if not buySuc then
					_err("auto buy error!!!");
					return
				end;
			end;
		end
		
		--检测背包中是否有足够升阶石
		b_IsEnough_1, n_Minus_1 = self.ItemSystem:CheckDelEnumItemInPacketCond(_G.LevelUpEquipConfig.SJStoneId, needSJStoneNum);
		if not b_IsEnough_1 then return end;
	end;
	--删除各种石头和钱。
	--删除钱
	self.ItemSystem:CostPacketMoney(needMoney, _G.ItemSysOperType.QiangHua);
	--删除各种石头--删除物品通知
	local b_IsUseBind_1;
	local b_IsUseBind_2;
	local b_IsUseBind_3;
	local tempV;
	local tMaterials = {}
	tempV, b_IsUseBind_1 = self.ItemSystem:DelEnumItemInPacket(_G.LevelUpEquipConfig.SJStoneId, needSJStoneNum, QuestTable.IsUseNotBindFirst, _G.ItemSysOperType.QiangHua);
	table.insert(tMaterials, {dwItemEnum = _G.LevelUpEquipConfig.SJStoneId, number = needSJStoneNum});
	--计算成功率，默认值失败false。
	local result = false;
	result = self.TianGuanCiFuSystem:IsEquipUpGradeMax();
	if not result then
		local successRate = _G.LevelUpEquipConfig.S_SuccessRate(itemInst, self.TianGuanCiFuSystem:Get_EquipUpGrade());
		if math.random(1, 10000) <= successRate then
			result = true;
		end;
	end;
	--如果成功如何
	if result then
		-----------------
		--日志记录
		local dwBegin = self.TianGuanCiFuSystem:Get_EquipUpGrade();
		local dwEnd = 0;
		CLogSystemManager:cifu(objPlayer, 5, itemInst:GetEnumID(), 1, dwBegin, dwEnd);
		-----------------
		--清空天官赐福值
		self.TianGuanCiFuSystem:Set_EquipUpGrade(0);
		--升阶装备
		self.ItemSystem:ItemUpGrade(QuestTable.ItemInstId);
		local mountSystem = objPlayer:GetSystem("CMountSystem");
		if mountSystem then
			mountSystem:EquipChange(itemInst);
			if b_PutOffMountEquip then
				mountSystem:PutOffEquip(n_MountInstID, n_Slot, 0, 0)
			end;
		end;
	else
		--增加天官赐福值
		self.TianGuanCiFuSystem:Add_EquipUpGrade(itemInst);
	end;
	--是否使用绑定道具，如果使用则绑定装备
	if (not itemInst:IsBind()) and (b_IsUseBind_1 or b_IsUseBind_2 or b_IsUseBind_3) then
		self.ItemSystem:BindItem(itemInst:GetInstID());
	end;
	--给客户端返回结果
	self:GetPlayer().EISys_OnLevelUpEquipMsg{Result = result};
	
	--升阶后装备阶数5阶及以上全服广播，用来装B
	if result then
		--通知事件中心
		objPlayer:GetSystem('CPlayerEventCenterSystem'):DoEvent(_G.enumPlayerEventType.EventEquipUpGrade, itemInst:GetLevel());
		local b_Cond = itemInst:GetLevel() >= _G.EICongratulationConfig.LevelUp.Grade;
		if b_Cond then
			local info = {};
			info[1] = GetCurTime();
			info[2] = itemInst:GetLevel();
			info[3] = enumId;
			info[4] = quality;
			self:BroadCastMsg(itemInst, 4, info);
		end;
	end;
	objPlayer:GetSystem('CPlayerEventCenterSystem'):DoEvent(_G.enumPlayerEventType.EventLevelUpEquip);
end;



