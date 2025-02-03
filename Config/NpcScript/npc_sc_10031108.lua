﻿--保存函数表
local npc_fun = {}
--npcid
local npc_id = 10031108
----------------------------------------------
-----------------采集npc
--npc开启检查
function npc_fun.cb_npc_on_opera_check(objNpc,objPlayer,sysNpc,sysScript)
			local num=sysScript:GetItemNum(7100014)
				if num > 0 then
	  sysScript:Notice(9000110020)			
				return false;
			end
			return true
end


--npc被开启时执行
function npc_fun.cb_npc_on_opera(objNpc,objPlayer,sysNpc,sysScript)
	local sysMap = objPlayer:GetSystem("CMapSystem")
	local sysTask = objPlayer:GetSystem("CTaskSystem")
	if sysScript:AddTaskItem(7100014,1,enItemBindType.eYes) 	then 
	local Task = sysTask:GetTask(2021)		
		if Task:GetTaskState()~=TaskStateConfig.Done then
				sysScript:MovePlayer(-41,-40,nil)
		end		
	else
		  sysScript:Notice(9000110010)
	end
end


--设置npc携带任务
function npc_fun.npc_get_task()
	local task = {
		[1] = 2021;
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