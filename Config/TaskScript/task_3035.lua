local task_id = 3035
local tbFun = {}
--接受任务时执行
function tbFun:cb_task_on_accept(objPlayer,objTask,sysScript)

end
--任务更新时执行
function tbFun:cb_task_on_update(objPlayer,objTask,sysScript)
	local sysTask = objPlayer:GetSystem("CTaskSystem")	
	local Task = sysTask:GetTask(3035)	
		if Task:GetTaskState()==TaskStateConfig.Done then
		sysScript:Story(303501,true)	
		end
end
--完成任务时执行
function tbFun:cb_task_on_complete(objPlayer,objTask,sysScript)
			sysScript:StopPfx(96)
end
--放弃任务时执行
function tbFun:cb_task_on_doff(objPlayer,objTask,sysScript)
		sysScript:StopPfx(96)
		sysScript:DelItem(7100004,1)
end
--获取任务使用物品信息
function tbFun:get_item_use_info(objPlayer,objTask)
	local Item = {}
	Item[7100002] = {
	{map_id=5086,x=-9,y=-12,round=4;};
	};
	
	
	return Item;
end
--------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Task,task_id,tbFun)
--------------------------------------------------------------