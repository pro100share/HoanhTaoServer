--功能屏蔽
--[[
--坐骑升阶
function CMountSystem:UpSkill(info)
	--检测权限
	if not self:HasAuthority("MountSkill") then return end;
	
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("Cannot get player by CMountSystem:UpGrade(info)");
		return;
	end;
	--检查坐骑升级技能条件
	local mountInst = self:GetMountInst(info.n_MountInstID);
	if not mountInst then return end;
	--是否可以升级技能
	----还没学会该技能
	local n_SkillLevel = mountInst.t_Skill[info.n_SkillIndex];
	if not n_SkillLevel then return	end;
	----坐骑技能满级
	if n_SkillLevel > 99 then return end;
	----坐骑学习等级不够
	local t_Res = _G.MountSkill[info.n_SkillIndex]:GetUpLevelCondition(n_SkillLevel);
	if t_Res.n_NeedLevel > mountInst:GetLevel() then return end;
	--所需金钱
	if not self.ItemSystem:IsPacketMoneyEnough(t_Res.n_Money) then return end;
	--[[坐骑技能升级不用资质果了
	--如果使用资质果
	if info.b_IsUseZZG then
		--检测背包中是否有足够资质果
		local b_IsEnough_1, n_Minus_1 = self.ItemSystem:CheckDelEnumItemInPacketCond(_G.UpQualityConfig.ZZGEnumID, t_Res.n_NeedZZGNum);
		--用于自动购买
		local autoBuyInfo = {};
		if not b_IsEnough_1 then
			if info.b_IsAutoBuy then
				local info = {};
				info.dwItemEnum 	= _G.UpQualityConfig.ZZGEnumID;
				info.dwItemNumber 	= n_Minus_1;
				table.insert(autoBuyInfo, info);
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
			local n_Result, _, _ = mallSystem:CanBuyItemList(autoBuyInfo);
			if n_Result > 0 then return end;
			for k, v in pairs(autoBuyInfo) do
				local buySuc = mallSystem:BuyItemByID(v.dwItemNumber, v.dwItemEnum)
				if not buySuc then
					_err("auto buy error!!!");
					return;
				end;
			end;
			--再次检测背包中是否有足够资质果
			b_IsEnough_1, _ = self.ItemSystem:CheckDelEnumItemInPacketCond(_G.UpQualityConfig.ZZGEnumID, t_Res.n_NeedZZGNum);
			if not b_IsEnough_1  then return end;
		end;
		--删除资质果
		self.ItemSystem:DelEnumItemInPacket(_G.UpQualityConfig.ZZGEnumID, t_Res.n_NeedZZGNum, false, _G.ItemSysOperType.Mount);
	else--不然就要消耗五行真气
	]]
		local objElemSystem = objPlayer:GetSystem("CFiveElemSystem");
		if not objElemSystem then 
			_err("get CFiveElemSystem error!!!");
			return
		end;
		--拥有五行真气
		local n_HaveGold, n_HaveWood, n_HaveWater, n_HaveFire, n_HaveSoil = objElemSystem:GetElemValue();
		if n_HaveGold < t_Res.n_Gold or n_HaveWood < t_Res.n_Wood or n_HaveWater < t_Res.n_Water or n_HaveFire < t_Res.n_Fire or n_HaveSoil < t_Res.n_Soil then
			return;
		end;
		--消耗真气
		objElemSystem:ChangeAttr("dwMetalValue",	- t_Res.n_Gold);
		objElemSystem:ChangeAttr("dwWoodValue",		- t_Res.n_Wood);
		objElemSystem:ChangeAttr("dwWaterValue",	- t_Res.n_Water);
		objElemSystem:ChangeAttr("dwFireValue",		- t_Res.n_Fire);
		objElemSystem:ChangeAttr("dwEarthValue",	- t_Res.n_Soil);
	--[[坐骑技能升级不用资质果了
	end;
	]]
	--删除钱
	self.ItemSystem:CostPacketMoney(t_Res.n_Money, _G.ItemSysOperType.Mount);
	--成功率
	local n_SuccessRate	= t_Res.n_SuccessRate;
	local n_Rate = math.random(1, 10000);
	local isSuc = false;
	if n_Rate <= n_SuccessRate then
		isSuc = true;
		mountInst:UpSkill(info.n_SkillIndex);
		self:InsertDirty(mountInst:GetInstID());
		self.b_ImmediatelySave = true;
		if mountInst:GetInstID() == self.n_ActiveMountID then
			self:AttributeChange();
		end;
		--通知事件中心
		objPlayer:GetSystem('CPlayerEventCenterSystem'):DoEvent(_G.enumPlayerEventType.EventMountUpSkill, info.n_SkillIndex, mountInst.t_Skill[info.n_SkillIndex]);
	end;
	objPlayer.MountSys_UpSkillResultMsg{MountInstID = mountInst:GetInstID(), IsSuc = isSuc, SkillIndex = info.n_SkillIndex};
end;
]]


