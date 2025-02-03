local task_id = 5013
local tbFun = {}
--接受任务时执行
function tbFun:cb_task_on_accept(objPlayer,objTask,sysScript)

end
--任务更新时执行
function tbFun:cb_task_on_update(objPlayer,objTask,sysScript)
	local sysTask = objPlayer:GetSystem("CTaskSystem")	
	local Task = sysTask:GetTask(5013)	
		if Task:GetTaskState()==TaskStateConfig.Done then
						local t = {
						[1] = 501302;
						[2] = 501302;
						[3] = 501302;
						[4] = 501302;
					}
					local dwProf = sysScript:GetProf()
					local f =function()
					sysScript:Story(t[dwProf],true)
				 --sysScript:NpcStory(501303)						
					end	
				sysScript:Story(501301,nil,f)		
		end
end
--完成任务时执行
function tbFun:cb_task_on_complete(objPlayer,objTask,sysScript)

end
--放弃任务时执行
function tbFun:cb_task_on_doff(objPlayer,objTask,sysScript)

end
--获取任务使用物品信息
function tbFun:get_item_use_info(objPlayer,objTask)
	 local Item = {}
	 Item[7100052] = {
	 {map_id=1006,x=51,y=99,round=3;};
	 };
	
	
	 return Item;
end
--------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Task,task_id,tbFun)
--------------------------------------------------------------