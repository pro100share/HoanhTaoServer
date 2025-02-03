local task_id = 7036
local tbFun = {}
--接受任务时执行
function tbFun:cb_task_on_accept(objPlayer,objTask,sysScript)

end
--任务更新时执行
function tbFun:cb_task_on_update(objPlayer,objTask,sysScript)
	--[[
	local sysTask = objPlayer:GetSystem("CTaskSystem")
	print("task 7036 :",sysScript:CheckTaskExplore(7036),sysScript:CheckBUff(10092013))
		if sysScript:CheckTaskExplore(7036) and sysScript:CheckBUff(10092013) then
					sysTask:RcvKillMonster(88888841)
		else
			  sysScript:Notice(9000110014)
		end
		--]]
end

--到达指定地点时执行
function tbFun:cb_task_on_arrive(objPlayer,objTask,sysScript)
		local sysTask = objPlayer:GetSystem("CTaskSystem")
		print("task 7036 :",sysScript:CheckTaskExplore(7036),sysScript:CheckBUff(10092013))
		if sysScript:CheckTaskExplore(7036) and sysScript:CheckBUff(10092013) then
					sysTask:RcvKillMonster(88888841)
					return 1
		else
			  sysScript:Notice(9000110014)
			  return 0
		end
end
--完成任务时执行
function tbFun:cb_task_on_complete(objPlayer,objTask,sysScript)
	sysScript:DelBuff(10092013)
end
--放弃任务时执行
function tbFun:cb_task_on_doff(objPlayer,objTask)
	sysScript:DelBuff(10092013)
end
--获取任务使用物品信息
function tbFun:get_item_use_info(objPlayer,objTask)

end
--------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Task,task_id,tbFun)
--------------------------------------------------------------
	