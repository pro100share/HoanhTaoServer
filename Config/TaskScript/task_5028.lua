local task_id = 5028
local tbFun = {}
--接受任务时执行
function tbFun:cb_task_on_accept(objPlayer,objTask,sysScript)
			--sysScript:NpcStory(502801)
end
--任务更新时执行
function tbFun:cb_task_on_update(objPlayer,objTask,sysScript)

end
--完成任务时执行
function tbFun:cb_task_on_complete(objPlayer,objTask,sysScript)

end
--放弃任务时执行
function tbFun:cb_task_on_doff(objPlayer,objTask,sysScript)

end
--获取任务使用物品信息
function tbFun:get_item_use_info(objPlayer,objTask)
	 local Item = {}
	 Item[7100054] = {
	 {map_id=1006,x=-14,y=54,round=4;};
	 {map_id=1006,x=-37,y=74,round=4;};	
		{map_id=1006,x=-65,y=100,round=4;};
		{map_id=1006,x=-62,y=57,round=4;};		
	 };

	 return Item;
end
--------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Task,task_id,tbFun)
--------------------------------------------------------------
