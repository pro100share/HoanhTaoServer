local task_id = 12022
local tbFun = {}
--接受任务时执行
function tbFun:cb_task_on_accept(objPlayer,objTask)

end
--任务更新时执行
function tbFun:cb_task_on_update(objPlayer,objTask)
	local sysTask = objPlayer:GetSystem("CTaskSystem")	
	 local Task = sysTask:GetTask(12022)	
		 if Task:GetTaskState()==TaskStateConfig.Done then	
		sysScript:Story(1202205,true)		 
		 end				
end
--完成任务时执行
function tbFun:cb_task_on_complete(objPlayer,objTask)

end
--放弃任务时执行
function tbFun:cb_task_on_doff(objPlayer,objTask)

end
--获取任务使用物品信息
function tbFun:get_item_use_info(objPlayer,objTask)
	local Item = {}
	Item[7100329] = {
	{map_id=1013,x=5,y=11,round=4;};
	};
	
	
	return Item;
end
--------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Task,task_id,tbFun)
--------------------------------------------------------------
	