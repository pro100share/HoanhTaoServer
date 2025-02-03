local task_id = 5020
local tbFun = {}
--接受任务时执行
function tbFun:cb_task_on_accept(objPlayer,objTask)

end
--任务更新时执行
function tbFun:cb_task_on_update(objPlayer,objTask,sysScript)
		-- if sysScript:GetTaskState(5020)==4 then
		-- sysScript:Story(48)
		-- end
end
--完成任务时执行
function tbFun:cb_task_on_complete(objPlayer,objTask,sysScript)
	-- sysScript:Story(50)
end
--放弃任务时执行
function tbFun:cb_task_on_doff(objPlayer,objTask)

end
--获取任务使用物品信息
function tbFun:get_item_use_info(objPlayer,objTask)
	-- local Item = {}
	-- Item[7100054] = {
	-- {map_id=1006,x=-65,y=99,round=4;};
	-- {map_id=1006,x=-37,y=78,round=4;};
	-- {map_id=1006,x=-22,y=53,round=4;};	
	-- {map_id=1006,x=-63,y=57,round=4;};
	-- };
	
	
	-- return Item;
end
--------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Task,task_id,tbFun)
--------------------------------------------------------------