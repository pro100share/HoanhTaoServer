local task_id = 10007
local tbFun = {}

_G.LXXSG10007 = {}
--接受任务时执行
function tbFun:cb_task_on_accept(objPlayer,objTask,sysScript)

end
--任务更新时执行
function tbFun:cb_task_on_update(objPlayer,objTask,sysScript)

end
--完成任务时执行
function tbFun:cb_task_on_complete(objPlayer,objTask,sysScript)
	_G.LXXSG10007[objPlayer:GetRoleID()] = nil
end
--放弃任务时执行
function tbFun:cb_task_on_doff(objPlayer,objTask,sysScript)
	sysScript:DelMonObj(_G.LXXSG10007[objPlayer:GetRoleID()] or 0)
	_G.LXXSG10007[objPlayer:GetRoleID()] = nil
end
--获取任务使用物品信息
function tbFun:get_item_use_info(objPlayer,objTask)

end
--------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Task,task_id,tbFun)
--------------------------------------------------------------
	