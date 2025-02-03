local task_id = 11075
local tbFun = {}
--接受任务时执行
function tbFun:cb_task_on_accept(objPlayer,objTask,sysScript)
	 sysScript:PlayPfx(96,-11.59,-9.53,0,bAll)
	 sysScript:PlayPfx(96,-11.13,-8.15,0,bAll)
	 sysScript:PlayPfx(96,-12.36,-8.11,0,bAll)
	 sysScript:PlayPfx(96,-12.62,-9.14,0,bAll) 
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

end
--------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Task,task_id,tbFun)
--------------------------------------------------------------
	