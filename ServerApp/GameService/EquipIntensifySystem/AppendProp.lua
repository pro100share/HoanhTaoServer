----------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------重置附加属性逻辑-------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------
--服务器响应客户端重置装备附加属性请求
function CEquipIntensifySystem:AppendProp(QuestTable)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("cannot find objPlayer by CEquipIntensifySystem:AppendProp");
		return;
	end;
	--参数有效性检查
	
	--权限检测
	if not self:HasAuthority("PropResetAll") then return end;
	--得到装备实例
	local itemInst = self.ItemSystem:GetItem(QuestTable.ItemInstId);
	--检测ItemInstId是否存在
	if not itemInst then return end;
	--检测ItemInstId是否是装备
	if not itemInst:IsEquip() then return end;
	--检测装备生命周期
	if not itemInst:IsAlive() then return end;
	--检测装备穿戴位置
	if not self:CheckInTable(_G.AppendPropConfig.CanIntensifyTable, itemInst:GetWearPos()) then return end;

	--运算出强化装备的数据
	local needMoney		 = math.ceil(_G.AppendPropConfig.NeedMoney(itemInst) * self.nDiscount_Append);	--重置需要金钱
	local needCZStoneNum = _G.AppendPropConfig.NeedCZStoneNum(itemInst);	--重置需要重置石个数
	--检测背包中是否有足够银两
	if not self.ItemSystem:IsPacketMoneyEnough(needMoney) then return end;
	--用于自动购买
	local autoBuyInfo = {};
	--检测背包中是否有足够重置石
	local b_IsEnough_1, n_Minus_1 = self.ItemSystem:CheckDelEnumItemInPacketCond(_G.AppendPropConfig.CZStoneId, needCZStoneNum);
	--用于自动购买
	local autoBuyInfo = {};
	if not b_IsEnough_1 then
		if QuestTable.IsAutoBuy then
			local t = {};
			t.dwItemEnum 	= _G.AppendPropConfig.CZStoneId;
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
		--检测背包中是否有足够重置石
		b_IsEnough_1, n_Minus_1 = self.ItemSystem:CheckDelEnumItemInPacketCond(_G.AppendPropConfig.CZStoneId, needCZStoneNum);
		if not b_IsEnough_1 then return end;
	end;
	--删除各种石头和钱。
	--删除钱
	self.ItemSystem:CostPacketMoney(needMoney, _G.ItemSysOperType.QiangHua);
	local b_IsUseBind_1;
	local tempV;
	local tMaterials = {}
	--删除各种石头	--删除物品通知
	tempV, b_IsUseBind_1 = self.ItemSystem:DelEnumItemInPacket(_G.AppendPropConfig.CZStoneId, needCZStoneNum, QuestTable.IsUseNotBindFirst, _G.ItemSysOperType.QiangHua);
	table.insert(tMaterials, {dwItemEnum = _G.AppendPropConfig.CZStoneId, number = needCZStoneNum});
	--重新生成新的附加属性
	local newAppendProp = {};
	local sumRate = 0; 	----用来算出权值总和
	local rate = 0;		----用来在保存1和权值总和之间随机
	local temp = 0;		----用来运算权值区间
	---------------------------------------------------------------------------------
	------------------------计算出现几条附加属性---------------------------
	---------------------------------------------------------------------------------
	for k, v in pairs(_G.AppendPropConfig.PropNumProbability) do
		sumRate = sumRate + v;
	end;
	temp = sumRate;
	rate = math.random(1, sumRate);
	local propNum = 0;
	for k, v in pairs(_G.AppendPropConfig.PropNumProbability) do
		temp = temp - v;
		if rate > temp then
			propNum = k;
			break;
		end;
	end;
	---------------------------------------------------------------------------------
	---------------计算出现何种类型的附加属性和数值------------------
	---------------------------------------------------------------------------------
	--记录每种类型附加属性出现次数
	local appearance = {
		[1] = 0;
		[2] = 0;
		[3] = 0;
		[4] = 0;
		[5] = 0;
		[6] = 0;
	};
	local newPropTypeProbability = {};
	for i=1, propNum do
		sumRate = 0; 	----用来算出权值总和
		rate = 0;		----用来在保存1和权值总和之间随机
		temp = 0;		----用来运算权值区间
		--根据类型出现次数运算出下次出现何种类型属性权值表
		for k, v in pairs(_G.AppendPropConfig.PropTypeProbability) do
			newPropTypeProbability[k] = math.ceil(v * _G.AppendPropConfig.PropTypeAttenuation(appearance[k]));
		end;
		for k, v in pairs(newPropTypeProbability) do
			sumRate = sumRate + v ;
		end;
		temp = sumRate;
		rate = math.random(1, sumRate);
		local propType = 0;
		for k, v in pairs(newPropTypeProbability) do
			temp = temp - v;
			if rate > temp then
				propType = k;
				appearance[propType] = appearance[propType] + 1;
				break;
			end;
		end;
		local baseValue = math.floor((_G.EquipAppendConfig[itemInst:GetPropertyID()][_G.EquipAppendTypeNumToStrConfig[propType].dwMin] / _G.EquipAppendConfig[itemInst:GetPropertyID()][_G.EquipAppendTypeNumToStrConfig[propType].dwMax]) * 1000000);
		local propValue = baseValue + math.random(_G.AppendPropConfig.PropValueInit.dwMin, _G.AppendPropConfig.PropValueInit.dwMax);
		newAppendProp[i] = {dwPropertyType = propType, dwValue = propValue};
	end;
	if itemInst.dwBindType == enItemBindType.eNo and b_IsUseBind_1 then
		self.ItemSystem:BindItem(QuestTable.ItemInstId);
	end;
	--保留重置结果以便响应客户端选择操作
	self.CZItemInstId = QuestTable.ItemInstId;
	self.newCZProp = newAppendProp;
	self.CZPropUseMaterial = tMaterials;
	self.CZPropUseMoney = needMoney;
	--给客户端返回结果
	self:GetPlayer().EISys_OnAppendPropMsg{AppendProp = newAppendProp};
	self:GetPlayer():GetSystem('CPlayerEventCenterSystem'):DoEvent(_G.enumPlayerEventType.EventAppendProp);
end;
--服务器响应客户端选择装备附加属性请求
function CEquipIntensifySystem:UserChooseProp(ChooseNew)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("cannot find objPlayer by CEquipIntensifySystem:UserChooseProp");
		return;
	end;
	local itemInst = self.ItemSystem:GetItem(self.CZItemInstId);
	if not itemInst then
		_err("can not get item inst");
		return;
	end;
	if ChooseNew then
		self.ItemSystem:SetItemProperty(itemInst:GetInstID(), self.newCZProp);
		local mountSystem = objPlayer:GetSystem("CMountSystem");
		if mountSystem then
			mountSystem:EquipChange(itemInst);
		end;
		--附加属性条数为5条及以上全服广播，用来装B
		local Prop = itemInst:GetProperty();
		local propNum = #Prop;
		if propNum >= _G.EICongratulationConfig.ResetAppendProp.Num then
			local info = {};
			info[1] = GetCurTime();
			info[2] = propNum;
			self:BroadCastMsg(itemInst, 2, info);
		end;
	end;
	self.CZItemInstId = nil;
	self.newCZProp = nil;
	self.CZPropUseMaterial = nil;
	self.CZPropUseMoney = nil;
	objPlayer.EISys_OnUserChoosePropMsg{};
end;



