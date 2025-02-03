local task_id = 5022
local tbFun = {}
--接受任务时执行
function tbFun:cb_task_on_accept(objPlayer,objTask,sysScript)
		sysScript:Story(502201,true)
end
--任务更新时执行
function tbFun:cb_task_on_update(objPlayer,objTask,sysScript)
		if objTask:GetTaskState()==TaskStateConfig.Done then
		
						local t = {
						[1] = 502203;
						[2] = 502203;
						[3] = 502203;
						[4] = 502203;
					}
					local dwProf = sysScript:GetProf()
					local f =function()
					sysScript:Story(t[dwProf],true)
					end			
				  sysScript:Story(502202,nil,f)		
		
		-- sysScript:Story(502202)	
		end
end
--完成任务时执行
function tbFun:cb_task_on_complete(objPlayer,objTask,sysScript)
		-- sysScript:Story(502203,true)		
end
--放弃任务时执行
function tbFun:cb_task_on_doff(objPlayer,objTask)

end
--获取任务使用物品信息
function tbFun:get_item_use_info(objPlayer,objTask)
	 local Item = {}
	 Item[7100049] = {
	 {map_id=1006,x=96,y=-6,round=4;};
	 };
	
	
	 return Item;
end
--------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Task,task_id,tbFun)
--------------------------------------------------------------