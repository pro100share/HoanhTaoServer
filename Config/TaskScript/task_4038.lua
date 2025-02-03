local task_id = 4038
local tbFun = {}
--接受任务时执行
function tbFun:cb_task_on_accept(objPlayer,objTask,sysScript)
	-- sysScript:AddMonSP(10052008,10052008,10052008,10052008,100520010,1,27)
	-- sysScript:AddMonSP(10052008,10052008,10052008,10052008,100520010,-1,25)
	-- sysScript:AddMonSP(10052008,10052008,10052008,10052008,100520010,-3,23)
	-- sysScript:AddMonSP(10052008,10052008,10052008,10052008,100520010,-5,21)
	-- sysScript:AddMonSP(10052008,10052008,10052008,10052008,100520010,-7,19)
	-- sysScript:AddMonSP(10052008,10052008,10052008,10052008,100520010,-9,17)	
	
	-- sysScript:AddMonSP(10052009,10052009,10052009,10052009,100520020,-22,31)
	-- sysScript:AddMonSP(10052009,10052009,10052009,10052009,100520020,-18,28)
	-- sysScript:AddMonSP(10052009,10052009,10052009,10052009,100520020,-16,25)
	-- sysScript:AddMonSP(10052009,10052009,10052009,10052009,100520020,-13,22)
	-- sysScript:AddMonSP(10052009,10052009,10052009,10052009,100520020,-11,20)
	-- sysScript:AddMonSP(10052009,10052009,10052009,10052009,100520020,-10,18)

	-- sysScript:AddMonSP(10052008,10052008,10052008,10052008,100520010,5,-10)
	-- sysScript:AddMonSP(10052008,10052008,10052008,10052008,100520010,3,-9)
	-- sysScript:AddMonSP(10052008,10052008,10052008,10052008,100520010,6,-6)
	-- sysScript:AddMonSP(10052008,10052008,10052008,10052008,100520010,1,-7)
	-- sysScript:AddMonSP(10052008,10052008,10052008,10052008,100520010,-1,-5)
	-- sysScript:AddMonSP(10052008,10052008,10052008,10052008,100520010,-3,-2)

	-- sysScript:AddMonSP(10052009,10052009,10052009,10052009,100520020,-13,-2)
	-- sysScript:AddMonSP(10052009,10052009,10052009,10052009,100520020,-16,-5)
	-- sysScript:AddMonSP(10052009,10052009,10052009,10052009,100520020,-17,-7)
	-- sysScript:AddMonSP(10052009,10052009,10052009,10052009,100520020,-19,-9)
	-- sysScript:AddMonSP(10052009,10052009,10052009,10052009,100520020,-22,-11)
	-- sysScript:AddMonSP(10052009,10052009,10052009,10052009,100520020,-24,-14)	
end
--任务更新时执行
function tbFun:cb_task_on_update(objPlayer,objTask,sysScript)

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
	