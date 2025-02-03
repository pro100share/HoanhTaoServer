local task_id = 11070
local tbFun = {}
--接受任务时执行
function tbFun:cb_task_on_accept(objPlayer,objTask,sysScript)
	sysScript.LXX10121076 = sysScript.LXX10121076 or {}
	local sysMap = objPlayer:GetSystem("CMapSystem")
	local sysTask = objPlayer:GetSystem("CTaskSystem")	
	local objMap = sysMap:GetCurMap()
	local mgrMon = objMap:GetMonsterMgr()
	for k,v in pairs(sysScript.LXX10121076) do
		local Mon = mgrMon:GetMonsterInfo(v)
		if Mon and not Mon:IsDead() then
			sysTask:Error(999916)
			return;
		end
	end
	sysScript.LXX10121076[1] = sysScript:AddMonSP(10122013,1108,10122013,10122013,100320050,-32,-4)
	sysScript.LXX10121076[2] = sysScript:AddMonSP(10122013,1108,10122013,10122013,100320050,-33,-6)
	sysScript.LXX10121076[3] = sysScript:AddMonSP(10122013,1108,10122013,10122013,100320050,-33,-8)
	sysScript.LXX10121076[4] = sysScript:AddMonSP(10122013,1108,10122013,10122013,100320050,-33,-10)
	sysScript.LXX10121076[5] = sysScript:AddMonSP(10122013,1108,10122013,10122013,100320050,-33,-12)
	sysScript.LXX10121076[6] = sysScript:AddMonSP(10122013,1108,10122013,10122013,100320050,-31,-12)	
	sysScript.LXX10121076[7] = sysScript:AddMonSP(10122013,1108,10122013,10122013,100320050,-31,-10)
	sysScript.LXX10121076[8] = sysScript:AddMonSP(10122013,1108,10122013,10122013,100320050,-31,-8)	
	sysScript.LXX10121076[9] = sysScript:AddMonSP(10122013,1108,10122013,10122013,100320050,-31,-6)			
	sysScript.LXX10121076[10] = sysScript:AddMonSP(10122013,1108,10122013,10122013,100320050,-31,-4)
	sysScript.LXX10121076[11] = sysScript:AddMonSP(10122013,1108,10122013,10122013,100320050,-29,-4)
	sysScript.LXX10121076[12] = sysScript:AddMonSP(10122013,1108,10122013,10122013,100320050,-29,-6)
	sysScript.LXX10121076[13] = sysScript:AddMonSP(10122013,1108,10122013,10122013,100320050,-29,-8)
	sysScript.LXX10121076[14] = sysScript:AddMonSP(10122013,1108,10122013,10122013,100320050,-29,-10)
	sysScript.LXX10121076[15] = sysScript:AddMonSP(10122013,1108,10122013,10122013,100320050,-29,-12)
	sysScript.LXX10121076[16] = sysScript:AddMonSP(10122013,1108,10122013,10122013,100320050,-29,-14)
	sysScript.LXX10121076[17] = sysScript:AddMonSP(10122013,1108,10122013,10122013,100320050,-27,-15)
	sysScript.LXX10121076[18] = sysScript:AddMonSP(10122013,1108,10122013,10122013,100320050,-27,-13)	
	sysScript.LXX10121076[19] = sysScript:AddMonSP(10122013,1108,10122013,10122013,100320050,-27,-11)
	sysScript.LXX10121076[20] = sysScript:AddMonSP(10122013,1108,10122013,10122013,100320050,-27,-9)
	sysScript.LXX10121076[21] = sysScript:AddMonSP(10122013,1108,10122013,10122013,100320050,-27,-7)		
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
	