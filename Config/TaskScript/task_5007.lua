local task_id = 5007
local tbFun = {}
--接受任务时执行
function tbFun:cb_task_on_accept(objPlayer,objTask)

end
--任务更新时执行
function tbFun:cb_task_on_update(objPlayer,objTask,sysScript)
	local sysTask = objPlayer:GetSystem("CTaskSystem")
	local sysMap = objPlayer:GetSystem("CMapSystem")
	local Task = sysTask:GetTask(5007)	
		 if Task:GetTaskState()~=TaskStateConfig.Done then
						local fPosX	=	{
								[1] =	-91;
								[2] = -56;
								[3] = -22;			
						};
						local fPosY = {
								[1] = 93;
								[2] = 103;
								[3] = 108;				
						};
					for i=1,3 do
						local dwNow,dwMax = objTask:GetMonInfo(i)
						if dwNow<dwMax then
							sysScript:MovePlayer(fPosX[i],fPosY[i],1006)
							return;
						end
					end
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