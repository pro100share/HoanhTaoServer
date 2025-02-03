local task_id = 3002
local tbFun = {}
--接受任务时执行
function tbFun:cb_task_on_accept(objPlayer,objTask)

end
--任务更新时执行
function tbFun:cb_task_on_update(objPlayer,objTask,sysScript)
	local sysTask = objPlayer:GetSystem("CTaskSystem")
		local Task = sysTask:GetTask(3002)	
		if Task:GetTaskState()==TaskStateConfig.Done then
				sysScript:Story(300202,true)
		end
end
--完成任务时执行
function tbFun:cb_task_on_complete(objPlayer,objTask)

end
--放弃任务时执行
function tbFun:cb_task_on_doff(objPlayer,objTask)

end
--------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Task,task_id,tbFun)
--------------------------------------------------------------
