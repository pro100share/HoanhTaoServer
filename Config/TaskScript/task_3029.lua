local task_id = 3029
local tbFun = {}
--接受任务时执行
function tbFun:cb_task_on_accept(objPlayer,objTask)

end
--任务更新时执行
function tbFun:cb_task_on_update(objPlayer,objTask,sysScript)
						local t = {
						[1] = 302902;
						[2] = 302902;
						[3] = 302902;
						[4] = 302902;
					}
					local dwProf = sysScript:GetProf()
					local f =function()
				  sysScript:Story(t[dwProf],true)		
					end			
					sysScript:Story(302901,nil,f)						
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
