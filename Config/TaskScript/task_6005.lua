local task_id = 6005
local tbFun = {}
--接受任务时执行
function tbFun:cb_task_on_accept(objPlayer,objTask,sysScript)
	--sysScript:AddNpc(10071008,-76,-36)	
end
--任务更新时执行
function tbFun:cb_task_on_update(objPlayer,objTask,sysScript)
	-- if objTask:GetTaskState() == TaskStateConfig.Done then
	-- --sysScript:DelNpc(10071008,-76,-36)	
	-- sysScript:NpcStory(22,objPlayer)
	-- end
end
--完成任务时执行
function tbFun:cb_task_on_complete(objPlayer,objTask)

end
--放弃任务时执行
function tbFun:cb_task_on_doff(objPlayer,objTask)

end
--获取任务使用物品信息
function tbFun:get_item_use_info(objPlayer,objTask)
	-- local Item = {}
	-- Item[7100060] = {
	-- {map_id=1007,x=-76,y=-36,round=4;};
	-- };
	
	
	-- return Item;
end
--------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Task,task_id,tbFun)
--------------------------------------------------------------