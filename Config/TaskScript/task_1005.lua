local task_id = 1005
local tbFun = {}
--接受任务时执行
function tbFun:cb_task_on_accept(objPlayer,objTask,sysScript)
	-- local t = {
			-- [1] = 100501;
			-- [2] = 100502;
			-- [3] = 100503;
			-- [4] = 100504;
		-- }
		-- local dwProf = sysScript:GetProf()
		-- sysScript:Story(t[dwProf])
		--local f =function()
			--sysScript:Story(t[dwProf])
		--end
		--sysScript:ScnStory(1004,f)					
end
--任务更新时执行
function tbFun:cb_task_on_update(objPlayer,objTask)

end
--完成任务时执行
function tbFun:cb_task_on_complete(objPlayer,objTask)

end
--------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Task,task_id,tbFun)
--------------------------------------------------------------		