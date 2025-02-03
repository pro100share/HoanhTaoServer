local task_id = 11013
local tbFun = {}
--接受任务时执行
function tbFun:cb_task_on_accept(objPlayer,objTask,sysScript)
	 sysScript:PlayPfx(96,-30,94,0,bAll)
	 sysScript:PlayPfx(96,-31,91,0,bAll)
	 sysScript:PlayPfx(96,-33,90,0,bAll)		 
	 sysScript:PlayPfx(96,-32,87,0,bAll) 
	 sysScript:PlayPfx(96,-35,89,0,bAll)
	 sysScript:PlayPfx(96,-38,85,0,bAll)
	 sysScript:PlayPfx(96,-40,88,0,bAll)	
	 sysScript:PlayPfx(96,-42,92,0,bAll)	 
end
--任务更新时执行
function tbFun:cb_task_on_update(objPlayer,objTask,sysScript)
	local sysTask = objPlayer:GetSystem("CTaskSystem")	
	 local Task = sysTask:GetTask(11013)	
		 if Task:GetTaskState()==TaskStateConfig.Done then	 
	 sysScript:StopPfx(96,-30,94,0,bAll)
	 sysScript:StopPfx(96,-31,91,0,bAll)
	 sysScript:StopPfx(96,-33,90,0,bAll)		 
	 sysScript:StopPfx(96,-32,87,0,bAll) 
	 sysScript:StopPfx(96,-35,89,0,bAll)
	 sysScript:StopPfx(96,-38,85,0,bAll)
	 sysScript:StopPfx(96,-40,88,0,bAll)	
	 sysScript:StopPfx(96,-42,92,0,bAll)		 
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
	Item[7100314] = {
	{map_id=1012,x=-31,y=84,round=4;};
	};
	
	
	return Item;
end
--------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Task,task_id,tbFun)
--------------------------------------------------------------
	