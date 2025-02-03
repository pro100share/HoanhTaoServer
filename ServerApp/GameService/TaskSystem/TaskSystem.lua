--[[
功能：任务系统（服务器）
作者：周长沙
时间：2012-2-11
]]
-------------------------------------
_G.CTaskSystem = {}

local dwChongFu = 2231
local dwHuoDong = 2232
-------------------------------------
--检查物品是不是任务物品
local function CheckItemType(dwItemId)
	local CFG = EquipBaseData[dwItemId] or OtherBaseData[dwItemId] or nil
	if CFG then
		local dwItemType = CFG.dwParentType
		if dwItemType==7 then
			return 1--是任务物品
		else
			return 2--不是任务物品
		end
	end
	return 0--物品不存在
end
local function CheckTable(t)
	for k,v in pairs(t) do
		return t
	end
	return nil
end
-------------------------------------
function CTaskSystem:new()
	local obj = CSystem:new("CTaskSystem");
	---------------------------------------------
	obj.Tasks = {}				--存放任务信息
	
	obj.Accept = {}				--存放当前接受的任务
	obj.Complete = {}			--存放已完成的任务
	obj.CanAccept = {}			--存放可接任务
	
	obj.dwLastMain = 0			--存放上次完成的主线id
	obj.dwTaskNum = 0			--存放任务数量信息
	obj.dwTaskNumMax = 999		--存放任务数量上限信息
	obj.dwLastUpdateTime = 0	--上次更新时间
	obj.dwDelay = 3*60000		--更新间隔
	obj.dwShareDis = 20			--任务杀怪共享距离
	obj.dwRepeatCheckTime = 0	--重复任务更新时间
	
	obj.dwDailyLoop = 0				--日环环数
	obj.dwWeeklyLoop = 0			--周环环数
	obj.dwNowLoop = 0				--当前环数
	obj.dwNowLoopTaskId = 0			--当前环任务
	obj.dwLoopUpdateTime = 0		--更新时间
	
	-- obj.ChongFuTaskCount=0 			--记录的每天接受的《侠义。重复》任务的数量
	-- obj.ChongFuTaskIds={} 				--记录当天曾经接受的《侠义。重复》任务id
	
	-- obj.dwRandomLoop = 0			--随机任务存放
	---------------------------------------------
	for i,v in pairs(CTaskSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end

function CTaskSystem:Create(IsChangeLine)
	-----------------
	-----------------
	--获取数据库操作对象
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local objDB = objPlayer:GetDBQuery();
	self.objDBQuery = CTaskSystemDB:new(objDB,self)
	--读取任务信息
	local Data = objPlayer:GetLineData("CTaskSystem")
	local Tasks = {}
	if type(Data)=="table" then
		for k,v in pairs(Data) do
			if type(v)=="table" then
				for m,n in pairs(v) do
					table.insert(Tasks,n)
				end
			end
		end
	end
	local ExInfo = (objPlayer:GetLineData("CTaskSystemEx") or {})[1]
	if ExInfo and ExInfo[1] then
		self.dwWeeklyLoop = ExInfo[1].dwWeeklyLoop or 0
		self.dwNowLoop = ExInfo[1].dwNowLoop or 0		--当前环数
		if CTimeFormat:isToday(ExInfo[1].dwUpdateTime or 0) then
			self.dwDailyLoop = ExInfo[1].dwDailyLoop or 0
		else
			self.dwDailyLoop = 0			--日环环数
			if not CTimeFormat:isThisWeek(ExInfo[1].dwUpdateTime or 0) then
				self.dwWeeklyLoop = 0			--周环环数
				--self.dwNowLoop = 0			--当前环数
			end
		end
		
		self.dwNowLoopTaskId = ExInfo[1].dwNowTask or 0	--当前环任务id
		
	else
		self.dwDailyLoop = 0			--日环环数
		self.dwWeeklyLoop = 0			--周环环数
		self.dwNowLoop = 0				--当前环数
		self.dwNowLoopTaskId = 0		--当前环任务id
	end
	if Tasks then
		for k,Info in pairs(Tasks) do
			local Task = CTaskManager:GetTaskByDBInfo(Info)
			if Task then
				self.Tasks[Task:GetId()] = Task
				local dwTaskState = Task:GetTaskState()
				if dwTaskState == TaskStateConfig.Accept or dwTaskState == TaskStateConfig.Done then
					if Task:GetTaskType() == TaskTypeConfig.Weekly then
						if Task:GetId() == self.dwNowLoopTaskId then
							if self.dwDailyLoop ~= 0 then
								self.dwTaskNum = self.dwTaskNum + 1
								self.Accept[Task:GetId()] = Task
							else
								self.dwNowLoopTaskId = 0
								Task:SetTaskState(TaskStateConfig.Complete)
								self:DBUpdate(Task:GetId())
								--print("TASK Doff:"..Task:GetId())
							end
						else
							Task:SetTaskState(TaskStateConfig.Complete)
							self:DBUpdate(Task:GetId())
							--print("TASK Sql Err:"..Task:GetId())
						end
					else
						self.dwTaskNum = self.dwTaskNum + 1
						self.Accept[Task:GetId()] = Task
					end
				elseif dwTaskState == TaskStateConfig.Complete then
					self.Complete[Task:GetId()] = Task
					Task:Clear()
				end
			end
		end
	end

	self.dwLoopUpdateTime = GetCurTime()
	self.dwLastMain = self:GetLastMainTask()
	
	if IsChangeLine == 1 then
	--if IsChangeLine then
		self.CanAccept = (objPlayer:GetLineData("CTaskSystemEx2") or {})[1] or {}
	end

	---------------------------------------------
	local sysItem = objPlayer:GetSystem("CItemSystem");
	sysItem:RegEvent( self )
	---------------------------------------------
	self:AddAttr()
	return true;
end

function CTaskSystem:Update(dwInterval)
	--重复任务
	if not CTimeFormat:isToday(self.dwRepeatCheckTime or 0) then
		self.dwRepeatCheckTime = GetCurTime()
		local TaskList = {}
		-- self.ChongFuTaskCount=0;
		-- self.ChongFuTaskIds={};
		for k,v in pairs(self.Tasks) do
			local bRes = v:CheckRepeat()
			if bRes then
				table.insert(TaskList,k)
			end
		end
		self:SendChongFuInfo()--发送侠义重复任务次数信息
		self:SendRepeatTaskUpdate(TaskList)--发送周环任务信息
	end
	--风云任务
	if not self.Accept[self.dwNowLoopTaskId] then
		local dwWeekly,dwQuality = self:GetNextWeeklyTask()
		if dwWeekly and (dwWeekly~=0) then
			self:RcvAcceptTask(dwWeekly,dwQuality)
		end
	end
	return true
end

function CTaskSystem:Destroy()
	return true
end
function CTaskSystem:OnChangeLineBegin(dwNewLineID)
	local objPlayer = self:GetPlayer()
	local Tasks = {}
	for k,v in pairs(self.Tasks) do
		table.insert(Tasks,v:Pack())
	end
	for i=1,#Tasks,10 do
		local Data = {}
		for j=0,9 do
			table.insert(Data,Tasks[i+j])
		end
		objPlayer:SetLineData("CTaskSystem",Data)
	end
	local ExInfo = {}
	ExInfo[1] = {}
	ExInfo[1].dwWeeklyLoop = self.dwWeeklyLoop
	ExInfo[1].dwNowLoop = self.dwNowLoop
	ExInfo[1].dwDailyLoop = self.dwDailyLoop
	ExInfo[1].dwUpdateTime = self.dwLoopUpdateTime
	ExInfo[1].dwNowTask = self.dwNowLoopTaskId
	objPlayer:SetLineData("CTaskSystemEx",ExInfo)
	
	objPlayer:SetLineData("CTaskSystemEx2",self.CanAccept)
end
function CTaskSystem:OnEnterScene()
	--刷新可接任务
	self:FlushCanAcceptTask(true)
end
function CTaskSystem:GetRefreshValue(dwIndex)
	local objPlayer = self:GetPlayer()
	local sysRefresh = objPlayer:GetSystem("CRefreshSystem")
	return sysRefresh:GetData(dwIndex) or 0
end

function CTaskSystem:SetRefreshValue(dwIndex,dwValue)
	local objPlayer = self:GetPlayer()
	local sysRefresh = objPlayer:GetSystem("CRefreshSystem")
	return sysRefresh:SetData(dwIndex,dwValue)
end

function CTaskSystem:AddRefreshValue(dwIndex)
	local dwValue = self:GetRefreshValue(dwIndex) + 1
	self:SetRefreshValue(dwIndex,dwValue)
	return dwValue
end
--------------------------------------
--获取任务信息
function CTaskSystem:GetTask(dwTaskId)
	return self.Tasks[dwTaskId]
end
--获取接受任务列表和完成任务列表
function CTaskSystem:GetTaskList()
	return self.Accept,self.Complete
end
--给予章节奖励
function CTaskSystem:GiveChapterReward(dwChapterId)
	self:AddAttr()
end
--给予风云奖励
function CTaskSystem:GiveWeeklyReward()
	local objPlayer = self:GetPlayer()
	if not objPlayer then return end;
	local Info = TaskFun:GetWeeklyRewardSP(self.dwDailyLoop or 1,self.dwWeeklyLoop or 1,objPlayer:GetLevel() or 1)
	local dwMoney = Info.dwMoney
	local dwExp = Info.dwExp
	local dwPneuma = Info.dwPneuma
	local dwCash = Info.dwCash
	local dwXiayi= Info.dwXiayi 
	local objPlayer = self:GetPlayer()
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	local sysItem = objPlayer:GetSystem("CItemSystem");
	local sysFiveElem = objPlayer:GetSystem("CFiveElemSystem");
	--加游戏币
	if dwMoney and dwMoney ~= 0 then
		sysItem:AddPacketMoney(dwMoney, _G.ItemSysOperType.GiveWeeklyReward);
	end;
	--加经验
	objPlayer:AddExp(dwExp)
	--加真气
	sysFiveElem:ChangeAttrAll(dwPneuma,  _G.FiveElemSysOperType.GiveWeeklyReward)
	--加礼金
	if dwCash and dwCash ~= 0 then
		sysItem:AddBindGold(dwCash, _G.ItemSysOperType.TaskReward);
	end;
	--加侠义值
	local sysErrant = objPlayer:GetSystem("CErrantHonorSystem");
	if dwXiayi and dwXiayi~=0 then
		sysErrant:AddErrantHonorValue(dwXiayi);
	end
	local Item = Info.Item
	for k,v in pairs(Item) do
		if sysScript:AddPackItem(v.dwId,v.dwNum,v.dwBind) then
			Item[k] = nil;
		end
	end
	local SendItem = {}
	for k,v in pairs(Item) do
		local oitem = SItemMessage:new();
		oitem.dwItemEnum = v.dwId
		oitem.dwItemNumber =  v.dwNum
		oitem.dwBindType = v.dwBind
		oitem.dwLifeTime = -1;
		table.insert( SendItem, oitem );
	end
	
	
	if #SendItem>0 then
		local objMail = CMail:new()
		-- local Item = {}
		-- local oitem = SItemMessage:new();
		-- oitem.dwItemEnum = dwItemId
		-- oitem.dwItemNumber =  1
		-- oitem.dwBindType = enItemBindType.eYes
		-- oitem.dwLifeTime = -1;
		-- table.insert( Item, oitem );
		objMail:SetSender( -10086, WeeklyPanelConfig.szSender )
		objMail:SetContent( WeeklyPanelConfig.szTitle, WeeklyPanelConfig.szBody );
		objMail:SetAccessory( 0, 0, 0, SendItem );
		sysScript:SendMail(objMail)
	end
end
--任务增加属性
function CTaskSystem:AddAttr()
	local dwTaskId = self:GetMainTask()
	if self.dwLastMain == 0 then
		return
	end
	local dwChapterId,dwIndex,dwMax = self:GetChapterId(dwTaskId)
	if not dwChapterId then
		dwChapterId = #TaskChapterConfig + 1
	end;
	local SingleAttrChange = SSingleAttrChange:new()
	for i=1,dwChapterId-1 do
		local cfg = CTaskManager.Chapter.Reward[i]
		if not cfg then return end
		--TaskChapterConfig[i].Reward
		for k,v in pairs(cfg) do
			SingleAttrChange[k] = SingleAttrChange[k] + v
		end
	end
	local objPlayer = self:GetPlayer()
	if not objPlayer then return end;
	local sysSkill = objPlayer:GetSystem("CSkillSystem")
	sysSkill:NotifyTaskUpdate(SingleAttrChange)
end
--获取上一个完成的主线
function CTaskSystem:GetLastMainTask()
	local lastTaskId=0
	local taskId=1001;
	while taskId~=nil do
		if self.Complete[taskId] then
			lastTaskId=taskId;		
		end
		taskId=CTaskManager.Chapter.Tasks[taskId].Next
	end
	return lastTaskId;
end
--获取正在进行的主线
function CTaskSystem:GetMainTask()
	return CTaskManager:GetNextMain(self.dwLastMain)
	--[[
	for dwTaskId,Task in pairs(self.Accept) do
		if Task:GetTaskType()==TaskTypeConfig.Principal then
			return dwTaskId
		end
	end
	
	for dwTaskId,cfgTask in pairs(TaskConfig) do
		if (cfgTask._type == TaskTypeConfig.Principal) then
			if (self:CheckForAcceptList(dwTaskId)==6) or (self:CheckForAcceptList(dwTaskId)==7) then
				return dwTaskId
			end
		end
	end
	--]]
end
--根据任务id获得任务所在章节
function CTaskSystem:GetChapterId(dwTaskID)
	return CTaskManager:GetChapterId(dwTaskID)
end
----------------------------------------
--检查某个任务能否放入可接列表
function CTaskSystem:CheckForAcceptList(dwTaskId)
	local Task = self.Accept[dwTaskId]
	if Task then
		return 0
	end
	
	Task = self.Complete[dwTaskId]
	if Task then
		if Task.CFG.repeat_type==0 then
			return 1
		elseif Task.CFG.repeat_times<=Task.Record.dwCompleteTimes then
			return 2
		end
	end
	if not TaskConfig[dwTaskId] then
		return 3
	elseif TaskConfig[dwTaskId].repeat_accept==0 then
		if self.Tasks[dwTaskId] then
			return 4;
		end
	end
	local dwNeedLevel = TaskConfig[dwTaskId].need_lv
	local dwNeedTaskId = TaskConfig[dwTaskId].need_task
	local dwNeedSp = TaskConfig[dwTaskId].need_sp or 0
	local objPlayer = self:GetPlayer()
	local dwMyLevel = objPlayer:GetInfo().dwLevel or 1
	if (dwNeedTaskId~=0) and (not self.Complete[dwNeedTaskId]) then--前置任务未完成
		return 5
	end
	if dwNeedSp > 0 then
		if not TaskFun:CheckSpNeed(objPlayer,dwNeedSp) then
			return 8
		end
	end
	if dwNeedLevel > dwMyLevel then--等级不足
		return 6
	end
	
	
	return 7
end
--检查能否接受某任务
function CTaskSystem:CheckForAccept(dwTaskId)
	local objPlayer = self:GetPlayer()
	if self.dwTaskNum == self.dwTaskNumMax then
		-- print("task num full")
		--任务已达上限
		objPlayer.TaskAcceptFailInfoMsg{DwTaskId=dwTaskId,DwInfoType=TaskAcceptFailType.MaxNum}
		return false
	end
	
	local Task = self.Tasks[dwTaskId]
	--日环
	if (TaskConfig[dwTaskId]._type == TaskTypeConfig.Daily) then
		return true
	--周环
	elseif (TaskConfig[dwTaskId]._type == TaskTypeConfig.Weekly) then
		if self.dwDailyLoop > 20 then
			-- print("ERR Weekly Task Num",objPlayer:GetRoleID())
			return false;
		end
		return true;
	end
	
	if Task then
		if ((Task:GetTaskState()==TaskStateConfig.Accept) or (Task:GetTaskState()==TaskStateConfig.Done)) then
			-- print("task already accept")
			--任务已接受
			objPlayer.TaskAcceptFailInfoMsg{DwTaskId=dwTaskId,DwInfoType=TaskAcceptFailType.AlreadyHave}
			return false
		elseif Task:GetTaskState()== TaskStateConfig.Complete then
			-- print("task already complete")
			if (Task.CFG.repeat_type==0) then
				--任务已完成
				return false;
			elseif (Task.CFG.repeat_times<=Task.Record.dwCompleteTimes) then
				--任务已完成
				return false
			end
		elseif (Task.CFG.repeat_accept==0) then
			-- print("task already accept once")
			--任务不可重复接受（只能接受一次，无论有没有完成）
			objPlayer.TaskAcceptFailInfoMsg{DwTaskId=dwTaskId,DwInfoType=TaskAcceptFailType.AcceptOnce}
			return false
		end
	end
	if not CTaskManager.Tasks[dwTaskId] then
		-- print("task no exist")
		--任务不存在
		objPlayer.TaskAcceptFailInfoMsg{DwTaskId=dwTaskId,DwInfoType=TaskAcceptFailType.Error}
		return false
	end
	local AcceptConditions = CTaskManager.Tasks[dwTaskId]:CheckAcceptCondition()
	if AcceptConditions.dwLevel > 0 then
		local dwMylevel = self:GetPlayer():GetInfo().dwLevel
		if dwMylevel<AcceptConditions.dwLevel then
			-- print("task level down")
			--等级不足
			objPlayer.TaskAcceptFailInfoMsg{DwTaskId=dwTaskId,DwInfoType=TaskAcceptFailType.LowLevel}
			return false
		end
	end
	if AcceptConditions.dwTask > 0 then
		if (not self.Tasks[AcceptConditions.dwTask]) or (self.Tasks[AcceptConditions.dwTask]:GetTaskState()~=TaskStateConfig.Complete) then
			-- print("task need task :",AcceptConditions.dwTask)
			if self.Tasks[AcceptConditions.dwTask] then
				-- print("task state:",self.Tasks[AcceptConditions.dwTask]:GetTaskState())
			end
			--前置任务未完成
			objPlayer.TaskAcceptFailInfoMsg{DwTaskId=dwTaskId,DwInfoType=TaskAcceptFailType.NoTask}
			return false
		end
	end
	if AcceptConditions.dwItem > 0 then
		local sysItem = objPlayer:GetSystem("CItemSystem");
		local dwItemType = CheckItemType(AcceptConditions.dwItem)
		local dwCounts;
		if dwItemType==1 then
			dwCounts, _, _ = sysItem:GetEnumItemNumInTaskRoom(AcceptConditions.dwItem);
		elseif dwItemType==2 then
			dwCounts, _, _ = sysItem:GetEnumItemNumInPacket(AcceptConditions.dwItem);
		end
		if dwCounts < 1 then--无接任务所需物品
			-- print("task need item :",AcceptConditions.dwItem)
			objPlayer.TaskAcceptFailInfoMsg{DwTaskId=dwTaskId,DwInfoType=TaskAcceptFailType.NoItem}
			return false;
		end
	end
	if AcceptConditions.dwGiveItem > 0 then
		local sysItem = objPlayer:GetSystem("CItemSystem");
		local dwItemEnum = AcceptConditions.dwGiveItem
		local dwItemType = CheckItemType(dwItemEnum)
		local dwItemNumber = AcceptConditions.dwGiveNum
		local dwBindType = enItemBindType.eYes
		local bRoom = false
		if dwItemType==1 then
			bRoom = true;
		elseif dwItemType==2 then
			bRoom = sysItem:IsEnumItemListCanAddToPacket({{dwItemEnum=dwItemEnum,dwItemNumber=dwItemNumber,dwBindType=dwBindType}} )
		end
		if bRoom ~= true then
			-- print("task need room")
			--背包空间不足
			objPlayer.TaskAcceptFailInfoMsg{DwTaskId=dwTaskId,DwInfoType=TaskAcceptFailType.NoRoom}
			return false
		end
	end
	return true
end
--检查能否完成某任务
function CTaskSystem:CheckForComplete(dwTaskId)
	local Task = self.Accept[dwTaskId]
	local objPlayer = self:GetPlayer()
	local sysItem = objPlayer:GetSystem("CItemSystem");
	local sysScript = objPlayer:GetSystem("CScriptSystem");
	if not Task then
		--无此任务
		objPlayer.TaskCompleteFailInfoMsg{DwTaskId=dwTaskId,DwInfoType=TaskCompleteFailType.NoTask}
		return false
	end
	if Task:GetTaskState()== TaskStateConfig.Complete then
		return false
	end
	if not Task:CheckCompleteCondition() then
		--未满足完成条件
		objPlayer.TaskCompleteFailInfoMsg{DwTaskId=dwTaskId,DwInfoType=TaskCompleteFailType.NoDone}
		self:SendUpdateTask(dwTaskId)
		return false
	end
	if Task:GetTaskState()~=TaskStateConfig.Done then
		--未满足完成条件
		objPlayer.TaskCompleteFailInfoMsg{DwTaskId=dwTaskId,DwInfoType=TaskCompleteFailType.NoDone}
		self:SendUpdateTask(dwTaskId)
		return false
	end
	
	--侠义任务
	if Task:GetTaskType() == TaskTypeConfig.chongfu then
		if self:GetRefreshValue(dwChongFu)>= TaskChongFuConfig.dwChongFuLimit then 
			sysScript:Notice(9000110030)
			return false;
		end
	end
	
	--活动任务
	if Task:GetTaskType() == TaskTypeConfig.huodong then
		if self:GetRefreshValue(dwHuoDong)>= TaskChongFuConfig.dwHuoDongLinit then 
			sysScript:Notice(9000110042)
			return false;
		end
	end
	
	local Item = Task:GetCount().Item
	local objPlayer = self:GetPlayer()
	local sysScript = objPlayer:GetSystem("CScriptSystem");
	for _,Info in pairs(Item) do
		if Info.dwId>0 and Info.dwMax>0 then
			local dwItemId = Info.dwId
			local dwNum = Info.dwMax
			if sysScript:GetItemNumTask(dwItemId) < dwNum then
				sysScript:Notice(9000110031)
				return false
			end
		end
	end
	
	local dwLevel = objPlayer:GetInfo().dwLevel
	local Reward = Task:GetReward(self.dwWeeklyLoop,self.dwDailyLoop,self.dwNowLoop,dwLevel)
	local tbItemPackTable = {}
	local tbItemTaskTable = {}
	for _,Info in pairs(Reward.Item) do
		if (Info.dwId and Info.dwId>0) and (Info.dwNum and Info.dwNum>0) then
			local dwItemEnum = Info.dwId
			local dwItemType = CheckItemType(dwItemEnum)
			local dwItemNumber = Info.dwNum
			local dwBindType = enItemBindType.eYes
			if dwItemType==1 then
				table.insert(tbItemTaskTable,{dwItemEnum=dwItemEnum,dwItemNumber=dwItemNumber,dwBindType=dwBindType})
			elseif dwItemType==2 then
				table.insert(tbItemPackTable,{dwItemEnum=dwItemEnum,dwItemNumber=dwItemNumber,dwBindType=dwBindType})
			end
		end
	end
	local dwProf = objPlayer:GetInfo().dwProf
	local ProfItem = Reward.ProfItem
	if ProfItem then
		for k,v in pairs(ProfItem) do
			local dwId = v.dwId
			local dwNum = v.dwNum
			if dwId>0 then
				local cfg = GiftConfig.PropConfig[dwId]
				if cfg then
					local dwItemEnum = cfg.ProfEquipEnum[dwProf]
					local dwItemType = CheckItemType(dwItemEnum)
					local dwItemNumber = dwNum
					local dwBindType = enItemBindType.eYes
					if dwItemType==1 then
						table.insert(tbItemTaskTable,{dwItemEnum=dwItemEnum,dwItemNumber=dwItemNumber,dwBindType=dwBindType})
					elseif dwItemType==2 then
						table.insert(tbItemPackTable,{dwItemEnum=dwItemEnum,dwItemNumber=dwItemNumber,dwBindType=dwBindType})
					end
				end
			end
		end
	end
	local bRoomPack = sysItem:IsEnumItemListCanAddToPacket(tbItemPackTable)
	local bRoomTask = true;
	if (bRoomPack~= true) or (bRoomTask~= true) then
		--背包空间不足
		--objPlayer.TaskCompleteFailInfoMsg{DwTaskId=dwTaskId,DwInfoType=TaskCompleteFailType.NoRoom}
		self.bSendMail = true;
		return true
	end
	return true
end
--检查能否放弃某任务
function CTaskSystem:CheckForDoff(dwTaskId)
	local Task = self.Accept[dwTaskId]
	local objPlayer = self:GetPlayer()
	if not Task then
		--无此任务
		objPlayer.TaskDoffFailInfoMsg{DwTaskId=dwTaskId,DwInfoType=TaskDoffFailType.NoTask}
		return false
	end
	
	if (Task:GetTaskState()~=TaskStateConfig.Accept) and (Task:GetTaskState()~=TaskStateConfig.Done) then
		--无此任务
		objPlayer.TaskDoffFailInfoMsg{DwTaskId=dwTaskId,DwInfoType=TaskDoffFailType.NoTask}
		return false
	end
	
	if TaskConfig[Task:GetId()].cancer and TaskConfig[Task:GetId()].cancer~=0 then
		--任务无法放弃
		objPlayer.TaskDoffFailInfoMsg{DwTaskId=dwTaskId,DwInfoType=TaskDoffFailType.NoDoff,TextId=TaskConfig[Task:GetId()].cancer}
		return false
	end
	return true
end
--检查任务进展(接受任务时执行,主要是检查物品)
function CTaskSystem:CheckTaskProgress(dwTaskId)
	local Task = self:GetTask(dwTaskId)
	local bDone = true
	local Count = Task:GetCount()
	local objPlayer = self:GetPlayer()
	local sysItem = objPlayer:GetSystem("CItemSystem");
	local bNeedUpdate = false
	for dwType,tbChile in pairs(Count) do
		for dwPos,tbInfo in pairs(tbChile) do
			if dwType == "Item" then
				local dwItemType = CheckItemType(tbInfo.dwId)
				local AllNum = 0;
				if dwItemType == 1 then
					AllNum = sysItem:GetEnumItemNumInTaskRoom(tbInfo.dwId);
				elseif dwItemType == 2 then
					AllNum = sysItem:GetEnumItemNumInPacket(tbInfo.dwId);
				end
				if AllNum > tbInfo.dwMax then
					AllNum = tbInfo.dwMax
				end
				if AllNum > 0 then
					self:NotifyItemAdded(tbInfo.dwId,AllNum)
				end
			end
			if dwType == "Special" then
				local dwTypeId = tbInfo.dwId
				--加点
				if dwTypeId == TaskSpNeed.SetPoint then
					local sysSkill = objPlayer:GetSystem("CSkillSystem")
					local Info = sysSkill:GetInfo()
					if Info.dwPoint == 0 then
						self:OnEventCenter("EventSetPoint",1)
					end
				--装备武器
				elseif dwTypeId == TaskSpNeed.UseWeapon then
					local sysItem = objPlayer:GetSystem("CItemSystem")
					if sysItem:GetWornEquipNum() > 0 then
						self:OnEventCenter("EventUseWeapon", sysItem:GetWornEquipNum())
					end
				--经脉
				elseif dwTypeId == TaskSpNeed.EventPulseUp then
					local sysPulse = objPlayer:GetSystem("CPulseSystem")
					if sysPulse:GetPulseTotalNum() > 0 then
						self:OnEventCenter("EventPulseUp",sysPulse:GetPulseTotalNum())
					end
				--五行
				elseif dwTypeId == TaskSpNeed.ElementUp then
					local sysFiveElem = objPlayer:GetSystem("CFiveElemSystem")
					if sysFiveElem:ForTaskNeedGetLv() > 0 then
						self:OnEventCenter("EventElementUp",1)
					end
				--充值
				elseif dwTypeId == TaskSpNeed.EventCharge then
					local sysItem =  objPlayer:GetSystem("CItemSystem")
					if sysItem:GetGoldNum()>0 then
						self:OnEventCenter("EventCharge",sysItem:GetGoldNum())
					end
				--升级
				elseif dwTypeId == TaskSpNeed.EventLevelUp then
					local dwLevel = objPlayer:GetLevel()
					self:OnEventCenter("EventLevelUp",dwLevel)
				--加好友
				elseif dwTypeId == TaskSpNeed.FriendAdd then
					local sysFriend = objPlayer:GetSystem("CFriendSystem")
					local dwNum = sysFriend:GetFriendCount()
					if dwNum > 0 then
						self:OnEventCenter("EventAddFriend",dwNum)
					end
				--宝甲阶数
				elseif dwTypeId == TaskSpNeed.EventUpgradeAmulet then
					local sysAmulet = objPlayer:GetSystem("CAmuletSystem")
					if (sysAmulet:GetLevel() or 0) > 1 then
						self:OnEventCenter("EventUpgradeAmulet",sysAmulet:GetLevel())
					end
				--宝甲成长度
				elseif dwTypeId == TaskSpNeed.EventIntenAmulet then
					local sysAmulet = objPlayer:GetSystem("CAmuletSystem")
					if (sysAmulet:GetGrowth() or 0) > 0 then
						self:OnEventCenter("EventIntenAmulet",sysAmulet:GetGrowth())
					end
				--坐骑升阶
				elseif dwTypeId == TaskSpNeed.EventMountUpGrade then
					local sysMount = objPlayer:GetSystem("CMountSystem")
					if sysMount:GetMaxMountGrade() > 1 then
						self:OnEventCenter("EventMountUpGrade",sysMount:GetMaxMountGrade())
					end
				end
			end
			if tbInfo.dwMax > tbInfo.dwNow then
				bDone = false
			end
		end
	end
	if (bDone== true) and (Task:GetTaskState()~=TaskStateConfig.Done) then
		Task:SetTaskState(TaskStateConfig.Done)
		self:SendUpdateTask(dwTaskId)
	end
end
--检查任务进展(任务更新时执行)
function CTaskSystem:CheckTaskProgressOnUpdate(dwTaskId)
	local Task = self:GetTask(dwTaskId)
	if not self.Accept[dwTaskId] then return false end;
	local bDone = true
	local Count = Task:GetCount()
	local objPlayer = self:GetPlayer()
	local sysItem = objPlayer:GetSystem("CItemSystem");
	local bNeedUpdate = false
	for dwType,tbChile in pairs(Count) do
		for dwPos,tbInfo in pairs(tbChile) do
			if tbInfo.dwMax > tbInfo.dwNow then
				bDone = false
			end
		end
	end
	if bDone== true then
		Task:SetTaskState(TaskStateConfig.Done)
	else
		Task:SetTaskState(TaskStateConfig.Accept)
	end
	return bDone
end
--刷新可接任务
function CTaskSystem:FlushCanAcceptTask(bSend)

	-- self.ChongFuTaskCount=0
	-- for k,v in pairs(self.Tasks) do
		-- if v:GetTaskType()==TaskTypeConfig.chongfu and v.Record and v.Record.dwCompleteTimes>0 then
			-- self.ChongFuTaskCount=self.ChongFuTaskCount+1
			-- self.ChongFuTaskIds[v:GetId()]=true;
		-- end
	-- end

	local delTask = {}
	local addTask = {}
	local dwNextMain = self:GetMainTask()
	for dwTaskId,Task in pairs(self.CanAccept) do
		if self:CheckForAcceptList(dwTaskId)~=7 then
			table.insert(delTask,dwTaskId)
		end
		self.CanAccept[dwTaskId] = nil
	end
	for dwTaskId,cfgTask in pairs(CTaskManager:GetCheckTask()) do
		if not self.CanAccept[dwTaskId] then
			if self:CheckForAcceptList(dwTaskId)==7 then
				if cfgTask.auto_accept == 1 and dwTaskId~=1001 then
					self:RcvAcceptTask(dwTaskId)
					return;
				elseif cfgTask._type==TaskTypeConfig.Principal and dwTaskId ~= dwNextMain then
					self.CanAccept[dwTaskId]=nil
				else
					table.insert(addTask,dwTaskId)
					self.CanAccept[dwTaskId] = true
				end
			-- elseif self:CheckForAcceptList(dwTaskId)==6 and (cfgTask._type == TaskTypeConfig.Principal) then
				-- dwNextMain = dwTaskId
			end
		end
	end
	if (not self:CheckForAcceptList(dwNextMain)==6) or self.Accept[dwNextMain] then
		dwNextMain = 0
	end
	if bSend then
		self:SendChongFuInfo()--发送侠义重复任务次数信息
		self:SendCanAcceptInfo(addTask,delTask,dwNextMain)
	end
end
--是否有接受日环任务
function CTaskSystem:IsAcceptDaily()
	for dwTaskId,Task in pairs(self.Accept) do
		if Task.CFG._type == TaskTypeConfig.Daily then
			return dwTaskId
		end
	end
	return 0
end

--是否有接受周环任务
function CTaskSystem:IsAcceptWeekly()
	local Task = self.Accept[self.dwNowLoopTaskId]
	if Task then
		return self.dwNowLoopTaskId
	else
		return 0
	end
	return 0
end
--周环环数更新检查
function CTaskSystem:CheckWeeklyLoop(dwTaskId)
	self.dwWeeklyLoop = self.dwWeeklyLoop + 1
	if CTimeFormat:isToday(self.dwLoopUpdateTime) then
		self.dwDailyLoop = self.dwDailyLoop + 1
	else
		self.dwDailyLoop = 1			--日环环数
		if not CTimeFormat:isThisWeek(self.dwLoopUpdateTime) then
			self.dwWeeklyLoop = 1			--周环环数
		end
	end
	
	self.dwNowLoop = self.dwNowLoop+1		--当前环数
	if self.dwNowLoop>8 then
		self.dwNowLoop = 1
	end
	self.dwNowLoopTaskId = dwTaskId		--当前环任务id
	self.dwLoopUpdateTime = GetCurTime()
	self:DBExWrite()
end
----------------------------------------
--接受任务
function CTaskSystem:DoAccept(dwTaskId,dwStarLevel)
	local dwAcceptTimes = 0
	local dwCompleteTimes = 0
	local dwLoopId = 0
	local dwQuality = dwStarLevel or 0
	local bDBState = false
	if TaskConfig[dwTaskId]._type==TaskTypeConfig.Weekly then
		self:CheckWeeklyLoop(dwTaskId)
		dwLoopId = self.dwNowLoop
	end
	
	if self.Tasks[dwTaskId] then
		bDBState = true
		dwAcceptTimes = self.Tasks[dwTaskId]:GetAcceptTimes()
		dwCompleteTimes = self.Tasks[dwTaskId]:GetCompleteTimes()
	end
	local Task = CTaskManager:GetTaskForAccept(dwTaskId)
	if not Task then return end;
	
	if self.Tasks[dwTaskId] then
		Task.Record=self.Tasks[dwTaskId].Record
	end
	
	local dwLevel = self:GetPlayer():GetInfo().dwLevel

	Task:AcceptTask(dwAcceptTimes,dwCompleteTimes,dwLevel,dwLoopId,dwQuality)
	
	self.Tasks[Task:GetId()] = Task
	self.Accept[Task:GetId()] = Task
	self.Complete[Task:GetId()] = nil
	
	self.dwTaskNum = self.dwTaskNum + 1
	
	if bDBState then
		self:DBUpdate(dwTaskId)
	else
		self:DBInsert(dwTaskId)
	end
	
	self:SendAcceptTask(Task:GetId())
	local AcceptCondition = Task:CheckAcceptCondition()
	if AcceptCondition.dwGiveItem>0 and AcceptCondition.dwGiveNum>0 then
		local objPlayer = self:GetPlayer()
		local sysItem = objPlayer:GetSystem("CItemSystem");
		local cfg = EquipBaseData[AcceptCondition.dwGiveItem] or OtherBaseData[AcceptCondition.dwGiveItem]
		local dwItemType = CheckItemType(AcceptCondition.dwGiveItem)
		if dwItemType == 1 then-----是否是任务物品
			local addItemList = {};
			local tempTable = {
				dwItemEnum	= AcceptCondition.dwGiveItem;
				dwItemNumber= AcceptCondition.dwGiveNum;
				dwBindType	= enItemBindType.eYes;
			};
			table.insert(addItemList, tempTable);
			sysItem:AddEnumItemListToTaskRoom(addItemList, _G.ItemSysOperType.TaskReward)
		elseif dwItemType== 2 then
			local addItemList = {};
			local tempTable = {
				dwItemEnum	= AcceptCondition.dwGiveItem;
				dwItemNumber= AcceptCondition.dwGiveNum;
				dwBindType	= enItemBindType.eYes;
			};
			table.insert(addItemList, tempTable);
			sysItem:AddEnumItemListToPacket(addItemList, _G.ItemSysOperType.TaskReward)
		end
		self:FlyItem(AcceptCondition.dwGiveItem)
	end
	self:GetPlayer():GetSystem("CPlayerEventCenterSystem"):DoEvent(enumPlayerEventType.EventAcceptTask,1,dwTaskId,TaskConfig[dwTaskId]._type);
	self:CheckTaskProgress(dwTaskId)
end
--完成任务
function CTaskSystem:DoComplete(dwTaskId,bNoReward)
	local dwLevel = self:GetPlayer():GetInfo().dwLevel
	--print("CTaskSystem:DoComplete",dwTaskId)
	if not dwTaskId then return end;
	if not self.Tasks[dwTaskId] then return end;
	local Item = self.Tasks[dwTaskId]:GetCount().Item
	local Reward = self.Tasks[dwTaskId]:GetReward(self.dwWeeklyLoop,self.dwDailyLoop,self.dwNowLoop,dwLevel)
	
	self.Tasks[dwTaskId]:CompleteTask(dwLevel)
	self.Accept[dwTaskId] = nil
	self.Complete[dwTaskId] = self.Tasks[dwTaskId]
	
	local objPlayer = self:GetPlayer()
	local sysItem = objPlayer:GetSystem("CItemSystem");
	local sysScript = objPlayer:GetSystem("CScriptSystem");
	for _,Info in pairs(Item) do
		if Info.dwId>0 and Info.dwMax>0 then
			local dwItemId = Info.dwId
			local dwNum = Info.dwMax
			--[[
			local dwItemType = CheckItemType(dwItemId)
			local PackId = 0
			if dwItemType==1 then
				PackId = enItemPosition.eTaskRoom
			elseif dwItemType==2 then
				PackId = enItemPosition.ePacket
			end
			if PackId == enItemPosition.ePacket then
				sysItem:DelEnumItemInPacket(dwItemId, dwNum, false, _G.ItemSysOperType.TaskDel);
			elseif PackId == enItemPosition.eTaskRoom then
				sysItem:DelEnumItemInTaskRoom(dwItemId, dwNum, false, _G.ItemSysOperType.TaskDel);
			end;
			--]]
			sysScript:DelItemTask(dwItemId,dwNum)
		end
	end
	local AcceptCondition = self.Tasks[dwTaskId]:CheckAcceptCondition()
	if AcceptCondition.dwGiveItem>0 and AcceptCondition.dwGiveNum>0 then
		sysItem:DelEnumItemInTaskRoom(AcceptCondition.dwGiveItem, AcceptCondition.dwGiveNum, false, _G.ItemSysOperType.TaskDel)
	end
	
	self.dwTaskNum = self.dwTaskNum - 1
	if not bNoReward then
		self:DoReward(dwTaskId,Reward)
		self:SendCompleteTask(dwTaskId)
	end
	if self.Tasks[dwTaskId].CFG._type == TaskTypeConfig.Daily then
		self:GetPlayer():GetSystem("CPlayerEventCenterSystem"):DoEvent(enumPlayerEventType.EventCompleteDailyTask,1,dwTaskId,self.Tasks[dwTaskId].CFG._type);
	elseif self.Tasks[dwTaskId].CFG._type == TaskTypeConfig.Weekly then
		self:GetPlayer():GetSystem("CPlayerEventCenterSystem"):DoEvent(enumPlayerEventType.EventCompleteWeeklyTask,1,dwTaskId,self.Tasks[dwTaskId].CFG._type);
		if self.Tasks[dwTaskId].Record.dwLoopId == 8 and not bNoReward then
			self:GiveWeeklyReward()
		end
	elseif self.Tasks[dwTaskId].CFG._type == TaskTypeConfig.Principal then
		self.dwLastMain = dwTaskId
		--[[
		local dwChapterId,dwIndex,dwMax = self:GetChapterId(dwTaskId)
		if dwIndex==dwMax then
			self:GiveChapterReward(dwChapterId)
		end
		--]]
		local Info = CTaskManager.Chapter.Tasks[dwTaskId]
		if Info then
			if Info.Last then
				self:GiveChapterReward(Info.Chapter)
			end
		end
	elseif self.Tasks[dwTaskId].CFG._type == TaskTypeConfig.Branch then
		self:GetPlayer():GetSystem('CPlayerEventCenterSystem'):DoEvent(enumPlayerEventType.EventBranch,1)
	elseif self.Tasks[dwTaskId].CFG._type == TaskTypeConfig.chongfu then
		self:AddRefreshValue(dwChongFu)
	elseif self.Tasks[dwTaskId].CFG._type == TaskTypeConfig.huodong then
		self:AddRefreshValue(dwHuoDong)
	end
	self:GetPlayer():GetSystem("CPlayerEventCenterSystem"):DoEvent(enumPlayerEventType.EventCompleteTask,1,dwTaskId,self.Tasks[dwTaskId].CFG._type);
end
--放弃任务
function CTaskSystem:DoDoff(dwTaskId)
	local objPlayer = self:GetPlayer()
	local sysItem = objPlayer:GetSystem("CItemSystem");
	
	self.Tasks[dwTaskId]:DoffTask()
	self.Accept[dwTaskId] = nil
	
	self.dwTaskNum = self.dwTaskNum - 1
	local AcceptCondition = self.Tasks[dwTaskId]:CheckAcceptCondition()
	if AcceptCondition.dwGiveItem>0 and AcceptCondition.dwGiveNum>0 then
		sysItem:DelEnumItemInTaskRoom(AcceptCondition.dwGiveItem, AcceptCondition.dwGiveNum, false, _G.ItemSysOperType.TaskDel)
	end
	local Item = self.Tasks[dwTaskId]:GetCount().Item
	if Item then
		for _,Info in pairs(Item) do
			if Info.dwId>0 and Info.dwMax>0 then
				local dwItemId = Info.dwId
				local dwNum = Info.dwMax
				local dwItemType = CheckItemType(dwItemId)
				if dwItemType==1 then
					sysItem:DelEnumItemInTaskRoom(dwItemId, dwNum, false, _G.ItemSysOperType.TaskDel);
				end
			end
		end
	end
	self:SendDoffTask(dwTaskId)
	self:GetPlayer():GetSystem("CPlayerEventCenterSystem"):DoEvent(enumPlayerEventType.EventDoffTask,1,dwTaskId);
end

--给予任务奖励
function CTaskSystem:DoReward(dwTaskId,Reward)
	local Task = self.Tasks[dwTaskId]
	local objPlayer = self:GetPlayer()
	local dwLevel = objPlayer:GetInfo().dwLevel
	--local Reward = Task:GetReward(self.dwWeeklyLoop,self.dwDailyLoop,self.dwNowLoop,dwLevel)
	----------------------------
	--奖励
	----------------------------
	local sysItem = objPlayer:GetSystem("CItemSystem");
	local sysFiveElem = objPlayer:GetSystem("CFiveElemSystem");
	local sysScript = objPlayer:GetSystem("CScriptSystem");
	local sysErrant = objPlayer:GetSystem("CErrantHonorSystem");
	--加游戏币
	if Reward.dwMoney ~= 0 then
		sysItem:AddPacketMoney(Reward.dwMoney, _G.ItemSysOperType.TaskReward);
	end;
	--加经验
	objPlayer:AddExp(Reward.dwExp)
	--加真气
	sysFiveElem:ChangeAttrAll(Reward.dwPneuma,   _G.FiveElemSysOperType.DoReward)
	
	--加侠义值
	if Reward.dwXiayi then
		sysErrant:AddErrantHonorValue(Reward.dwXiayi);
	end
	
	--
	--飞图标记录
	local FlyItem = {}
	--加物品
	local tabAddPackList = {}
	local tabAddTaskList = {}
	for _,Info in pairs(Reward.Item) do
		if (Info.dwId and Info.dwId>0) and (Info.dwNum and Info.dwNum>0) then
	
			local dwItemEnum = Info.dwId
			local dwItemNumber = Info.dwNum
			local dwBindType = enItemBindType.eYes
			
			local dwItemType = CheckItemType(Info.dwId)
			if dwItemType==1 then
				table.insert(tabAddTaskList,{dwItemEnum=dwItemEnum,dwItemNumber=dwItemNumber,dwBindType=dwBindType})
			elseif dwItemType==2 then
				table.insert(tabAddPackList,{dwItemEnum=dwItemEnum,dwItemNumber=dwItemNumber,dwBindType=dwBindType})
			end
			table.insert(FlyItem,Info.dwId)
		end
	end
	local dwProf = objPlayer:GetInfo().dwProf
	local ProfItem = Reward.ProfItem
	if ProfItem then
		for k,v in pairs(ProfItem) do
			local dwId = v.dwId
			local dwNum = v.dwNum
			if dwId>0 then
				local cfg = GiftConfig.PropConfig[dwId]
				if cfg then
					local dwItemEnum = cfg.ProfEquipEnum[dwProf]
					local dwItemType = CheckItemType(dwItemEnum)
					local dwItemNumber = dwNum
					local dwBindType = enItemBindType.eYes
					local setProperty = cfg.PropList
					local dwLevel = cfg.dwStrongEnum
					if dwItemType==1 then
						table.insert(tabAddTaskList,{dwItemEnum=dwItemEnum,dwItemNumber=dwItemNumber,dwBindType=dwBindType,setProperty=setProperty,dwStrongLevel=dwLevel})
					elseif dwItemType==2 then
						table.insert(tabAddPackList,{dwItemEnum=dwItemEnum,dwItemNumber=dwItemNumber,dwBindType=dwBindType,setProperty=setProperty,dwStrongLevel=dwLevel,dwTianSheng=0})
					end
					table.insert(FlyItem,dwItemEnum)
				end
			end
		end
	end
	if #tabAddTaskList >0 then
		sysItem:AddEnumItemListToTaskRoom(tabAddTaskList, _G.ItemSysOperType.TaskReward)
	end
	if #tabAddPackList >0 then
		if self.bSendMail then
		
			sysScript:Notice(9000110032)
			
			local mail = CMail:new();
			mail:SetSender( -10086,SysStringConfigInfo[9000110033] or "9000110033" );
			mail:SetReceiver( objPlayer:GetRoleID(), objPlayer:GetName() or "" );
			mail:SetContent( SysStringConfigInfo[9000110034] or "9000110034",SysStringConfigInfo[9000110035] or "9000110035" );
			mail:SetLifeTime( 15*24*3600*1000 );
			mail:SetAccessory( 0, 0, 0, tabAddPackList )
			
			CMailManager:SendMail( mail );
		else
			sysItem:AddEnumItemListToPacket(tabAddPackList, _G.ItemSysOperType.TaskReward)
		end
	end
	self:FlyItemS(FlyItem)
end
----------------------------------------
-----------消息接收
----------------------------------------
--接受任务
function CTaskSystem:RcvAcceptTask(dwTaskId,dwQuality)
	--print("on recv accept task:",dwTaskId)
	if self:CheckForAccept(dwTaskId) then
		self:DoAccept(dwTaskId,dwQuality)
	else
		self:FlushCanAcceptTask(true)
	end
end
--完成任务
function CTaskSystem:RcvCompleteTask(dwTaskId)
	--------------------------------------
	if self:CheckForComplete(dwTaskId) then
		self:DoComplete(dwTaskId)
	end
	self.bSendMail = false;
end
--放弃任务
function CTaskSystem:RcvDoffTask(dwTaskId)
	if self:CheckForDoff(dwTaskId) then
		self:DoDoff(dwTaskId)
	end
end
--到达地点
function CTaskSystem:RcvRightPlace()
	local Player = self:GetPlayer()
	local sysScript = Player:GetSystem("CScriptSystem");
	local dwMapId,fPosX,fPosY = sysScript:GetMapPos()
	self:RcvMove(dwMapId,fPosX,fPosY)
end
--npc对话
function CTaskSystem:OnAskForTalkOver(dwTaskId,dwNpcId)
	local Task = self.Accept[dwTaskId]
	if Task then
		local cfg = Task.CFG
		if cfg.npc_need1~=dwNpcId then return end;
		if Task:GetTaskState() == TaskStateConfig.Accept then
			local dwItemNum = cfg.npc_item_num or 0
			if dwItemNum>0 then
				local objPlayer = self:GetPlayer()
				local sysScript = objPlayer:GetSystem("CScriptSystem")
				if not sysScript:DelItem(cfg.npc_item,cfg.npc_item_num) then
					sysScript:Notice(9000110014)
					return --物品数量不足
				end
			end
			self:OnNpcTalk(dwTaskId,dwNpcId)
		end
	end
end
----------------------------------------
--消息发送
----------------------------------------
--发送已接受任务与可接任务消息
function CTaskSystem:SendAllTaskInfo()
	--print("SEND----------------------+++++")
	local objPlayer = self:GetPlayer()
	local Tasks = self.Accept
	local sendTask = {}
	sendTask.dwTaskNum = self.dwTaskNum
	sendTask.Tasks = {}
	--已接
	for k,v in pairs(Tasks) do
		if (v.CFG.special_need1 == TaskSpNeed.EventCharge) and (v:GetTaskState()==TaskStateConfig.Accept) then
			local sysItem =  objPlayer:GetSystem("CItemSystem")
			if sysItem:GetGoldNum() > 0 then
				self:OnEventCenter("EventCharge",sysItem:GetGoldNum())
			end
		end
		local Task = v:GetSendInfo()
		table.insert(sendTask.Tasks,Task)
		if #sendTask.Tasks > 4 then
			objPlayer.TaskGetAcceptInfoMsg{TaskInfo=sendTask};
			sendTask.Tasks = {}
		end
	end

	if not self.Tasks[1001] then
		self:DoAccept(1001)
	elseif self.Tasks[1001]:GetTaskState()==TaskStateConfig.Accept then
		self:DoAccept(1001)
	end

	objPlayer.TaskGetAcceptInfoMsg{TaskInfo=sendTask};

	--可接
	local addTask = {}
	local delTask = {}
	local dwNextMain = self:GetMainTask()
	for k,v in pairs(self.CanAccept) do
		table.insert(addTask,k)
	end
	if self.CanAccept[dwNextMain] then
		dwNextMain = 0
	elseif self.Accept[dwNextMain] then
		dwNextMain = 0
	end
	--[[
	for dwTaskId,cfgTask in pairs(TaskConfig) do
		if not self.CanAccept[dwTaskId] then
			if self:CheckForAcceptList(dwTaskId)==6 and (cfgTask._type == TaskTypeConfig.Principal) then
				dwNextMain = dwTaskId
			end
		end
	end
	--]]
	self:SendCanAcceptInfo(addTask,delTask,dwNextMain)
	self:SendWeekInfo()
	--self:DoAccept(1013)
end
--发送周环任务信息
function CTaskSystem:SendWeekInfo()

	local objPlayer = self:GetPlayer()
	local sendInfo = {}
	sendInfo[1] = self.dwWeeklyLoop
	sendInfo[2] = self.dwDailyLoop
	sendInfo[3] = self.dwNowLoop
	sendInfo[4] = self.dwNowLoopTaskId
	
	objPlayer.TaskGetWeekInfoMsg{
		Info = sendInfo;
	}
end
--发送侠义.重复任务消息
function CTaskSystem:SendChongFuInfo()

	local objPlayer=self:GetPlayer();
	--[[
	local n=0;
	for k,v in pairs(self.Tasks) do
		if v:GetTaskType()==TaskTypeConfig.chongfu and v.Record and v.Record.dwCompleteTimes>0 then
			n=n+v.Record.dwCompleteTimes;
		end
	end
	--]]
	objPlayer.TaskGetChongFuMsg{
		ChongFu = self:GetRefreshValue(dwChongFu);
		HuoDong = self:GetRefreshValue(dwHuoDong);
	};
end


--发送可接任务消息
function CTaskSystem:SendCanAcceptInfo(addTask,delTask,dwNextMain)
	local objPlayer = self:GetPlayer()
	objPlayer.TaskGetCanAcceptInfoMsg{
		AddTask=CheckTable(addTask);
		DelTask=CheckTable(delTask);
		NextMain=dwNextMain;
		Daily=nil;
		Weekly = nil;
		Random = nil;
	}
	if not self.Accept[self.dwNowLoopTaskId] then
		local dwWeekly,dwQuality = self:GetNextWeeklyTask()
		if dwWeekly and (dwWeekly~=0) then
			self:RcvAcceptTask(dwWeekly,dwQuality)
		end
	end
end
--发送接受任务消息
function CTaskSystem:SendAcceptTask(dwTaskId)
	local Task = self.Tasks[dwTaskId]
	local sendInfo = Task:GetSendInfo()
	local objPlayer = self:GetPlayer()
	objPlayer.TaskAcceptTaskMsg{TbTask=sendInfo}
	self:DoTaskScript("cb_task_on_accept",Task)
	if Task:GetTaskType()==TaskTypeConfig.Weekly then
		self:SendWeekInfo()
	end
end
--发送完成任务消息
function CTaskSystem:SendCompleteTask(dwTaskId)
	local objPlayer = self:GetPlayer()
	objPlayer.TaskCompleteTaskMsg{DwTaskId=dwTaskId}
	self:DBUpdate(dwTaskId)
	self:DoTaskScript("cb_task_on_complete",self.Tasks[dwTaskId])
end
--发送放弃任务消息
function CTaskSystem:SendDoffTask(dwTaskId)
	local objPlayer = self:GetPlayer()
	objPlayer.TaskDoffTaskMsg{DwTaskId=dwTaskId}
	self:DBUpdate(dwTaskId)
	self:DoTaskScript("cb_task_on_doff",self.Tasks[dwTaskId])
end
--发送任务更新消息
function CTaskSystem:SendUpdateTask(dwTaskId)
	local Task = self.Tasks[dwTaskId]
	self:CheckTaskProgressOnUpdate(dwTaskId)
	local sendInfo = Task:GetSendInfo()
	local objPlayer = self:GetPlayer()
	objPlayer.TaskUpdateTaskMsg{TbTask=sendInfo}
	if sendInfo.dwState == TaskStateConfig.Done then
		self:GetPlayer():GetSystem("CPlayerEventCenterSystem"):DoEvent(enumPlayerEventType.EventDoneTask,1,dwTaskId);
	end
	self:DBUpdate(dwTaskId)
	self:DoTaskScript("cb_task_on_update",Task)
end
--发送出错信息
function CTaskSystem:Error(dwId)
	local objPlayer = self:GetPlayer()
	objPlayer.TaskErrorMsg{Id=dwId}
end
--发送给周围队友任务杀怪消息
function CTaskSystem:SendTeamKillMonster(dwTaskId,dwMonsterId)
	local objMainPlayer = self:GetPlayer()
	local dwMainRoleId = objMainPlayer:GetRoleID()
	local tId = {}
	--组队系统
	local sysTeam = objMainPlayer:GetSystem("CTeamSystem");
	--地图系统
	local sysMap = objMainPlayer:GetSystem("CMapSystem");
	if sysTeam:GetTeamId() then
		for k,v in pairs(sysTeam:GetTeamLeaguer()) do
			if v~=dwMainRoleId then
				local objPlayer = sysMap:GetRoleByID(v)
				if objPlayer then	
					local sysTask = objPlayer:GetSystem("CTaskSystem");
					if sysTask:RcvTeamKillMonster(dwTaskId,dwMonsterId) then
						tId[v] = v
					end
				end
			end
		end
	end
	return tId
end
--发送重复任务更新
function CTaskSystem:SendRepeatTaskUpdate(TaskList)
	local objPlayer = self:GetPlayer()
	objPlayer.RepeatTaskUpdateMsg{TaskList=TaskList}
end

--发送仇恨杀怪消息
function CTaskSystem:SendHateKillMonster(dwTaskId,dwMonsterId,Hate,tSend)
	local objMainPlayer = self:GetPlayer()
	local dwMainRoleId = objMainPlayer:GetRoleID()
	for dwRoleId,dwValue in pairs(Hate or {}) do
		if (dwRoleId ~= dwMainRoleId) and (not tSend[dwRoleId]) then
			local objPlayer = CPlayerManager:GetPlayerByRoleID(dwRoleId)
			if objPlayer then
				local sysTask = objPlayer:GetSystem("CTaskSystem")
				sysTask:RcvHateKillMonster(dwTaskId,dwMonsterId)
			end
		end
	end
end
---------------------------------------
--任务掉落判断
function CTaskSystem:DoDrop(Item)
	local dwTaskId = Item.dwTaskId
	if self.Tasks[dwTaskId] and self.Tasks[dwTaskId]:GetTaskState()==TaskStateConfig.Accept then
		local dwItemEnum = Item.dwItemEnum
		local dwItemType = CheckItemType(dwItemEnum)
		local dwNum = Item.dwNum
		local dwNumNow,dwNumMax = self.Tasks[dwTaskId]:GetItemNumNeed(dwItemEnum)
		if dwNumMax>dwNumNow then
			if dwNum+dwNumNow > dwNumMax then
				dwNum = dwNumMax - dwNumNow
			end
			local objPlayer = self:GetPlayer()
			local sysItem = objPlayer:GetSystem("CItemSystem");
			if dwItemType==1 then
				local addItemList = {};
				local tempTable = {
					dwItemEnum	= dwItemEnum;
					dwItemNumber= dwNum;
					dwBindType	= enItemBindType.eYes;
				};
				table.insert(addItemList, tempTable);
				sysItem:AddEnumItemListToTaskRoom(addItemList, _G.ItemSysOperType.PickUp)
			elseif dwItemType==2 then
				local addItemList = {};
				local tempTable = {
					dwItemEnum	= dwItemEnum;
					dwItemNumber= dwNum;
					dwBindType	= enItemBindType.eYes;
				};
				table.insert(addItemList, tempTable);
				sysItem:AddEnumItemListToPacket(addItemList, _G.ItemSysOperType.PickUp)
			end
			objPlayer:GetSystem("CPlayerEventCenterSystem"):DoEvent(enumPlayerEventType.EventDropTaskItem,1);
		end
	end
end
--------------------------------
--数据库操作
--插入任务
function CTaskSystem:DBInsert(dwTaskId)
	local Task = self:GetTask(dwTaskId)
	local Pack = Task:Pack()
	local objPlayer = self:GetPlayer()
	local dwRoleID = objPlayer:GetRoleID()
	Pack.dwRoleID = dwRoleID
	return self.objDBQuery:AddTaskInfo(Pack)
end
--更新任务
function CTaskSystem:DBUpdate(dwTaskId)
	local Task = self:GetTask(dwTaskId)
	local Pack = Task:Pack()
	local objPlayer = self:GetPlayer()
	local dwRoleID = objPlayer:GetRoleID()
	Pack.dwRoleID = dwRoleID
	return self.objDBQuery:UpdateTaskInfo(Pack)
end
-------------------------------------------
--更新特殊任务信息
function CTaskSystem:DBExWrite()
	local objPlayer = self:GetPlayer()
	local dwRoleID = objPlayer:GetRoleID()
	return self.objDBQuery:UpdateTaskExInfo(dwRoleID,self.dwDailyLoop,self.dwWeeklyLoop,self.dwNowLoop,self.dwNowLoopTaskId)
end

---------------------------------------------
function CTaskSystem:DoGMClear()
	self.Complete = {}
	for dwTaskId,v in pairs(self.Accept) do
		self:DoDoff(dwTaskId)
	end
	self:DoAccept(1001)
end
