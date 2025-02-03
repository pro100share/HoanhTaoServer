--保存函数表
local npc_fun = {}
--npcid
local npc_id = 10121092
----------------------------------------------
-----------------采集npc
--npc开启检查
function npc_fun.cb_npc_on_opera_check(objNpc,objPlayer,sysNpc,sysScript)

end

--npc被开启时执行
function npc_fun.cb_npc_on_opera(objNpc,objPlayer,sysNpc,sysScript)

end
--设置npc携带任务
function npc_fun.npc_get_task()

end
--设置读条时间
function npc_fun.npc_get_time()

end
-----------------------------------------------
------------------其他npc
--npc触发对话时执行（修改对话内容）
function npc_fun.cb_npc_on_talk(talk_page,objPlayer,sysScript)
	
end
----------------------------------------------
function npc_fun.shuaguai(objNpc,objPlayer,sysNpc,tbParam,sysScript)
	sysScript.LXX10121092 = sysScript.LXX10121092 or {}
	local sysMap = objPlayer:GetSystem("CMapSystem")
	local sysTask = objPlayer:GetSystem("CTaskSystem")	
	local objMap = sysMap:GetCurMap()
	local mgrMon = objMap:GetMonsterMgr()
	for k,v in pairs(sysScript.LXX10121092) do
		local Mon = mgrMon:GetMonsterInfo(v)
		if Mon and not Mon:IsDead() then
			sysTask:Error(999916)
			return;
		end
	end
	sysScript.LXX10121092[1] = sysScript:AddMonSP(10122003,2103,10122003,10122003,101020130,35,64)
	sysScript.LXX10121092[2] = sysScript:AddMonSP(10122003,2103,10122003,10122003,101020130,32,64)
	sysScript.LXX10121092[3] = sysScript:AddMonSP(10122003,2103,10122003,10122003,101020130,28,64)
	sysScript.LXX10121092[4] = sysScript:AddMonSP(10122003,2103,10122003,10122003,101020130,24,64)
	sysScript.LXX10121092[5] = sysScript:AddMonSP(10122003,2103,10122003,10122003,101020130,36,51)
	sysScript.LXX10121092[6] = sysScript:AddMonSP(10122003,2103,10122003,10122003,101020130,32,51)
	sysScript.LXX10121092[7] = sysScript:AddMonSP(10122003,2103,10122003,10122003,101020130,18,60)
	sysScript.LXX10121092[8] = sysScript:AddMonSP(10122003,2103,10122003,10122003,101020130,14,60)
	sysScript.LXX10121092[9] = sysScript:AddMonSP(10122003,2103,10122003,10122003,101020130,14,56)
end
-----------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Npc,npc_id,npc_fun)
-----------------------------------------------