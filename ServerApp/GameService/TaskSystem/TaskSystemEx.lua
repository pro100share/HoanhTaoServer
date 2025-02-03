--[[
功能：任务系统（服务器） 日环 周环 随机 进度消息相关逻辑
作者：周长沙
时间：2012-5-25
]]
----------------------------------------
local cfg = WeeklyPanelConfig.OneKeyComplete
local dwCost = cfg.dwCost
local dwRebate = cfg.dwRebate
local dwAllCost = dwCost*dwRebate*20

--获得下一个周环任务id
function CTaskSystem:GetNextWeeklyTask()
	if not self:HasAuthority('Weekly') then return end;
	local objPlayer = self:GetPlayer()
	local dwLevel = objPlayer:GetInfo().dwLevel or 1
	local dwWeeklyLoop = 1
	local dwDailyLoop = 1
	local dwNowLoop = 1
	
	dwWeeklyLoop = self.dwWeeklyLoop + 1
	if CTimeFormat:isToday(self.dwLoopUpdateTime) then
		dwDailyLoop = self.dwDailyLoop + 1
	else
		dwDailyLoop = 1			--日环环数
		if not CTimeFormat:isThisWeek(self.dwLoopUpdateTime) then
			dwWeeklyLoop = 1			--周环环数
		end
	end
	
	dwNowLoop = dwNowLoop + 1		--当前环数
	if dwNowLoop>8 then
		dwNowLoop = 1
	end
	
	return TaskFun:GetWeekly(dwLevel,dwWeeklyLoop,dwDailyLoop,dwNowLoop,self.dwNowLoopTaskId), TaskFun:GenerateQuality(self);
end
----------------------------------------
------------------------------------------------------------------
------------------------------------------------------接收任务操作
--收到快速完成周环请求
function CTaskSystem:RcvCompleteWeekly()
	if not self:HasAuthority('Weekly') then return end;
	local objPlayer = self:GetPlayer()
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	local sysItem = objPlayer:GetSystem("CItemSystem")
	local dwTaskId = self:IsAcceptWeekly()
	local dwItemId = WeeklyPanelConfig.OneKeyComplete.dwItemId
	local dwNum = WeeklyPanelConfig.OneKeyComplete.dwNum
	local dwCost = WeeklyPanelConfig.OneKeyComplete.dwCost
	if dwTaskId == 0 then--没有接受周环任务
		sysScript:Notice(WeeklyPanelConfig.OneKeyComplete.dwNoTaskNoticeId)
		return 
	end
	--[[
	if sysScript:DelItem(dwItemId,dwNum) then
		self:DoComplete(dwTaskId)
	else--物品数量不足
		sysScript:Notice(WeeklyPanelConfig.OneKeyComplete.dwNoItemNoticeId)
		return
	end
	--]]
	if sysItem:IsGoldEnough(dwCost) then
		sysItem:CostGold(dwCost, ItemSysOperType.TaskDel)
		self:DoComplete(dwTaskId)
	else
		sysScript:Notice(WeeklyPanelConfig.OneKeyComplete.dwNoItemNoticeId)
		return
	end
	
	
end
--收到快速完成全部周环请求
function CTaskSystem:RcvCompleteWeeklyAll()
	if not self:HasAuthority('Weekly') then return end;
	local objPlayer = self:GetPlayer()
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	local sysItem = objPlayer:GetSystem("CItemSystem")
	local dwNum = self.dwDailyLoop
	local dwCost = dwAllCost--(21 - dwNum)*dwCost*dwRebate
	local dwWeekly = self.dwWeeklyLoop
	local dwNow = self.dwNowLoop
	local objPlayer = self:GetPlayer()
	local dwLevel = objPlayer:GetInfo().dwLevel or 1
	local dwTaskID = self.dwNowLoopTaskId
	if dwTaskID == 0 then return end;
	local Task = self.Accept[dwTaskID]
	if not Task then return end;
    local dwQuality = Task:GetQuality();
	local Info = TaskFun:GetOneKetAllCompleteReward(dwTaskID,dwNum,dwNow,dwWeekly,dwLevel,dwQuality);
	if sysItem:IsGoldEnough(dwCost) then
		if #(Info.Item) > 0 then
			if not sysScript:AddItem(Info.Item,nil,nil,enItemPosition.ePacket) then
				objPlayer.TaskAcceptFailInfoMsg{DwTaskId=0,DwInfoType=TaskAcceptFailType.NoRoom}
				return;
			end
		--	self:FlyItem(Info.dwItemID)
		end
		self:DoComplete(dwTaskID,true)
		sysItem:CostGold(dwCost, ItemSysOperType.TaskDel)
		self:DoCompleteWeeklyAllReward(Info)
		for i=1,(20 - dwNum) do
			self:GetPlayer():GetSystem("CPlayerEventCenterSystem"):DoEvent(enumPlayerEventType.EventCompleteTask,1,dwTaskID,self.Tasks[dwTaskID].CFG._type);
			self:GetPlayer():GetSystem("CPlayerEventCenterSystem"):DoEvent(enumPlayerEventType.EventCompleteWeeklyTask,1,dwTaskID,self.Tasks[dwTaskID].CFG._type);
		end
	else
		sysScript:Notice(WeeklyPanelConfig.OneKeyComplete.dwNoItemNoticeId)
		return
	end
	
end

--接收到杀怪消息
function CTaskSystem:RcvKillMonster(dwMonsterId,Hate)
	for k,v in pairs(self.Accept) do
		local bResault = v:OnKillMonster(dwMonsterId)
		if bResault then
			self:SendUpdateTask(k)
		end
	end
	local tSend = self:SendTeamKillMonster(dwTaskId,dwMonsterId)
	self:SendHateKillMonster(dwTaskId,dwMonsterId,Hate,tSend)
end

--接收到队友任务杀怪消息
function CTaskSystem:RcvTeamKillMonster(dwTaskId,dwMonsterId)
	local bHave = false
	if dwTaskId then
		local Task = self.Accept[dwTaskId]
		if Task and ((Task.CFG.team_share==1) or (Task.CFG.team_share==3)) then
			local bResault = Task:OnKillMonster(dwMonsterId)
			if bResault then
				self:SendUpdateTask(k)
				bHave = true
			end
		end
	else
		for k,v in pairs(self.Accept) do
			if (v.CFG.team_share==1) or (v.CFG.team_share==3) then
				local bResault = v:OnKillMonster(dwMonsterId)
				if bResault then
					self:SendUpdateTask(k)
					bHave = true
				end
			end
		end
	end
	return bHave
end

--接收到仇恨任务杀怪消息
function CTaskSystem:RcvHateKillMonster(dwTaskId,dwMonsterId)
	if dwTaskId then
		local Task = self.Accept[dwTaskId]
		if Task and ((Task.CFG.team_share==2) or (Task.CFG.team_share==3)) then
			local bResault = Task:OnKillMonster(dwMonsterId)
			if bResault then
				self:SendUpdateTask(k)
			end
		end
	else
		for k,v in pairs(self.Accept) do
			if (v.CFG.team_share==2) or (v.CFG.team_share==3) then
				local bResault = v:OnKillMonster(dwMonsterId)
				if bResault then
					self:SendUpdateTask(k)
				end
			end
		end
	end
end
--接收到获得物品消息
function CTaskSystem:NotifyItemAdded(dwItemId,dwNum)
	for k,v in pairs(self.Accept) do
		local bResault = v:OnGetItem(dwItemId,dwNum)
		if bResault then
			self:SendUpdateTask(k)
		end
	end
end

--接收到使用物品消息
function CTaskSystem:OnUseItem(dwItemId)
	for k,v in pairs(self.Accept) do
		local bResault = v:OnUseItem(dwItemId)
		if bResault then
			self:SendUpdateTask(k)
		end
	end
end
--接收到丢弃物品消息
function CTaskSystem:NotifyItemDelete(dwItemId,dwNum)
	for k,v in pairs(self.Accept) do
		local bResault = v:OnLoseItem(dwItemId,dwNum)
		if bResault then
			self:SendUpdateTask(k)
		end
	end
end
--接收到移动消息
function CTaskSystem:RcvMove(dwMapId,fX,fY)
	for k,v in pairs(self.Accept) do
		if v:GetTaskState()==TaskStateConfig.Accept then
			local bResault = v:OnMove(dwMapId,fX,fY)
			if bResault then
				if self:DoTaskScript("cb_task_on_arrive",v)==1 then
					self:SendUpdateTask(k)
					self:GetPlayer():GetSystem("CPlayerEventCenterSystem"):DoEvent(enumPlayerEventType.EventArriveTask,1,k);
				else
					v:UpdateCount(TaskEvent.Move,1,-1)
				end
				--self:DoTaskScript("cb_task_on_arrive",v)
			end
		end
	end
end
--接收到特殊操作消息
function CTaskSystem:OnEventCenter(szEventName,dwNum,...)
	local param = {...}
	--print("CTaskSystem:OnEventCenter",szEventName,dwNum,...)
	if TaskSpNeedTxt[szEventName] then
		for k,v in pairs(self.Accept) do
			local bResault = v:OnSpecial(TaskSpNeedTxt[szEventName],dwNum or 1)
			if bResault then
				self:SendUpdateTask(k)
			end
		end
	end
	--连斩特殊处理
	if szEventName == "EventContinueKill" then
		local dwNum = param[1]
		if dwNum > 999 then
			self:OnEventCenter("EventContinueKillCombo1000",1)
		elseif dwNum > 899 then
			self:OnEventCenter("EventContinueKillCombo900",1)
		elseif dwNum > 799 then
			self:OnEventCenter("EventContinueKillCombo800",1)
		elseif dwNum > 699 then
			self:OnEventCenter("EventContinueKillCombo700",1)
		elseif dwNum > 599 then
			self:OnEventCenter("EventContinueKillCombo600",1)
		elseif dwNum > 499 then
			self:OnEventCenter("EventContinueKillCombo500",1)
		elseif dwNum > 399 then
			self:OnEventCenter("EventContinueKillCombo400",1)
		elseif dwNum > 299 then
			self:OnEventCenter("EventContinueKillCombo300",1)
		elseif dwNum > 199 then
			self:OnEventCenter("EventContinueKillCombo200",1)
		elseif dwNum > 99 then
			self:OnEventCenter("EventContinueKillCombo100",1)
		end
		return;
	end
	if TaskChangeEvent[szEventName] then
		local szNewEvent = szEventName..param[TaskChangeEvent[szEventName]]
		self:OnEventCenter(szNewEvent,dwNum or 1)
		return;
	end
	
	
	--刷新可接任务
	if TaskCareEvent[szEventName] then
		--local  f = function() self:FlushCanAcceptTask(true) end
		--CTimer:AddTimer( 1, false, f, Param )
		self:FlushCanAcceptTask(true)
	end
end
--收到npc对话消息
function CTaskSystem:OnNpcTalk(dwTaskId,dwNpcId)
	local Task = self.Accept[dwTaskId]
	if Task:OnNpcTalk(dwNpcId) then
		self:SendUpdateTask(dwTaskId)
	end
end
---------------------------------------------------------------------------------
--通知客户端飞图标
--单个
function CTaskSystem:FlyItem(ItemEnum)
	local objPlayer = self:GetPlayer()
	local sysItem = objPlayer:GetSystem("CItemSystem")
	sysItem:FlyItemIconToPacket( {ItemEnum} )
end
--多个
function CTaskSystem:FlyItemS(tbItems)
	local objPlayer = self:GetPlayer()
	local sysItem = objPlayer:GetSystem("CItemSystem")
	sysItem:FlyItemIconToPacket( tbItems )
end
---------------------------------------------------------------------------------
--触发任务脚本
function CTaskSystem:DoTaskScript(szFunctionName,Task)
	self:DoTaskStory(szFunctionName,Task)
	return Task:DoTaskFun(szFunctionName,self:GetPlayer(),Task,self:GetPlayer():GetSystem("CScriptSystem"))
end
--执行剧情
function CTaskSystem:DoTaskStory(szFunctionName,Task)
	local cfg = TaskMoveConfig[Task:GetId()]
	if cfg then
		local sysScript = self:GetPlayer():GetSystem("CScriptSystem")
		local dwProf = sysScript:GetProf()
		local dwFirstID,dwSecondID;
		local dwType1,dwType2;
		local Info;
		local f=function() end;
		if szFunctionName=="cb_task_on_accept" then
			Info = cfg[1]
		elseif szFunctionName == "cb_task_on_complete" then
			Info = cfg[3]
		elseif szFunctionName == "cb_task_on_update" then
			if TaskStateConfig.Done == Task:GetTaskState() then
				Info = cfg[2]
			end
		end
		if Info then
			if type(Info[1])=="table" then
				Info = Info[dwProf]
			end
		end
		if Info then
			dwFirstID,dwType1 = Info[1],Info[2]
			dwSecondID,dwType2 = Info[3],Info[4]
		end
		if dwSecondID then
			if dwType2==1 then
				f = function()
					sysScript:Story(dwSecondID)
				end
			elseif dwType2==2 then
				f = function()
					sysScript:ScnStory(dwSecondID)
				end
			elseif dwType2==3 then
				CDelayerManager:Delay( eDelay._100ms, function() sysScript:NpcStory(dwSecondID) end )
			end
		end
		if dwFirstID then
			if dwType1==1 then
				CDelayerManager:Delay( eDelay._1sec, function() sysScript:Story(dwFirstID,false,f) end )
			elseif dwType1==2 then
				CDelayerManager:Delay( eDelay._1sec, function() sysScript:ScnStory(dwFirstID,f) end )
			elseif dwType1==3 then
				CDelayerManager:Delay( eDelay._100ms, function() sysScript:NpcStory(dwFirstID);f() end )
			end
		end
	end
end
----------------------------------------------------------------------------------
function CTaskSystem:DoCompleteWeeklyAllReward(Info)
	local objPlayer = self:GetPlayer()
	local sysItem = objPlayer:GetSystem("CItemSystem");
	local sysFiveElem = objPlayer:GetSystem("CFiveElemSystem");
	--加游戏币
	if Info.dwMoney and Info.dwMoney ~= 0 then
		sysItem:AddPacketMoney(Info.dwMoney, _G.ItemSysOperType.TaskReward);
	end;
	--加经验
	objPlayer:AddExp(Info.dwExp)
	--加真气
	sysFiveElem:ChangeAttrAll(Info.dwPneuma, _G.FiveElemSysOperType.DoCompleteWeeklyAllReward)
	--加礼金
	if Info.dwCash and Info.dwCash ~= 0 then
		sysItem:AddBindGold(Info.dwCash, _G.ItemSysOperType.TaskReward)
	end;
	--加侠义值
	local sysErrant = objPlayer:GetSystem("CErrantHonorSystem");
	if Info.dwXiayi and Info.dwXiayi~=0 then
		sysErrant:AddErrantHonorValue(Info.dwXiayi);
	end
	self:SendCompleteWeeklyAll(Info)
end
function CTaskSystem:SendCompleteWeeklyAll(Info)
	self.Tasks[self.dwNowLoopTaskId] = nil
	self.Accept[self.dwNowLoopTaskId] = nil
	self.dwNowLoop = Info.dwReal
	self.dwNowLoopTaskId = 0
	self.dwDailyLoop = 20
	self.dwLoopUpdateTime = GetCurTime()
	local objPlayer = self:GetPlayer()
	self:DBExWrite()
	self:SendWeekInfo()
	objPlayer.TaskWeekCompleteAllMsg{Info=Info}
end

-- @breif 风云任务调整星级
function CTaskSystem:ChangeTaskQuality()
	local dwTaskID = self:IsAcceptWeekly()
	if dwTaskID ~= 0 then
        local setConsume = TaskFun:GetChangeQualityConsume(self);
        local objItemSystem = self:GetPlayer():GetSystem("CItemSystem");
        if setConsume.dwType == 1 then
            if not objItemSystem:CostPacketMoney(setConsume.dwValue, 
                    ItemSysOperType.TaskDel) then
                return;
            end
        elseif setConsume.dwType == 2 then
            if not objItemSystem:CostGold(setConsume.dwValue,
                    ItemSysOperType.TaskDel) then
                return;
            end
        else
            return;
        end
        local dwQuality = TaskFun:GenerateQuality(self);
		self:SetTaskQuality(dwTaskID, dwQuality);
        if TaskFun:IsMaxQuality(dwQuality) then
            CGameApp.TaskMaxQualityBroadcastMsg {
                SecretKey = TaskMessage.dwSecretKey;
                RoleID = self:GetPlayer():GetRoleID();
                RoleName = self:GetPlayer():GetInfo().szRoleName;
            };
        end
	end
end

function CTaskSystem:SetTaskQuality(dwTaskID, dwQuality)
	local objTask = self.Tasks[dwTaskID];
	if not objTask then
		return;
	end
	objTask:SetQuality(dwQuality);
	self:SendUpdateTask(dwTaskID);
end;
