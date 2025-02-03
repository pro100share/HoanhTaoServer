--保存函数表
local npc_fun = {}
--npcid
local npc_id = 10071101
----------------------------------------------
-----------------采集npc
--npc开启检查
function npc_fun.cb_npc_on_opera_check(objNpc,objPlayer,sysNpc,sysScript)
		local sysTask = objPlayer:GetSystem("CTaskSystem")
		local Task = sysTask:GetTask(6049) 
		local Task2 = sysTask:GetTask(6050) 
		if (Task and Task:GetTaskState()==2) or (Task2 and Task2:GetTaskState()==2) then
			return true;
		end
	 sysScript:Notice(9000110020)			
		return false;
end
--npc被开启时执行
function npc_fun.cb_npc_on_opera(objNpc,objPlayer,sysNpc,sysScript)
	objNpc.LXXData = objNpc.LXXData or {}
	local dwRoleID = objPlayer:GetRoleID()
	local sysMap = objPlayer:GetSystem("CMapSystem")
	local sysTask = objPlayer:GetSystem("CTaskSystem")
	local Map = sysMap:GetCurMap()
	local mgrMonster = Map:GetMonsterMgr()
	local num=sysScript:GetItemNum(7100058)		
	if num < 1 then 
		if not sysScript:AddTaskItem(7100058,1,enItemBindType.eYes) then 
			sysScript:Notice(9000110010)
			--return
		end
	end
	local dwObjID = objNpc.LXXData[dwRoleID] 
	if dwObjID then
	 local objMon = mgrMonster:GetMonsterInfo(dwObjID)
	 if objMon and (not objMon.Data.blShow) then
			objMon:Show()
		else
			sysTask:Error(999916)
		end	
		else
		objNpc.LXXData[dwRoleID] = sysScript:AddMonSP(10072003,10072003,10072003,10072003,100720030,-99,-92)
	end		
	-- if sysScript:AddTaskItem(7100058,1,enItemBindType.eYes) 	then 
	-- sysScript:AddMonSP(10072003,10072003,10072003,10072003,100720030,-99,-92)	
	-- else 
		  -- sysScript:Notice(9000110010)			
	-- end
end
--设置npc携带任务
function npc_fun.npc_get_task()
	local task = {
		[1] = 6049;
		[2] = 6050;
	};
	return task
end
--设置读条时间
function npc_fun.npc_get_time()
	return 2000
end
-----------------------------------------------
------------------其他npc
--npc触发对话时执行（修改对话内容）
function npc_fun.cb_npc_on_talk(talk_page,objPlayer)
	
end
-----------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Npc,npc_id,npc_fun)
-----------------------------------------------