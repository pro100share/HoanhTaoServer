local task_id = 3022
local tbFun = {}
--接受任务时执行
function tbFun:cb_task_on_accept(objPlayer,objTask,sysScript)
		sysScript:Story(302201,true)	
end
--任务更新时执行
function tbFun:cb_task_on_update(objPlayer,objTask,sysScript)
	-- local sysTask = objPlayer:GetSystem("CTaskSystem")	
	-- local Task = sysTask:GetTask(3022)	
		-- if Task:GetTaskState()==TaskStateConfig.Done then
		-- sysScript:NpcStory(302202)
			-- end
end
--完成任务时执行
function tbFun:cb_task_on_complete(objPlayer,objTask)

end
--放弃任务时执行
function tbFun:cb_task_on_doff(objPlayer,objTask)

end
--获取任务使用物品信息
function tbFun:get_item_use_info(objPlayer,objTask,sysScript)
	local Item = {}
	Item[7100057] = {
	{map_id=1004,x=94,y=-53,round=4;};
	};
	
	
	return Item;
end
--------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Task,task_id,tbFun)
--------------------------------------------------------------
	