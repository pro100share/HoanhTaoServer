﻿local task_id = 5041
local tbFun = {}
--接受任务时执行
function tbFun:cb_task_on_accept(objPlayer,objTask,sysScript)
				--sysScript:NpcStory(504101)	
end
--任务更新时执行
function tbFun:cb_task_on_update(objPlayer,objTask,sysScript)	
		-- if objTask:GetTaskState()==TaskStateConfig.Done then	
						-- -- local t = {
						-- -- [1] = 504104;
						-- -- [2] = 504104;
						-- -- [3] = 504104;
						-- -- [4] = 504104;
					-- -- };
					-- -- local dwProf = sysScript:GetProf()
					-- -- local f =function()
				  -- -- sysScript:ScnStory(504103)						
				  -- -- sysScript:NpcStory(t[dwProf])		
					-- -- end			
				-- sysScript:Story(504102)		
		-- end	
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