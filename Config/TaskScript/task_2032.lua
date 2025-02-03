local task_id = 2032
local tbFun = {}
--接受任务时执行
function tbFun:cb_task_on_accept(objPlayer,objTask)

end
--任务更新时执行
function tbFun:cb_task_on_update(objPlayer,objTask,sysScript)
						local t = {
						[1] = 203202;
						[2] = 203202;
						[3] = 203202;
						[4] = 203202;
					}
					local dwProf = sysScript:GetProf()
					local f =function()
					sysScript:Story(t[dwProf],true)
					end			
				  sysScript:Story(203201,nil,f)
					-- -- local f =function()
						-- -- sysScript:Story(203202,true)					
					-- -- end
						-- -- sysScript:Story(203201,f)
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
