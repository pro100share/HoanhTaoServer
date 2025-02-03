local task_id = 2041
local tbFun = {}
--接受任务时执行
function tbFun:cb_task_on_accept(objPlayer,objTask,sysScript)
					--sysScript:Story(204101)
end
--任务更新时执行
function tbFun:cb_task_on_update(objPlayer,objTask,sysScript)

end
--完成任务时执行
function tbFun:cb_task_on_complete(objPlayer,objTask)

	end
--------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Task,task_id,tbFun)
--------------------------------------------------------------