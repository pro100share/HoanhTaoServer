local task_id = 2140
local tbFun = {}
--接受任务时执行
function tbFun:cb_task_on_accept(objPlayer,objTask,sysScript)
	local dwPetID = 50710015;
	local objPlayer = sysScript:GetPlayer()
	local sysPet = objPlayer:GetSystem("CPetSystem");
	local isOK, _ = sysPet:AddPetBySystem(dwPetID) ;
	if not isOK then
		return
	end
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
--------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Task,task_id,tbFun)
--------------------------------------------------------------
