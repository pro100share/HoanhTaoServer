local task_id = 1019
local tbFun = {}
--接受任务时执行
function tbFun:cb_task_on_accept(objPlayer,objTask,sysScript)

end
--任务更新时执行
function tbFun:cb_task_on_update(objPlayer,objTask,sysScript)
--[[
	local sysTask = objPlayer:GetSystem("CTaskSystem")	
	local Task = sysTask:GetTask(1019)	
		if Task:GetTaskState()==TaskStateConfig.Done then
		sysScript:Story(101901)
		end
--]]		
end
--完成任务时执行
function tbFun:cb_task_on_complete(objPlayer,objTask,sysScript)
		
end
--放弃任务时执行
function tbFun:cb_task_on_doff(objPlayer,objTask)

end
--------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Task,task_id,tbFun)
--------------------------------------------------------------
	