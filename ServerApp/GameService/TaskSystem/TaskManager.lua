--[[
功能：任务系统 任务管理器（服务器）
作者：周长沙
时间：2012-2-11
]]
---------------------------------------
_G.CTaskManager = CSingle:new();
--插入单体管理器
CSingleManager:AddSingle(CTaskManager);
----------------------------------------

----------------------------------------
--初始化
function CTaskManager:Create()
	self.Tasks = {}--任务模板
	self.Items = {}--任务关注的物品
	self.Chapter = {--章节模板
		Tasks = {};
		Reward = {};
	}
	self.CheckTasks = {}--需要检查的可接任务
	for dwTaskId,tbTaskInfo in pairs(TaskConfig) do
		local Task = CTask:new(tbTaskInfo)
		self.Tasks[dwTaskId] = Task
		for i=1,4 do
			if TaskConfig["item_id"..i] ~= 0 then
				self.Items[TaskConfig["item_id"..i] or -1] = true
			end
		end
		if tbTaskInfo._type==TaskTypeConfig.Principal or  
			TaskFun:IsBHTask(tbTaskInfo._type) then
			self.CheckTasks[dwTaskId] = tbTaskInfo
		end
	end
	for i=1,#TaskChapterConfig do
		self.Chapter.Reward[i] = {}
		local TaskList = TaskChapterConfig[i].TaskList
		local NextTaskList = {}
		if TaskChapterConfig[i+1] then
			NextTaskList = TaskChapterConfig[i+1].TaskList
		end
		for j=1,#TaskList do
			self.Chapter.Tasks[TaskList[j]] = {Next=TaskList[j+1] or NextTaskList[1],Chapter=i}
			if not TaskList[j+1] then
				self.Chapter.Tasks[TaskList[j]].Last = true;
			end
		end
		for j=1,i do
			for k,v in pairs(TaskChapterConfig[j].Reward) do
				self.Chapter.Reward[i][k] = (self.Chapter.Reward[k] or 0) + v
			end
		end
	end
	return true
end
--更新
function CTaskManager:Update()
	return true	
end
--销毁
function CTaskManager:Destroy()
	return true
end
------------------------------------------
--返回一个任务用于玩家接收
function CTaskManager:GetTaskForAccept(dwTaskId)
	local Task = self.Tasks[dwTaskId]
	if Task then
		return Task:CreateFromBaseInfo()
	end
	return nil
end

--跟据读数据库表数据，创建玩家任务信息
function CTaskManager:GetTaskByDBInfo(Info)
	local Task = CTask:UnPack(Info)
	return Task
end

function CTaskManager:GetCheckTask()
	return self.CheckTasks
end

function CTaskManager:GetNextMain(dwTaskID)
	if not self.Chapter.Tasks[dwTaskID] then
		return 0
	end
	return self.Chapter.Tasks[dwTaskID].Next or 0
end
function CTaskManager:GetChapterId(dwTaskID)
	if self.Chapter.Tasks[dwTaskID] then
		return self.Chapter.Tasks[dwTaskID].Chapter
	end
	-- print("No Task In TaskChapterConfig Task ID :",dwTaskID)
end
---------------------------------------------
--事件监听
--EventType:
function CTaskManager:EventListener(ObjPlayer,EventType,...)
	local sysTask = ObjPlayer:GetSystem("CTaskSystem")
	if EventType == TaskEvent.KillMonster then
		sysTask:RcvKillMonster(...)
	elseif EventType == TaskEvent.GetItem then
		sysTask:NotifyItemAdded(...)
	elseif EventType == TaskEvent.UseItem then
		sysTask:NotifyItemUse(...)
	elseif EventType == TaskEvent.DropItem then
		sysTask:NotifyItemDelete(...)
	elseif EventType == TaskEvent.Move then
		sysTask:RcvMove(...)
	end
end
---------------------------------------------





























