--保存函数表
local npc_fun = {}
--npcid
local npc_id = 10121093
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
	sysScript.LXX10121093 = sysScript.LXX10121093 or {}
	local sysMap = objPlayer:GetSystem("CMapSystem")
	local sysTask = objPlayer:GetSystem("CTaskSystem")	
	local objMap = sysMap:GetCurMap()
	local mgrMon = objMap:GetMonsterMgr()
	for k,v in pairs(sysScript.LXX10121093) do
		local Mon = mgrMon:GetMonsterInfo(v)
		if Mon and not Mon:IsDead() then
			sysTask:Error(999916)
			return;
		end
	end
	sysScript.LXX10121093[1] = sysScript:AddMonSP(10122003,2103,10122003,10122003,101020130,52,62)
	sysScript.LXX10121093[2] = sysScript:AddMonSP(10122003,2103,10122003,10122003,101020130,50,64)
	sysScript.LXX10121093[3] = sysScript:AddMonSP(10122003,2103,10122003,10122003,101020130,47,66)
	sysScript.LXX10121093[4] = sysScript:AddMonSP(10122003,2103,10122003,10122003,101020130,44,64)
	sysScript.LXX10121093[5] = sysScript:AddMonSP(10122003,2103,10122003,10122003,101020130,50,53)
	sysScript.LXX10121093[6] = sysScript:AddMonSP(10122003,2103,10122003,10122003,101020130,50,50)
	sysScript.LXX10121093[7] = sysScript:AddMonSP(10122003,2103,10122003,10122003,101020130,47,48)
	sysScript.LXX10121093[8] = sysScript:AddMonSP(10122003,2103,10122003,10122003,101020130,44,51)
end
-----------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Npc,npc_id,npc_fun)
-----------------------------------------------