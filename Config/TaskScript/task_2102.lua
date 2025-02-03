local task_id = 2102
local tbFun = {}
--接受任务时执行
function tbFun:cb_task_on_accept(objPlayer,objTask,sysScript)
	--sysScript:Story(36)
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
function tbFun:get_item_use_info(objPlayer,objTask)
	local Item = {}
	Item[7100132] = {
	{map_id=1003,x=-39,y=-11,round=4;};
	{map_id=1003,x=-17,y=-6,round=4;};	
	{map_id=1003,x=-21,y=7,round=4;};	
	--{map_id=1003,x=-40,y=-22,round=4;};		
	};
	
	
	return Item;
end
--------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Task,task_id,tbFun)
--------------------------------------------------------------
