--创建系统
function CFiveElemSystem:Create(bIsChangeLine)
    -- 创建数据库对象
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local objDB = objPlayer:GetDBQuery();
	self.objDBQuery = CFiveElemDBOper:new(objDB,self);
	if not self.objDBQuery then
		return false;
	end;
	--------------------------------------------------------
	local tabDataList = objPlayer:GetLineData("CFiveElementSystem")
	if tabDataList[1][1] then
		self.dwMetalLv = tabDataList[1][1]
		self.dwWoodLv = tabDataList[1][2]
		self.dwWaterLv = tabDataList[1][3]
		self.dwFireLv = tabDataList[1][4]
		self.dwEarthLv = tabDataList[1][5]
		self.dwDantianLv = tabDataList[1][6]
		self.dwMetalValue = tabDataList[1][7]
		self.dwWoodValue = tabDataList[1][8]
		self.dwWaterValue = tabDataList[1][9]
		self.dwFireValue = tabDataList[1][10]
		self.dwEarthValue = tabDataList[1][11]
		self.dwCountTime = tabDataList[1][12]
		self.dwMetalTime = tabDataList[1][13]
		self.dwWoodTime = tabDataList[1][14]
		self.dwWaterTime = tabDataList[1][15]
		self.dwFireTime = tabDataList[1][16]
		self.dwEarthTime = tabDataList[1][17]
		self.szFillParam = tabDataList[1][18]
	end
	if bIsChangeLine == 0 then
	--if not bIsChangeLine then
		if not CTimeFormat:isTodayEx(objPlayer:GetInfo().tmDownlineTime/1000) then
			self.szFillParam = '00000'
			self.dwMetalTime = 0
			self.dwWoodTime = 0
			self.dwWaterTime = 0
			self.dwFireTime = 0
			self.dwEarthTime = 0
		end
	end
	self.setFill = {}
	local param = tonumber(self.szFillParam)
	param = param or 0;
	self.setFill.dwMetal = math.floor(param/10000)
	self.setFill.dwWood = math.floor(param/1000 - self.setFill.dwMetal*10)
	self.setFill.dwWater = math.floor(param/100 - self.setFill.dwMetal*100 - self.setFill.dwWood*10)
	self.setFill.dwFire = math.floor(param/10 - self.setFill.dwMetal*1000 - self.setFill.dwWood*100 - self.setFill.dwWater*10)
	self.setFill.dwEarth = math.floor(param - self.setFill.dwMetal*10000 - self.setFill.dwWood*1000 - self.setFill.dwWater*100 - self.setFill.dwFire*10)	
	local objVipSys = objPlayer:GetSystem('CVipSystem')
	objVipSys:AddSys(self)
	-- 计算五行附加的属性
	self:CountAttribute()
	return true;
end
function CFiveElemSystem:ResetInfo()
	local objPlayer = self:GetPlayer();
	self.szFillParam = '00000'
	self.dwMetalTime = 0
	self.dwWoodTime = 0
	self.dwWaterTime = 0
	self.dwFireTime = 0
	self.dwEarthTime = 0
	self:UpdateInfoToClient(objPlayer,2,{'szFillParam','dwMetalTime','dwWoodTime','dwWaterTime','dwFireTime','dwEarthTime'})
end
function CFiveElemSystem:OnChangeLineBegin(dwNewLineID)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local t = {}
	t[1] = self.dwMetalLv;
	t[2] = self.dwWoodLv;
	t[3] = self.dwWaterLv;
	t[4] = self.dwFireLv;
	t[5] = self.dwEarthLv;
	t[6] = self.dwDantianLv;
	t[7] = self.dwMetalValue;
	t[8] = self.dwWoodValue;
	t[9] = self.dwWaterValue;
	t[10] = self.dwFireValue;
	t[11] = self.dwEarthValue;
	t[12] = self.dwCountTime;
	t[13] = self.dwMetalTime;
	t[14] = self.dwWoodTime;
	t[15] = self.dwWaterTime;
	t[16] = self.dwFireTime;
	t[17] = self.dwEarthTime;
	t[18] = self.szFillParam;
	objPlayer:SetLineData("CFiveElementSystem",t);
end
--update (疾蓄时间倒计时)
function CFiveElemSystem:Update(dwInterval)
	return true
end
function CFiveElemSystem:Destroy()
	-- if self.objDBQuery then
		-- self.objDBQuery:SaveInfo()
	-- end;
end;

function CFiveElemSystem:OnEnterScene()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	-- 服务器开始计算五行真气，并通知客户端开始计算五行真气
	self:UpdateInfoToClient(objPlayer,1)
end;
--初始化五行增加的战斗人物属性
function CFiveElemSystem:CountAttribute()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local sklSystem = objPlayer:GetSystem("CSkillSystem")
	self.AttributeList.dwAttack = ERF_Count_AttribOfWuxing(self.dwMetalLv,enumFiveElemType.Metal)
	self.AttributeList.dwHPMax = ERF_Count_AttribOfWuxing(self.dwWoodLv,enumFiveElemType.Wood)
	self.AttributeList.dwFlee = ERF_Count_AttribOfWuxing(self.dwWaterLv,enumFiveElemType.Water)
	self.AttributeList.dwCrit = ERF_Count_AttribOfWuxing(self.dwFireLv,enumFiveElemType.Fire)
	self.AttributeList.dwDefense = ERF_Count_AttribOfWuxing(self.dwEarthLv,enumFiveElemType.Earth)
	self.AttributeList.dwMPMax = ERF_Count_AttribOfWuxing(self.dwDantianLv,enumFiveElemType.Dantian)
	local fightInfo = SSingleAttrChange:new()
	fightInfo:Copy(self.AttributeList);
	sklSystem:NotifyFiveUpdate(fightInfo,99,false)
	for k,v in pairs (FiveElemComboConfig) do
		if self.dwMetalLv >= v.LvLimit.dwMetalLv and
		   self.dwWoodLv >= v.LvLimit.dwWoodLv and
		   self.dwWaterLv >= v.LvLimit.dwWaterLv and
		   self.dwFireLv >= v.LvLimit.dwFireLv and
		   self.dwEarthLv >= v.LvLimit.dwEarthLv then
		    self.ComboAttributeList[k] = 1
		    local fightInfo = SSingleAttrChange:new()
			for k1,v1 in pairs (FiveElemComboConfig[k].ProValue) do
				fightInfo[FiveElemComboConfig[k].ProValue[k1][1]] = FiveElemComboConfig[k].ProValue[k1][2]
				self.AttributeList[FiveElemComboConfig[k].ProValue[k1][1]] = self.AttributeList[FiveElemComboConfig[k].ProValue[k1][1]] + FiveElemComboConfig[k].ProValue[k1][2]
			end
			sklSystem:NotifyFiveUpdate(fightInfo,k,false)
		end
	end
end
--增加因为五行升级增加的战斗人物属性
function CFiveElemSystem:AddAttribute()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local sklSystem = objPlayer:GetSystem("CSkillSystem")
	local t = {};
	for k,v in pairs (self.AttributeList) do
		t[k] = v;
	end
	self.AttributeList.dwAttack = ERF_Count_AttribOfWuxing(self.dwMetalLv,enumFiveElemType.Metal)
	self.AttributeList.dwHPMax = ERF_Count_AttribOfWuxing(self.dwWoodLv,enumFiveElemType.Wood)
	self.AttributeList.dwFlee = ERF_Count_AttribOfWuxing(self.dwWaterLv,enumFiveElemType.Water)
	self.AttributeList.dwCrit = ERF_Count_AttribOfWuxing(self.dwFireLv,enumFiveElemType.Fire)
	self.AttributeList.dwDefense = ERF_Count_AttribOfWuxing(self.dwEarthLv,enumFiveElemType.Earth)
	self.AttributeList.dwMPMax = ERF_Count_AttribOfWuxing(self.dwDantianLv,enumFiveElemType.Dantian)
	local fightInfo = SSingleAttrChange:new()
	for k,v in pairs (self.AttributeList) do
		fightInfo[k] = self.AttributeList[k]
	end
	sklSystem:NotifyFiveUpdate(fightInfo,99,false)
	for k,v in pairs (FiveElemComboConfig) do
		if self.dwMetalLv >= v.LvLimit.dwMetalLv and
		   self.dwWoodLv >= v.LvLimit.dwWoodLv and
		   self.dwWaterLv >= v.LvLimit.dwWaterLv and
		   self.dwFireLv >= v.LvLimit.dwFireLv and
		   self.dwEarthLv >= v.LvLimit.dwEarthLv then
			if not self.ComboAttributeList[k] then
				self.ComboAttributeList[k] = 1
				local eventSys = objPlayer:GetSystem('CPlayerEventCenterSystem')
				eventSys:DoEvent(enumPlayerEventType.EventElemCombo,1);
				local fightInfo = SSingleAttrChange:new()
				for k1,v1 in pairs (FiveElemComboConfig[k].ProValue) do
					fightInfo[FiveElemComboConfig[k].ProValue[k1][1]] = FiveElemComboConfig[k].ProValue[k1][2]
					self.AttributeList[FiveElemComboConfig[k].ProValue[k1][1]] = self.AttributeList[FiveElemComboConfig[k].ProValue[k1][1]] + FiveElemComboConfig[k].ProValue[k1][2]
				end
				sklSystem:NotifyFiveUpdate(fightInfo,k,false)
				local t = {}
				t.dwIndex = k
				objPlayer.CltElemMsg{Type = ConfigElemMsg.Suit,Param = t}
			end
		end
	end
end
--获得五行属性值
function CFiveElemSystem:GetElemValue()
	return self.dwMetalValue,self.dwWoodValue,self.dwWaterValue,self.dwFireValue,self.dwEarthValue
end
function CFiveElemSystem:FiveElementRecord(dwGold, dwWood, dwWater, dwFire, dwEarth, dwType)
	local uItemGold, uItemWood, uItemWater, uItemFire, uItemEarth  = self:GetElemValue()	
		local setData = {
			[1] = {dwCurrent = uItemGold, dwChange = dwGold};
			[2] = {dwCurrent = uItemWood, dwChange = dwWood};
			[3] = {dwCurrent = uItemWater, dwChange = dwWater};
			[4] = {dwCurrent = uItemFire, dwChange = dwFire};
			[5] = {dwCurrent = uItemEarth, dwChange = dwEarth};
		}
		
	CLogSystemManager:zhenqi(self:GetPlayer(), setData, dwType)	
end;
--改变所有五行真气值，如果超过五行真气上限返回false 增加失败
function CFiveElemSystem:ChangeAttrAll(dwValue, dwType)
	if self:CanChange( 'dwMetalValue', dwValue ) and
		self:CanChange( 'dwWoodValue', dwValue ) and
		self:CanChange( 'dwWaterValue', dwValue ) and
		self:CanChange( 'dwFireValue', dwValue ) and
		self:CanChange( 'dwEarthValue', dwValue ) then
		local uItemGold, uItemWood, uItemWater, uItemFire, uItemEarth  = self:GetElemValue()	
		self:ChangeAttr( 'dwMetalValue', dwValue )
		self:ChangeAttr( 'dwWoodValue', dwValue )
		self:ChangeAttr( 'dwWaterValue', dwValue )
		self:ChangeAttr( 'dwFireValue', dwValue )
		self:ChangeAttr( 'dwEarthValue', dwValue )
		local setData = {
			[1] = {dwCurrent = uItemGold, dwChange = dwValue};
			[2] = {dwCurrent = uItemWood, dwChange = dwValue};
			[3] = {dwCurrent = uItemWater, dwChange = dwValue};
			[4] = {dwCurrent = uItemFire, dwChange = dwValue};
			[5] = {dwCurrent = uItemEarth, dwChange = dwValue};
		}
		
		CLogSystemManager:zhenqi(self:GetPlayer(), setData, dwType)	
		return true
	else
		return false
	end
end
--改变所有五行真气值，无视溢出
function CFiveElemSystem:ChangeAttrAllIgnore(dwValue, dwType)
	local uItemGold, uItemWood, uItemWater, uItemFire, uItemEarth  = self:GetElemValue()	
	self:ChangeAttr( 'dwMetalValue', dwValue )
	self:ChangeAttr( 'dwWoodValue', dwValue )
	self:ChangeAttr( 'dwWaterValue', dwValue )
	self:ChangeAttr( 'dwFireValue', dwValue )
	self:ChangeAttr( 'dwEarthValue', dwValue )
	local setData = {
		[1] = {dwCurrent = uItemGold, dwChange = dwValue};
		[2] = {dwCurrent = uItemWood, dwChange = dwValue};
		[3] = {dwCurrent = uItemWater, dwChange = dwValue};
		[4] = {dwCurrent = uItemFire, dwChange = dwValue};
		[5] = {dwCurrent = uItemEarth, dwChange = dwValue};
	}
	CLogSystemManager:zhenqi(self:GetPlayer(), setData, dwType)	
end
--私有  是否可以改变真气值
function CFiveElemSystem:CanChange(strAttr,dwValue)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local capacity = ERF_Count_tempOfWuxing(self.dwDantianLv);
	local temp = self[strAttr]
	if dwValue > 0 and temp == capacity then
		return false
	end
	temp = math.floor(temp + dwValue)
	if temp < 0 then 
		return false
	end
	return true
end
--改变一项五行属性,成功返回true 失败返回false
function CFiveElemSystem:ChangeAttr( strAttr, dwValue ,nFlag)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local addValue = dwValue;
	local capacity = ERF_Count_tempOfWuxing(self.dwDantianLv);
	local temp = self[strAttr]
	if addValue > 0 and temp == capacity then
		return false
	end
	temp = math.floor(temp + addValue)
	if temp > capacity then 
		temp = capacity 
	end
	if temp < 0 then 
		return false
	end
	self[strAttr] = temp
	local szIndex = string.sub(strAttr,1,-6)
	if nFlag ~= 2 and dwValue > 0 then
		self:GetPlayer():GetSystem("CPlayerEventCenterSystem"):DoEvent(enumPlayerEventType.EventAddFiveElem,addValue);
		self[szIndex..'Time'] = self[szIndex..'Time'] + addValue;
	end
	if addValue > 0 then
		local sysIncomeRecord = objPlayer:GetSystem("CIncomeRecordSystem")
		if sysIncomeRecord then
			sysIncomeRecord:OnAddZQ(strAttr,addValue)
		end
		objPlayer.ElemChangeNoticeMsg{Name=strAttr,Value= addValue};
	end
	self:UpdateInfoToClient(objPlayer,2,{strAttr,szIndex..'Time'})
	return true
end
--VIP状态改变事件响应
function CFiveElemSystem:OnVipChange(bState)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	if bState == true then
		self:UpdateInfoToClient(objPlayer,11)
	else
		self:UpdateInfoToClient(objPlayer,12)
	end
end
--五行升级
local ElemKeyToLv = 
{
	[enumFiveElemType.Metal] = 'dwMetalLv',
	[enumFiveElemType.Wood] = 'dwWoodLv',
	[enumFiveElemType.Water] = 'dwWaterLv',
	[enumFiveElemType.Fire] = 'dwFirelLv',
	[enumFiveElemType.Earth] = 'dwEarthLv',
	[enumFiveElemType.Dantian] = 'dwDantianLv',
}
function CFiveElemSystem:UpElemLv(nType,Info)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local objItemSys = objPlayer:GetSystem("CItemSystem")
	local elemLv = self[ElemKeyToLv[nType]]
	local str = ElemKeyToLv[nType]
	local szIndex = string.sub(str,1,-3)
	local playerLv = objPlayer:GetLevel()
	if elemLv >= ERF_Limit_LvOfWuxing(playerLv,nType) then
		return
	end
	if playerLv < ERF_Limit_LvOfWuxingPlayer(self[str],nType) then
		local t = {}
		objPlayer.CltElemMsg{Type = ConfigElemMsg.NoLevel,Param = t}
		return
	end
	local metal,wood,water,fire,earth = ERF_Count_ConsumeOfWuxing(elemLv,nType)
	local dwNeedItemNum = ERF_GetElemtUpNeedItemNum(elemLv + 1,nType)
	local hasItemNum, _, _  = objItemSys:GetEnumItemNumInPacket(ConfigFiveElemParam.UpLvItemEnum[szIndex])
	if metal <= self.dwMetalValue and
		wood <= self.dwWoodValue and 
		water <= self.dwWaterValue and 
		fire <= self.dwFireValue and 
		earth <= self.dwEarthValue then
		if 	hasItemNum >= dwNeedItemNum then
		else
			if Info.isCheckBoxSelect == true then
				local BuyNumber = dwNeedItemNum - hasItemNum
				local MallSystem = objPlayer:GetSystem("CMallSystem")
				local BuySuccess = MallSystem:BuyItemByID(BuyNumber,ConfigFiveElemParam.UpLvItemEnum[szIndex])
				if not BuySuccess then return false end
			else
				return
			end
		end
		self.dwMetalValue = self.dwMetalValue - metal
		self.dwWoodValue = self.dwWoodValue - wood
		self.dwWaterValue = self.dwWaterValue - water
		self.dwFireValue = self.dwFireValue - fire
		self.dwEarthValue = self.dwEarthValue - earth	
		objItemSys:DelEnumItemInPacket(ConfigFiveElemParam.UpLvItemEnum[szIndex], dwNeedItemNum, false, _G.ItemSysOperType.FiveElem)
		local dwRandow = math.random(1,100)
		if ERF_GetElemtUpSuccessPercent(self[str],nType) / 100 >= dwRandow then
			self[str] = self[str] + 1
			self:AddAttribute()
			local eventSys = objPlayer:GetSystem('CPlayerEventCenterSystem')
			if nType == enumFiveElemType.Dantian then
				eventSys:DoEvent(enumPlayerEventType.EventDantianUp,1);
			else
				eventSys:DoEvent(enumPlayerEventType.EventElementUp,1,nil,str);
			end
			objPlayer.CltFlushFiveElemInfoMsg{ElemName = nType,ElemLv = self[str]};
		else
			objPlayer.CltElemMsg{Type = ConfigElemMsg.Failed,Param = t}
		end
	else
		local t = {}
		objPlayer.CltElemMsg{Type = ConfigElemMsg.NoZhenqi,Param = t}
	end	
	self:UpdateInfoToClient(objPlayer,2)
end;
--加疾蓄时间
function CFiveElemSystem:AddElemTime(strName,dwValue)
end
--查看他人五行信息
function CFiveElemSystem:GetPlayerViewMsg()
	local t = {};
	-- t.dwMetalLv = self.dwMetalLv;
	-- t.dwWoodLv = self.dwWoodLv;
	-- t.dwWaterLv = self.dwWaterLv;
	-- t.dwFireLv = self.dwFireLv;
	-- t.dwEarthLv = self.dwEarthLv;
	-- t.dwDantianLv = self.dwDantianLv;
	-- t.ComboAttributeList = self.ComboAttributeList;
	return t;
end
--人物升级事件响应
function CFiveElemSystem:EventLevelUp(dwValue,dwUpLevel)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local t = {dwValue,dwUpLevel}
	objPlayer.CltElemMsg{Type = ConfigElemMsg.LevelUp,Param = t}
end
--解析五行灌注网络信息
function CFiveElemSystem:DecodeMsg(Type,HParam,LParam)
	if Type == ConfigElemMsg.ConvertElem then
		self:ConvertElem(HParam,LParam)
	elseif Type == ConfigElemMsg.PopCoerceElem then
		self:PopCoerceElem(HParam,LParam)
	elseif Type == ConfigElemMsg.PopElem then
		self:PopElem(HParam,LParam)
	end
end
--提取真气
function CFiveElemSystem:PopElem(HParam,LParam)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local objItemSys = objPlayer:GetSystem('CItemSystem')
	local capacity = ERF_Count_tempOfWuxing(self.dwDantianLv);
	local itemNum, _, _ = objItemSys:GetEnumItemNumInPacket(ConfigFiveElemParam.ConvertItemEnum) 
	if itemNum < ConfigFiveElemParam.ConvertItemNum then
		return
	end
	if capacity == self[LParam..'Value'] then
		local t = {}
		objPlayer.CltElemMsg{Type = ConfigElemMsg.PushFull,Param = t}
		return
	end
	if objItemSys:GetItem(HParam) then
		objItemSys:DelItemNumber(HParam,1, _G.ItemSysOperType.FiveElem)
		objItemSys:DelEnumItemInPacket(ConfigFiveElemParam.ConvertItemEnum, ConfigFiveElemParam.ConvertItemNum, true, _G.ItemSysOperType.FiveElem)
		self.setFill[LParam] = 1
		self.szFillParam = tostring(self.setFill.dwMetal * 10000 + self.setFill.dwWood * 1000 + self.setFill.dwWater * 100
		+ self.setFill.dwFire * 10 + self.setFill.dwEarth)
		self:ChangeAttr(LParam..'Value', ConfigFiveElemParam.ZhenqiLimit )
		objPlayer.CltElemMsg{Type = ConfigElemMsg.PushComplete,Param = t}
	end
end
--灌注真气
function CFiveElemSystem:ConvertElem(HParam,LParam)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local objItemSys = objPlayer:GetSystem('CItemSystem')
	if self[LParam..'Value'] < ConfigFiveElemParam.ZhenqiLimit then
	--	_info('No enough elem to convert')
		return
	end
	local dwItemEnum = ConfigFiveElemParam.tradeItem[LParam];
	if objItemSys:GetItem(HParam) then
		objItemSys:DelItemNumber(HParam, 1, _G.ItemSysOperType.FiveElem)
	else
		return
	end	
	self:ChangeAttr(LParam..'Value', -ConfigFiveElemParam.ZhenqiLimit )
	local setAddList = {};
	local tempTable1 = {
		dwItemEnum	= dwItemEnum;
		dwItemNumber= 1;
	};
	table.insert(setAddList, tempTable1);
	local tabItem = objItemSys:AddEnumItemListToPacket(setAddList, _G.ItemSysOperType.FiveElem);
	if tabItem[1] then
		objItemSys:SetItemDoodle(tabItem[1], string.format(SysStringConfigInfo[3000550008],objPlayer:GetInfo().szRoleName));
	end
	objPlayer.CltElemMsg{Type = ConfigElemMsg.ConvertComplete,Param = t}
end
--平衡真气
function CFiveElemSystem:BalanceElem(Info)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local objItemSys = objPlayer:GetSystem('CItemSystem')
	local bIsEnough, _ = objItemSys:CheckDelEnumItemInPacketCond(ConfigFiveElemParam.BalanceItemEnum, ConfigFiveElemParam.BalanceItemNum)
	if not bIsEnough then return end
	objItemSys:DelEnumItemInPacket(ConfigFiveElemParam.BalanceItemEnum, ConfigFiveElemParam.BalanceItemNum, true, _G.ItemSysOperType.FiveElem)
	self.dwTotalValue = self.dwMetalValue + 
						self.dwWoodValue +
						self.dwWaterValue +
						self.dwFireValue +
						self.dwEarthValue
	local dwOldTotalValue = Info[1] + Info[2] + Info[3] + Info[4] + Info[5]
	local dwPerValue = math.floor((self.dwTotalValue - dwOldTotalValue)/5)
	self.dwMetalValue = Info[1] + dwPerValue
	self.dwWoodValue = Info[2] + dwPerValue
	self.dwWaterValue = Info[3] + dwPerValue
	self.dwFireValue = Info[4] + dwPerValue
	self.dwEarthValue = Info[5] + dwPerValue
	self:UpdateInfoToClient(objPlayer,2,{'dwMetalValue',
											'dwWoodValue',
											'dwWaterValue',
											'dwFireValue',
											'dwEarthValue',})
	local t = {}
	objPlayer.CltElemMsg{Type = ConfigElemMsg.PalanceSuccess,Param = t}
end
--GM命令 增加真气到最大值
function CFiveElemSystem:GMFullElem()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local capacity = ERF_Count_tempOfWuxing(self.dwDantianLv);
	self:ChangeAttr( 'dwMetalValue', capacity )
	self:ChangeAttr( 'dwWoodValue', capacity )
	self:ChangeAttr( 'dwWaterValue', capacity )
	self:ChangeAttr( 'dwFireValue', capacity )
	self:ChangeAttr( 'dwEarthValue', capacity )
	self:UpdateInfoToClient(objPlayer,2)
	return true
end
--GM命令 增加五行到最大值
function CFiveElemSystem:GMFinishElem()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local playerLv = objPlayer:GetLevel()
	self.dwMetalLv = ERF_Limit_LvOfWuxing(playerLv,enumFiveElemType.Metal)
	self.dwWoodLv = ERF_Limit_LvOfWuxing(playerLv,enumFiveElemType.Wood)
	self.dwWaterLv = ERF_Limit_LvOfWuxing(playerLv,enumFiveElemType.Water)
	self.dwFireLv = ERF_Limit_LvOfWuxing(playerLv,enumFiveElemType.Fire)
	self.dwEarthLv = ERF_Limit_LvOfWuxing(playerLv,enumFiveElemType.Earth)
	self.dwDantianLv = ERF_Limit_LvOfWuxing(playerLv,enumFiveElemType.Dantian)
	self:AddAttribute()
	self:UpdateInfoToClient(objPlayer,2)
end
-- 任务需求:得到五行总等级
function CFiveElemSystem:ForTaskNeedGetLv()
	local typelist = 
	{
		'Metal',
		'Wood',
		'Water',
		'Fire',
		'Earth',
	}
	local num = 0
	for k,v in pairs (typelist) do
		num = num + self['dw'..v..'Lv']
	end
	return num
end
---2012-09-04 优化更新发送和数据库写入
function CFiveElemSystem:UpdateInfoToClient(objPlayer,nFlag,tabInfo)
	local sInfo = {};
	if not tabInfo then
		sInfo = self:GetAllInfoTab()
	else
		for k,v in ipairs (tabInfo) do
			sInfo[v] = self[v]
		end
	end
	objPlayer.CltInitFiveElemInfoMsg{ SInfo = sInfo ,Flag = nFlag }
	if self.objDBQuery then
		sInfo.AttributeList = nil
		self.objDBQuery:SaveInfo(sInfo)
	end
end
--私有 构造全数据结构
function CFiveElemSystem:GetAllInfoTab()
	local sInfo = {}
	-- sInfo.dwMetalLv = self.dwMetalLv;
	-- sInfo.dwWoodLv = self.dwWoodLv;
	-- sInfo.dwWaterLv = self.dwWaterLv;
	-- sInfo.dwFireLv = self.dwFireLv;
	-- sInfo.dwEarthLv = self.dwEarthLv;
	-- sInfo.dwDantianLv = self.dwDantianLv;
	sInfo.dwMetalValue = self.dwMetalValue;
	sInfo.dwWoodValue = self.dwWoodValue;
	sInfo.dwWaterValue = self.dwWaterValue;
	sInfo.dwFireValue = self.dwFireValue;
	sInfo.dwEarthValue = self.dwEarthValue;
	sInfo.dwCountTime = self.dwCountTime;
	sInfo.dwMetalTime = self.dwMetalTime;
	sInfo.dwWoodTime = self.dwWoodTime;
	sInfo.dwWaterTime = self.dwWaterTime;
	sInfo.dwFireTime = self.dwFireTime;
	sInfo.dwEarthTime = self.dwEarthTime;
	sInfo.szFillParam = self.szFillParam;
	-- sInfo.AttributeList = {};
	-- sInfo.AttributeList.dwAttack = self.AttributeList.dwAttack
	-- sInfo.AttributeList.dwDefense = self.AttributeList.dwDefense
	-- sInfo.AttributeList.dwFlee = self.AttributeList.dwFlee
	-- sInfo.AttributeList.dwCrit = self.AttributeList.dwCrit
	-- sInfo.AttributeList.dwHPMax = self.AttributeList.dwHPMax
	-- sInfo.AttributeList.dwMPMax = self.AttributeList.dwMPMax
	return sInfo
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------
--=========================五行调和系统（新）
-----------------------------------------

--五行调和打开请求
function CFiveElemSystem:OpenFiveElementConsonanceSystem()
	self:GetPlayer().OnDataMsg{tInfo = {
								dwResult = 0,
								dwMetalValue = self.dwMetalValue,
								dwWoodValue = self.dwWoodValue,
								dwWaterValue = self.dwWaterValue,
								dwFireValue = self.dwFireValue,
								dwEarthValue = self.dwEarthValue},
	}
end
--五行调和请求
function CFiveElemSystem:DoAdjust(Param)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local tempData = {}
	local objPlace = ConfigFiveElemParam.PlaceConfig[Param.nType];
	if not objPlace then return end
	local objItemSys = objPlayer:GetSystem("CItemSystem");
	local objMallSystem = objPlayer:GetSystem("CMallSystem");
	local dwResult = 0
	if objPlace.FunJudge(objItemSys,objMallSystem) then
		local capacity = ERF_Count_tempOfWuxing(self.dwDantianLv);
		local allNumB = 0
		local allNumA = 0
		for k,v in pairs(Param.tData) do
			if v < 0 then
				v = 0;
			end;
			allNumB = allNumB + v
			allNumA = allNumA + self[k]	
		end
		if allNumB > allNumA then
			objPlayer.CltElemMsg{Type = ConfigElemMsg.NotMate,Param = {}}
			return
		end
		local uItemGold, uItemWood, uItemWater, uItemFire, uItemEarth  = self:GetElemValue()
		for k,v in pairs(Param.tData) do
			if v > 0 then
				tempData[k] = math.floor(v*objPlace.dwPercent);
			else
				tempData[k] = 0;
			end
			if tempData[k] > capacity then 
				tempData[k] = capacity 
			end
			self[k] = 0;
		end

		self:ChangeAttr( 'dwMetalValue', tempData.dwMetalValue ,2);
		self:ChangeAttr( 'dwWoodValue', tempData.dwWoodValue ,2);
		self:ChangeAttr( 'dwWaterValue', tempData.dwWaterValue ,2);
		self:ChangeAttr( 'dwFireValue', tempData.dwFireValue,2 );
		self:ChangeAttr( 'dwEarthValue', tempData.dwEarthValue,2 );	
		
		local setData = {
			[1] = {dwCurrent = uItemGold, dwChange = tempData.dwMetalValue - uItemGold};
			[2] = {dwCurrent = uItemWood, dwChange = tempData.dwWoodValue - uItemWood};
			[3] = {dwCurrent = uItemWater, dwChange = tempData.dwWaterValue - uItemWater};
			[4] = {dwCurrent = uItemFire, dwChange = tempData.dwFireValue - uItemFire};
			[5] = {dwCurrent = uItemEarth, dwChange = tempData.dwEarthValue - uItemEarth};
		}

		CLogSystemManager:zhenqi(objPlayer, setData, _G.FiveElemSysOperType.FiveElement)	
		
		objPlayer:GetSystem('CPlayerEventCenterSystem'):DoEvent(enumPlayerEventType.EventElemBalance)

	else
		dwResult = 2;
	end
	if dwResult == 0 then
		objPlace.FunDo(objItemSys);
		self:GetPlayer().OnDataMsg{tInfo = {
							bIsOperate = true,
							dwResult = dwResult,
							dwMetalValue = self.dwMetalValue,
							dwWoodValue = self.dwWoodValue,
							dwWaterValue = self.dwWaterValue,
							dwFireValue = self.dwFireValue,
							dwEarthValue = self.dwEarthValue},
	}
	self:UpdateInfoToClient(objPlayer,2)
	end
end
--=========================
--五行数据库类
_G.CFiveElemDBOper = {};
function CFiveElemDBOper:new(objDB,objUser)
    local obj = {};
	obj.objDBQuery = objDB;
	obj.objUser = objUser;   --对应的玩家
	for i, v in pairs(CFiveElemDBOper) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;
function CFiveElemDBOper:SaveInfo(tabInfo)
	local sInfo = {}
	if not tabInfo then
		sInfo = self.objUser:GetAllInfoTab()
	else
		sInfo = tabInfo
	end
	sInfo.AttributeList = nil
	local status,dwRoleID = self:CheckDBAlive()
	if status == false then
		_info("T_Role_FiveElem Not Alive by CFiveElemDBOper:SaveInfo");
	end
	
	local SqlCmd = self.objDBQuery:CreateUpdateCmd('T_Role_FiveElem');
	for k,v in pairs (sInfo) do
		if type(self.objUser[k]) == 'number' then
			SqlCmd.Fields[k] = math.floor(self.objUser[k])
		else
			SqlCmd.Fields[k] = self.objUser[k];
		end
	end
	SqlCmd.Wheres.dwRoleID = dwRoleID;
	SqlCmd:execute();
	return true;
end
function CFiveElemDBOper:AddInfo(dwRoleID)

	local SqlCmd = self.objDBQuery:CreateInsertCmd('T_Role_FiveElem');
	SqlCmd.Fields.dwRoleID					= dwRoleID;	
	SqlCmd.Fields.dwMetalLv					= 0;		
	SqlCmd.Fields.dwWoodLv					= 0;		
	SqlCmd.Fields.dwWaterLv					= 0;		
	SqlCmd.Fields.dwFireLv					= 0;		
	SqlCmd.Fields.dwEarthLv					= 0;		
	SqlCmd.Fields.dwDantianLv				= 0;
	SqlCmd.Fields.dwMetalValue				= 0;		
	SqlCmd.Fields.dwWoodValue				= 0;		
	SqlCmd.Fields.dwWaterValue				= 0;		
	SqlCmd.Fields.dwFireValue				= 0;		
	SqlCmd.Fields.dwEarthValue				= 0;		
	SqlCmd.Fields.dwCountTime				= GetCurTime();		
	SqlCmd.Fields.dwMetalTime				= 0;
	SqlCmd.Fields.dwWoodTime 				= 0;
	SqlCmd.Fields.dwWaterTime 				= 0;
	SqlCmd.Fields.dwFireTime 				= 0;
	SqlCmd.Fields.dwEarthTime				= 0;
	SqlCmd.Fields.szFillParam				= '00000';
	SqlCmd:execute()
	return true;
end
function CFiveElemDBOper:CheckDBAlive()
	if not self.objDBQuery then
		_info("self.objDBQuery is null by CFiveElemDBQuery");
		return false;
	end;
	if not self.objUser then
		_info("self.objUser is null by CFiveElemDBQuery");
		return false;
	end;
	local objPlayer = self.objUser:GetPlayer();
	if not objPlayer then
		_info("objPlayer is null by CFiveElemDBQuery");
		return false;
	end;
    local dwRoleID = objPlayer:GetRoleID();
	if dwRoleID == 0 then
		_info("dwRoleID == 0 by CFiveElemDBQuery");
		return false;
	end;
	return true , dwRoleID
end