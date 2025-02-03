--保存函数表
local npc_fun = {}
--npcid
local npc_id = 50851001
----------------------------------------------
-----------------采集npc
--npc开启检查
function npc_fun.cb_npc_on_opera_check(objNpc,objPlayer,sysNpc,sysScript)
	local sysItem = objPlayer:GetSystem("CItemSystem")
	local num = sysItem:GetEnumItemNumInTaskRoom(7100011)
	if num > 0 then
		return false;
	end
	return true
end
--npc被开启时执行
function npc_fun.cb_npc_on_opera(objNpc,objPlayer,sysNpc,sysScript)
	if sysScript:AddTaskItem(7100011, 1, enItemBindType.eYes) then
		-- sysScript:Story(101601)	
	else
		sysTask:Error(999918)
	end;	
end
--设置npc携带任务
function npc_fun.npc_get_task()
	local task = {
		[1] = 1016;
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