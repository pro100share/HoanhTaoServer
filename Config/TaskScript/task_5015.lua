local task_id = 5015
local tbFun = {}
--接受任务时执行
function tbFun:cb_task_on_accept(objPlayer,objTask,sysScript)
	sysScript:Story(501501,true)
end
--任务更新时执行
function tbFun:cb_task_on_update(objPlayer,objTask,sysScript)
				  sysScript:Story(501503,true)	
end
--完成任务时执行
function tbFun:cb_task_on_complete(objPlayer,objTask,sysScript)

end
--放弃任务时执行
function tbFun:cb_task_on_doff(objPlayer,objTask)

end
--获取任务使用物品信息
function tbFun:get_item_use_info(objPlayer,objTask)
	 local Item = {}
	 Item[7100139] = {
	 {map_id=5087,x=-1,y=-25,round=4;};
	 };
	
	
	 return Item;
end
--------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Task,task_id,tbFun)
--------------------------------------------------------------
