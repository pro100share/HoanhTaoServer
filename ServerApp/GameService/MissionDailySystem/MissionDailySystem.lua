--2012.4.12
--作者：段磊磊
--每日活动系统
_G.CMissionDailySystem = {}
function CMissionDailySystem:new()
	local obj = CSystem:new("CMissionDailySystem");
	obj.Info = {};
	--日活跃度
	obj.Info.dwActivePoint = 0
	--周活跃度
	obj.Info.dwActivePointTotal = 0
	--日礼包领取记录
	obj.Info.setDailyGift = {};
	--周礼包领取记录
	obj.Info.setWeeklyGift = {};
	--活跃度事件记录
	obj.Info.setEventInfo = {};
	for k,v in ipairs(MissionDailyConfig.EventConfig) do
		obj.Info.setEventInfo[k] = 0
	end
	--在线时间
	obj.Info.dwOnLineTime = 0;
	--签到天数
	obj.Info.dwOnLineDay = 0;	
	--兑换物品领取记录
	obj.Info.setExchangeGift = {};
	--威望等级
	obj.Info.dwWeiWangLevel = 1			
	--威望领取记录	
	obj.Info.setWeiWangGift = {}	
	--时间戳
	obj.Info.dwTimeStamp = 0;
	for i,v in pairs(CMissionDailySystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	obj.setEvent = 
	{
		[enumPlayerEventType.EventKillMonster]	 = 0,		--杀怪数量
		[enumPlayerEventType.EventKillBossMonster]  = 0,	--杀BOSS数量
		[enumPlayerEventType.EventEnterDungeon]   = 0, 		--进入副本
		[enumPlayerEventType.EventCompleteTask]  = 0, 		--完成任务次数
		[enumPlayerEventType.EventContinueKill]  = 0,		--连斩次数
		[enumPlayerEventType.EventOnLineTime]    = 0,		--在线时间--半小时为单位
		[enumPlayerEventType.EventDaySign]       = 0,		--签到
		[enumPlayerEventType.EventCompleteDailyTask]       = 0,		--日环任务
		[enumPlayerEventType.EventCompleteWeeklyTask]       = 0,		--日环任务
		[enumPlayerEventType.TreasrueMapUse]       = 0,		--藏宝图
		[enumPlayerEventType.EventCostBindGold]       = 0,		--礼金消费
		[enumPlayerEventType.EventAddFiveElem]		= 0,		--五行增加
		[enumPlayerEventType.EventKillBossOn5030]		= 0,		--杀个boss
		[enumPlayerEventType.EventGuildDonate]		= 0,		--帮派捐赠
		[enumPlayerEventType.EventGuildEscort]		= 0,		--押镖
		[enumPlayerEventType.EventChatLineMsg]		= 0,		--世界喊话
		[enumPlayerEventType.EventEquipBuild]		= 0,		--装备修炼
		[enumPlayerEventType.EventKillVariationMonster]		= 0,		--击杀变异怪物	
		[enumPlayerEventType.EventGetMicroReward]		= 0,		--领取微端奖励	
		[enumPlayerEventType.EventInject]		= 0,		--闭关灌注
		[enumPlayerEventType.EventBuildTotalNum]		= 0,		--众志成城捐献
		[enumPlayerEventType.EventGamble]		= 0,		--老顽童次数
		[enumPlayerEventType.EventKillStoneMonster]		= 0,		--击杀陨石次数	
		[enumPlayerEventType.EventAnswer]		= 0,		--参加答题	
		[enumPlayerEventType.EventKillFStoneMonster]		= 0,		--击杀流星雨怪物
		[enumPlayerEventType.EventTaoHuaMiZhen]		= 0,		--桃花迷阵通关
		[enumPlayerEventType.EventEnterMap8025]		= 0,		--风云客栈 戏说天下
		[enumPlayerEventType.EventPassMaiFuDungeon]		= 0,		--通关十面埋伏
		[enumPlayerEventType.EventPassFengHuoDungeon]		= 0,		--通关烽火之路
		[enumPlayerEventType.EventPassYanWuDungeon]		= 0,		--通关演武
		[enumPlayerEventType.EventPassDaPoDungeon]		= 0,		--通关大破金营
		[enumPlayerEventType.EventPassShowWeiDungeon]		= 0,		--通关守卫襄阳
		[enumPlayerEventType.EventPassWuXingDungeon]		= 0,		--通关五行道场
		[enumPlayerEventType.EventPassFuQiDungeon]		= 0,		--通关夫妻
		[enumPlayerEventType.EventEscortAward]		= 0,		--个人押镖成功交镖
	}
	-----------------------2012-10-9 add
	--签到标志
	obj.Info.dwSignTime = 0;
	--其他礼包标志
	obj.Info.setOtherGift = {};
	return obj;
end;
function CMissionDailySystem:Create(bIsChangeLine)
    -- 创建数据库对象
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local objDB = objPlayer:GetDBQuery();
	self.objDBQuery = CMissionDailyDBOper:new(objDB,self);
	if not self.objDBQuery then
		return false;
	end;
	local tabDataList = objPlayer:GetLineData("CMissionDailySystem")
	if tabDataList[1][1] then
		self.Info.dwActivePoint = tabDataList[1][1]
		self.Info.dwActivePointTotal = tabDataList[1][2]
		self.Info.setDailyGift = tabDataList[1][3]
		self.Info.setWeeklyGift = tabDataList[1][4]
		self.Info.dwOnLineTime = tabDataList[1][6]
		self.Info.dwOnLineDay = tabDataList[1][7]
		self.Info.setExchangeGift = tabDataList[1][8]
		self.Info.dwSignTime = tabDataList[1][9]
		self.Info.setOtherGift = tabDataList[1][10]
		self.Info.dwWeiWangLevel = tabDataList[1][11]
		self.Info.setWeiWangGift = tabDataList[1][12]
		
		local tbDBEventInfo = tabDataList[1][5];
		for k,v in pairs(self.Info.setEventInfo)do
			if tbDBEventInfo[k] then
				self.Info.setEventInfo[k] = tbDBEventInfo[k];
			end
		end
	end
	if bIsChangeLine == 0 then
	--if not bIsChangeLine then
		if objPlayer:GetInfo().tmDownlineTime ~= 0 then
			if not CTimeFormat:isToday(objPlayer:GetInfo().tmDownlineTime) then
				self:ResetDayInfo(true)
			end
		
			if not CTimeFormat:isThisWeek(objPlayer:GetInfo().tmDownlineTime) then
				self:ResetWeekInfo(true)
			end
		end
		if (CTimeFormat:GetTodayStartMsec() -  self.Info.dwSignTime) >= ONE_DAY_MSEC then
			self.Info.dwSignTime  = 0
			--self.Info.dwOnLineDay = 0;
		end
	end
	-- 计算活动的属性
	self:CountAttribute()
	self.KeyEventList = {}
	for k,v in pairs (MissionDailyConfig.EventConfig) do
		if not self.KeyEventList[v.EventType] then
			self.KeyEventList[v.EventType] = {}
		end
		self.KeyEventList[v.EventType][k] = {}
	end
	self.DecodeFun = {}
	self.DecodeFun[MissionDailyMsgConfig.DaySign] = function(objPlayer,Param) self:FunDaySign(objPlayer,Param) end
	self.DecodeFun[MissionDailyMsgConfig.GetDayGift] = function(objPlayer,Param) self:FunGetDayGift(objPlayer,Param) end
	self.DecodeFun[MissionDailyMsgConfig.GetWeekGift] = function(objPlayer,Param) self:FunGetWeekGift(objPlayer,Param) end
	self.DecodeFun[MissionDailyMsgConfig.GetChargeGift] = function(objPlayer,Param) self:FunGetChargeGift(objPlayer,Param) end
	self.DecodeFun[MissionDailyMsgConfig.SignGetReword] = function(objPlayer,Param) self:FunSignGetReword(objPlayer,Param) end
	self.DecodeFun[MissionDailyMsgConfig.GetWeiWangGift] = function(objPlayer,Param) self:FunGetWeiWangGift(objPlayer,Param) end
	self.DecodeFun[MissionDailyMsgConfig.CompleteTask] = function(objPlayer,Param) self:FunCompleteTask(objPlayer,Param) end
	self.DecodeFun[MissionDailyMsgConfig.OtherGetReword] = function(objPlayer,Param) self:FunOtherGetReword(objPlayer,Param) end
	self.DecodeFun[MissionDailyMsgConfig.UpWeiWangLevel] = function(objPlayer,Param) self:FunUpWeiWangLevel(objPlayer,Param) end
	return true;
end
function CMissionDailySystem:FunDaySign(objPlayer,Param) 
	local nowDay = CTimeFormat:toweekEx(_now(1))
	local t = {}
	if self.Info.dwOnLineDay[nowDay+1] == 1 then
		objPlayer.CltMissionDailyMsg{Type = MissionDailyMsgConfig.AlreadySign,Param = t}
		return
	else
		self.Info.dwOnLineDay[nowDay+1] = 1
		local tInfo = {}
		tInfo.dwOnLineDay = self.Info.dwOnLineDay
		self:UpdateInfoToClient(MissionDailyMsgConfig.UpdataOnlineDay,tInfo,objPlayer)
		objPlayer.CltMissionDailyMsg{Type = MissionDailyMsgConfig.SignSuccess,Param = t}
		CMailManager:SendConfigMail( 900050001, objPlayer:GetRoleID() )
	end
end
function CMissionDailySystem:FunGetDayGift(objPlayer,Param) 
	self:GetDayGift(Param.dwSerial)
end
function CMissionDailySystem:FunGetWeekGift(objPlayer,Param) 
	self:GetWeekGift(Param.dwSerial)
end
function CMissionDailySystem:FunGetChargeGift(objPlayer,Param) 
	self:GetChargeGift(Param.dwSerial,Param.dwSubSerial)
end
function CMissionDailySystem:FunSignGetReword(objPlayer,Param) 
	local timeTodayStart = CTimeFormat:GetTodayStartMsec()
	if self.Info.dwSignTime >= timeTodayStart then
	--	_info('today already sign')
	else
		if (timeTodayStart -  self.Info.dwSignTime) < ONE_DAY_MSEC then
			self:GetSignReword(true)
		else
			self:GetSignReword(true)
			--self:GetSignReword(false)//之前是如果不连续领取的话连续天数会中断，现在策划改为不连续领取也不会中断
		end
	end
end
function CMissionDailySystem:FunGetWeiWangGift(objPlayer,Param) 
	self:GetWeiWangReword(Param[1])
end
function CMissionDailySystem:FunCompleteTask(objPlayer,Param) 
	self:CompleteNow(Param[1])
end
function CMissionDailySystem:FunOtherGetReword(objPlayer,Param) 
	self:GetOtherReword(Param[1])
end
function CMissionDailySystem:FunUpWeiWangLevel(objPlayer)
	---uplevel
	if WeiWangConfig[self.Info.dwWeiWangLevel+1] then
		if self.Info.dwActivePointTotal >= WeiWangConfig[self.Info.dwWeiWangLevel+1].dwValue  then
			self.Info.dwActivePointTotal = self.Info.dwActivePointTotal - WeiWangConfig[self.Info.dwWeiWangLevel+1].dwValue
			
			self.Info.dwWeiWangLevel = self.Info.dwWeiWangLevel + 1;
			
			-- if self.Info.dwWeiWangLevel == #WeiWangConfig then
				-- self.Info.dwActivePointTotal = WeiWangConfig[self.Info.dwWeiWangLevel].dwValue
			-- end
			
			self:CountAttribute();
		end
	end
	
	--notice
	local tInfo = {}
	tInfo.dwActivePoint = self.Info.dwActivePoint
	tInfo.dwActivePointTotal = self.Info.dwActivePointTotal
	tInfo.dwWeiWangLevel = self.Info.dwWeiWangLevel
	self:UpdateInfoToClient(MissionDailyMsgConfig.UpdataActiveValue,tInfo,objPlayer)
end;
--处理客户端请求
function CMissionDailySystem:Decode(Type,Param)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	if self.DecodeFun[Type] then
		self.DecodeFun[Type](objPlayer,Param)
	end
end
function CMissionDailySystem:CountAttribute()
	if not self:HasAuthority("WeiWang") then return end;
	
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local sklSystem = objPlayer:GetSystem("CSkillSystem")
	local fightInfo = SSingleAttrChange:new()
	if not WeiWangConfig[self.Info.dwWeiWangLevel] then return end
	for k,v in pairs (WeiWangConfig[self.Info.dwWeiWangLevel].Attri) do
		fightInfo[k] = v
	end
	sklSystem:NotifyWeiWangUpdate(fightInfo,false)
end
--初始化时更新全部信息
function CMissionDailySystem:UpdataAllInfo(objPlayer,isInit)
	local tInfo1,tInfo2,tInfo3,tInfo4,tInfo5,tInfo6,tInfo7,tInfo8,tInfo9 = {},{},{},{},{},{},{},{},{}
	tInfo1.setEventInfo = self.Info.setEventInfo
	self:UpdateInfoToClient(MissionDailyMsgConfig.UpdataEvent,tInfo1,objPlayer)
	tInfo2.dwOnLineDay = self.Info.dwOnLineDay
	tInfo2.dwSignTime = self.Info.dwSignTime
	self:UpdateInfoToClient(MissionDailyMsgConfig.UpdataDayGift,tInfo2,objPlayer)
	tInfo3.setWeeklyGift = self.Info.setWeeklyGift
	self:UpdateInfoToClient(MissionDailyMsgConfig.UpdataWeekGift,tInfo3,objPlayer)
	tInfo4.setExchangeGift = self.Info.setExchangeGift
	self:UpdateInfoToClient(MissionDailyMsgConfig.UpdataGiftGift,tInfo4,objPlayer)
	tInfo5.dwActivePoint = self.Info.dwActivePoint
	tInfo5.dwActivePointTotal = self.Info.dwActivePointTotal
	tInfo7.setDailyGift = self.Info.setDailyGift
	self:UpdateInfoToClient(MissionDailyMsgConfig.UpdataActiveGift,tInfo7,objPlayer)
	tInfo5.dwWeiWangLevel = self.Info.dwWeiWangLevel
	tInfo5.isInit = isInit;
	self:UpdateInfoToClient(MissionDailyMsgConfig.UpdataActiveValue,tInfo5,objPlayer)
	tInfo6.setOtherGift = self.Info.setOtherGift
	self:UpdateInfoToClient(MissionDailyMsgConfig.UpdataOtherGift,tInfo6,objPlayer)
	tInfo8.setWeiWangGift = self.Info.setWeiWangGift
	self:UpdateInfoToClient(MissionDailyMsgConfig.UpdataWeiWangLevel,tInfo8,objPlayer)
	tInfo9.dwOnLineTime = self.Info.dwOnLineTime
	self:UpdateInfoToClient(MissionDailyMsgConfig.UpdataOnlineTime,tInfo9,objPlayer)
end
--初始化时更新全部信息
function CMissionDailySystem:GetAllInfo(objPlayer)
	local tInfo = {}
	tInfo.setEventInfo = self.Info.setEventInfo
	tInfo.dwOnLineDay = self.Info.dwOnLineDay
	tInfo.dwSignTime = self.Info.dwSignTime
	tInfo.setWeeklyGift = self.Info.setWeeklyGift
	tInfo.setExchangeGift = self.Info.setExchangeGift
	tInfo.dwActivePoint = self.Info.dwActivePoint
	tInfo.dwActivePointTotal = self.Info.dwActivePointTotal
	tInfo.setDailyGift = self.Info.setDailyGift
	tInfo.dwWeiWangLevel = self.Info.dwWeiWangLevel
	tInfo.setOtherGift = self.Info.setOtherGift
	tInfo.setWeiWangGift = self.Info.setWeiWangGift
	tInfo.dwOnLineTime = self.Info.dwOnLineTime
	return tInfo
end
--每天早上重置一部分属性
function CMissionDailySystem:ResetDayInfo(nFlag)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	self.Info.dwActivePoint = 0;
	self.Info.setDailyGift = {};
	self.Info.dwOnLineTime = 0;
	self.Info.setEventInfo = {}
	for k,v in ipairs(MissionDailyConfig.EventConfig) do
		self.Info.setEventInfo[k] = 0
	end
	if not nFlag then
		local tInfo1 = {}
		tInfo1.setEventInfo = self.Info.setEventInfo
		local tInfo2 = {}
		tInfo2.dwSignTime = self.Info.dwSignTime
		tInfo2.dwOnLineDay = self.Info.dwOnLineDay
		local tInfo5= {}
		tInfo5.dwActivePoint = self.Info.dwActivePoint
		tInfo5.dwActivePointTotal = self.Info.dwActivePointTotal
		tInfo5.dwWeiWangLevel = self.Info.dwWeiWangLevel
		local tInfo7 = {}
		tInfo7.setDailyGift = self.Info.setDailyGift
		self:UpdateInfoToClient(MissionDailyMsgConfig.UpdataEvent,tInfo1,objPlayer)
		self:UpdateInfoToClient(MissionDailyMsgConfig.UpdataDayGift,tInfo2,objPlayer)
		self:UpdateInfoToClient(MissionDailyMsgConfig.UpdataActiveValue,tInfo5,objPlayer)	
		self:UpdateInfoToClient(MissionDailyMsgConfig.UpdataActiveGift,tInfo7,objPlayer)
	end
end
--每周一早上重置一部分数据
function CMissionDailySystem:ResetWeekInfo(nFlag)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	self.Info.setWeeklyGift = {};	
	local tInfo2 = {}
	tInfo2.setWeeklyGift = self.Info.setWeeklyGift
	
	if not nFlag then
		self:UpdateInfoToClient(MissionDailyMsgConfig.UpdataWeekGift,tInfo2,objPlayer)
	end
end
function CMissionDailySystem:GetWeiWangLevel()
	return self.Info.dwWeiWangLevel
end
function CMissionDailySystem:GetTotalActivePoint()
	return self.Info.dwActivePointTotal
end
function CMissionDailySystem:GetActivePoint()
	return self.Info.dwActivePoint
end
function CMissionDailySystem:OnChangeLineEnd(dwNewLineID)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	CBossInfoManager:AddPlayer(objPlayer:GetRoleID(),self)
	self:UpdateBossInfoToClient(objPlayer)
end
function CMissionDailySystem:OnChangeLineBegin(dwNewLineID)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local t = {}
	--日活跃度
	t[1] = self.Info.dwActivePoint
	--周活跃度
	t[2] = self.Info.dwActivePointTotal
	--日礼包领取记录
	t[3] = self.Info.setDailyGift;
	--周礼包领取记录
	t[4] = self.Info.setWeeklyGift;
	--活跃度事件记录
	t[5] = self.Info.setEventInfo;
	--在线时间
	t[6] = self.Info.dwOnLineTime;
	--签到天数
	t[7] = self.Info.dwOnLineDay;	
	--兑换物品领取记录
	t[8] = self.Info.setExchangeGift;
	--今天的签到标志
	t[9] = self.Info.dwSignTime;
	--其他礼包标志
	t[10] = self.Info.setOtherGift;
	--威望等级
	t[11] = self.Info.dwWeiWangLevel			
	--威望领取记录	
	t[12] = self.Info.setWeiWangGift	
	objPlayer:SetLineData("CMissionDailySystem",t);
	CBossInfoManager:DelPlayer(objPlayer:GetRoleID(),self)
end
function CMissionDailySystem:Update(dwInterval)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local tempTime  = self.Info.dwOnLineTime
	tempTime = tempTime + dwInterval;
	if tempTime <= 0 then
		self.Info.dwOnLineTime = 0
	else
		self.Info.dwOnLineTime = tempTime
		local tInfo = {}
		tInfo.dwOnLineTime = self.Info.dwOnLineTime
		self:UpdateInfoToClient(MissionDailyMsgConfig.UpdataOnlineTime,tInfo,objPlayer)
	end

	local dwMin = math.floor(self.Info.dwOnLineTime/60000)
	if dwMin / MissionDailyConfig.OnLineTimeUnit == math.floor(dwMin / MissionDailyConfig.OnLineTimeUnit) then
		local eventSys = objPlayer:GetSystem('CPlayerEventCenterSystem')
		eventSys:DoEvent(enumPlayerEventType.EventOnLineTime,1);
	end
	return true
end

function CMissionDailySystem:Destroy()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local objMapSys = objPlayer:GetSystem('CMapSystem')
	local dwLineNum = objMapSys.dwCurLine
	--self.objDBQuery:SaveInfo(self:GetAllInfo(objPlayer))
	CBossInfoManager:DelPlayer(objPlayer:GetRoleID(),self,dwLineNum)
end;
function CMissionDailySystem:EventLevelUp(dwValue,dwLevel)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local t = {}
	t[1] = dwValue
	t[2] = dwLevel
	objPlayer.CltMissionDailyMsg{Type = MissionDailyMsgConfig.LevelUp,Param = t}
end
function CMissionDailySystem:EventChangeLine(dwValue,dwOldLine,dwNewLine)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	CBossInfoManager:ChangeLine(objPlayer:GetRoleID(),self,dwOldLine,dwNewLine)
end
function CMissionDailySystem:OnEnterScene()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	CBossInfoManager:AddPlayer(objPlayer:GetRoleID(),self)
	self:UpdataAllInfo(objPlayer,true)
	-------------------------------------
	local temp = CMovementSystemMgr.ProcessListHead
	while temp do
		objPlayer.OnStartTimeMsg{ID = temp.dwMovementID,
							nTime = (temp.FinishTime - GetCurTime()) };
		temp = temp.Next
	end	
	local temp = CMovementSystemMgr.WaitListHead
	while temp do
        local tInfo = MovementConfig:GetNoticeInfo(temp.dwMovementID)
        if tInfo and GetCurTime() >= (temp.ActionTime - tInfo.nShowTime) then
			objPlayer.OnWillStartTimeMsg{ID = temp.dwMovementID,
				nTime = GetCurTime() - (temp.ActionTime - tInfo.nShowTime)};
		end
		temp = temp.Next
	end
	self:UpdateBossInfoToClient(objPlayer)
end;

--GM命令增加活跃度
function CMissionDailySystem:AddActivePoint(dwValue)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	self:ChangeActivePoint(dwValue)
	self:UpdataAllInfo(objPlayer)
end
--更新信息到客户端
function CMissionDailySystem:UpdateInfoToClient(dwType,Info,objPlayer,nFlag)
	if nFlag == nil then
		nFlag = 1
	end
	objPlayer.CltFlushMissionDailyInfoMsg{ Type = dwType,SInfo = Info,Flag = nFlag }
	self.objDBQuery:SaveInfo(Info)
end;
function CMissionDailySystem:UpdateBossInfoToClient(objPlayer)
	local Info = CBossInfoManager.setBossList
	objPlayer.CltFlushMissionDailyInfoMsg{ Type = -1,SInfo = Info,Flag = 2 }
end;
------玩家事件中心分发出来的事件
function CMissionDailySystem:OnEventCenter(dwEventID,dwValue,...)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;

	if not self.setEvent[dwEventID] or not self.KeyEventList[dwEventID] then
		return ;
	end;
	local arg = {...}

	local value = dwValue or 1
	local tempParam = arg[1] or 0

	--棋局击杀boss处理
	if dwEventID == enumPlayerEventType.EventKillBossMonster and arg[4] == 5030 then
		--print('~~~~~~~~~~~~~~~~~~~~~~~~~~')
		self:GetPlayer():GetSystem('CPlayerEventCenterSystem'):DoEvent(enumPlayerEventType.EventKillBossOn5030,1);
	end
	local tInfo = {}
	tInfo.setEventInfo = {}
	local isSend = false
	for k,v in pairs (self.KeyEventList[dwEventID]) do
		if MissionDailyScript[dwEventID] then
			if MissionDailyScript[dwEventID](...) == false then return end
		end
		if self.Info.setEventInfo[k] < MissionDailyConfig.EventConfig[k].LimitValue then	
			if MissionDailyConfig.EventConfig[k].ParamID == 0 or MissionDailyConfig.EventConfig[k].ParamID == tempParam then	
				local beforeValue = math.ceil(self.Info.setEventInfo[k]/MissionDailyConfig.EventConfig[k].OnePartValue)
				self.Info.setEventInfo[k] = self.Info.setEventInfo[k] + value	
				if self.Info.setEventInfo[k] > MissionDailyConfig.EventConfig[k].LimitValue then self.Info.setEventInfo[k] = MissionDailyConfig.EventConfig[k].LimitValue end
				tInfo.setEventInfo[k] = self.Info.setEventInfo[k]
				if self.Info.setEventInfo[k] >= MissionDailyConfig.EventConfig[k].LimitValue then
					self:ChangeActivePoint(MissionDailyConfig.EventConfig[k].ActivePoint,k)
					CLogSystemManager:weiwang(objPlayer, k);
					isSend = true
				end
				local afterValue = math.ceil(self.Info.setEventInfo[k]/MissionDailyConfig.EventConfig[k].OnePartValue)
				if afterValue > beforeValue then
					isSend = true
				end
			end
		end 	
	end
	if isSend == true then
		self:UpdateInfoToClient(MissionDailyMsgConfig.UpdataEvent,tInfo,objPlayer)
	end
end
function CMissionDailySystem:ChangeActivePoint(dwValue)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	if dwValue > 0 then
		self.Info.dwActivePoint = self.Info.dwActivePoint + dwValue
	end
	self.Info.dwActivePointTotal = self.Info.dwActivePointTotal + dwValue
	-- if WeiWangConfig[self.Info.dwWeiWangLevel+1] then
		-- if self.Info.dwActivePointTotal >= WeiWangConfig[self.Info.dwWeiWangLevel+1].dwValue  then
			-- --self.Info.dwActivePointTotal = WeiWangConfig[self.Info.dwWeiWangLevel+1].dwValue - self.Info.dwActivePointTotal
			-- self.Info.dwActivePointTotal = self.Info.dwActivePointTotal - WeiWangConfig[self.Info.dwWeiWangLevel+1].dwValue
			
			-- self.Info.dwWeiWangLevel = self.Info.dwWeiWangLevel + 1
			-- if self.Info.dwWeiWangLevel == #WeiWangConfig then self.Info.dwActivePointTotal = WeiWangConfig[self.Info.dwWeiWangLevel].dwValue end
		-- end
	-- end
	
	if self.Info.dwActivePointTotal > MissionDailyConfig.ActivePointTotalMax then
		self.Info.dwActivePointTotal = MissionDailyConfig.ActivePointTotalMax;
	end
	
	self:CountAttribute()
	local eventSys = objPlayer:GetSystem('CPlayerEventCenterSystem')
	eventSys:DoEvent(enumPlayerEventType.EventAddActivePoint,dwValue);
	
	local tInfo = {}
	tInfo.dwActivePoint = self.Info.dwActivePoint
	tInfo.dwActivePointTotal = self.Info.dwActivePointTotal
	tInfo.dwWeiWangLevel = self.Info.dwWeiWangLevel
	self:UpdateInfoToClient(MissionDailyMsgConfig.UpdataActiveValue,tInfo,objPlayer)
end
-- 活动开始事件
function CMissionDailySystem:EventDungeonBegin(dwValue,dwDungeonID)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	for k,v in pairs (MissionDailyConfig.DungeonInfoConfig) do
		if k == dwDungeonID then
			local t = {}
			t.dwDungeonID = dwDungeonID
			objPlayer.CltMissionDailyMsg{Type = MissionDailyMsgConfig.DungeonBegin,Param = t}
			return
		end
	end
end
---领取日活跃礼包
function CMissionDailySystem:GetDayGift(dwSerial)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	for k,v in pairs (self.Info.setDailyGift) do
		if dwSerial == v then
		--	_info('daily get already')
			return
		end
	end
	local objItemSys = objPlayer:GetSystem('CItemSystem')
	local dayGiftInfo = MissionDailyConfig.DayGiftConfig[dwSerial].ItemList
	local t = {}
	t.dwSerial = dwSerial
	if self.Info.dwActivePoint >= MissionDailyConfig.DayGiftConfig[dwSerial].ActivePointNeed then
		local addItemList = {};
		for k,v in pairs (dayGiftInfo) do
			local tempTable = {
				dwItemEnum	= v.dwItemEnum;
				dwItemNumber= v.dwItemNum;
				dwBindType	= v.dwBindType;
			};
			table.insert(addItemList, tempTable);
		end
		if objItemSys:IsEnumItemListCanAddToPacket(addItemList) then
			objItemSys:AddEnumItemListToPacket(addItemList, _G.ItemSysOperType.MissionDaily)
			
			table.insert(self.Info.setDailyGift,dwSerial)
			local tInfo = {}
			tInfo.setDailyGift = self.Info.setDailyGift
			objPlayer:GetSystem('CPlayerEventCenterSystem'):DoEvent(enumPlayerEventType.EventWeiwangGift)
			self:UpdateInfoToClient(MissionDailyMsgConfig.UpdataActiveGift,tInfo,objPlayer)
			objPlayer.CltMissionDailyMsg{Type = MissionDailyMsgConfig.GetActiveGiftSure,Param = t}
		else
			objPlayer.CltMissionDailyMsg{Type = MissionDailyMsgConfig.GetActiveGiftNoPack,Param = t}
			--no pack
		end
	else
		objPlayer.CltMissionDailyMsg{Type = MissionDailyMsgConfig.GetDayGiftNoPoint,Param = t}
		-- no point 
	end
end
---领取周活跃礼包
function CMissionDailySystem:GetWeekGift(dwSerial)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	for k,v in pairs (self.Info.setWeeklyGift) do
		if dwSerial == v then
		--	_info('weekly get already')
			return
		end
	end
	local tempDaySign = 0
	for k,v in pairs (self.Info.dwOnLineDay) do
		if self.Info.dwOnLineDay[k] == 1 then
			tempDaySign = tempDaySign + 1
		end
	end
	local t = {}
	t.dwSerial = dwSerial
	if self.Info.dwActivePointTotal >= MissionDailyConfig.WeekGiftConfig[dwSerial].ActivePointNeed then
		if tempDaySign >= MissionDailyConfig.WeekGiftConfig[dwSerial].DaySignNeed then
			local itemSystem = objPlayer:GetSystem('CItemSystem')
			itemSystem:AddBindGold(MissionDailyConfig.WeekGiftConfig[dwSerial].dwBindGold, _G.ItemSysOperType.MissionDaily)
			table.insert(self.Info.setWeeklyGift,dwSerial)
			local tInfo = {}
			tInfo.setWeeklyGift = self.Info.setWeeklyGift
			self:UpdateInfoToClient(MissionDailyMsgConfig.UpdataWeekGift,tInfo,objPlayer)
			objPlayer.CltMissionDailyMsg{Type = MissionDailyMsgConfig.GetWeekGiftSure,Param = t}
		else
			objPlayer.CltMissionDailyMsg{Type = MissionDailyMsgConfig.GetWeekGiftNoDay,Param = t}
			-- no day
		end
	else
		objPlayer.CltMissionDailyMsg{Type = MissionDailyMsgConfig.GetWeekGiftNoPoint,Param = t}
		--no point
	end
end
--领取福利礼包
function CMissionDailySystem:GetChargeGift(dwSerial,dwSubSerial)
	--print(dwSerial,dwSubSerial)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	for k,v in pairs (self.Info.setExchangeGift) do
		if dwSerial*10 + dwSubSerial == v then
		--	_info('chargegift get already')
			return
		end
	end
	---判断充值条件是否满足
	local t = {}
	t.dwSerial = dwSerial
	t.dwSubSerial = dwSubSerial
	if true then
		local objItemSys = objPlayer:GetSystem('CItemSystem')
		local myProf = objPlayer:GetInfo().dwProf
		local addItemList = {};
		for k,v in pairs (MissionDailyConfig.GiftInfoConfig[dwSerial].ChargeEventList[dwSubSerial].Gift) do
			----------------------------
			if v.dwPropEnum ~= 0 or v.dwPropNum ~= 0 then
				local tempTable = {
					dwItemEnum		= GiftConfig.PropConfig[v.dwPropEnum].ProfEquipEnum[myProf];
					dwItemNumber	= v.dwItemNum;
					setProperty		= GiftConfig.PropConfig[v.dwPropEnum].PropList;
					dwBindType		= v.dwBindType;
					dwStrongLevel	= GiftConfig.PropConfig[v.dwPropEnum].dwStrongEnum;
				};
				table.insert(addItemList, tempTable);
			else
			----------------------------
				local tempTable = {
					dwItemEnum	= v.dwItemEnum;
					dwItemNumber= v.dwItemNum;
					dwBindType	= v.dwBindType;
				};
				table.insert(addItemList, tempTable);
			end
		end
		
		if objItemSys:IsEnumItemListCanAddToPacket(addItemList) then
			objItemSys:AddEnumItemListToPacket(addItemList, _G.ItemSysOperType.MissionDaily)
			
			table.insert(self.Info.setExchangeGift,dwSerial*10 + dwSubSerial)
			local tInfo =  {}
			tInfo.setExchangeGift = self.Info.setExchangeGift
			self:UpdateInfoToClient(MissionDailyMsgConfig.UpdataGiftGift,tInfo,objPlayer)
			objPlayer.CltMissionDailyMsg{Type = MissionDailyMsgConfig.GetChargeGiftSure,Param = t}
			if MissionDailyConfig.GiftInfoConfig[dwSerial].ChargeEventList[dwSubSerial].bMessage == 1 then
				t.szRoleName = objPlayer:GetInfo().szRoleName
				t.dwRoleID = objPlayer:GetRoleID()
			--	GSRemoteCall(nil,"CMissionDailySystem","UniCast",{t});
				CGameApp.ServMissionDailyUniCastMsg{Param = {t}};
			end
		else
			objPlayer.CltMissionDailyMsg{Type = MissionDailyMsgConfig.GetChargeGiftNoPack,Param = t}
			--no pack
		end
	else
		objPlayer.CltMissionDailyMsg{Type = MissionDailyMsgConfig.GetChargeGiftCanNotGet,Param = t}
	end
end
--广播
function CMissionDailySystem:UniCast(t)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	objPlayer.CltMissionDailyMsg{Type = MissionDailyMsgConfig.OtherGetChargeGiftSure,Param = t}
end

--立即完成
function CMissionDailySystem:CompleteNow(dwIndex)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local objItemSys = objPlayer:GetSystem("CItemSystem")
	local completeIndex = dwIndex
	if self.Info.setEventInfo[completeIndex] >= MissionDailyConfig.EventConfig[completeIndex].LimitValue then return end
	
	---------------------------
	local tmpCostBindGold = MissionDailyConfig.EventConfig[completeIndex].CostBindGold
	local tmpCostGold = MissionDailyConfig.EventConfig[completeIndex].CostGold
	if tmpCostBindGold ~= 0 then
		if objItemSys:IsBindGoldEnough(tmpCostBindGold) then
			objItemSys:CostBindGold(tmpCostBindGold, _G.ItemSysOperType.MissionDaily);
		else
			local t = {dwIndex}
			objPlayer.CltMissionDailyMsg{Type = MissionDailyMsgConfig.CompleteNotHasBindGold,Param = t}
			return
		end
	end
	if tmpCostGold ~= 0 then
		if objItemSys:IsGoldEnough(tmpCostGold) then
			objItemSys:CostGold(tmpCostGold, _G.ItemSysOperType.MissionDaily);
		else
			local t = {dwIndex}
			objPlayer.CltMissionDailyMsg{Type = MissionDailyMsgConfig.CompleteNotHasGold,Param = t}
			return
		end
	end
	-- local itemHasNum = objItemSys:GetEnumItemNumInPacket(MissionDailyConfig.CompLeteItemID)
	-- if itemHasNum >= MissionDailyConfig.EventConfig[dwIndex].CostItemNum then
		-- objItemSys:DelEnumItemInPacket(MissionDailyConfig.CompLeteItemID, MissionDailyConfig.EventConfig[dwIndex].CostItemNum,false, _G.ItemSysOperType.MissionDaily)	
	-- else
		-- local t = {dwIndex}
		-- objPlayer.CltMissionDailyMsg{Type = MissionDailyMsgConfig.CompleteNotHasItem,Param = t}
	-- end
	self.Info.setEventInfo[completeIndex] = MissionDailyConfig.EventConfig[completeIndex].LimitValue
	self:ChangeActivePoint(MissionDailyConfig.EventConfig[completeIndex].ActivePoint,completeIndex)
	local tInfo = {}
	tInfo.setEventInfo = self.Info.setEventInfo
	self:UpdateInfoToClient(MissionDailyMsgConfig.UpdataEvent,tInfo,objPlayer)	
	---------------------------
end
--其他礼包判断条件
function CMissionDailySystem:JudgeOtherReword(otherGiftEnum)
	return true
end
--威望领奖
function CMissionDailySystem:GetWeiWangReword(dwWeiWangIndex)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	if dwWeiWangIndex > self.Info.dwWeiWangLevel then return end
	for k,v in pairs (self.Info.setWeiWangGift) do
		if v == dwWeiWangIndex then
			return
		end
	end
	local objItemSys = objPlayer:GetSystem('CItemSystem')
	local GiftInfo = WeiWangConfig[dwWeiWangIndex].ItemList

	local t = {}
	t[1] = dwWeiWangIndex
	if objItemSys:IsPacketSlotEnoughFor(#GiftInfo) then
		local addItemList = {};
		for k,v in pairs (GiftInfo) do
			local tempTable = {
				dwItemEnum	= v.dwItemEnum;
				dwItemNumber= v.dwItemNum;
				dwBindType	= v.dwBindType;
			};
			table.insert(addItemList, tempTable);
		end
		objItemSys:AddEnumItemListToPacket(addItemList, _G.ItemSysOperType.MissionDaily);
		
		table.insert(self.Info.setWeiWangGift,dwWeiWangIndex)
		local tInfo = {}
		tInfo.setWeiWangGift = self.Info.setWeiWangGift
		self:UpdateInfoToClient(MissionDailyMsgConfig.UpdataWeiWangLevel,tInfo,objPlayer)
		objPlayer.CltMissionDailyMsg{Type = MissionDailyMsgConfig.GetWeiWangGiftSure,Param = t}	
	else
		objPlayer.CltMissionDailyMsg{Type = MissionDailyMsgConfig.GetWeiWangNoPack,Param = t}
		--no pack
	end
end
--其他礼包领取物品
function CMissionDailySystem:GetOtherReword(otherGiftEnum)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	if not self:JudgeOtherReword(otherGiftEnum) then return end
	for k,v in pairs (self.Info.setOtherGift) do
		if v == otherGiftEnum then return end
	end
	
	local objItemSys = objPlayer:GetSystem('CItemSystem')
	local GiftInfo = MissionDailyConfig.OtherReword[otherGiftEnum]
	local addItemList = {};
	for k,v in pairs (GiftInfo) do
		local tempTable = {
			dwItemEnum	= v.dwItemEnum;
			dwItemNumber= v.dwItemNum;
			dwBindType	= v.dwBindType;
		};
		table.insert(addItemList, tempTable);
	end
	
	local t = {}
	t[1] = otherGiftEnum
	if objItemSys:IsEnumItemListCanAddToPacket(addItemList) then
		objItemSys:AddEnumItemListToPacket(addItemList, _G.ItemSysOperType.MissionDaily)
		
		table.insert(self.Info.setOtherGift,otherGiftEnum)
		local tInfo = {}
		tInfo.setOtherGift = self.Info.setOtherGift
		self:UpdateInfoToClient(MissionDailyMsgConfig.UpdataOtherGift,tInfo,objPlayer)
		objPlayer.CltMissionDailyMsg{Type = MissionDailyMsgConfig.GetOtherGiftSure,Param = t}	
	else
		objPlayer.CltMissionDailyMsg{Type = MissionDailyMsgConfig.GetOtherGiftNoPack,Param = t}
		--no pack
	end
end
--签到领取物品
function CMissionDailySystem:GetSignReword(bFlag)
	if bFlag == true then
		self.Info.dwOnLineDay = self.Info.dwOnLineDay + 1
	else
		self.Info.dwOnLineDay = 1
	end
	---------------------------------
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local objItemSys = objPlayer:GetSystem('CItemSystem')
	local n = self.Info.dwOnLineDay
	if n > #MissionDailyConfig.SignReword then
		n = #MissionDailyConfig.SignReword
	end
	local dayGiftInfo = MissionDailyConfig.SignReword[n]
	local t = {}
	local addItemList = {};
	for k,v in pairs (dayGiftInfo) do
		local tempTable = {
			dwItemEnum	= v.dwItemEnum;
			dwItemNumber= v.dwItemNum;
			dwBindType	= v.dwBindType;
		};
		table.insert(addItemList, tempTable);
	end
	if objItemSys:IsEnumItemListCanAddToPacket(addItemList) then
		objItemSys:AddEnumItemListToPacket(addItemList, _G.ItemSysOperType.MissionDaily)
		
		local eventSys = objPlayer:GetSystem('CPlayerEventCenterSystem')
		--eventSys:DoEvent(enumPlayerEventType.EventDaySign,1);
		self.Info.dwSignTime = GetCurTime()
		local tInfo = {}
		tInfo.dwSignTime = self.Info.dwSignTime
		tInfo.dwOnLineDay = self.Info.dwOnLineDay
		
		self:UpdateInfoToClient(MissionDailyMsgConfig.UpdataDayGift,tInfo,objPlayer)
		objPlayer.CltMissionDailyMsg{Type = MissionDailyMsgConfig.GetDayGiftSure,Param = t}
		
		objPlayer:GetSystem('CPlayerEventCenterSystem'):DoEvent(enumPlayerEventType.EventGetMicroReward,1);
	else
		objPlayer.CltMissionDailyMsg{Type = MissionDailyMsgConfig.GetDayGiftNoPack,Param = t}
		--no pack
	end
end
function CMissionDailySystem:EventGetAuthority(szAuthName)
	if szAuthName == "WeiWang" then
		self:CountAttribute();
	end
end;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--礼包数据库类
_G.CMissionDailyDBOper = {};
function CMissionDailyDBOper:new(objDB,objUser)
    local obj = {};
	obj.objDBQuery = objDB;
	obj.objUser = objUser;   --对应的玩家
	for i, v in pairs(CMissionDailyDBOper) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;
--将类似“1#23#345#”的字符串转换为value为1,23,345的table
function CMissionDailyDBOper:GetFormat(szStr)
	local t = {};
	if szStr == 0 or szStr == '0' then
		return t
	end
	if szStr == nil or szStr == '' then
		return t;
	end
	local h,e;
	local tempStr = szStr;
	local paramStr;
	while true do
		h,e = string.find(tempStr,'&');
		if not h then
			break;
		end
		paramStr = string.sub(tempStr,1,h-1);
		table.insert(t,tonumber(paramStr));
		tempStr = string.sub(tempStr,h+1,-1);
	end
	return t;
end
--将类似value为1,23,345的table转换为“1#23#345#”的字符串
function CMissionDailyDBOper:SetFormat(T)
	local t = Table:DeepCopy(T)
	if t == 0  then
		return ''
	end
	local str = '';
	local tempParam = '';
	while true do
		tempParam = table.remove(t);
		if tempParam == nil then
			break;
		end
		str = tempParam..'&'..str
	end
	return str;
end

function CMissionDailyDBOper:SaveInfo(tabInfo)

	if not self.objDBQuery then
		_info("self.objDBQuery is null by CMissionDailyDBOper");
		return false;
	end;
	if not self.objUser then
		_info("self.objUser is null by CMissionDailyDBOper");
		return false;
	end;
	
	local objPlayer = self.objUser:GetPlayer();
	if not objPlayer then
		_info("objPlayer is null by CMissionDailyDBOper");
		return false;
	end;
    local dwRoleID = objPlayer:GetRoleID();
	if dwRoleID == 0 then
		_info("dwRoleID == 0 by CMissionDailyDBOper");
		return false;
	end;
	
	local SqlCmd = self.objDBQuery:CreateUpdateCmd('T_Role_MissionDaily');
	for k,v in pairs (tabInfo) do
		if type(self.objUser.Info[k]) == 'table' then
			SqlCmd.Fields[k] = CMissionDailyDBOper:SetFormat(self.objUser.Info[k])
		else
			SqlCmd.Fields[k] = self.objUser.Info[k]
		end
	end
	SqlCmd.Wheres.dwRoleID = dwRoleID
	SqlCmd:execute()
	return true;
end
----------------------------------------------------------
