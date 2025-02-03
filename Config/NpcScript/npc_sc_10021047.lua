﻿--保存函数表
local npc_fun = {}
--npcid
local npc_id = 10021047
----------------------------------------------
-----------------采集npc
--npc开启检查
function npc_fun.cb_npc_on_opera_check(objNpc,objPlayer,sysNpc,sysScript)
	return true
end

--npc被开启时执行
function npc_fun.cb_npc_on_opera(objNpc,objPlayer,sysNpc,sysScript)
end

--设置npc携带任务
function npc_fun.npc_get_task()
	local task = {
	};
	return task
end
--设置读条时间
function npc_fun.npc_get_time()
	return 3000
end
-----------------------------------------------
------------------其他npc
--npc触发对话时执行（修改对话内容）
function npc_fun.cb_npc_on_talk(talk_page,objPlayer,sysScript)
	local tbInfo = CCrossSvrHoldManager:GetCrossHoldInfoOnEnterScene()
	local Page = {[1]=1}
	for _, Info in pairs(tbInfo) do
		for k,v in pairs(Info) do
			table.insert(Page,{tp=tk.close,text=v,})
		end
		break;
	end
	Page[1] = nil
	talk_page[1] = Page
end
----------------------------------------------
-----------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Npc,npc_id,npc_fun)
-----------------------------------------------