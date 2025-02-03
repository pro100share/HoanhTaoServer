----------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------增加装备附加属性数值逻辑------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------
--服务器响应客户端增加装备附加属性数值请求
function CEquipIntensifySystem:AddAppendPropValue(QuestTable)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("cannot find objPlayer by CEquipIntensifySystem:AddAppendPropValue");
		return;
	end;
	--参数有效性检查
	
	--权限检测
	if not self:HasAuthority("PropIntensify") then return end;
	--得到装备实例
	local itemInst = self.ItemSystem:GetItem(QuestTable.ItemInstId);
	--检测ItemInstId是否存在
	if not itemInst then return end;
	--检测ItemInstId是否是装备
	if not itemInst:IsEquip() then return end;
	--检测装备生命周期
	if not itemInst:IsAlive() then return end;
	--检测装备穿戴位置
	if not self:CheckInTable(_G.AddAppendPropValueConfig.CanIntensifyTable, itemInst:GetWearPos()) then return end;
	--检测ItemInstId属性条数
	local oldProp = itemInst:GetProperty();
	local newProp = itemInst:GetProperty();
	local propNum = 0;
	local MaxValueNum = 0;
	for k, v in pairs(oldProp) do
		propNum = k;
		if v.dwValue >= _G.AddAppendPropValueConfig.MaxAppendPropValue then
			MaxValueNum = MaxValueNum + 1;
		end;
	end;
	--附加属性条数为0
	if propNum == 0 then return	end;
	--检测是否已全是梦幻满级
	if MaxValueNum == propNum then return end;
	
	--运算出强化装备的数据
	local needMoney		 = math.ceil(_G.AddAppendPropValueConfig.NeedMoney(itemInst, propNum) * self.nDiscount_AddValue); --强化需要金钱
	local needQHStoneNum = _G.AddAppendPropValueConfig.NeedQHStoneNum(itemInst, propNum);	 	--强化需要强化石个数
	local needXYStoneNum = QuestTable.UseXYStoneNum;
	--检测背包中是否有足够银两
	if not self.ItemSystem:IsPacketMoneyEnough(needMoney) then return end;
	--检测背包中是否有足够强化石
	local b_IsEnough_1, n_Minus_1 = self.ItemSystem:CheckDelEnumItemInPacketCond(_G.AddAppendPropValueConfig.QHStoneId, needQHStoneNum);
	--检测背包中是否有足够幸运石
	local b_IsEnough_2, n_Minus_2 = true, 0;
	if needXYStoneNum > 0 then
		b_IsEnough_2, n_Minus_2 = self.ItemSystem:CheckDelEnumItemInPacketCond(_G.AddAppendPropValueConfig.XYStoneId, needXYStoneNum);
	end;
	--用于自动购买
	local autoBuyInfo = {};
	if not b_IsEnough_1 then
		if QuestTable.IsAutoBuy then
			local t = {};
			t.dwItemEnum 	= _G.AddAppendPropValueConfig.QHStoneId;
			t.dwItemNumber 	= n_Minus_1;
			table.insert(autoBuyInfo, t);
		else--材料不够而且不是自动购买则返回
			return;
		end;
	end;
	if not b_IsEnough_2 then
		if QuestTable.IsAutoBuy then
			local t = {};
			t.dwItemEnum	= _G.AddAppendPropValueConfig.XYStoneId;
			t.dwItemNumber	= n_Minus_2;
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
					_err("auto buy error!!!", v.dwItemNumber, v.dwItemEnum);
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
		end;
		--检测背包中是否有足够强化石
		b_IsEnough_1, n_Minus_1 = self.ItemSystem:CheckDelEnumItemInPacketCond(_G.AddAppendPropValueConfig.QHStoneId, needQHStoneNum);
		--检测背包中是否有足够幸运石
		if needXYStoneNum > 0 then
			b_IsEnough_2, n_Minus_2 = self.ItemSystem:CheckDelEnumItemInPacketCond(_G.AddAppendPropValueConfig.XYStoneId, needXYStoneNum);
		end;
		if not b_IsEnough_1 or not b_IsEnough_2 then return end;
	end;

	--删除各种石头和钱。
	--删除钱
	self.ItemSystem:CostPacketMoney(needMoney, _G.ItemSysOperType.QiangHua);
	--删除各种石头--删除物品通知
	local b_IsUseBind_1;
	local b_IsUseBind_2;
	local tempV;
	local tMaterials = {}
	tempV, b_IsUseBind_1 = self.ItemSystem:DelEnumItemInPacket(_G.AddAppendPropValueConfig.QHStoneId, needQHStoneNum, QuestTable.IsUseNotBindFirst, _G.ItemSysOperType.QiangHua);
	table.insert(tMaterials, {dwItemEnum = _G.AddAppendPropValueConfig.QHStoneId, number = needQHStoneNum});
	if needXYStoneNum > 0 then
		tempV, b_IsUseBind_2 = self.ItemSystem:DelEnumItemInPacket(_G.AddAppendPropValueConfig.XYStoneId, needXYStoneNum, QuestTable.IsUseNotBindFirst, _G.ItemSysOperType.QiangHua);
		table.insert(tMaterials, {dwItemEnum = _G.AddAppendPropValueConfig.XYStoneId, number = needXYStoneNum});
	end;
	--计算成功率，默认值失败false。
	local result = false;
	local successRate = _G.AddAppendPropValueConfig.SuccessRate(itemInst, propNum, QuestTable.UseXYStoneNum);
	if math.random(1, 10000) <= successRate then
		result = true;
	end;
	--是否使用绑定道具，如果使用则绑定装备，不论成功与否
	if (not itemInst:IsBind()) and (b_IsUseBind_1 or b_IsUseBind_2) then
		self.ItemSystem:BindItem(QuestTable.ItemInstId);
	end;
	local nAddExp = 0;
	--如果成功如何
	if result then
		local minValue = _G.AddAppendPropValueConfig.MinAddPropValue(itemInst, propNum, QuestTable.UseXYStoneNum);
		local maxValue = _G.AddAppendPropValueConfig.MaxAddPropValue(itemInst, propNum, QuestTable.UseXYStoneNum);
		for i=1, propNum do
			newProp[i].dwValue = newProp[i].dwValue + math.random(minValue, maxValue);
			if newProp[i].dwValue >= _G.AddAppendPropValueConfig.MaxAppendPropValue then
				newProp[i].dwValue = _G.AddAppendPropValueConfig.MaxAppendPropValue;
			else
				local value_1 = (newProp[i].dwValue / _G.AddAppendPropValueConfig.MaxAppendPropValue);
				local value_2 = _G.EquipAppendConfig[itemInst:GetPropertyID()][_G.EquipAppendTypeNumToStrConfig[newProp[i].dwPropertyType].dwMax];
				local value_3 = math.ceil(value_1 * value_2);
				if value_3 == value_2 then
					newProp[i].dwValue = _G.AddAppendPropValueConfig.MaxAppendPropValue;
				end;
			end;
		end;
		self.ItemSystem:SetItemProperty(itemInst:GetInstID(), newProp);
		local mountSystem = objPlayer:GetSystem("CMountSystem");
		if mountSystem then
			mountSystem:EquipChange(itemInst);
		end;
	else
		--洗炼数值失败奖励经验
		local addExpNum = objPlayer:GetSystem("CRefreshSystem"):GetData(0106);
		if addExpNum and addExpNum > 0 then
            nAddExp = _G.AddAppendPropValueConfig.AddExp(itemInst, objPlayer:GetLevel());
			objPlayer:AddExp(nAddExp);
			objPlayer:GetSystem("CRefreshSystem"):SetData(0106,addExpNum - 1);
		end;
	end;
	--给客户端返回结果
	self:GetPlayer().EISys_OnAddAppendPropValueMsg{Result = result, OldProp = oldProp, NewProp = newProp};
	self:GetPlayer():GetSystem('CPlayerEventCenterSystem'):DoEvent(_G.enumPlayerEventType.EventAddAppendPropValue);
	--附加属性条数为5条及以上并且都为梦幻满值全服广播，用来装B
	local Prop = itemInst:GetProperty();
	local propNum_1 = #Prop;
	local MaxValueNum_1 = 0;
	for k, v in pairs(Prop) do
		if v.dwValue >= _G.AddAppendPropValueConfig.MaxAppendPropValue then
			MaxValueNum_1 = MaxValueNum_1 + 1;
		end;
	end;
	if propNum_1 >= _G.EICongratulationConfig.AddAppendPropValue.Num and propNum_1 == MaxValueNum_1 then
		local info = {};
		info[1] = GetCurTime();
		info[2] = propNum_1;
		self:BroadCastMsg(itemInst, 6, info);
	end;
end;



