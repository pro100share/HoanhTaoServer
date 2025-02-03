local task_id = 3037
local tbFun = {}
--接受任务时执行
function tbFun:cb_task_on_accept(objPlayer,objTask,sysScript)

end
--任务更新时执行
function tbFun:cb_task_on_update(objPlayer,objTask,sysScript)
	local sysTask = objPlayer:GetSystem("CTaskSystem")	
	local Task = sysTask:GetTask(3037)	
		if Task:GetTaskState()==TaskStateConfig.Done then
						local t = {
						[1] = 303702;
						[2] = 303702;
						[3] = 303702;
						[4] = 303702;
					}
					local dwProf = sysScript:GetProf()
					local f =function()
					sysScript:Story(t[dwProf],true)
					end	
				sysScript:Story(303701,nil,f)		
		end
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
