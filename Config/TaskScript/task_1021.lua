local task_id = 1021
local tbFun = {}
--接受任务时执行
function tbFun:cb_task_on_accept(objPlayer,objTask,sysScript)
		 -- sysScript:NpcStory(102101)			
end
--任务更新时执行
function tbFun:cb_task_on_update(objPlayer,objTask,sysScript)
	 -- local sysTask = objPlayer:GetSystem("CTaskSystem")	
	 -- local Task = sysTask:GetTask(1021)	
		 -- if Task:GetTaskState()==TaskStateConfig.Done then
		 -- sysScript:Story(102102)			
		 -- end		
end
--完成任务时执行
function tbFun:cb_task_on_complete(objPlayer,objTask)

	end
--------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Task,task_id,tbFun)
--------------------------------------------------------------