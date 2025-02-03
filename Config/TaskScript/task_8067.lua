local task_id = 8067
local tbFun = {}
--接受任务时执行
function tbFun:cb_task_on_accept(objPlayer,objTask,sysScript)

end
--任务更新时执行
function tbFun:cb_task_on_update(objPlayer,objTask,sysScript)

end
--完成任务时执行
function tbFun:cb_task_on_complete(objPlayer,objTask,sysScript)
		sysScript:ChangeLook(0) 		
end
--放弃任务时执行
function tbFun:cb_task_on_doff(objPlayer,objTask,sysScript)
		sysScript:ChangeLook(0) 
end
--获取任务使用物品信息
function tbFun:get_item_use_info(objPlayer,objTask,sysScript)
	local Item = {}
	Item[7100245] = {
	{map_id=5098,x=-13,y=-25,round=100;};
	};
	
	
	return Item;
end
--------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Task,task_id,tbFun)
--------------------------------------------------------------
	