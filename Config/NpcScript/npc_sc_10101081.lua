--保存函数表
local npc_fun = {}
--npcid
local npc_id = 10101081
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
	sysScript.LXX10101081 = sysScript.LXX10101081 or {}
	local sysMap = objPlayer:GetSystem("CMapSystem")
	local sysTask = objPlayer:GetSystem("CTaskSystem")	
	local objMap = sysMap:GetCurMap()
	local mgrMon = objMap:GetMonsterMgr()
	for k,v in pairs(sysScript.LXX10101081) do
		local Mon = mgrMon:GetMonsterInfo(v)
		if Mon and not Mon:IsDead() then
			sysTask:Error(999916)
			return;
		end
	end
	sysScript.LXX10101081[1] = sysScript:AddMonSP(10102020,1087,10102020,10102020,101020120,35,35)
	sysScript.LXX10101081[2] = 	sysScript:AddMonSP(10102020,1087,10102020,10102020,101020120,29,35)
	sysScript.LXX10101081[3] = 	sysScript:AddMonSP(10102020,1087,10102020,10102020,101020120,24,31)
	sysScript.LXX10101081[4] = 	sysScript:AddMonSP(10102020,1087,10102020,10102020,101020120,24,25)
	sysScript.LXX10101081[5] = 	sysScript:AddMonSP(10102020,1087,10102020,10102020,101020120,31,21)
	sysScript.LXX10101081[6] = 	sysScript:AddMonSP(10102020,1087,10102020,10102020,101020120,37,24)	
	sysScript.LXX10101081[7] = 	sysScript:AddMonSP(10102020,1087,10102020,10102020,101020120,38,29)
	sysScript.LXX10101081[8] = 	sysScript:AddMonSP(10102020,1087,10102020,10102020,101020120,36,32)
	sysScript.LXX10101081[9] = 	sysScript:AddMonSP(10102020,1087,10102020,10102020,101020120,31,32)
	sysScript.LXX10101081[10] = 	sysScript:AddMonSP(10102020,1087,10102020,10102020,101020120,29,30)
end
-----------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Npc,npc_id,npc_fun)
-----------------------------------------------