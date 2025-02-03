--保存函数表
local npc_fun = {}
--npcid
local npc_id = 10041020
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
	return 2000
end
-----------------------------------------------
------------------其他npc
--npc触发对话时执行（修改对话内容）
function npc_fun.cb_npc_on_talk(talk_page,objPlayer,sysScript)
	if sysScript:GetTaskState(3034) == 2 then
			local Link = {tp=tk.page,id=14,text=303427};
			sysScript:NpcModiTalkLink(talk_page,1,4,Link)
	else
	  sysScript:NpcModiTalkLink(talk_page,1,4,nil)
	end
end
-----------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Npc,npc_id,npc_fun)
-----------------------------------------------