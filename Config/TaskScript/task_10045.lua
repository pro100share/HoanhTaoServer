local task_id = 10045
local tbFun = {}
--接受任务时执行
function tbFun:cb_task_on_accept(objPlayer,objTask,sysScript)
		sysScript:Story(1004501,true)
end
--任务更新时执行
function tbFun:cb_task_on_update(objPlayer,objTask)

end
--完成任务时执行
function tbFun:cb_task_on_complete(objPlayer,objTask,sysScript)
		
end
--放弃任务时执行
function tbFun:cb_task_on_doff(objPlayer,objTask,sysScript)
		sysScript:StopPfx(96)
end
--获取任务使用物品信息
function tbFun:get_item_use_info(objPlayer,objTask)
	local Item = {}
	Item[7100278] = {
	{map_id=1011,x=-15,y=-15,round=3;};
	{map_id=1011,x=-15,y=-19,round=3;};
	{map_id=1011,x=-15,y=-22,round=3;};	
	{map_id=1011,x=-15,y=-25,round=3;};
	};
	
	
	return Item;
end
--------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Task,task_id,tbFun)
--------------------------------------------------------------
	