﻿--保存函数表
local npc_fun = {}
--npcid
local npc_id = 10071109
----------------------------------------------
-----------------采集npc
--npc开启检查
function npc_fun.cb_npc_on_opera_check(objNpc,objPlayer,sysNpc,sysScript)
			local num=sysScript:GetItemNum(7100007)
				if num > 6 then
	  sysScript:Notice(9000110020)			
				return false;
			end
			return true
end
--npc被开启时执行
function npc_fun.cb_npc_on_opera(objNpc,objPlayer,sysNpc,sysScript)
	local sysMap = objPlayer:GetSystem("CMapSystem")
	local sysTask = objPlayer:GetSystem("CTaskSystem")
	if sysScript:AddTaskItem(7100007,1,enItemBindType.eYes) 	then 
	else 
		  sysScript:Notice(9000110010)			
	end
		local num=sysScript:GetItemNum(7100007)
	if sysScript:GetItemNum(7100007)<6 then
		sysNpc:OnOpera(objNpc:GetObjId())
	end
end
--设置npc携带任务
function npc_fun.npc_get_task()
	local task = {
		[1] = 6005;
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