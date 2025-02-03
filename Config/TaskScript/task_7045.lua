local task_id = 7045
local tbFun = {}
--接受任务时执行
function tbFun:cb_task_on_accept(objPlayer,objTask,sysScript)

end
--任务更新时执行
function tbFun:cb_task_on_update(objPlayer,objTask,sysScript)
	-- local sysTask = objPlayer:GetSystem("CTaskSystem")	
	-- local Task = sysTask:GetTask(7045)	
		-- if Task:GetTaskState()==TaskStateConfig.Done then
		-- local t = {
			-- [1] = 704501;
			-- [2] = 704502;
			-- [3] = 704503;
			-- [4] = 704504;
		-- }
		-- local dwProf = sysScript:GetProf()
		-- --local f =function()
			-- sysScript:Story(t[dwProf])		
		-- end
end
--完成任务时执行
function tbFun:cb_task_on_complete(objPlayer,objTask,sysScript)
	
end
--放弃任务时执行
function tbFun:cb_task_on_doff(objPlayer,objTask)

end
--获取任务使用物品信息
function tbFun:get_item_use_info(objPlayer,objTask)

end
--------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Task,task_id,tbFun)
--------------------------------------------------------------
	