function CPulseSystem:Create(bIsChangeLine)
    -- 创建数据库对象
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local objDB = objPlayer:GetDBQuery();
	self.objDBQuery = CPulseSystemDBOper:new(objDB,self);
	if not self.objDBQuery then
		return false;
	end;

	local tabDataList = objPlayer:GetLineData("CPulseSystem")
	if tabDataList and tabDataList[1][1] then
		self.dwPulse1 = tabDataList[1][1]
		self.dwPulse2 = tabDataList[1][2]
		self.dwPulse3 = tabDataList[1][3]
		self.dwPulse4 = tabDataList[1][4]
		self.dwPulse5 = tabDataList[1][5]
		self.dwPulse6 = tabDataList[1][6]
		self.dwPulse7 = tabDataList[1][7]
		self.dwPulse8 = tabDataList[1][8]
		self.dwTotalExp = tabDataList[1][9]
		self.dwCountTime = tabDataList[1][10]
		self.dwLastTimes = tabDataList[1][11]
		self.dwWuValue = tabDataList[1][12]
		self.dwWuType = tabDataList[1][13]
		if tabDataList[1][14] then
			self.dwCurPulse = tabDataList[1][14]
			self.PulseWaitList = tabDataList[1][15]
		end
		self.dwPulseDragon = tabDataList[1][16] or 0;
	end
	local index = self.dwWuType
	if PulseActionConfig[index] then
		PulseActionConfig[index](self)	
	end
	self.dwLastTimes = self:GetShareNum(bIsChangeLine)
	local vipSys = objPlayer:GetSystem('CVipSystem');
	vipSys:AddSys(self)
	-- 计算经脉附加的属性
	self:CountAttribute()
	
	local eventSys = objPlayer:GetSystem('CPlayerEventCenterSystem')
	eventSys:DoEvent(enumPlayerEventType.EventPulseUp,1,self:GetPulseTotalNum());
	for dwType = 1,8 do
		local curPulse = self['dwPulse'..dwType];
		eventSys:DoEvent(enumPlayerEventType['EventPulseUp'..dwType],1,curPulse);
	end
	return true;
end
function CPulseSystem:ResetInfo()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local value = 0
	local vipSys = objPlayer:GetSystem('CVipSystem');
	if vipSys:IsVip() then
		value  = PulseShareTimesEx;
	else
		value  = PulseShareTimes;
	end
	self.dwLastTimes = value
	self:UpdateInfoToClient(enumPulseFeedBack.Exp,objPlayer,{'dwLastTimes'})
end
function CPulseSystem:GetFightValue()
	local value = 0
	local fightInfo = SSingleAttrChange:new()
	for k,v in pairs (self.AttributeList) do
		fightInfo[k] = self.AttributeList[k]
	end
	local draPulAttr = self:GetDraPulAttri(self.dwPulseDragon);
	fightInfo:AddValue(draPulAttr)
	for k,v in pairs (fightInfo) do
		if EquipGradeConfig[k] then
			value = value + EquipGradeConfig[k]*v
		end
	end
	
	return value
end
function CPulseSystem:OnChangeLineBegin(dwNewLineID)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local t = {}
	t[1] = self.dwPulse1;
	t[2] = self.dwPulse2;
	t[3] = self.dwPulse3;
	t[4] = self.dwPulse4;
	t[5] = self.dwPulse5;
	t[6] = self.dwPulse6;
	t[7] = self.dwPulse7;
	t[8] = self.dwPulse8;
	t[9] = self.dwTotalExp;
	t[10] = self.dwCountTime;
	t[11] = self.dwLastTimes;
	t[12] = self.dwWuValue;
	t[13] = self.dwWuType;
	t[14] = self.dwCurPulse;
	t[15] = self.PulseWaitList;
	t[16] = self.dwPulseDragon;
	objPlayer:SetLineData("CPulseSystem",t);
end

function CPulseSystem:GetPlayerViewMsg()
	local t = {};
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	t.dwPulse1 = self.dwPulse1;	--八条经脉进度
	t.dwPulse2 = self.dwPulse2;
	t.dwPulse3 = self.dwPulse3;
	t.dwPulse4 = self.dwPulse4;
	t.dwPulse5 = self.dwPulse5;
	t.dwPulse6 = self.dwPulse6;
	t.dwPulse7 = self.dwPulse7;
	t.dwPulse8 = self.dwPulse8;
	t.dwPulseFullNum = self.dwPulseFullNum; --冲通的经脉条数	
	t.dwPulseFullNumOld = self.dwPulseFullNumOld; --冲通的经脉条数
	t.dwTotalExp = self.dwTotalExp 		--当前通过他人冲脉获得的经验
	t.dwLastTimes = self.dwLastTimes 
	t.dwWuValue = self.dwWuValue 	--悟值
	t.dwWuType = self.dwWuType  		--悟类型
	t.dwPulseDragon = self.dwPulseDragon;---龙脉
	local AttributeList = {};
	AttributeList.dwAttack = self.AttributeList.dwAttack 
	AttributeList.dwDefense = self.AttributeList.dwDefense 
	AttributeList.dwCrit = self.AttributeList.dwCrit
	AttributeList.dwFlee = self.AttributeList.dwFlee
	AttributeList.dwHPMax = self.AttributeList.dwHPMax
	AttributeList.dwMPMax = self.AttributeList.dwMPMax
	AttributeList.dwDuck = self.AttributeList.dwDuck
	
	local tbSend = {};
	for key,value in pairs(AttributeList)do
		local dwIndex = GetAttrNameToIndex(key);
		if dwIndex then
			tbSend[dwIndex] = value;
		end
	end
	t.AttributeList = tbSend;

	t.dwPulseEx1 = self.dwPulseEx1;
	t.dwPulseEx2 = self.dwPulseEx2;
	t.dwPulseEx3 = self.dwPulseEx3;
	t.dwPulseEx4 = self.dwPulseEx4;
	local sklSys = objPlayer:GetSystem('CSkillSystem')
	t.dwFightPoint = sklSys:CountBattleScoreInfo().dwPulseScore
	
	local tbPulseSend = {};
	for k,v in pairs(t)do
		local id = PulseProName2Index[k]
		if id then
			tbPulseSend[id] = v;
		end
	end
	
	return tbPulseSend;
end

function CPulseSystem:Destroy()
	-- if self.objDBQuery then
		-- local tabInfo = self:GetAllInfoTab()
		-- self.objDBQuery:SaveInfo(tabInfo)
	-- end;
end;
function CPulseSystem:OnVipChange(bState)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	if bState == true then
		local vipSystem = objPlayer:GetSystem('CVipSystem')
		self.dwLastTimes = self.dwLastTimes +(PulseShareTimesEx - PulseShareTimes)
		if self.dwLastTimes > PulseShareTimesEx then  self.dwLastTimes = PulseShareTimesEx end
		local times = self.dwLastTimes
		objPlayer.CltFlushPulseInfoMsg{Type = enumPulseFeedBack.VipChange ,RoleID = times,Opt = 1}
		self.objDBQuery:SaveInfo({'dwLastTimes'});
	else
		objPlayer.CltFlushPulseInfoMsg{Type = enumPulseFeedBack.VipChange ,RoleID = 0,Opt = 2}
	end
end
function CPulseSystem:OnEnterScene()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	-- 发送到客户端
	self:UpdateInfoToClient(enumPulseFeedBack.All,objPlayer)
end;

function CPulseSystem:ChangeScene()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local roleID = objPlayer:GetRoleID()
	local num = self.dwPulseFullNum
	objPlayer.CltFlushPulseInfoMsg{Type = enumPulseFeedBack.PlayPfxForever,RoleID = roleID,Opt = num};
end

--得到附加战斗属性
function CPulseSystem:GetSkillValue()
	return self.AttributeList
end

--得到分享經驗次數
function CPulseSystem:GetShareNum(bIsChangeLine)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	--如果上次下线的时间不是今天那么将数据重置
	if bIsChangeLine == 0 then
	--if not bIsChangeLine  then
		for k,v in ipairs (PulseConfig) do
			if self['dwPulse'..k] == PulseConfig[k].number then
				self.dwPulseFullNum = self.dwPulseFullNum + 1 
			end
			if self['dwPulse'..k] >= 24 then
				self.dwPulseFullNumOld = self.dwPulseFullNumOld + 1 
			end
		end
		local vipSys = objPlayer:GetSystem('CVipSystem')
		if not CTimeFormat:isTodayEx(objPlayer:GetInfo().tmDownlineTime/1000) then
			if vipSys:IsVip() then
				return PulseShareTimesEx;
			else
				return PulseShareTimes;
			end
		end
	end
	return self.dwLastTimes
end
function CPulseSystem:GetPulseInfo()
	return 
end
function CPulseSystem:CountAttribute()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	self.AttributeList = 
	{
		dwAttack = 0,
		dwDefense = 0,
		dwCrit = 0,
		dwFlee = 0,
		dwHPMax	= 0;--生命max
		dwMPMax	= 0;--内力max
		dwDuck	= 0;--闪避率
	};
	local sklSystem = objPlayer:GetSystem("CSkillSystem")
	for k,v in ipairs (PulseConfig) do
		for i = 1,self['dwPulse'..k] do
			for k1,v1 in pairs (self.AttributeList) do
				if PulseConfig[k].Pulse[i][k1] then
					self.AttributeList[k1] = self.AttributeList[k1] + PulseConfig[k].Pulse[i][k1]
				end
			end
		end
	end
	-------------------------------------------------
	for k,v in pairs (PulseExConfig.PulseEx) do
		--每种EX的等级
		local state = 1
		for k1,v1 in ipairs (v.PulseLimit) do
			if k1 > self['dwPulseEx'..k] then
				if state == 2 then break end
				for i = 1,8 do
					if v1['dwPulse'..i] then
						if self['dwPulse'..i] >= v1['dwPulse'..i] then
							
						else
							state = 2
							break
						end
					end	
				end	
				if state == 1 then
					if k1 > self['dwPulseEx'..k] then
						self['dwPulseEx'..k] = k1
					end
				end
			end
		end
	end
	for i = 1,4 do
		local num = self['dwPulseEx'..i]
		for k = 1,num do
			for k1,v1 in pairs (self.AttributeList) do
				self.AttributeList[k1] = self.AttributeList[k1] + PulseExConfig.PulseEx[i].Attri[k][k1]	or 0	
			end
		end
	end
	----------------------------------------------
	local fightInfo = SSingleAttrChange:new()
	for k,v in pairs (self.AttributeList) do
		fightInfo[k] = self.AttributeList[k]
	end
	local draPulAttr = self:GetDraPulAttri(self.dwPulseDragon);
	fightInfo:AddValue(draPulAttr)
	sklSystem:NotifyPulseUpdate(fightInfo,false)
end
--冲脉前处理
function CPulseSystem:BumpPulseBefore(dwType,dwDrugNum)
	self:BumpPulse(dwType,dwDrugNum)
end
function CPulseSystem:CleanWuEffect()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	self.dwWuValue = 0
	self.dwWuType = 0
	self:UpdateInfoToClient(enumPulseFeedBack.WuValue,objPlayer,{'dwWuValue','dwWuType'})
end
function CPulseSystem:BumpPulse(dwType,dwDrugNum)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	if dwDrugNum < 0 or dwDrugNum > 9 then return end;
	
	local objElemSystem = objPlayer:GetSystem("CFiveElemSystem")
	local mapSystem = objPlayer:GetSystem("CMapSystem")
	local objItemSystem = objPlayer:GetSystem("CItemSystem")

	local dwTotaLNum, _, _= objItemSystem:GetEnumItemNumInPacket(PulseItem.nItemID);
	if dwDrugNum > dwTotaLNum then
	--	_info('pulse no drug')
		return
	end
	--冲脉处理
	local pulseNum = PulseConfig[dwType].number;							--单一经脉穴位数量
	local metal,wood,water,fire,earth = objElemSystem:GetElemValue();		--玩家五行真气数据
	local curPulse = self['dwPulse'..dwType] + 1;							--要冲的穴位编号
	if curPulse > pulseNum then
	--	_info('pulse full!');
		objPlayer.CltFlushPulseInfoMsg{Type = enumPulseFeedBack.Full,RoleID = dwRoleID,Opt = dwType};
		return false;
	end
	local multiple = 1 
	if  self.dwZhenqiReturn then multiple = self.dwZhenqiReturn end
	local metalCost = PulseConfig[dwType].Pulse[curPulse].zhenqi_metal * multiple;--冲穴基础消耗
	local woodCost = PulseConfig[dwType].Pulse[curPulse].zhenqi_wood * multiple;
	local waterCost = PulseConfig[dwType].Pulse[curPulse].zhenqi_water * multiple;
	local fireCost = PulseConfig[dwType].Pulse[curPulse].zhenqi_fire * multiple;
	local earthCost = PulseConfig[dwType].Pulse[curPulse].zhenqi_earth * multiple;
	if self.dwZhenqiReturn then self.dwZhenqiReturn = nil self:CleanWuEffect() end
	
	if  metal >= metalCost and
		wood >= woodCost and
		water >= waterCost and
		fire  >= fireCost and
		earth >= earthCost then
		
		objElemSystem:ChangeAttr('dwMetalValue',-metalCost)
		objElemSystem:ChangeAttr('dwWoodValue',-woodCost)
		objElemSystem:ChangeAttr('dwWaterValue',-waterCost)
		objElemSystem:ChangeAttr('dwFireValue',-fireCost)
		objElemSystem:ChangeAttr('dwEarthValue',-earthCost)
		
		local dwRoleID = objPlayer:GetRoleID()
		-- 删除药品
		if dwDrugNum > 0 then
			objItemSystem:DelEnumItemInPacket(PulseItem.nItemID, dwDrugNum, false, _G.ItemSysOperType.Pulse)
		end
		local memberAddRate = 0
		local vipSystem = objPlayer:GetSystem('CVipSystem')
		if vipSystem:IsVip() then
			memberAddRate = PulseMemberAddRate
		end
		local tempRate = (PulseConfig[dwType].Pulse[curPulse].rate + dwDrugNum*PulseItem.dwPercent + memberAddRate)
		if self.dwRate then tempRate = 10000 end
		if tempRate >= (math.random(1,10000)) then
			if self.dwRate then self.dwRate = nil self:CleanWuEffect() end
		--	_info('BumpPulse Success!')
			self.dwCurPulse = dwType
			-- 通知所有玩家该玩家开始倒数
			local playerList = mapSystem:GetPlayerByRange(100);
			if type(playerList) == 'table' then
				for k,v in pairs (playerList) do
					v.CltFlushPulseInfoMsg{Type = enumPulseFeedBack.ConverseCount,RoleID = dwRoleID,Opt = dwType};
				end	
			end
			--通知自己
			self.PulseWaitList[dwType] = 1;
			-------------------------------------2013-4-9冲脉升级操作放从倒计时后放到倒计时前
			if self.PulseWaitList[dwType] ~= 1 then
				_info('You Can`t Improve this Pulse')
				return false
			end
			local pulseNum = PulseConfig[dwType].number;	
			local curPulse = self['dwPulse'..dwType] + 1;	 --要冲的穴位编号
			
			if curPulse >= pulseNum then
				_info('this pulse is full!');
			end
			--成功
			self['dwPulse'..dwType] = curPulse
			self.objDBQuery:SaveInfo({'dwPulse'..dwType});
			--------------------------------------
			objPlayer.CltFlushPulseInfoMsg{Type=enumPulseFeedBack.Success,RoleID=dwRoleID,Opt=dwType};
		else
			self.dwWuValue = self.dwWuValue + FormulaPulseWuValue(self.dwPulseFullNum ,self['dwPulse'..dwType])
			if self.dwWuValue >= PulseExConfig.dwWuValueTop then self.dwWuValue = PulseExConfig.dwWuValueTop end
			local tempWuValue = self.dwWuValue
			if tempWuValue == PulseExConfig.dwWuValueTop then
				if self.dwWuType == 0 then
					self.dwWuType = math.random(1,5)
					local index = self.dwWuType
					PulseActionConfig[index](self)	
				end
			end
			self:UpdateInfoToClient(enumPulseFeedBack.WuValue,objPlayer,{'dwWuValue','dwWuType'})
			objPlayer.CltFlushPulseInfoMsg{Type = enumPulseFeedBack.Faild,RoleID = tempWuValue,Opt = dwType};
		end
		return true
	else
		_info('not enough elemValue');
		return false;
	end
end

function CPulseSystem:ImprovePulse()
	local dwType = self.dwCurPulse
	local isFull = 0
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local dwRoleID = objPlayer:GetRoleID()
	local mapSystem = objPlayer:GetSystem("CMapSystem")
	local szRoleName = mapSystem:GetRoleByID(dwRoleID):GetInfo().szRoleName
	local sklSystem = objPlayer:GetSystem("CSkillSystem")
	local eventSys = objPlayer:GetSystem('CPlayerEventCenterSystem')
	if not self.PulseWaitList[dwType] then
		_info('Error Pulse')
		return false
	end
	--------------------------------------------------------------------------------------2013-4-9冲脉升级操作放从倒计时后放到倒计时前
	-- if self.PulseWaitList[dwType] ~= 1 then
		-- _info('You Can`t Improve this Pulse')
		-- return false
	-- end
	local pulseNum = PulseConfig[dwType].number;	
	local curPulse = self['dwPulse'..dwType];	 --要冲的穴位编号
	
	if curPulse >= pulseNum then
		isFull = 1
		_info('this pulse is full!');
	end
	-- --成功
	-- self['dwPulse'..dwType] = curPulse
	
	local curPulse = self['dwPulse'..dwType]
	-----------------------------------------------------------------------------------------
	self.PulseWaitList[dwType]  = nil;
	eventSys:DoEvent(enumPlayerEventType.EventPulseUp,1,self:GetPulseTotalNum());
	eventSys:DoEvent(enumPlayerEventType['EventPulseUp'..dwType],1,curPulse);
	--为该玩家增加冲穴奖励经验
	local tempExp = math.floor(FormulaPulseExp(objPlayer:GetLevel())*objPlayer:GetAddicted(),1)
	if self.dwExpTimes then tempExp = tempExp * self.dwExpTimes end
	objPlayer:AddExp(tempExp,nil,false);
	if self.dwExpTimes then self.dwExpTimes = nil self:CleanWuEffect() end
	objPlayer.CltFlushPulseInfoMsg{Type = enumPulseFeedBack.AddExp,RoleID = dwRoleID,Opt = tempExp};
	--当前穴位增加属性
	local fightInfo = SSingleAttrChange:new()
	for k,v in pairs (self.AttributeList) do
		if PulseConfig[dwType].Pulse[curPulse][k] and PulseConfig[dwType].Pulse[curPulse][k] ~= 0 then
			self.AttributeList[k] = self.AttributeList[k] + PulseConfig[dwType].Pulse[curPulse][k]		
		end	
	end
	--EX穴位套装增加属性
	for k,v in pairs (PulseExConfig.PulseEx) do
		--每种EX的等级
		local state = 1
		for k1,v1 in ipairs (v.PulseLimit) do	
			if k1 > self['dwPulseEx'..k] then
				if state == 2 then break end
				for i = 1,8 do
					if v1['dwPulse'..i] then
						if self['dwPulse'..i] >= v1['dwPulse'..i] then
							
						else
							state = 2
							break
						end
					end	
				end	
				if state == 1 then
					if k1 > self['dwPulseEx'..k] then
						self['dwPulseEx'..k] = k1
						for k2,v2 in pairs (self.AttributeList) do
							self.AttributeList[k2] = self.AttributeList[k2] + PulseExConfig.PulseEx[k].Attri[k1][k2] or 0
						end
					end
				end
			end
		end
	end
	for k,v in pairs (self.AttributeList) do
		fightInfo[k] = self.AttributeList[k]
	end
	local draPulAttr = self:GetDraPulAttri(self.dwPulseDragon);
	fightInfo:AddValue(draPulAttr)
	sklSystem:NotifyPulseUpdate(fightInfo,false)
	--周围玩家加经验
	local playerList = mapSystem:GetPlayerByRange(PulseShareDistance);
	if type(playerList) == 'table' then
		for k,v in pairs (playerList) do
			if dwRoleID ~= k then
				local pulseSystem = v:GetSystem("CPulseSystem");
				if pulseSystem.dwLastTimes ~= 0 then
					local tempExp = math.floor(FormulaPulseExp(v:GetLevel())*objPlayer:GetAddicted(),2);
					pulseSystem.dwLastTimes = pulseSystem.dwLastTimes - 1;
					pulseSystem.dwTotalExp = pulseSystem.dwTotalExp + tempExp;
					v.CltFlushPulseInfoMsg{Type = enumPulseFeedBack.ShareExp,RoleID = dwRoleID,Opt = tempExp};
					pulseSystem:UpdateInfoToClient(enumPulseFeedBack.Exp,v,{'dwTotalExp','dwLastTimes'})
					v:AddExp(tempExp,nil,false)
				end
			end
		end
	end
	--周围怪物全死 
	local monsterList = mapSystem:GetMonsterByRange(PulseShareDistance);
	if type(monsterList) == 'table' then
		--lw：冲脉的伤害改为根据攻击力计算
		local tbInfo = objPlayer:GetSystem("CSkillSystem"):GetInfo();
		local dwNum = 0;
		for k,v in pairs (monsterList) do
			if v:IsBoss() == false and v:IsDead() == false then
				local dwSelfGuildID = 0;
				local objGuildSys = objPlayer:GetSystem("CGuildSystem");
				if objGuildSys then
					dwSelfGuildID = objGuildSys:GetGuildID();
				end
				if v:GetGuildID() ~= dwSelfGuildID then
					dwNum = dwNum + 1;
					local fPer = CountPulseHurtValue(objPlayer,v);
					v:Hurt(tbInfo.dwAttack*fPer,false,objPlayer)
					
					if dwNum >= PulseKillMonsterMax then
						break;
					end
				end
			end
		end
	end
	objPlayer.CltFlushPulseInfoMsg{Type = enumPulseFeedBack.Begin,RoleID = isFull,Opt = dwType};
	--向其他玩家发送该玩家播放冲穴光效
	playerList = mapSystem:GetPlayerByRange(100);
	if type(playerList) == 'table' then
		for k,v in pairs (playerList) do
			v.CltFlushPulseInfoMsg{Type = enumPulseFeedBack.PlayPfx,RoleID = dwRoleID,Opt = isFull};
		end
	end
	-------------------------------------------------------------------------------------------------------------------------------
	if self['dwPulse'..dwType] == pulseNum then
		self.dwPulseFullNum = self.dwPulseFullNum + 1;
		if self['dwPulse'..dwType] >= 24 then
			self.dwPulseFullNumOld = self.dwPulseFullNumOld + 1 
		end
		objPlayer.CltFlushPulseInfoMsg{Type = enumPulseFeedBack.PlayPfxForever,RoleID = dwRoleID,Opt = self.dwPulseFullNum};
		if type(playerList) == 'table' then
			for k,v in pairs (playerList) do
				v.CltFlushPulseInfoMsg{Type = enumPulseFeedBack.PlayPfxForever,RoleID = dwRoleID,Opt = self.dwPulseFullNum};
			end
		end
		CGameApp.ServPulseUniCastMsg{RoleID = dwRoleID,Type = dwType,RoleName = szRoleName,PulseFullNum = self.dwPulseFullNum};
		eventSys:DoEvent(enumPlayerEventType.EventBumpPulse,1);
	end
	self:UpdateInfoToClient(enumPulseFeedBack.Pulse,objPlayer,{'dwPulse'..dwType,'dwPulseFullNum'})
	
	CLogSystemManager:pulse(objPlayer, dwType, curPulse)
end
function CPulseSystem:UniCast(dwRoleID,dwType,szRoleName,dwPulseFullNum)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	if not self:HasAuthority( 'Pulse',false ) then return end
	objPlayer.CltFlushPulseInfoMsg{Type = enumPulseFeedBack.FinishOnePulse,RoleID = dwRoleID,Opt = dwType,RoleName = szRoleName};
	if dwPulseFullNum == #PulseConfig then
		objPlayer.CltFlushPulseInfoMsg{Type = enumPulseFeedBack.FinishAllPulse,RoleID = dwRoleID,Opt = dwType,RoleName = szRoleName};
	end
end
function CPulseSystem:ImprovePulseEx(dwType)
	local isFull = 0
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local dwRoleID = objPlayer:GetRoleID()
	local mapSystem = objPlayer:GetSystem("CMapSystem")
	local szRoleName = mapSystem:GetRoleByID(dwRoleID):GetInfo().szRoleName
	local sklSystem = objPlayer:GetSystem("CSkillSystem")
	local eventSys = objPlayer:GetSystem('CPlayerEventCenterSystem')
	if not self.PulseWaitList[dwType] then
		return false
	end
	if self.PulseWaitList[dwType] ~= 1 then
		_info('You Can`t Improve this Pulse')
		return false
	end
	local pulseNum = PulseConfig[dwType].number;	
	local curPulse = self['dwPulse'..dwType] + 1;	 --要冲的穴位编号
	
	if curPulse >= pulseNum then
		isFull = 1
		_info('this pulse is full!');
	end
	--成功
	self['dwPulse'..dwType] = curPulse
	self.PulseWaitList[dwType]  = nil;
	eventSys:DoEvent(enumPlayerEventType.EventPulseUp,1,self:GetPulseTotalNum());
	eventSys:DoEvent(enumPlayerEventType['EventPulseUp'..dwType],1,curPulse);
	for k,v in pairs (self.AttributeList) do
		if PulseConfig[dwType].Pulse[curPulse][k] and PulseConfig[dwType].Pulse[curPulse][k] ~= 0 then
			self.AttributeList[k] = self.AttributeList[k] + PulseConfig[dwType].Pulse[curPulse][k]		
		end	
	end
	----------------------
	--EX穴位套装增加属性
	for k,v in pairs (PulseExConfig.PulseEx) do
		--每种EX的等级
		local state = 1
		for k1,v1 in ipairs (v.PulseLimit) do	
			if k1 > self['dwPulseEx'..k] then
				if state == 2 then break end
				for i = 1,8 do
					if v1['dwPulse'..i] then
						if self['dwPulse'..i] >= v1['dwPulse'..i] then
							
						else
							state = 2
							break
						end
					end	
				end	
				if state == 1 then
					if k1 > self['dwPulseEx'..k] then
						self['dwPulseEx'..k] = k1
						for k2,v2 in pairs (self.AttributeList) do
							self.AttributeList[k2] = self.AttributeList[k2] + PulseExConfig.PulseEx[k].Attri[k1][k2] or 0
						end
					end
				end
			end
		end
	end
	-------------------
	local fightInfo = SSingleAttrChange:new()
	for k,v in pairs (self.AttributeList) do
		fightInfo[k] = self.AttributeList[k]
	end
	local draPulAttr = self:GetDraPulAttri(self.dwPulseDragon);
	fightInfo:AddValue(draPulAttr)
	sklSystem:NotifyPulseUpdate(fightInfo,false)
	
	if self['dwPulse'..dwType] == pulseNum then
		self.dwPulseFullNum = self.dwPulseFullNum + 1;
		if self['dwPulse'..dwType] >= 24 then
			self.dwPulseFullNumOld = self.dwPulseFullNumOld + 1 
		end
		objPlayer.CltFlushPulseInfoMsg{Type = enumPulseFeedBack.PlayPfxForever,RoleID = dwRoleID,Opt = self.dwPulseFullNum};
		if type(playerList) == 'table' then
			for k,v in pairs (playerList) do
				v.CltFlushPulseInfoMsg{Type = enumPulseFeedBack.PlayPfxForever,RoleID = dwRoleID,Opt = self.dwPulseFullNum};
			end
		end
		CGameApp.ServPulseUniCastMsg{RoleID = dwRoleID,Type = dwType,RoleName = szRoleName,PulseFullNum = self.dwPulseFullNum};
		eventSys:DoEvent(enumPlayerEventType.EventBumpPulse,1);
	end
	self:UpdateInfoToClient(enumPulseFeedBack.All,objPlayer)
end
function CPulseSystem:GetPulseNum()
	return self.dwPulseFullNum
end
function CPulseSystem:GetPulseTotalNum()
	local num = 0
	for i = 1,8 do
		num = self['dwPulse'..i] + num
	end
	return num
end
function CPulseSystem:GMFinishPulse()	
	local n = 0
	
	for k,v in pairs (PulseConfig) do
		for i = 1,PulseConfig[k].number - self['dwPulse'..k] do
			self.PulseWaitList[k] = 1
			self:ImprovePulseEx(k)
			n = n + 1
		end
	end
end
function CPulseSystem:GetAllInfoTab()
	local sInfo = {}
	sInfo[1] = 'dwPulse1'
	sInfo[2] = 'dwPulse2'
	sInfo[3] = 'dwPulse3'
	sInfo[4] = 'dwPulse4'
	sInfo[5] = 'dwPulse5' 
	sInfo[6] = 'dwPulse6'
	sInfo[7] = 'dwPulse7' 
	sInfo[8] = 'dwPulse8' 
	sInfo[9] = 'dwPulseFullNum' 
	
	sInfo[10] = 'dwTotalExp'
	sInfo[11] = 'dwLastTimes'
	sInfo[12] = 'dwWuValue'
	sInfo[13] = 'dwWuType'
	sInfo[21] = 'dwPulseFullNumOld'
	
	return sInfo
end
function CPulseSystem:UpdateInfoToClient(typ,objPlayer,tabInfo)
	local sInfo = {};
	if not tabInfo then
		tabInfo = self:GetAllInfoTab()
	end
	for k,v in pairs (tabInfo) do
		sInfo[v] = self[v]
		if v == 'dwPulseFullNum' then
			sInfo.AttributeList = {};
			sInfo.AttributeList[1] = self.AttributeList.dwAttack;
			sInfo.AttributeList[2] = self.AttributeList.dwDefense;
			sInfo.AttributeList[3] = self.AttributeList.dwCrit;
			sInfo.AttributeList[4] = self.AttributeList.dwFlee;
			sInfo.AttributeList[5] = self.AttributeList.dwHPMax;
			sInfo.AttributeList[6] = self.AttributeList.dwMPMax;
			sInfo.AttributeList[7] = self.AttributeList.dwDuck;
		end
	end
		
	objPlayer.CltInitPulseInfoMsg{ Type = typ,SInfo = sInfo,DraPul = self.dwPulseDragon }
	self.objDBQuery:SaveInfo(tabInfo)
end;

----获取龙脉属性
function CPulseSystem:GetDraPulAttri(draIndex)
	local objAdv = SSingleAttrChange:new();
	for k,v in pairs(_G.PulseDragonConfig) do
		if(k == draIndex) then
			objAdv = v.FunProperty();
			break;
		end
	end
	return objAdv;
end

function CPulseSystem:UseItemOpenDraPul(dwDraIndex)
	local objPlayer = self:GetPlayer()
	if(not objPlayer) then
		return;
	end
	local objItemSystem = objPlayer:GetSystem("CItemSystem");
	if( not objItemSystem ) then
		return;
	end
	
	local cfg = PulseDragonConfig[dwDraIndex];
	if not cfg then
		objPlayer.OnOpenDragonResultMsg{Code = 4};
		return;
	end
	--判断龙脉是否可以开启
	if not cfg.FunCheckCondition(self:GetPulseTotalNum(),self:HasAuthority("Pulse")) then
		-- print("===UseItemOpenDraPul===",self:GetPulseTotalNum(),self:HasAuthority("Pulse"))
		objPlayer.OnOpenDragonResultMsg{Code = 1};
		return;
	end
	
	if(self.dwPulseDragon >= dwDraIndex) then
		objPlayer.OnOpenDragonResultMsg{Code = 2};
		return;
	end
	local isSucc = objItemSystem:DelEnumItemInPacket(cfg.dwCostItemEnumID,cfg.dwCostItemNum,true, _G.ItemSysOperType.Used) 
	if not isSucc then
		objPlayer.OnOpenDragonResultMsg{Code = 3};
		return;
	end
	
	self.dwPulseDragon = dwDraIndex
	objPlayer.ResultUseItemOpenDraPulMsg{DraPul = self.dwPulseDragon}
	CGameApp.OpenDraPulseCastMsg{RoleID = objPlayer:GetRoleID(),RoleName = objPlayer:GetName(),DarPul = self.dwPulseDragon}
	self:CountAttribute()
	self.objDBQuery:SaveDraPulInfo()
end










_G.CPulseSystemDBOper = {};
function CPulseSystemDBOper:new(objDB,objUser)
	local obj = {};
	obj.objDBQuery = objDB;
	obj.objUser = objUser;   --对应的玩家
	for i, v in pairs(CPulseSystemDBOper) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end
function CPulseSystemDBOper:SaveInfo(tabInfo)

	if not self.objDBQuery then
		_info("self.objDBQuery is null by CPulseSystemDBOper");
		return false;
	end;
	if not self.objUser then
		_info("self.objUser is null by CPulseSystemDBOper");
		return false;
	end;
	
	local objPlayer = self.objUser:GetPlayer();
	if not objPlayer then
		_info("objPlayer is null by CPulseSystemDBOper");
		return false;
	end;
    local dwRoleID = objPlayer:GetRoleID();
	if dwRoleID == 0 then
		_info("dwRoleID == 0 by CPulseSystemDBOper");
		return false;
	end;
	
	local SqlCmd = self.objDBQuery:CreateUpdateCmd('T_Role_Pulse');
	SqlCmd.Wheres.dwRoleID = dwRoleID;
	tabInfo.dwPulseFullNum = nil
	for k,v in pairs (tabInfo) do
		SqlCmd.Fields[v] = self.objUser[v]
	end
	SqlCmd.Fields.dwCountTime = GetCurTime();
	
	SqlCmd:execute()
	return true;
end

function CPulseSystemDBOper:SaveDraPulInfo()
	if not self.objDBQuery then
		_info("self.objDBQuery is null by CPulseSystemDBOper");
		return false;
	end;
	if not self.objUser then
		_info("self.objUser is null by CPulseSystemDBOper");
		return false;
	end;
	
	local objPlayer = self.objUser:GetPlayer();
	if not objPlayer then
		_info("objPlayer is null by CPulseSystemDBOper");
		return false;
	end;
    local dwRoleID = objPlayer:GetRoleID();
	if dwRoleID == 0 then
		_info("dwRoleID == 0 by CPulseSystemDBOper");
		return false;
	end;
	local SqlCmd = self.objDBQuery:CreateUpdateCmd('T_Role_Pulse');
	SqlCmd.Wheres.dwRoleID = dwRoleID;
	SqlCmd.Fields.dwDraPul = self.objUser.dwPulseDragon;
	SqlCmd:execute()
	return true;
end

