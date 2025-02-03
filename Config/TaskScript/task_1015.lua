local task_id = 1015
local tbFun = {}
--接受任务时执行
function tbFun:cb_task_on_accept(objPlayer,objTask,sysScript)

end
--任务更新时执行
function tbFun:cb_task_on_update(objPlayer,objTask,sysScript)
--[[
	local sysTask = objPlayer:GetSystem("CTaskSystem")	
	local Task = sysTask:GetTask(1015)	
		if Task:GetTaskState()==TaskStateConfig.Done then
		local t = {
			[1] = 101501;
			[2] = 101502;
			[3] = 101503;
			[4] = 101504;
		}
		local dwProf = sysScript:GetProf()
		--local f =function()
			sysScript:Story(t[dwProf])		
		end
--]]
end
--完成任务时执行
function tbFun:cb_task_on_complete(objPlayer,objTask)

end
--放弃任务时执行
function tbFun:cb_task_on_doff(objPlayer,objTask)

end
--------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Task,task_id,tbFun)
--------------------------------------------------------------
	