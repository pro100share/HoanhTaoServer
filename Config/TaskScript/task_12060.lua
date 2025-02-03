local task_id = 12060
local tbFun = {}
--接受任务时执行
function tbFun:cb_task_on_accept(objPlayer,objTask,sysScript)
		sysScript:Story(1206001,true) 
		sysScript.LXX10131085 = sysScript.LXX10131085 or {}
			local sysMap = objPlayer:GetSystem("CMapSystem")
			local sysTask = objPlayer:GetSystem("CTaskSystem")	
			local objMap = sysMap:GetCurMap()
			local mgrMon = objMap:GetMonsterMgr()
			for k,v in pairs(sysScript.LXX10131085) do
				local Mon = mgrMon:GetMonsterInfo(v)
				if Mon and not Mon:IsDead() then
					sysTask:Error(999916)
					return;
				end
			end
			sysScript.LXX10131085[1] = sysScript:AddMonSP(10132015,1117,10132015,10132015,101310070,2,-15)
			sysScript.LXX10131085[2] = sysScript:AddMonSP(10132015,1117,10132015,10132015,101310070,2,-17)
			sysScript.LXX10131085[3] = sysScript:AddMonSP(10132015,1117,10132015,10132015,101310070,2,-19)
			sysScript.LXX10131085[4] = sysScript:AddMonSP(10132015,1117,10132015,10132015,101310070,2,-21)
			sysScript.LXX10131085[5] = sysScript:AddMonSP(10132015,1117,10132015,10132015,101310070,2,-23)
			sysScript.LXX10131085[6] = sysScript:AddMonSP(10132015,1117,10132015,10132015,101310070,-1,-15)	
			sysScript.LXX10131085[7] = sysScript:AddMonSP(10132015,1117,10132015,10132015,101310070,-1,-17)
			sysScript.LXX10131085[8] = sysScript:AddMonSP(10132015,1117,10132015,10132015,101310070,-1,-19)	
			sysScript.LXX10131085[9] = sysScript:AddMonSP(10132015,1117,10132015,10132015,101310070,-1,-21)		
			sysScript.LXX10131085[10] = sysScript:AddMonSP(10132015,1117,10132015,10132015,101310070,-1,-23)
			sysScript.LXX10131085[11] = sysScript:AddMonSP(10132015,1117,10132015,10132015,101310070,-4,-15)
			sysScript.LXX10131085[12] = sysScript:AddMonSP(10132015,1117,10132015,10132015,101310070,-4,-17)
			sysScript.LXX10131085[13] = sysScript:AddMonSP(10132015,1117,10132015,10132015,101310070,-4,-19)
			sysScript.LXX10131085[14] = sysScript:AddMonSP(10132015,1117,10132015,10132015,101310070,-4,-21)
			sysScript.LXX10131085[15] = sysScript:AddMonSP(10132015,1117,10132015,10132015,101310070,-4,-23)
			sysScript.LXX10131085[16] = sysScript:AddMonSP(10132015,1117,10132015,10132015,101310070,-7,-15)
			sysScript.LXX10131085[17] = sysScript:AddMonSP(10132015,1117,10132015,10132015,101310070,-7,-17)
			sysScript.LXX10131085[18] = sysScript:AddMonSP(10132015,1117,10132015,10132015,101310070,-7,-19)	
			sysScript.LXX10131085[19] = sysScript:AddMonSP(10132015,1117,10132015,10132015,101310070,-7,-21)
			sysScript.LXX10131085[20] = sysScript:AddMonSP(10132015,1117,10132015,10132015,101310070,-7,-23)
			sysScript.LXX10131085[21] = sysScript:AddMonSP(10132015,1117,10132015,10132015,101310070,5,-15)
			sysScript.LXX10131085[22] = sysScript:AddMonSP(10132015,1117,10132015,10132015,101310070,5,-17)
			sysScript.LXX10131085[23] = sysScript:AddMonSP(10132015,1117,10132015,10132015,101310070,5,-19)
			sysScript.LXX10131085[24] = sysScript:AddMonSP(10132015,1117,10132015,10132015,101310070,5,-21)
			sysScript.LXX10131085[25] = sysScript:AddMonSP(10132015,1117,10132015,10132015,101310070,5,-23)
			sysScript.LXX10131085[26] = sysScript:AddMonSP(10132015,1117,10132015,10132015,101310070,8,-15)
			sysScript.LXX10131085[27] = sysScript:AddMonSP(10132015,1117,10132015,10132015,101310070,8,-17)
			sysScript.LXX10131085[28] = sysScript:AddMonSP(10132015,1117,10132015,10132015,101310070,8,-19)
			sysScript.LXX10131085[29] = sysScript:AddMonSP(10132015,1117,10132015,10132015,101310070,8,-21)
			sysScript.LXX10131085[30] = sysScript:AddMonSP(10132015,1117,10132015,10132015,101310070,8,-23)			
			
end
--任务更新时执行
function tbFun:cb_task_on_update(objPlayer,objTask,sysScript)
	local sysTask = objPlayer:GetSystem("CTaskSystem")	
	 local Task = sysTask:GetTask(12060)	
		 if Task:GetTaskState()==TaskStateConfig.Done then
		sysScript:Story(1206002,true)
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

end
--------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Task,task_id,tbFun)
--------------------------------------------------------------
	