local task_id = 7057
local tbFun = {}
--接受任务时执行
function tbFun:cb_task_on_accept(objPlayer,objTask,sysScript)
						-- local t = {
						-- [1] = 705701;
						-- [2] = 705701;
						-- [3] = 705701;
						-- [4] = 705701;
					-- }
					-- local dwProf = sysScript:GetProf()
					-- local f =function()
					-- sysScript:Story(t[dwProf],true)
					-- end		
		-- sysScript:Story(705702,true,f)	
end
--任务更新时执行
function tbFun:cb_task_on_update(objPlayer,objTask,sysScript)

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
	