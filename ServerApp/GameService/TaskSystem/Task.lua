--[[
功能：任务系统 单个任务（服务器）
作者：周长沙
时间：2012-2-11
]]
-----------------------------------
_G.CTask = {}
CMemoryDebug:Show("ObjTask");
-----------------------------------
--本地函数
--字符串连接
local function PushString(...)
	local tbStr = {...}
	local szStr = ""
	for i=1,#tbStr,1 do
		szStr = szStr..tbStr[i]..";"
	end
	return szStr;
end 

--字符串切割，参数： 源字符串，切割符
--返回：切割后的表
local function Split(szFullString, szSeparator)
	local nFindStartIndex = 1
	local nSplitIndex = 1
	local nSplitArray = {}
	while true do
	   local nFindLastIndex = string.find(szFullString, szSeparator, nFindStartIndex)
	   if not nFindLastIndex then
			nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len(szFullString))
			break
	   end
	   nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, nFindLastIndex - 1)
	   nFindStartIndex = nFindLastIndex + string.len(szSeparator)
	   nSplitIndex = nSplitIndex + 1
	end
	return nSplitArray
end
-----------------------------------
--新建一个任务
function CTask:new(tbTaskInfo)
	local Task = setmetatable({},{__index=CTask})
	--任务的配置信息
	Task.CFG = tbTaskInfo
	--任务接受条件信息
	Task.AcceptConditions = {}
	Task.AcceptConditions.dwLevel = tbTaskInfo.need_lv				--等级
	Task.AcceptConditions.dwTask = tbTaskInfo.need_task				--前置任务
	Task.AcceptConditions.dwItem = tbTaskInfo.need_item				--物品
	Task.AcceptConditions.dwRepeatType = tbTaskInfo.repeat_type		--重复类型
	Task.AcceptConditions.dwRepeatTimes = tbTaskInfo.repeat_times	--重复次数
	Task.AcceptConditions.dwGiveItem = tbTaskInfo.give_item			--给予物品
	Task.AcceptConditions.dwGiveNum = tbTaskInfo.give_num			--给予数量
	
	--任务过程需求信息
	Task.Counts = {}
	Task.Counts.Monster = {}	--杀怪
	local monster_id1 = Split(tbTaskInfo.monster_id1,";")
	local monster_id2 = Split(tbTaskInfo.monster_id2,";")
	local monster_id3 = Split(tbTaskInfo.monster_id3,";")
	local monster_id4 = Split(tbTaskInfo.monster_id4,";")
	Task.Counts.Monster[1] = {dwId=monster_id1;dwMax=tbTaskInfo.monster_num1;dwNow=0;}
	Task.Counts.Monster[2] = {dwId=monster_id2;dwMax=tbTaskInfo.monster_num2;dwNow=0;}
	Task.Counts.Monster[3] = {dwId=monster_id3;dwMax=tbTaskInfo.monster_num3;dwNow=0;}
	Task.Counts.Monster[4] = {dwId=monster_id4;dwMax=tbTaskInfo.monster_num4;dwNow=0;}
	Task.Counts.Item = {}		--物品收集
	Task.Counts.Item[1] = {dwId=tbTaskInfo.item_id1;dwMax=tbTaskInfo.item_num1;dwNow=0;}
	Task.Counts.Item[2] = {dwId=tbTaskInfo.item_id2;dwMax=tbTaskInfo.item_num2;dwNow=0;}
	Task.Counts.Item[3] = {dwId=tbTaskInfo.item_id3;dwMax=tbTaskInfo.item_num3;dwNow=0;}
	Task.Counts.Item[4] = {dwId=tbTaskInfo.item_id4;dwMax=tbTaskInfo.item_num4;dwNow=0;}
	Task.Counts.Explore = {}	--探索
	Task.Counts.Explore[1] = {dwId=tbTaskInfo.map_id;fX=tbTaskInfo.x;fY=tbTaskInfo.y;fDis=tbTaskInfo.round;dwMax=1;dwNow=0;}
	for k,v in pairs(Task.Counts.Explore) do
		if v.dwId==0 then
			Task.Counts.Explore[k].dwMax = 0
		end
	end
	Task.Counts.ItemUse = {}	--物品使用
	Task.Counts.ItemUse[1] = {dwId=tbTaskInfo.use_item;dwMax=tbTaskInfo.use_time;dwNow=0;}
	Task.Counts.Special = {}	--特殊需求(Special)
	Task.Counts.Special[1] = {dwId=tbTaskInfo.special_need1;dwMax=tbTaskInfo.special_num1;dwNow=0;}
	Task.Counts.Npc = {}
	Task.Counts.Npc[1] = {dwId=tbTaskInfo.npc_need1 or 0;dwMax=1;dwNow=0;}
	for k,v in pairs(Task.Counts.Npc) do
		if v.dwId==0 then
			Task.Counts.Npc[k].dwMax = 0
		end
	end
	
	--任务奖励信息
	Task.Reward = {}
	Task.Reward.dwMoney = tbTaskInfo.money														--游戏币
	Task.Reward.dwExp = tbTaskInfo.exp															--经验
	Task.Reward.dwPneuma = tbTaskInfo.pneuma													--五行真气
	Task.Reward.Item = {}																		--公共物品
	Task.Reward.Item[1] = {dwId=tbTaskInfo.item1_id;dwNum=tbTaskInfo.item1_num;}
	Task.Reward.Item[2] = {dwId=tbTaskInfo.item2_id;dwNum=tbTaskInfo.item2_num;}
	Task.Reward.ProfItem = {}																	--职业物品
	Task.Reward.ProfItem[1] = {dwId=tbTaskInfo.pro_item1;dwNum=1}
	Task.Reward.ProfItem[2] = {dwId=tbTaskInfo.pro_item2;dwNum=1}
	--任务记录信息
	Task.Record = {}
	Task.Record.dwTaskId = tbTaskInfo.id	--任务id
	Task.Record.dwState = 0					--任务状态
	Task.Record.dwAcceptTimes = 0			--接受次数
	Task.Record.dwCompleteTimes = 0			--完成次数
	Task.Record.dwLastAcceptTime = 0		--上次接受时间
	Task.Record.dwLastCompleteTime = 0		--上次完成时间
	Task.Record.dwLastAcceptLevel = 0		--上次接任务等级
	Task.Record.dwLastCompleteLevel = 0		--上次完成任务等级
	Task.Record.dwLoopId = 0				--环数
	Task.Record.dwQuality = 0				--品质(星级)
	--任务脚本
	Task.tbFun = CScriptManager:GetScript(ScriptTypeConfig.Task,tbTaskInfo.id) or {}
	
	CMemoryDebug:AddObject("ObjTask", Task);
	return Task
end
--任务更新
function CTask:Update(dwDelay)
end

--根据模版信息创建玩家任务
function CTask:CreateFromBaseInfo()
	local Task = self:new(TaskConfig[self:GetId()])
	return Task
end

--接受任务处理
function CTask:AcceptTask(dwAcceptTimes,dwCompleteTimes,dwLevel,dwLoopId,dwQuality)
	self.Record.dwAcceptTimes = (dwAcceptTimes or 0) + 1
	self.Record.dwCompleteTimes = dwCompleteTimes or 0
	self.Record.dwLastAcceptLevel = dwLevel or 1
	self.Record.dwLoopId = dwLoopId or 0
	self.Record.dwQuality = dwQuality or 1
	self.Record.dwLastAcceptTime = GetCurTime()
	self:ClearTaskCount()
	self:SetTaskState(TaskStateConfig.Accept)
end
--完成任务处理
function CTask:CompleteTask(dwLevel)
	self.Record.dwCompleteTimes = (self.Record.dwCompleteTimes or 0) + 1
	self.Record.dwLastCompleteTime = GetCurTime()
	self.Record.dwLastCompleteLevel = dwLevel or 1
	self:SetTaskState(TaskStateConfig.Complete)
	self:Clear()
end
--简化任务
function CTask:Clear()
	self.Reward = {}
	self.Counts = {}
end
--放弃任务处理
function CTask:DoffTask()
	self:SetTaskState(TaskStateConfig.UnAccept)
	self:Clear()
end
--执行任务脚本
function CTask:DoTaskFun(szFunName,...)
	if self.tbFun[szFunName] then
		local t = {...}
		local res,_log = pcall(function() return self.tbFun[szFunName](self.tbFun,unpack(t))end)
		if not res then
			-- print("Task Script Err("..self:GetId()..")",_log)
		end
		if _log == 1 then
			return 1
		end
	else
		return 1;
	end
	return 0
end
------------------------------------
--接收玩家杀怪信息
function CTask:OnKillMonster(dwMonsterId)
	local IsNeed = false
	if self.Record.dwState==TaskStateConfig.Accept then
		for k,v in pairs(self.Counts.Monster) do
			if v.dwNow <v.dwMax then
				for i,j in pairs(v.dwId) do
					if tonumber(j)==dwMonsterId then
						self:UpdateCount(TaskEvent.KillMonster,k,1)
						IsNeed = true
					end
				end
			end
		end
	end
	return IsNeed
end
--接收玩家获得物品信息
function CTask:OnGetItem(dwItemId,dwNum)
	local IsNeed = false
	if self.Record.dwState==TaskStateConfig.Accept then
		for k,v in pairs(self.Counts.Item) do
			if v.dwId == dwItemId and v.dwNow <v.dwMax then
				self:UpdateCount(TaskEvent.GetItem,k,dwNum)
				IsNeed = true
			end
		end
	end
	return IsNeed
end
--接收玩家使用物品信息
function CTask:OnUseItem(dwItemId)
	local IsNeed = false
	if self.Record.dwState==TaskStateConfig.Accept then
		for k,v in pairs(self.Counts.ItemUse) do
			if v.dwId == dwItemId and v.dwNow <v.dwMax then
				self:UpdateCount(TaskEvent.UseItem,k,1)
				IsNeed = true
			end
		end
	end
	return IsNeed
end
--接收玩家失去物品信息
function CTask:OnLoseItem(dwItemId,dwNum)
	local IsNeed = false
	if (self.Record.dwState==TaskStateConfig.Accept) or (self.Record.dwState==TaskStateConfig.Done) then
		for k,v in pairs(self.Counts.Item) do
			if v.dwId == dwItemId and v.dwNow > 0 then
				self:UpdateCount(TaskEvent.GetItem,k,-dwNum)
				IsNeed = true
			end
		end
	end
	return IsNeed
end
--接收玩家位置信息
function CTask:OnMove(dwMapId,fX,fY)
	local IsNeed = false
	if self.Record.dwState==TaskStateConfig.Accept then
		for k,v in pairs(self.Counts.Explore) do
			if v.dwId == dwMapId and v.dwNow < v.dwMax and ((v.fX-fX)^2+(v.fY-fY)^2<v.fDis^2) then
				self:UpdateCount(TaskEvent.Move,k,1)
				IsNeed = true
			end
		end
	end
	return IsNeed
end
--接收到特殊操作信息(Special)
function CTask:OnSpecial(dwSpecialType,dwNum)
	local IsNeed = false
	if self.Record.dwState==TaskStateConfig.Accept then
		for k,v in pairs(self.Counts.Special) do
			if dwSpecialType == v.dwId and v.dwNow < v.dwMax then
				self:UpdateCount(TaskEvent.Special,k,dwNum)
				IsNeed = true
			end
		end
	end
	return IsNeed
end
--接收到与npc对话信息
function CTask:OnNpcTalk(dwNpcId)
	local IsNeed = false
	if self.Record.dwState==TaskStateConfig.Accept then
		for k,v in pairs(self.Counts.Npc) do
			if dwNpcId == v.dwId and v.dwNow < v.dwMax then
				self:UpdateCount(TaskEvent.NpcTalk,k,1)
				IsNeed = true
			end
		end
	end
	return IsNeed
end
----------------------------------
--修改任务计数器
function CTask:UpdateCount(dwType,dwPos,dwValue)
	--杀怪
	if dwType==TaskEvent.KillMonster then
		self.Counts.Monster[dwPos].dwNow = self.Counts.Monster[dwPos].dwNow + dwValue
		if self.Counts.Monster[dwPos].dwNow > self.Counts.Monster[dwPos].dwMax then
			self.Counts.Monster[dwPos].dwNow = self.Counts.Monster[dwPos].dwMax
		end
		if self.Counts.Monster[dwPos].dwNow < 0 then
			self.Counts.Monster[dwPos].dwNow = 0
		end
		if self.Counts.Monster[dwPos].dwNow == self.Counts.Monster[dwPos].dwMax then
			if self:CheckCompleteCondition() then
				self:SetTaskState(TaskStateConfig.Done)
			end
		else
			self:SetTaskState(TaskStateConfig.Accept)
		end
		return
	end
	--收集物品
	if dwType==TaskEvent.GetItem then
		self.Counts.Item[dwPos].dwNow = self.Counts.Item[dwPos].dwNow + dwValue
		if self.Counts.Item[dwPos].dwNow > self.Counts.Item[dwPos].dwMax then
			self.Counts.Item[dwPos].dwNow = self.Counts.Item[dwPos].dwMax
		end
		if self.Counts.Item[dwPos].dwNow < 0 then
			self.Counts.Item[dwPos].dwNow = 0
		end
		if self.Counts.Item[dwPos].dwNow == self.Counts.Item[dwPos].dwMax then
			if self:CheckCompleteCondition() then
				self:SetTaskState(TaskStateConfig.Done)
			end
		else
			self:SetTaskState(TaskStateConfig.Accept)
		end
		return
	end
	--物品使用
	if dwType==TaskEvent.UseItem then
		self.Counts.ItemUse[dwPos].dwNow = self.Counts.ItemUse[dwPos].dwNow + dwValue
		if self.Counts.ItemUse[dwPos].dwNow > self.Counts.ItemUse[dwPos].dwMax then
			self.Counts.ItemUse[dwPos].dwNow = self.Counts.ItemUse[dwPos].dwMax
		end
		if self.Counts.ItemUse[dwPos].dwNow < 0 then
			self.Counts.ItemUse[dwPos].dwNow = 0
		end
		if self.Counts.ItemUse[dwPos].dwNow == self.Counts.ItemUse[dwPos].dwMax then
			if self:CheckCompleteCondition() then
				self:SetTaskState(TaskStateConfig.Done)
			end
		else
			self:SetTaskState(TaskStateConfig.Accept)
		end
		return
	end
	--探索
	if dwType==TaskEvent.Move then
		self.Counts.Explore[dwPos].dwNow = self.Counts.Explore[dwPos].dwNow + dwValue
		if self.Counts.Explore[dwPos].dwNow > self.Counts.Explore[dwPos].dwMax then
			self.Counts.Explore[dwPos].dwNow = self.Counts.Explore[dwPos].dwMax
		end
		if self.Counts.Explore[dwPos].dwNow < 0 then
			self.Counts.Explore[dwPos].dwNow = 0
		end
		if self.Counts.Explore[dwPos].dwNow == self.Counts.Explore[dwPos].dwMax then
			if self:CheckCompleteCondition() then
				self:SetTaskState(TaskStateConfig.Done)
			end
		else
			self:SetTaskState(TaskStateConfig.Accept)
		end
		return
	end
	--特殊(Special)
	if dwType==TaskEvent.Special then
		self.Counts.Special[dwPos].dwNow = self.Counts.Special[dwPos].dwNow + dwValue
		if self.Counts.Special[dwPos].dwNow > self.Counts.Special[dwPos].dwMax then
			self.Counts.Special[dwPos].dwNow = self.Counts.Special[dwPos].dwMax
		end
		if self.Counts.Special[dwPos].dwNow < 0 then
			self.Counts.Special[dwPos].dwNow = 0
		end
		if self.Counts.Special[dwPos].dwNow == self.Counts.Special[dwPos].dwMax then
			if self:CheckCompleteCondition() then
				self:SetTaskState(TaskStateConfig.Done)
			end
		else
			self:SetTaskState(TaskStateConfig.Accept)
		end
		return
	end
	--Npc对话
	if dwType==TaskEvent.NpcTalk then
		self.Counts.Npc[dwPos].dwNow = self.Counts.Npc[dwPos].dwNow + dwValue
		if self.Counts.Npc[dwPos].dwNow > self.Counts.Npc[dwPos].dwMax then
			self.Counts.Npc[dwPos].dwNow = self.Counts.Npc[dwPos].dwMax
		end
		if self.Counts.Npc[dwPos].dwNow < 0 then
			self.Counts.Npc[dwPos].dwNow = 0
		end
		if self.Counts.Npc[dwPos].dwNow == self.Counts.Npc[dwPos].dwMax then
			if self:CheckCompleteCondition() then
				self:SetTaskState(TaskStateConfig.Done)
			end
		else
			self:SetTaskState(TaskStateConfig.Accept)
		end
		return
	end
end
----------------------------------
--返回任务接受条件
function CTask:CheckAcceptCondition()
	return self.AcceptConditions
end
--检查任务是否可完成
function CTask:CheckCompleteCondition()
	--杀怪
	for i=1,#self.Counts.Monster do
		if self.Counts.Monster[i].dwNow < self.Counts.Monster[i].dwMax then
			return false
		end
	end
	--物品收集
	for i=1,#self.Counts.Item do
		if self.Counts.Item[i].dwNow < self.Counts.Item[i].dwMax then
			return false
		end
	end
	--探索
	for i=1,#self.Counts.Explore do
		if self.Counts.Explore[i].dwNow < self.Counts.Explore[i].dwMax then
			return false
		end
	end
	--物品使用
	for i=1,#self.Counts.ItemUse do
		if self.Counts.ItemUse[i].dwNow < self.Counts.ItemUse[i].dwMax then
			return false
		end
	end
	--特殊(Special)
	for i=1,#self.Counts.Special do
		if self.Counts.Special[i].dwNow < self.Counts.Special[i].dwMax then
			return false
		end
	end
	--npc对话
	for i=1,#self.Counts.Npc do
		if self.Counts.Npc[i].dwNow < self.Counts.Npc[i].dwMax then
			return false
		end
	end
	return true
end
--返回任务ID
function CTask:GetId()
	return self.Record.dwTaskId
end
--返回任务状态
function CTask:GetTaskState()
	return self.Record.dwState
end
--设置任务状态
function CTask:SetTaskState(dwState)
	self.Record.dwState = dwState
end
--返回任务类型
function CTask:GetTaskType()
	return self.CFG._type
end
--返回任务接收次数
function CTask:GetAcceptTimes()
	return self.Record.dwAcceptTimes
end
--返回任务完成次数
function CTask:GetCompleteTimes()
	return self.Record.dwCompleteTimes
end
--设置任务完成次数
function CTask:SetCompleteTimes()
	self.Record.dwCompleteTimes = self.Record.dwCompleteTimes + 1
end
--返回任务计数信息
function CTask:GetCount()
	return self.Counts
end
--返回任务奖励信息
function CTask:GetReward(dwWeeklyLoop,dwDailyLoop,dwNowLoop,dwLevel)

	local dwLoop = self.Record.dwLoopId
	local dwQuality = self.Record.dwQuality
	local dwExp = self.Reward.dwExp
	local dwMoney = self.Reward.dwMoney
	local dwPneuma = self.Reward.dwPneuma
	if self.CFG._type == TaskTypeConfig.Daily then
		return TaskFun:GetDailyReward(dwLoop,dwExp,dwMoney,dwPneuma)
	elseif self.CFG._type == TaskTypeConfig.Weekly then
		return TaskFun:GetWeeklyReward(dwWeeklyLoop,dwDailyLoop,dwNowLoop,dwExp,dwMoney,dwPneuma,dwLevel,dwQuality)
	elseif self.CFG._type == TaskTypeConfig.huodong then
		return TaskFun:GetHuoDongReward(dwQuality,dwExp,dwMoney,dwPneuma,dwLevel)
	else
		return self.Reward
	end
end
--返回任务需要发送的消息
function CTask:GetSendInfo()
	local Task = {}
	Task.Counts = self.Counts
	Task.dwTaskId = self:GetId()
	Task.dwState = self:GetTaskState()
	Task.dwAcceptTimes = self.Record.dwAcceptTimes
	Task.dwCompleteTimes = self.Record.dwCompleteTimes
	Task.dwLastAcceptLevel = self.Record.dwLastAcceptLevel
	Task.dwLastCompleteLevel = self.Record.dwLastCompleteLevel
	Task.dwLoopId = self.Record.dwLoopId
	Task.dwQuality = self.Record.dwQuality
	if self.tbFun.get_item_use_info then
		Task.ItemInfo = self.tbFun:get_item_use_info(self)
	end
	return Task
end
--清除任务过程
function CTask:ClearTaskCount()
	--任务过程需求信息

	self.Counts.Monster[1].dwNow=0;
	self.Counts.Monster[2].dwNow=0;
	self.Counts.Monster[3].dwNow=0;
	self.Counts.Monster[4].dwNow=0;

	self.Counts.Item[1].dwNow=0;
	self.Counts.Item[2].dwNow=0;
	self.Counts.Item[3].dwNow=0;
	self.Counts.Item[4].dwNow=0;

	self.Counts.Explore[1].dwNow=0;

	self.Counts.ItemUse[1].dwNow=0;
	--(Special)
	self.Counts.Special[1].dwNow=0;
	
	self.Counts.Npc[1].dwNow=0;
end
--返回任务的当前物品信息
function CTask:GetItemNumNeed(dwItemEnum)
	local Item = self.Counts.Item 
	local dwNow = 0
	local dwMax = 0
	for k,v in pairs(Item) do
		if v.dwId == dwItemEnum then
			dwNow = v.dwNow + dwNow
			dwMax = v.dwMax + dwMax
		end
	end
	return dwNow,dwMax
end
--返回任务的杀怪信息
function CTask:GetMonInfo(dwPos)
	return self.Counts.Monster[dwPos].dwNow,self.Counts.Monster[dwPos].dwMax
end
---------------------------------
--打包本任务信息
function CTask:Pack()
	local Pack = {}
	--基础记录信息
	Pack.dwTaskId = self.Record.dwTaskId
	Pack.dwState = self.Record.dwState
	Pack.dwAcceptTimes = self.Record.dwAcceptTimes
	Pack.dwCompleteTimes = self.Record.dwCompleteTimes
	Pack.dwLastAcceptTime = self.Record.dwLastAcceptTime
	Pack.dwLastCompleteTime = self.Record.dwLastCompleteTime
	Pack.dwLastAcceptLevel = self.Record.dwLastAcceptLevel			--上次接任务等级
	Pack.dwLastCompleteLevel = self.Record.dwLastCompleteLevel		--上次完成任务等级
	Pack.dwLoopId = self.Record.dwLoopId							--环数
	Pack.dwQuality = self.Record.dwQuality							--品质(星级)
	
	--任务过程记录信息
	--杀怪
	if self.Counts and self.Counts.Monster then
		Pack.dwMon1 = self.Counts.Monster[1].dwNow + (self.Counts.Monster[2].dwNow or 0)*1000 + (self.Counts.Monster[3].dwNow or 0)*1000000 + (self.Counts.Monster[4].dwNow or 0)*1000000000
		-- Pack.dwMon2 = self.Counts.Monster[2].dwNow
		-- Pack.dwMon3 = self.Counts.Monster[3].dwNow
		-- Pack.dwMon4 = self.Counts.Monster[4].dwNow
		--物品收集
		Pack.dwItem1 = self.Counts.Item[1].dwNow + (self.Counts.Item[2].dwNow or 0)*1000 + (self.Counts.Item[3].dwNow or 0)*1000000 + (self.Counts.Item[4].dwNow or 0)*1000000000
		-- Pack.dwItem2 = self.Counts.Item[2].dwNow
		-- Pack.dwItem3 = self.Counts.Item[3].dwNow
		-- Pack.dwItem4 = self.Counts.Item[4].dwNow
		--探索
		Pack.dwExplore1 = self.Counts.Explore[1].dwNow
		--物品使用
		Pack.dwUse1 = self.Counts.ItemUse[1].dwNow
		--特殊要求(Special)
		Pack.dwSp1 = self.Counts.Special[1].dwNow
		--npc对话
		Pack.dwNpc1 = self.Counts.Npc[1].dwNow
	end
	--获得打包信息
	return Pack
end
--解压任务信息
function CTask:UnPack(Pack)
	local tbTaskInfo = Pack
	for k,v in pairs(tbTaskInfo) do
		tbTaskInfo[k] = tonumber(v)
	end
	if not TaskConfig[tbTaskInfo.dwTaskId] then
		return nil
	end
	local Task = self:new(TaskConfig[tbTaskInfo.dwTaskId])
	--基础记录
	Task.Record.dwState 				= tbTaskInfo.dwState
	Task.Record.dwAcceptTimes 			= tbTaskInfo.dwAcceptTimes
	Task.Record.dwCompleteTimes 		= tbTaskInfo.dwCompleteTimes
	Task.Record.dwLastAcceptTime 		= tbTaskInfo.dwLastAcceptTime
	Task.Record.dwLastCompleteTime 		= tbTaskInfo.dwLastCompleteTime
	Task.Record.dwLastAcceptLevel 		= tbTaskInfo.dwLastAcceptLevel							
	Task.Record.dwLastCompleteLevel	 	= tbTaskInfo.dwLastCompleteLevel		
	Task.Record.dwLoopId 				= tbTaskInfo.dwLoopId			
	Task.Record.dwQuality 				= tbTaskInfo.dwQuality		
	--过程记录
	--杀怪
	Task.Counts.Monster[1].dwNow 		= math.mod(tbTaskInfo.dwMon1 or 0,1000)
	Task.Counts.Monster[2].dwNow 		= math.mod(math.floor((tbTaskInfo.dwMon1 or 0)/1000),1000)
	Task.Counts.Monster[3].dwNow 		= math.mod(math.floor((tbTaskInfo.dwMon1 or 0)/1000000),1000)
	Task.Counts.Monster[4].dwNow 		= math.mod(math.floor((tbTaskInfo.dwMon1 or 0)/1000000000),1000)
	--物品收集
	Task.Counts.Item[1].dwNow 			= math.mod(tbTaskInfo.dwItem1 or 0,1000)
	Task.Counts.Item[2].dwNow 			= math.mod(math.floor((tbTaskInfo.dwItem1 or 0)/1000),1000)
	Task.Counts.Item[3].dwNow 			= math.mod(math.floor((tbTaskInfo.dwItem1 or 0)/1000000),1000)
	Task.Counts.Item[4].dwNow 			= math.mod(math.floor((tbTaskInfo.dwItem1 or 0)/1000000000),1000)
	--探索
	Task.Counts.Explore[1].dwNow 		= tbTaskInfo.dwExplore1
	--物品使用
	Task.Counts.ItemUse[1].dwNow 		= tbTaskInfo.dwUse1
	--特殊要求(Special)
	Task.Counts.Special[1].dwNow		= tbTaskInfo.dwSp1
	--npc对话
	Task.Counts.Npc[1].dwNow		= tbTaskInfo.dwNpc1 or 0
	Task:CheckRepeat()
	return Task
end
--检查可重复完成任务
function CTask:CheckRepeat()
	if self.CFG.repeat_type ~=0 then
		if (self.Record.dwCompleteTimes) and (self.Record.dwCompleteTimes~=0) then
			-------------------
			--日
			if self.CFG.repeat_type==1 then
				if not CTimeFormat:isToday(self.Record.dwLastCompleteTime) then
					self.Record.dwLastCompleteTime = 0
					self.Record.dwCompleteTimes = 0
					return true
				end
			--周
			elseif self.CFG.repeat_type==2 then
				if not CTimeFormat:isThisWeek(self.Record.dwLastCompleteTime) then
					self.Record.dwLastCompleteTime = 0
					self.Record.dwCompleteTimes = 0
					return true
				end
			--月
			elseif self.CFG.repeat_type==3 then
				if not CTimeFormat:isThisWeek(self.Record.dwLastCompleteTime) then---
					self.Record.dwLastCompleteTime = 0
					self.Record.dwCompleteTimes = 0
					return true
				end
			--年
			elseif self.CFG.repeat_type==4 then
				if not CTimeFormat:isThisWeek(self.Record.dwLastCompleteTime) then----
					self.Record.dwLastCompleteTime = 0
					self.Record.dwCompleteTimes = 0
					return true
				end
			end
			------------------
		end
	end
	return false
end


function CTask:SetQuality(dwQuality)
	self.Record.dwQuality = dwQuality;
end;

function CTask:GetQuality()
	return self.Record.dwQuality;
end;
