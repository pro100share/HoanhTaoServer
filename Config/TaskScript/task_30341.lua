local task_id = 30341
local tbFun = {}
--接受任务时执行
function tbFun:cb_task_on_accept(objPlayer,objTask)

end
--任务更新时执行
function tbFun:cb_task_on_update(objPlayer,objTask)

end
--完成任务时执行
function tbFun:cb_task_on_complete(objPlayer,objTask,sysScript)
		sysScript:StopPfx(96)
end
--放弃任务时执行
function tbFun:cb_task_on_doff(objPlayer,objTask,sysScript)
		sysScript:StopPfx(96)
end
--获取任务使用物品信息
function tbFun:get_item_use_info(objPlayer,objTask,sysScript)
	local Item = {}
	Item[7100167] = {
	{map_id=1003,x=-65,y=10,round=4;};
	};
	
	
	return Item;
end
--------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Task,task_id,tbFun)
--------------------------------------------------------------
	