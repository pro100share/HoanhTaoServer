local task_id = 6053
local tbFun = {}
--接受任务时执行
function tbFun:cb_task_on_accept(objPlayer,objTask,sysScript)
		
end
--任务更新时执行
function tbFun:cb_task_on_update(objPlayer,objTask,sysScript)

end
--完成任务时执行
function tbFun:cb_task_on_complete(objPlayer,objTask,sysScript)
			-- sysScript:NpcStory(605307)	
end
--放弃任务时执行
function tbFun:cb_task_on_doff(objPlayer,objTask)

end
--获取任务使用物品信息
function tbFun:get_item_use_info(objPlayer,objTask)
	 local Item = {}
	 Item[7100060] = {
	 {map_id=1007,x=7,y=79,round=4;};
	 };
	
	
	 return Item;
end
--------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Task,task_id,tbFun)
--------------------------------------------------------------
	