----------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------重置装备附加属性类型逻辑--------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------
--服务器响应客户端重置装备附加属性类型请求
function CEquipIntensifySystem:ResetAppendPropType(QuestTable)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("cannot find objPlayer by CEquipIntensifySystem:ResetAppendPropType");
		return;
	end;
	--参数有效性检查
	
	--权限检测
	if not self:HasAuthority("PropResetType") then return end;
	--得到装备实例
	local itemInst = self.ItemSystem:GetItem(QuestTable.ItemInstId);
	--检测ItemInstId是否存在
	if not itemInst then return end;
	--检测ItemInstId是否是装备
	if not itemInst:IsEquip() then return end;
	--检测装备生命周期
	if not itemInst:IsAlive() then return end;
	--检测装备穿戴位置
	if not self:CheckInTable(_G.ResetAppendPropTypeConfig.CanIntensifyTable, itemInst:GetWearPos()) then return end;
	--检测玩家选择重置哪条是否错误
	local propTable = itemInst:GetProperty();
	local havePropNum = 0;
	for k,v in pairs(propTable) do
		havePropNum = k;
	end;
	if QuestTable.PropIndex <= 0 or QuestTable.PropIndex > havePropNum then	return end;
	
	--运算出强化装备的数据
	local needMoney		 = math.ceil(_G.ResetAppendPropTypeConfig.NeedMoney(itemInst) * self.nDiscount_ResetType);	--重置需要金钱
	local needCZStoneNum = _G.ResetAppendPropTypeConfig.NeedCZStoneNum(itemInst); --重置需要重置石个数
	--检测背包中是否有足够银两
	if not self.ItemSystem:IsPacketMoneyEnough(needMoney) then return end;
	--检测背包中是否有足够重置石
	local b_IsEnough_1, n_Minus_1 = self.ItemSystem:CheckDelEnumItemInPacketCond(_G.ResetAppendPropTypeConfig.CZStoneId, needCZStoneNum);
	--用于自动购买
	local autoBuyInfo = {};
	if not b_IsEnough_1 then
		if QuestTable.IsAutoBuy then
			local t = {};
			t.dwItemEnum 	= _G.ResetAppendPropTypeConfig.CZStoneId;
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
		--检测背包中是否有足够重置石
		b_IsEnough_1, n_Minus_1 = self.ItemSystem:CheckDelEnumItemInPacketCond(_G.ResetAppendPropTypeConfig.CZStoneId, needCZStoneNum);
		if not b_IsEnough_1 then return end;
	end;
	
	--删除各种石头和钱。
	--删除钱
	self.ItemSystem:CostPacketMoney(needMoney, _G.ItemSysOperType.QiangHua);
	local b_IsUseBind_1;
	local tempV;
	local tMaterials = {}
	--删除各种石头--删除物品通知
	tempV, b_IsUseBind_1 = self.ItemSystem:DelEnumItemInPacket(_G.ResetAppendPropTypeConfig.CZStoneId, needCZStoneNum, QuestTable.IsUseNotBindFirst, _G.ItemSysOperType.QiangHua);
	table.insert(tMaterials, {dwItemEnum = _G.ResetAppendPropTypeConfig.CZStoneId, number = needCZStoneNum});
	--重置装备附加类型
	--记录每种类型附加属性出现次数
	local appearance = {
		[1] = 0;
		[2] = 0;
		[3] = 0;
		[4] = 0;
		[5] = 0;
		[6] = 0;
	};
	for k, v in pairs(propTable) do
		appearance[v.dwPropertyType] = appearance[v.dwPropertyType] + 1;
	end;
	local sumRate = 0; 	----用来算出权值总和
	local rate = 0;		----用来在保存1和权值总和之间随机
	local temp = 0;		----用来运算权值区间
	--根据类型出现次数运算出下次出现何种类型属性权值表
	local newPropTypeProbability = {};
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
			break;
		end;
	end;
	propTable[QuestTable.PropIndex].dwPropertyType = propType;

	self.ItemSystem:SetItemProperty(itemInst:GetInstID(), propTable);
	
	local mountSystem = objPlayer:GetSystem("CMountSystem");
	if mountSystem then
		mountSystem:EquipChange(itemInst);
	end;
	--是否使用绑定道具，如果使用则绑定装备
	if itemInst.dwBindType == enItemBindType.eNo and b_IsUseBind_1 then
		self.ItemSystem:BindItem(QuestTable.ItemInstId);
	end;
	--给客户端返回结果
	self:GetPlayer().EISys_OnResetAppendPropTypeMsg{Type = propType};
	self:GetPlayer():GetSystem('CPlayerEventCenterSystem'):DoEvent(_G.enumPlayerEventType.EventResetAppendPropType);
	
	--附加属性相同类型条数为4条及以上全服广播，用来装B
	appearance = {
		[1] = 0;
		[2] = 0;
		[3] = 0;
		[4] = 0;
		[5] = 0;
		[6] = 0;
	};
	for k, v in pairs(propTable) do
		appearance[v.dwPropertyType] = appearance[v.dwPropertyType] + 1;
	end;
	local v = appearance[propType];
	if v >= _G.EICongratulationConfig.ResetAppendPropType.Num then
		local info = {};
		info[1] = GetCurTime();
		info[2] = propType;
		info[3] = v;
		self:BroadCastMsg(itemInst, 5, info);
	end;
end;



