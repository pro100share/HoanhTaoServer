local task_id = 5040
local tbFun = {}
--接受任务时执行
function tbFun:cb_task_on_accept(objPlayer,objTask)

end
--任务更新时执行
function tbFun:cb_task_on_update(objPlayer,objTask,sysScript)
	-- local sysTask = objPlayer:GetSystem("CTaskSystem")
	-- local Task = sysTask:GetTask(5040)		
		-- if Task:GetTaskState()==TaskStateConfig.Done then	
						-- local t = {
						-- [1] = 504002;
						-- [2] = 504002;
						-- [3] = 504002;
						-- [4] = 504002;
					-- };
					-- local dwProf = sysScript:GetProf()
					-- local f =function()
				  -- sysScript:Story(t[dwProf],true)		
					-- end			
				-- sysScript:Story(504001,nil,f)		
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