local task_id = 3034
local tbFun = {}
--接受任务时执行
function tbFun:cb_task_on_accept(objPlayer,objTask,sysScript)
	--sysScript:Story(303401)
end
--任务更新时执行
function tbFun:cb_task_on_update(objPlayer,objTask,sysScript)
	local sysTask = objPlayer:GetSystem("CTaskSystem")	
	local Task = sysTask:GetTask(3034)	
		if Task:GetTaskState()==TaskStateConfig.Done then
	sysScript:Story(303402,true)
		end
end
--完成任务时执行
function tbFun:cb_task_on_complete(objPlayer,objTask,sysScript)
	
end
--放弃任务时执行
function tbFun:cb_task_on_doff(objPlayer,objTask,sysScript)

end
--------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Task,task_id,tbFun)
--------------------------------------------------------------
