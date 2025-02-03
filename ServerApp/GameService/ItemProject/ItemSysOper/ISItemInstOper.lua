------------------------------------
------------------------------------
--道具系统内部的接口文件
--author lkj



--获取道具实例
function CItemSystem:GetItemInst(dwInstID)
	return self.ItemList[dwInstID];
end;


--装备绑定
function CItemSystem:DoBindItem(objItem)
	objItem:Bind();
	self:OperUpd(objItem, _G.enItemUpdOper.eBind, {objItem:GetBindType()});
end;

--设置签名
function CItemSystem:DoSetItemDoodle(objItem, str)   
	objItem:SetDoodle(str);
	self:OperUpd(objItem, _G.enItemUpdOper.eDooe, {objItem:GetDoodle()});
end;

--装备升阶
function CItemSystem:DoUpGradeEquip(equip)
	local dwHolderClass, dwSlot = equip:GetPosInfo();
	local holder = self:GetHolder(dwHolderClass);
	if dwHolderClass ~= _G.enItemPosition.ePutOn then
		holder:DelItem(equip);
	end;
	if equip:UpGrade() then
		if dwHolderClass ~= _G.enItemPosition.ePutOn then
			holder:AddItemToSlot(equip, dwSlot);
		end;
		self:CheckEquipChange(equip);
		self:OperUpd(equip, _G.enItemUpdOper.eUpgd, {});
		return true;
	else
		if dwHolderClass ~= _G.enItemPosition.ePutOn then
			holder:AddItemToSlot(equip, dwSlot);
		end;
		return false;
	end;
end;

--设置装备实例附加属性
function CItemSystem:DoSetEquipProperty(equip, setProperty)
	equip:SetProperty(setProperty);
	self:CheckEquipChange(equip);
	self:OperUpd(equip, _G.enItemUpdOper.eProp, {equip:GetPropertyNetData()}, nil, equip:GetDBProperty());
end;

--设置装备实例强化等级
function CItemSystem:DoSetEquipStrongLevel(equip, dwStrongLevel)
	equip:SetStrongLevel(dwStrongLevel);
	self:CheckEquipChange(equip);
	self:OperUpd(equip, _G.enItemUpdOper.eStLv, {equip:GetStrongLevel()});
end;

--设置装备实例天生属性
function CItemSystem:DoSetEquipTianSheng(equip, dwTianSheng)
	equip:SetTianSheng(dwTianSheng);
	self:CheckEquipChange(equip);
	self:OperUpd(equip, _G.enItemUpdOper.eTias, {equip:GetTianSheng()});
end;

--同步装备耐久
function CItemSystem:UpdateEquipEndure(equip)
	self:OperUpd(equip, _G.enItemUpdOper.eEdre, {equip:GetEndure()});
end;

--降低装备耐久
function CItemSystem:DoDownEquipEndure(equip, dwValue)
	if equip:DownEndure(dwValue) then
		if equip:GetEndure() == 0 then
			self:EquipChange(equip:GetWearPos(), true)
		end;
		self:UpdateEquipEndure(equip)
	end;
end;

--修复装备耐久
function CItemSystem:DoFixEquipEndure(equip)
	local bEndureEmpty = false;
	if equip:GetEndure() == 0 then
		bEndureEmpty = true;
	end;
	if equip:FixEquipEndure() then
		if bEndureEmpty then
			self:EquipChange(equip:GetWearPos(), true);
		end;
		self:UpdateEquipEndure(equip)
	end;
end;

--设置道具位置
function CItemSystem:DoSetItemPosInfo(objItem, dwHolderClass, dwSlot)
	objItem:SetPosInfo(dwHolderClass, dwSlot);
	self:OperUpd(objItem, _G.enItemUpdOper.ePosn, {objItem:GetPosInfo()}, nil, objItem:GetDBPosInfo());
end;

--物品使用的时候，根据物品类型，让物品或者物品组进入CD状态
function CItemSystem:DoSetItemCD(objItem)
	local dwCDType	= objItem:GetCDType();
	local dwCDTime	= objItem:GetConfigCDTime();
	local dwNowTime	= GetCurTime();
	local holder, _	= objItem:GetPosInfo();
	holder = self:GetHolder(holder);
	if dwCDTime > 0 then
		if dwCDType == 0 then--如果物品的dwCDType为0，说明是属于特殊组，只使自己的CD进入读秒时间
			--寻找同一类物品，进入CD状态
			local setItemIDs = holder:GetItemIDSetByEnumID(objItem:GetEnumID());
			for _, dwInstID in ipairs(setItemIDs) do
				local itemInst = self:GetItemInst(dwInstID);
				itemInst:SetCDTime(dwNowTime);
			end;
		else
			--寻找同一CD类型物品，进入CD状态
			local setItemIDs = holder:GetItemIDSetByCDType(dwCDType);
			for _, dwInstID in ipairs(setItemIDs) do
				local itemInst = self:GetItemInst(dwInstID);
				itemInst:SetCDTime(dwNowTime);
			end;
		end
	end;
end



--使用道具常规检查
function CItemSystem:UseItemCommonCheck(objItem)
	--位置判断，非背包物品不可使用。
	local dwHolder, dwSlot = objItem:GetPosInfo();
	if dwHolder == _G.enItemPosition.ePacket or dwHolder == _G.enItemPosition.eTaskRoom then
		--生命周期判断
		if not objItem:IsAlive() then
			self:OnError(6000610016, objItem:GetInstID(), 0);
			return false;
		end
		--职业要求判断
		local dwRoleNeeded = objItem:GetRoleNeeded();
		if (dwRoleNeeded ~= 0) and (dwRoleNeeded ~= self:GetPlayer():GetInfo().dwProf) then
			self:OnError(6000610017, objItem:GetInstID(), dwRoleNeeded);
			return false;
		end
		--等级要求判断
		if objItem:GetLevelNeeded() > self:GetPlayer():GetLevel() then
			self:OnError(6000610007, objItem:GetInstID(), 0);
			return false;
		end
		--CD判断
		if objItem:IsInCD() then
			self:OnError(6000610018, objItem:GetInstID(), 0);
			return false;
		end
		--lw：丹药类要做能够使用的判断 2012-4-24 15:30
		if objItem:GetParentType() == 2 then
			local sBattleInfo = self:GetPlayer():GetSystem("CSkillSystem"):GetInfo();
			if sBattleInfo.dwUseItemForbidFlag == 1 then
				return false;
			end
		end
		
		return true;
	else
		_err("try to use item not in packet/taskroom!!!");
		return false;
	end;
end;



--使用道具
function CItemSystem:DoUseItem(objItem)
	local script = objItem:GetScript();
	local scripSys = self:GetPlayer():GetSystem("CScriptSystem");
	----使用脚本
	local res2 = script:OnUseItem(self, objItem, scripSys);
	----是否需要删除
	if res2 then
		if res2 > 0 then
			self:OnError(res2);
		end;
		return false;
	end;
	if objItem:GetCount() > 1 then
		self:DoDelItemNum(objItem, 1, "use");
	else
		self:DoDelItem(objItem, "use");
	end;
	
    --通知其它系统删除了某一个物品
	self:DoItemEvent("NotifyItemDelete", objItem:GetEnumID(), 1);
    --记录日志
    self:LogDelItem(objItem:GetEnumID(), 1, _G.ItemSysOperType.Used, objItem:GetBindType());
	
	----将物品进入CD操作
	self:DoSetItemCD(objItem);
	--事件中心,抛出使用道具事件
	self:GetPlayer():GetSystem('CPlayerEventCenterSystem'):DoEvent(enumPlayerEventType.EventUseItem, objItem:GetEnumID())
    
	return true;
end;

--批量使用道具
function CItemSystem:DoMassUseItem(objItem,num)
	local script = objItem:GetScript();
	local scripSys = self:GetPlayer():GetSystem("CScriptSystem");
	local curnum = 0;
	local res1 = 0;
		----使用脚本
	if(not script.CheckForMassUse) then
		return;
	end
	res1 ,curnum = script:CheckForMassUse(self, objItem,scripSys,num);
	if not res1 then
		if(curnum > 0) then
			self:OnError(curnum);
		end
		return false;
	end
	if(not script.OnUseMassItem) then
		return;
	end
	local res2 = script:OnUseMassItem(self, objItem, scripSys,curnum);
	----是否需要删除
	if res2 then
		if res2 > 0 then
			self:OnError(res2);
		end;
		return false;
	end;
	
	if(curnum ~= 0) then
		for i= 1,curnum do
			--事件中心,抛出使用道具事件
			self:GetPlayer():GetSystem('CPlayerEventCenterSystem'):DoEvent(enumPlayerEventType.EventUseItem, objItem:GetEnumID())
		end
		if objItem:GetCount() > curnum then
			self:DoDelItemNum(objItem, curnum, "use");
		else
			self:DoDelItem(objItem, "use");
		end;
		self:DoItemEvent("NotifyItemDelete", objItem:GetEnumID(), curnum);
		--记录日志
		self:LogDelItem(objItem:GetEnumID(), curnum, _G.ItemSysOperType.Used, objItem:GetBindType());
		
		 --通知其它系统删除了某一个物品
		self:DoSetItemCD(objItem);
		return true;
	else
		return false;
	end
end

--将道具A向道具B合并
function CItemSystem:MergeItemAToItemB(objItemA, objItemB)
	local dwMerNum = objItemB:CanMergeObjHowMany(objItemA);
	if dwMerNum == 0 then
		return false;
	end;
	local dwItemANum = objItemA:GetCount();
	if dwMerNum < dwItemANum then
		self:DoAddItemNum(objItemB, dwMerNum, "combine");
		self:DoDelItemNum(objItemA, dwMerNum, "combine");
		return dwMerNum;
	else
		self:DoAddItemNum(objItemB, dwItemANum, "combine");
		self:DoDelItem(objItemA, "combine");
		return dwItemANum;
	end;
end;



--将道具A和道具B交换位置
function CItemSystem:SwapItemAWithItemB(objItemA, objItemB)
	local holderClassA, dwSlotA = objItemA:GetPosInfo();
	local holderClassB, dwSlotB = objItemB:GetPosInfo();
	if holderClassA == holderClassB then--同容器内交换
		local holder = self:GetHolder(holderClassA);
		
		self:DoSetItemPosInfo(objItemA, holderClassB, dwSlotB);
		self:DoSetItemPosInfo(objItemB, holderClassA, dwSlotA);
		
		holder:SwapItemAWithItemB(objItemA, dwSlotA, objItemB, dwSlotB);
	else--异容器内交换
		local holderA = self:GetHolder(holderClassA);
		local holderB = self:GetHolder(holderClassB);
		
		self:DoSetItemPosInfo(objItemA, holderClassB, dwSlotB);
		self:DoSetItemPosInfo(objItemB, holderClassA, dwSlotA);
		
		holderA:UpdateSlotItem(dwSlotA, objItemA, objItemB);
		holderB:UpdateSlotItem(dwSlotB, objItemB, objItemA);
	end;
end;



--拆分一个物品，返回新拆分出来的道具ID
function CItemSystem:SplitItemTo(objItem, dwSplitNum, dwHolderClass)
	--生成新的
	self:DoDelItemNum(objItem, dwSplitNum, "split")
	local newItem = CItem:New(objItem:GetEnumID());
	objItem:Copy(newItem);
	newItem:SetCount(dwSplitNum);
	self:AddObjItemToHolder(newItem, dwHolderClass, "split");

	return newItem:GetInstID();
end



