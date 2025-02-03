local task_id = 8051
local tbFun = {}
--接受任务时执行
function tbFun:cb_task_on_accept(objPlayer,objTask,sysScript)
		  sysScript:SetAlertDis(10082009,100)
end
--任务更新时执行
function tbFun:cb_task_on_update(objPlayer,objTask,sysScript)
	local sysTask = objPlayer:GetSystem("CTaskSystem")	
	 local Task = sysTask:GetTask(8051)	
		 if Task:GetTaskState()==TaskStateConfig.Done then
		  sysScript:SetAlertDis(10082009,0)		  
		 end			 
end
--完成任务时执行
function tbFun:cb_task_on_complete(objPlayer,objTask,sysScript)
		
end
--放弃任务时执行
function tbFun:cb_task_on_doff(objPlayer,objTask,sysScript)

end
--获取任务使用物品信息
function tbFun:get_item_use_info(objPlayer,objTask,sysScript)

end
--------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Task,task_id,tbFun)
--------------------------------------------------------------
	