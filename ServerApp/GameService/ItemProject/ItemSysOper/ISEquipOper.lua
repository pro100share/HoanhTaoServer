------------------------------------
------------------------------------
--道具系统内部的接口文件
--author lkj



--获取所有身上的装备
function CItemSystem:GetAllPutOnEquip()
	local setEquip = {};
	for _, itemInstID in ipairs(self:GetEquipHolder():GetAllItemID()) do
		local itemInst = self:GetItemInst(itemInstID);
		if itemInst then
			table.insert(setEquip, itemInst);
		end;
	end;
	
	return setEquip;
end;



--判断一个装备是否被穿上
function CItemSystem:IsEquipWorn(equip)
	if self:GetEquipHolder():GetItemIDBySlot(equip:GetWearPos()) == equip:GetInstID() then
		return true;
	else
		return false;
	end;
end



----穿戴装备常规检查
function CItemSystem:WornEquipCommonCheck(equip)
	--生命周期判断
	if not equip:IsAlive() then
		self:OnError(6000610016, equip:GetInstID(), 0);
		return false;
	end
	--职业要求判断
	local dwRoleNeeded = equip:GetRoleNeeded();
	if (dwRoleNeeded ~= 0) and (dwRoleNeeded ~= self:GetPlayer():GetInfo().dwProf) then
		self:OnError(6000610017, equip:GetInstID(), dwRoleNeeded);
		return false;
	end
	--等级要求判断
	if equip:GetLevelNeeded() > self:GetPlayer():GetLevel() then
		self:OnError(6000610007, equip:GetInstID(), 0);
		return false;
	end

	return true;
end;



--如果装备为已穿戴的，则重算属性
function CItemSystem:CheckEquipChange(equip)
	if self:IsEquipWorn(equip) then
		if self:WornEquipCommonCheck(equip) then
			self:EquipChange(equip:GetWearPos(), true);
		else--脱下
			local equipHolder	= self:GetEquipHolder();
			local dwWearPos		= equip:GetWearPos();
			local packet		= self:GetPacket();
			local dwToSlot		= packet:GetOneEmptySlot();
			if not dwToSlot then return end;	
			self:MoveItemToHolderSlot(equip, equipHolder, dwWearPos, packet, dwToSlot);
		end;
	end;
end;



--指定穿戴位置的装备更改
----bWorn 是否是已穿戴的装备有更改
function CItemSystem:EquipChange(dwWearPos, bWorn)
	if self.b_Create then return end;
	local equipID = self:GetEquipHolder():GetItemIDBySlot(dwWearPos);
	local equip = self:GetItemInst(equipID);
	--加成属性更改
	self:EquipAttrChange(dwWearPos, equip);	
	--套装更改
	self:EquipSuitChange(dwWearPos, equip);
	--同步装备显示
	if equip then	
		--事件中心，抛出装备武器事件
		if dwWearPos == _G.enItemWearPos.eWeapon then
			self:GetPlayer():GetSystem("CPlayerEventCenterSystem"):DoEvent(enumPlayerEventType.EventUseWeapon, 1, equip:GetQuality());
		end;
		--紫装以上穿戴绑定
		if (not bWorn) and (equip:GetQuality() >= _G.enQualityType.ePink) and (not equip:IsBind()) then
			self:DoBindItem(equip);
		end;
		--self:GetPlayer():SetEquip(dwWearPos, equip:GetEnumID(), equip:GetMshID(), equip:GetStrongLevel());
	else
		--self:GetPlayer():SetEquip(dwWearPos, 0, nil, 0);
	end;
	
	local fashionDressSys = self:GetPlayer():GetSystem("CFashionDressSystem");
	if fashionDressSys then
		fashionDressSys:UpdateSingleViewModel(dwWearPos);
	end
end;

--装备更改 （只更改外观 不会影响属性  时装系统调用）
function CItemSystem:EquipChangeModel(dwWearPos)
	if self.b_Create then return end;
	local equipID = self:GetEquipHolder():GetItemIDBySlot(dwWearPos);
	local equip = self:GetItemInst(equipID);
	
	--同步装备显示
	if equip then	
		self:GetPlayer():SetEquip(dwWearPos, equip:GetEnumID(), equip:GetMshID(), equip:GetStrongLevel());
	else
		self:GetPlayer():SetEquip(dwWearPos, 0, nil, 0);
	end;
end;

--装备属性改变
function CItemSystem:EquipAttrChange(dwPos, equip)
	local OldAttr = self.AttrList[dwPos];
	local NewAttr;
	if equip and (equip:GetEndure() ~= 0) then
		NewAttr = equip:GetAddAttr();
	else
		NewAttr = SSingleAttrChange:new();
	end;
	self.AttrList[dwPos] = NewAttr;
	local tempAttr = NewAttr:Clone();
	--算差值
	tempAttr:SubValue(OldAttr);
	self.TotalAttr:AddValue(tempAttr);
	--同步属性
	--table.print(self.TotalAttr);
	local totalAttr = self.TotalAttr:Clone();
	self:GetPlayer():GetSystem("CSkillSystem"):NotifyEquipProperty(totalAttr, 1, false);
end;


--装备套装更改
function CItemSystem:EquipSuitChange(dwPos, equip)
	if not self.SuitsInfo.setEquipInfo[dwPos] then return end;
	
	local setEquipInfo = self.SuitsInfo.setEquipInfo[dwPos];
	local bStrLvlChange = false;
	local bTianShChange = false;
	local bQualityChange= false;
	if equip then
		if setEquipInfo.dwStrong ~= equip:GetStrongLevel() then
			setEquipInfo.dwStrong = equip:GetStrongLevel();
			bStrLvlChange = true;
		end;
		if setEquipInfo.dwTianSh ~= equip:GetTianSheng() then
			setEquipInfo.dwTianSh = equip:GetTianSheng();
			bTianShChange = true;
		end;
		if setEquipInfo.dwQuality ~= equip:GetQuality() then
			setEquipInfo.dwQuality = equip:GetQuality();
			bQualityChange = true;
		end;
	else
		if setEquipInfo.dwStrong ~= 0 then
			setEquipInfo.dwStrong = 0;
			bStrLvlChange = true;
		end;
		if setEquipInfo.dwTianSh ~= 0 then
			setEquipInfo.dwTianSh = 0;
			bTianShChange = true;
		end;
		if setEquipInfo.dwQuality ~= enQualityType.eNormal then
			setEquipInfo.dwQuality = enQualityType.eNormal;
			bQualityChange = true;
		end;
	end;
	
	local eventCenter = self:GetPlayer():GetSystem("CPlayerEventCenterSystem");
	--装备所有强化等级
	if bStrLvlChange then
		local totalStrong = 0;
		for _, equipInfo in ipairs(self.SuitsInfo.setEquipInfo) do
			totalStrong = totalStrong + equipInfo.dwStrong;
		end;
		--事件中心,抛出所有装备强化等级事件
		eventCenter:DoEvent(enumPlayerEventType.EventTotalStrong, 1, totalStrong);
	end;
	
	self.SuitsInfo.setSuitIDs = SuitCheck(self.SuitsInfo.setEquipInfo);
	
	--套装属性加成
	local addAttrAdv = SSingleAttrChange:new();
	local addAttrPer = SSingleAttrChange:new();
	for k, v in ipairs(self.SuitsInfo.setSuitIDs) do
		if v.isActive == 1 then
			local objAdv,objPer = GetSuitAttr(k);
			
			addAttrAdv:AddValue(objAdv);
			addAttrPer:AddValue(objPer);
			
			eventCenter:DoEvent(enumPlayerEventType.EventEquipSuit,k);
		end
	end;
	--同步属性
	self:GetPlayer():GetSystem("CSkillSystem"):NotifyEquipProperty(addAttrAdv, 2);
	self:GetPlayer():GetSystem("CSkillSystem"):NotifyEquipProperty(addAttrPer, 2, true);
	--同步套装特效
	self:GetPlayer():SetSuitList(self.SuitsInfo.setSuitIDs);
end;



--系统Create时计算所有装备属性
function CItemSystem:CalEquipAttr()
	--装备属性
	self.tbNeedChgEquipList = {};
	local allEquip = self:GetAllPutOnEquip();
	for _, equip in ipairs(allEquip) do
		local dwPos = equip:GetWearPos();
		if equip:GetEndure() ~= 0 then
			local NewAttr = equip:GetAddAttr();
			self.AttrList[dwPos] = NewAttr;
			--总值累加
			self.TotalAttr:AddValue(NewAttr);
		end;
		--装备模型
		local dwMode = self:GetPlayer():SetEquip(dwPos, equip:GetEnumID(), equip:GetMshID(), equip:GetStrongLevel(), true);
		--套装属性统计
		-- if self.SuitsInfo.setEquipInfo[dwPos] then
			-- self.SuitsInfo.setEquipInfo[dwPos].dwStrLvl = equip:GetStrongLevel();
			-- self.SuitsInfo.setEquipInfo[dwPos].dwTianSh = equip:GetTianSheng();
			-- self.SuitsInfo.setEquipInfo[dwPos].dwQuality= equip:GetQuality();
		-- end;
		
		--前后的外形不一致
		if dwMode == 1 then
			self.tbNeedChgEquipList[dwPos] = 
			{
				equip:GetMshID();
				equip:GetEnumID();
				equip:GetStrongLevel();
			}
		end
	end;
	--同步属性
	--table.print(self.TotalAttr);
	local totalAttr = self.TotalAttr:Clone();
	self:GetPlayer():GetSystem("CSkillSystem"):NotifyEquipProperty(totalAttr, 1, false);
	--套装属性加成
	local addAttrAdv = SSingleAttrChange:new();
	local addAttrPer = SSingleAttrChange:new();
	for k, v in ipairs(self.SuitsInfo.setSuitIDs) do
		if v.isActive == 1 then
			local objAdv,objPer = GetSuitAttr(k);
			
			addAttrAdv:AddValue(objAdv);
			addAttrPer:AddValue(objPer);
		end
	end;
	--同步属性
	self:GetPlayer():GetSystem("CSkillSystem"):NotifyEquipProperty(addAttrAdv, 2);
	self:GetPlayer():GetSystem("CSkillSystem"):NotifyEquipProperty(addAttrPer, 2, true);
	--同步套装特效
	self:GetPlayer():SetSuitList(self.SuitsInfo.setSuitIDs,true);
end;


function CItemSystem:CheckSuitForCreate()
	self.SuitsInfo.setEquipInfo = WearPosInfoMaker(self:GetAllPutOnEquip(),self:GetAllStone());
	
	self.SuitsInfo.setSuitIDs = SuitCheck(self.SuitsInfo.setEquipInfo);
end;
