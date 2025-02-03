local task_id = 2029
local tbFun = {}
--接受任务时执行
function tbFun:cb_task_on_accept(objPlayer,objTask)

end
--任务更新时执行
function tbFun:cb_task_on_update(objPlayer,objTask,sysScript)
	-- local sysTask = objPlayer:GetSystem("CTaskSystem")	
	-- local Task = sysTask:GetTask(2029)	
		-- if Task:GetTaskState()==TaskStateConfig.Done then
					-- sysScript:NpcStory(202901)
		-- end
end
--完成任务时执行
function tbFun:cb_task_on_complete(objPlayer,objTask)

	end
--------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Task,task_id,tbFun)
--------------------------------------------------------------