local task_id = 11011
local tbFun = {}
--接受任务时执行
function tbFun:cb_task_on_accept(objPlayer,objTask,sysScript)
		sysScript:Story(1101102,true)
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
		
end
--完成任务时执行
function tbFun:cb_task_on_complete(objPlayer,objTask,sysScript)

end
--放弃任务时执行
function tbFun:cb_task_on_doff(objPlayer,objTask,sysScript)
 
end
--获取任务使用物品信息
function tbFun:get_item_use_info(objPlayer,objTask)

end
--------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Task,task_id,tbFun)
--------------------------------------------------------------
	