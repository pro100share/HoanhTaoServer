local task_id = 1014
local tbFun = {}
--接受任务时执行
function tbFun:cb_task_on_accept(objPlayer,objTask,sysScript)
		-- sysScript:NpcStory(1014)
end
--任务更新时执行
function tbFun:cb_task_on_update(objPlayer,objTask,sysScript)
	local sysTask = objPlayer:GetSystem("CTaskSystem")	
	local Task = sysTask:GetTask(1014)	
		if Task:GetTaskState()==TaskStateConfig.Done then
						local t = {
						[1] = 101403;
						[2] = 101403;
						[3] = 101403;
						[4] = 101403;
					}
					local dwProf = sysScript:GetProf()
					local f =function()
					sysScript:Story(t[dwProf],true)
					end
				sysScript:Story(101402,nil,f)
		end	
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
	