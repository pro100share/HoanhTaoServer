﻿local task_id = 2017
local tbFun = {}
--接受任务时执行
function tbFun:cb_task_on_accept(objPlayer,objTask,sysScript)
	sysScript:Story(201701,true)
end
--任务更新时执行
function tbFun:cb_task_on_update(objPlayer,objTask)

end
	
--完成任务时执行
function tbFun:cb_task_on_complete(objPlayer,objTask,sysScript)

end
--放弃任务时执行
function tbFun:cb_task_on_doff(objPlayer,objTask)

end
--------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Task,task_id,tbFun)
--------------------------------------------------------------
