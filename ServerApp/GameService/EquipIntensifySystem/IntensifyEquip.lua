----------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------强化装备逻辑-------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------
--服务器响应客户端强化装备请求
function CEquipIntensifySystem:IntensifyEquip(QuestTable)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("cannot find objPlayer by CEquipIntensifySystem:IntensifyEquip");
		return;
	end;
	--权限检查
	if not self:HasAuthority("EquipIntensify") then return end;
	--得到装备实例
	local itemInst = self.ItemSystem:GetItem(QuestTable.ItemInstId);
	--检测ItemInstId是否存在
	if not itemInst then return end;
	--检测ItemInstId是否是装备
	if not itemInst:IsEquip() then return end;
	--检测装备生命周期
	if not itemInst:IsAlive() then return end;
	--检测是否锁定
	if self.ItemSystem:IsItemLocked(QuestTable.ItemInstId) then return end;
	--检测装备穿戴位置
	if not self:CheckInTable(_G.EquipIntensifyConfig.CanIntensifyTable, itemInst:GetWearPos()) then return end;
	--检测强化等级是否已满
	if itemInst:GetStrongLevel() >= _G.EquipIntensifyConfig.MaxIntensifyLevel then return end;
	
	--运算出强化装备的数据
	local needMoney		 = math.ceil(_G.EquipIntensifyConfig.NeedMoney(itemInst) * self.nDiscount_Intensify);	--强化需要金钱
	local needQHStoneNum = _G.EquipIntensifyConfig.NeedQHStoneNum(itemInst); 									--强化需要强化石个数
	--local needBDStoneNum = QuestTable.IsUseBDStone and _G.EquipIntensifyConfig.NeedBDStoneNum(itemInst) or 0; --强化需要保底石个数
	local needXYStoneNum = QuestTable.UseXYStoneNum;															--强化需要幸运石个数
	--检测背包中是否有足够银两
	if not self.ItemSystem:IsPacketMoneyEnough(needMoney) then return end;
	--检测背包中是否有足够强化石
	local b_IsEnough_1, n_Minus_1 = self.ItemSystem:CheckDelEnumItemInPacketCond(_G.EquipIntensifyConfig.QHStoneId, needQHStoneNum);
	--检测背包中是否有足够保底石
	--local b_IsEnough_2, n_Minus_2 = self.ItemSystem:CheckDelEnumItemInPacketCond(_G.EquipIntensifyConfig.BDStoneId, needBDStoneNum);
	--检测背包中是否有足够幸运石
	local b_IsEnough_3, n_Minus_3 = true, 0;
	if needXYStoneNum > 0 then
		b_IsEnough_3, n_Minus_3 = self.ItemSystem:CheckDelEnumItemInPacketCond(_G.EquipIntensifyConfig.XYStoneId, needXYStoneNum);
	end;
	--用于自动购买
	local autoBuyInfo = {};
	if not b_IsEnough_1 then
		if QuestTable.IsAutoBuy then
			local t = {};
			t.dwItemEnum 	= _G.EquipIntensifyConfig.QHStoneId;
			t.dwItemNumber 	= n_Minus_1;
			table.insert(autoBuyInfo, t);
		else--材料不够而且不是自动购买则返回
			return;
		end;
	end;
	--[[
	if not b_IsEnough_2 then
		if QuestTable.IsAutoBuy then
			local t = {};
			t.dwItemEnum	= _G.EquipIntensifyConfig.BDStoneId;
			t.dwItemNumber	= n_Minus_2;
			table.insert(autoBuyInfo, t);
		else--材料不够而且不是自动购买则返回
			return;
		end;
	end;
	]]
	if not b_IsEnough_3 then
		if QuestTable.IsAutoBuy then
			local t = {};
			t.dwItemEnum	= _G.EquipIntensifyConfig.XYStoneId;
			t.dwItemNumber	= n_Minus_3;
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
			-- local n_Result, n_CostGold = mallSystem:CanBuyItemListGold(autoBuyInfo);
			-- if n_Result > 0 then return end;
			for k, v in pairs(autoBuyInfo) do
				local buySuc = mallSystem:BuyItemByIDGold(v.dwItemNumber, v.dwItemEnum)
				if not buySuc then
					_err("auto buy error!!!");
					return
				end;
			end;
		else
			-- local n_Result, n_CostBindGold = mallSystem:CanBuyItemListBindGold(autoBuyInfo);
			-- if n_Result > 0 then return end;
			for k, v in pairs(autoBuyInfo) do
				local buySuc = mallSystem:BuyItemByIDBindGold(v.dwItemNumber, v.dwItemEnum)
				if not buySuc then
					_err("auto buy error!!!");
					return
				end;
			end;
		end
		
		-- local n_Result, n_CostBindGold, n_CostGold = mallSystem:CanBuyItemList(autoBuyInfo);
		-- if n_Result > 0 then return end;
		-- for k, v in pairs(autoBuyInfo) do
			-- local buySuc = mallSystem:BuyItemByID(v.dwItemNumber, v.dwItemEnum)
			-- if not buySuc then
				-- _err("auto buy error!!!");
				-- return
			-- end;
		-- end;
		--检测背包中是否有足够强化石
		b_IsEnough_1, n_Minus_1 = self.ItemSystem:CheckDelEnumItemInPacketCond(_G.EquipIntensifyConfig.QHStoneId, needQHStoneNum);
		--检测背包中是否有足够保底石
		--b_IsEnough_2, n_Minus_2 = self.ItemSystem:CheckDelEnumItemInPacketCond(_G.EquipIntensifyConfig.BDStoneId, needBDStoneNum);
		--检测背包中是否有足够幸运石
		if needXYStoneNum > 0 then
			b_IsEnough_3, n_Minus_3 = self.ItemSystem:CheckDelEnumItemInPacketCond(_G.EquipIntensifyConfig.XYStoneId, needXYStoneNum);
		end;
		if not b_IsEnough_1 or not b_IsEnough_3 then return end;
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
	tempV, b_IsUseBind_1 = self.ItemSystem:DelEnumItemInPacket(_G.EquipIntensifyConfig.QHStoneId, needQHStoneNum, QuestTable.IsUseNotBindFirst, _G.ItemSysOperType.QiangHua);
	table.insert(tMaterials, {dwItemEnum = _G.EquipIntensifyConfig.QHStoneId, number = needQHStoneNum});
	--[[
	if needBDStoneNum > 0 then
		tempV, b_IsUseBind_2 = self.ItemSystem:DelEnumItemInPacket(_G.EquipIntensifyConfig.BDStoneId, needBDStoneNum, QuestTable.IsUseNotBindFirst, _G.ItemSysOperType.QiangHua);
		table.insert(tMaterials, {dwItemEnum = _G.EquipIntensifyConfig.BDStoneId, number = needBDStoneNum});
	end;
	]]
	if needXYStoneNum > 0 then
		tempV, b_IsUseBind_3 = self.ItemSystem:DelEnumItemInPacket(_G.EquipIntensifyConfig.XYStoneId, needXYStoneNum, QuestTable.IsUseNotBindFirst, _G.ItemSysOperType.QiangHua);
		table.insert(tMaterials, {dwItemEnum = _G.EquipIntensifyConfig.XYStoneId, number = needXYStoneNum});
	end;
	
	--计算成功率，默认值失败false。
	local result = false;
    result = self.TianGuanCiFuSystem:IsEquipStrongMax();
    if result then
        --清空天官赐福值
		self.TianGuanCiFuSystem:Set_EquipStrong(0);
    else
        local successRate = _G.EquipIntensifyConfig.SuccessRate(itemInst, needXYStoneNum, self.TianGuanCiFuSystem:Get_EquipStrong());
        if math.random(1, 10000) <= successRate then
            result = true;
        end;
    end;
	--是否使用绑定道具，如果使用则绑定装备，不论成功与否
	if itemInst.dwBindType == enItemBindType.eNo and (b_IsUseBind_1 or b_IsUseBind_3) then
		self.ItemSystem:BindItem(QuestTable.ItemInstId);
	end;
	local beforeStrongLevel = itemInst:GetStrongLevel();
	local afterStrongLevel = beforeStrongLevel;
	--如果成功如何
	local nAddExp = 0;
	if result then
		afterStrongLevel = afterStrongLevel + 1;
        if afterStrongLevel == _G.EquipIntensifyConfig.MaxIntensifyLevel then
            --清空天官赐福值
            self.TianGuanCiFuSystem:Set_EquipStrong(0);
        end;
		self.ItemSystem:SetItemStrongLevel(itemInst:GetInstID(), afterStrongLevel);
	else--如果失败如何
        --增加天官赐福值
		self.TianGuanCiFuSystem:Add_EquipStrong(needQHStoneNum);
		--加经验
        local addExpNum = objPlayer:GetSystem("CRefreshSystem"):GetData(0104);
		if addExpNum and addExpNum > 0 then
            nAddExp = _G.EquipIntensifyConfig.AddExp(itemInst, objPlayer:GetLevel());
			objPlayer:AddExp(nAddExp);
			objPlayer:GetSystem("CRefreshSystem"):SetData(0104,addExpNum - 1);
		end;
		--如果用保底石则无失败惩罚--不使用保底石则进行失败惩罚，让你丫不花钱。
		--if not QuestTable.IsUseBDStone then
			--不掉级
			if afterStrongLevel <= _G.EquipIntensifyConfig.FailedDownOne then
				self.ItemSystem:SetItemStrongLevel(itemInst:GetInstID(), afterStrongLevel);
			--掉一级
			elseif afterStrongLevel < _G.EquipIntensifyConfig.FailedDownTo then
				afterStrongLevel = afterStrongLevel - 1;
				self.ItemSystem:SetItemStrongLevel(itemInst:GetInstID(), afterStrongLevel);
			--直掉等级
			else
				afterStrongLevel = _G.EquipIntensifyConfig.FailedDownTo;
				self.ItemSystem:SetItemStrongLevel(itemInst:GetInstID(), afterStrongLevel);
			end;
		--end;
	end;
	local mountSystem = objPlayer:GetSystem("CMountSystem");
	if mountSystem then
		mountSystem:EquipChange(itemInst);
	end;
	--通知事件中心
	objPlayer:GetSystem('CPlayerEventCenterSystem'):DoEvent(_G.enumPlayerEventType.EventEquipStrong, itemInst:GetStrongLevel());
	--给客户端返回结果
	self:GetPlayer().EISys_OnIntensifyEquipMsg{Result = result, BeforeStrongLevel = beforeStrongLevel, AfterStrongLevel = afterStrongLevel, AddExp = nAddExp};
	self:GetPlayer():GetSystem('CPlayerEventCenterSystem'):DoEvent(_G.enumPlayerEventType.EventIntensifyEquip);
	--大于等于10级全服广播，用来装B
	if result then
		local b_Cond_1 = _G.EICongratulationConfig.Intensify.First == afterStrongLevel;
		local b_Cond_2 = _G.EICongratulationConfig.Intensify.Second == afterStrongLevel;
		local b_Cond_3 = _G.EICongratulationConfig.Intensify.Third == afterStrongLevel;
		if b_Cond_1 or b_Cond_2 or b_Cond_3 then
			local info = {};
			info[1] = GetCurTime();
			info[2] = afterStrongLevel;
			self:BroadCastMsg(itemInst, 1, info);
		end;
	end;
end;



