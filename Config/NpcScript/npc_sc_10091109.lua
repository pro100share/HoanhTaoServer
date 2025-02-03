--保存函数表
local npc_fun = {}
--npcid
local npc_id = 10091109
----------------------------------------------
-----------------采集npc
--npc开启检查
function npc_fun.cb_npc_on_opera_check(objNpc,objPlayer,sysNpc,sysScript)
	if sysScript:CheckTaskMonster(7036,1) then
		  sysScript:Notice(9000110020)	
		return false;
	end
	return true
end
--npc被开启时执行
function npc_fun.cb_npc_on_opera(objNpc,objPlayer,sysNpc,sysScript)
	local sysMap = objPlayer:GetSystem("CMapSystem")
	local sysTask = objPlayer:GetSystem("CTaskSystem")
	sysTask:RcvKillMonster(88888836)
	sysScript:AddBuff(10092013,1)
	sysScript:AddBuff(100920130,1)	
	
	
	-- local objBuffSys = Enemy:GetSystem("CBuffSystem");
	-- if objBuffSys then
		-- objBuffSys:AddBuff(10092013,1);
	-- end
end
--设置npc携带任务
function npc_fun.npc_get_task()
	local task = {
		[1] = 7036;
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