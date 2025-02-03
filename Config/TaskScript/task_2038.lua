local task_id = 2038
local tbFun = {}
--接受任务时执行
function tbFun:cb_task_on_accept(objPlayer,objTask,sysScript)

end
--任务更新时执行
function tbFun:cb_task_on_update(objPlayer,objTask,sysScript)
	
end
	
--完成任务时执行
function tbFun:cb_task_on_complete(objPlayer,objTask,sysScript)
	local t = {
			[1] = 203801;
			[2] = 203802;
			[3] = 203803;
			[4] = 203804;
		}
		local dwProf = sysScript:GetProf()
		sysScript:Story(t[dwProf])
		local profToMount = {
			[1] = 10001;
			[2] = 20001;
			[3] = 30001;
			[4] = 40001;
		}
	local objPlayer = sysScript:GetPlayer()
	local sysMount = objPlayer:GetSystem("CMountSystem");
	local isOK, _ = sysMount:AddMountByID(profToMount[dwProf]);		
end
--放弃任务时执行
function tbFun:cb_task_on_doff(objPlayer,objTask)

end
--------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Task,task_id,tbFun)
--------------------------------------------------------------
