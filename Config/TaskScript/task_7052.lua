local task_id = 7052
local tbFun = {}
--接受任务时执行
function tbFun:cb_task_on_accept(objPlayer,objTask,sysScript)
		-- sysScript:Story(705201)
		sysScript:SetAlertDis(81,100)		
end
--任务更新时执行
function tbFun:cb_task_on_update(objPlayer,objTask,sysScript)
	local sysTask = objPlayer:GetSystem("CTaskSystem")	
	local Task = sysTask:GetTask(7052)	
		if Task:GetTaskState()==TaskStateConfig.Done then
		sysScript:Story(705202,true)	
		end
end
--完成任务时执行
function tbFun:cb_task_on_complete(objPlayer,objTask,sysScript)
		  sysScript:SetAlertDis(81,0)		
end
--放弃任务时执行
function tbFun:cb_task_on_doff(objPlayer,objTask)
		  sysScript:SetAlertDis(81,0)		
end
--获取任务使用物品信息
function tbFun:get_item_use_info(objPlayer,objTask)

end
--------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Task,task_id,tbFun)
--------------------------------------------------------------
	