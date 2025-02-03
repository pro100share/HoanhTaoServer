local task_id = 3019
local tbFun = {}
--接受任务时执行
function tbFun:cb_task_on_accept(objPlayer,objTask,sysScript)
	--sysScript:NpcStory(301901)
end
--任务更新时执行
function tbFun:cb_task_on_update(objPlayer,objTask,sysScript)
						local t = {
						[1] = 302001;
						[2] = 302001;
						[3] = 302001;
						[4] = 302001;
					}
					local dwProf = sysScript:GetProf()
					local f =function()
				  sysScript:Story(t[dwProf],true)		
					end			
					sysScript:Story(301902,nil,f)		
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
