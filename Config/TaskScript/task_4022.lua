local task_id = 4022
local tbFun = {}
--接受任务时执行
function tbFun:cb_task_on_accept(objPlayer,objTask,sysScript)

end
--任务更新时执行
function tbFun:cb_task_on_update(objPlayer,objTask,sysScript)
						local t = {
						[1] = 402202;
						[2] = 402202;
						[3] = 402202;
						[4] = 402202;
					}
					local dwProf = sysScript:GetProf()
					local f =function()
				  sysScript:Story(t[dwProf],true)		
					end			
		sysScript:Story(402201,nil,f)	
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
	