----------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------强化天生属性逻辑-------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------
--服务器响应客户端强化装备天生属性请求
function CEquipIntensifySystem:IntensifyBornProp(QuestTable)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("cannot find objPlayer by CEquipIntensifySystem:IntensifyBornProp");
		return;
	end;
	if not self:HasAuthority("EquipAddBorn") then return end;
	--得到装备实例
	local itemInst = self.ItemSystem:GetItem(QuestTable.ItemInstId);
	--检测ItemInstId是否存在
	if not itemInst then return end;
	--检测ItemInstId是否是装备
	if not itemInst:IsEquip() then return end;
	--检测装备生命周期
	if not itemInst:IsAlive() then return end;
	--检测装备穿戴位置
	if not self:CheckInTable(_G.IntensifyBornPropConfig.CanIntensifyTable, itemInst:GetWearPos()) then return end;
	--检测天生属性强化是否已满
	local itemBornProp = itemInst:GetTianSheng();--得到装备天生属性值
	if itemBornProp >= _G.IntensifyBornPropConfig.MaxIntensifyValue then return end;
	
	--运算出强化装备的数据
	local needMoney		 = _G.IntensifyBornPropConfig.NeedMoney(itemInst);	  	--强化需要金钱
	local needQHStoneNum = _G.IntensifyBornPropConfig.NeedQHStoneNum(itemInst); --强化需要强化石个数
	local needXYStoneNum = QuestTable.UseXYStoneNum;
	--检测背包中是否有足够银两
	if not self.ItemSystem:IsPacketMoneyEnough(needMoney) then return end;
	--检测背包中是否有足够强化石
	local b_IsEnough_1, n_Minus_1 = self.ItemSystem:CheckDelEnumItemInPacketCond(_G.IntensifyBornPropConfig.QHStoneId, needQHStoneNum);
	--检测背包中是否有足够幸运石
	local b_IsEnough_2, n_Minus_2 = true, 0;
	if needXYStoneNum > 0 then
		b_IsEnough_2, n_Minus_2 = self.ItemSystem:CheckDelEnumItemInPacketCond(_G.IntensifyBornPropConfig.XYStoneId, needXYStoneNum);
	end;
	--用于自动购买
	local autoBuyInfo = {};
	if not b_IsEnough_1 then
		if QuestTable.IsAutoBuy then
			local t = {};
			t.dwItemEnum 	= _G.IntensifyBornPropConfig.QHStoneId;
			t.dwItemNumber 	= n_Minus_1;
			table.insert(autoBuyInfo, t);
		else--材料不够而且不是自动购买则返回
			return;
		end;
	end;
	if not b_IsEnough_2 then
		if QuestTable.IsAutoBuy then
			local t = {};
			t.dwItemEnum	= _G.IntensifyBornPropConfig.XYStoneId;
			t.dwItemNumber	= n_Minus_2;
			table.insert(autoBuyInfo, t);
		else--材料不够而且不是自动购买则返回
			return;
		end;
	end;
	--------如果自动购买列表不为空则执行自动购买逻辑
	if #autoBuyInfo > 0 then
		local mallSystem = objPlayer:GetSystem("CMallSystem");
		if not mallSystem then
			_err("get mallSystem error!!!");
			return;
		end;
		local n_Result, n_CostBindGold, n_CostGold = mallSystem:CanBuyItemList(autoBuyInfo);
		if n_Result > 0 then return end;
		for k, v in pairs(autoBuyInfo) do
			local buySuc = mallSystem:BuyItemByID(v.dwItemNumber, v.dwItemEnum)
			if not buySuc then
				_err("auto buy error!!!");
				return
			end;
		end;
		--检测背包中是否有足够强化石
		b_IsEnough_1, n_Minus_1 = self.ItemSystem:CheckDelEnumItemInPacketCond(_G.IntensifyBornPropConfig.QHStoneId, needQHStoneNum);
		--检测背包中是否有足够幸运石
		if needXYStoneNum > 0 then
			b_IsEnough_2, n_Minus_2 = self.ItemSystem:CheckDelEnumItemInPacketCond(_G.IntensifyBornPropConfig.XYStoneId, needXYStoneNum);
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
	tempV, b_IsUseBind_1 = self.ItemSystem:DelEnumItemInPacket(_G.IntensifyBornPropConfig.QHStoneId, needQHStoneNum, QuestTable.IsUseNotBindFirst, _G.ItemSysOperType.QiangHua);
	table.insert(tMaterials, {dwItemEnum = _G.IntensifyBornPropConfig.QHStoneId, number = needQHStoneNum});
	if needXYStoneNum > 0 then
		tempV, b_IsUseBind_2 = self.ItemSystem:DelEnumItemInPacket(_G.IntensifyBornPropConfig.XYStoneId, needXYStoneNum, QuestTable.IsUseNotBindFirst, _G.ItemSysOperType.QiangHua);
		table.insert(tMaterials, {dwItemEnum = _G.IntensifyBornPropConfig.XYStoneId, number = needXYStoneNum});
	end;
	
	--计算成功率，默认值失败false。
	local result = false;
	local successRate = _G.IntensifyBornPropConfig.SuccessRate(itemInst, QuestTable.UseXYStoneNum);
	if math.random(1, 10000) <= successRate then
		result = true;
	end;
	--是否使用绑定道具，如果使用则绑定装备，不论成功与否
	if itemInst.dwBindType == enItemBindType.eNo and (b_IsUseBind_1 or b_IsUseBind_2) then
		self.ItemSystem:BindItem(QuestTable.ItemInstId);
	end;
	--如果成功如何
	if result then
		local isFull = false;
		local addPer = _G.IntensifyBornPropConfig.AddBornPropValue(itemInst);
		itemBornProp = itemBornProp + addPer;
		if itemBornProp > _G.IntensifyBornPropConfig.MaxIntensifyValue then
			itemBornProp = _G.IntensifyBornPropConfig.MaxIntensifyValue;
			isFull = true;
		end;
		self.ItemSystem:SetItemTianSheng(itemInst:GetInstID(), itemBornProp);
		local mountSystem = objPlayer:GetSystem("CMountSystem");
		if mountSystem then
			mountSystem:EquipChange(itemInst);
		end;
		if isFull then
			--通知事件中心
			objPlayer:GetSystem('CPlayerEventCenterSystem'):DoEvent(_G.enumPlayerEventType.EventEquipFullBornProp);
		end;
	end;
	--给客户端返回结果
	self:GetPlayer().EISys_OnIntensifyBornPropMsg{Result = result, NowPer = itemBornProp};
	
	--满天生属性全服广播，用来装B
	if result then
		local b_Cond_1 = (itemInst:GetLevel() >= _G.EICongratulationConfig.BornProp.Grade);
		local b_Cond_2 = (((itemInst:GetTianSheng()/_G.IntensifyBornPropConfig.MaxIntensifyValue)*100) >= _G.EICongratulationConfig.BornProp.Percent);
		if b_Cond_1 and b_Cond_2 then
			local info = {};
			info[1] = GetCurTime();
			self:BroadCastMsg(itemInst, 3, info);
		end;
	end;
	objPlayer:GetSystem('CPlayerEventCenterSystem'):DoEvent(_G.enumPlayerEventType.EventIntensifyBornProp);
end;



