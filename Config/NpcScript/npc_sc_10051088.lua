--保存函数表
local npc_fun = {}
--npcid
local npc_id = 10051088
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
	sysScript.LXX10051088 = sysScript.LXX10051088 or {}
	local sysMap = objPlayer:GetSystem("CMapSystem")
	local sysTask = objPlayer:GetSystem("CTaskSystem")	
	local objMap = sysMap:GetCurMap()
	local mgrMon = objMap:GetMonsterMgr()
	for k,v in pairs(sysScript.LXX10051088) do
		local Mon = mgrMon:GetMonsterInfo(v)
		if Mon and not Mon:IsDead() then
			sysTask:Error(999916)
			return;
		end
	end
	sysScript.LXX10051088[1] = 	sysScript:AddMonSP(10052008,10052008,10052008,10052008,100520010,-2,2)
	sysScript.LXX10051088[2] = 		sysScript:AddMonSP(10052009,10052009,10052009,10052009,100520020,-4,2)
	sysScript.LXX10051088[3] = 		sysScript:AddMonSP(10052008,10052008,10052008,10052008,100520010,-7,2)
	sysScript.LXX10051088[4] = 		sysScript:AddMonSP(10052009,10052009,10052009,10052009,100520020,-10,2)
	sysScript.LXX10051088[5] = 		sysScript:AddMonSP(10052008,10052008,10052008,10052008,100520010,-13,2)
	sysScript.LXX10051088[6] = 		sysScript:AddMonSP(10052009,10052009,10052009,10052009,100520020,-16,2)
	sysScript.LXX10051088[7] = 		sysScript:AddMonSP(10052008,10052008,10052008,10052008,100520010,-16,-1)
	sysScript.LXX10051088[8] = 		sysScript:AddMonSP(10052009,10052009,10052009,10052009,100520020,-16,-3)
	sysScript.LXX10051088[9] = 		sysScript:AddMonSP(10052008,10052008,10052008,10052008,100520010,-16,-5)
	sysScript.LXX10051088[10] = 		sysScript:AddMonSP(10052009,10052009,10052009,10052009,100520020,-16,-7)
	sysScript.LXX10051088[11] = 		sysScript:AddMonSP(10052008,10052008,10052008,10052008,100520010,-16,-9)
	sysScript.LXX10051088[12] = 		sysScript:AddMonSP(10052009,10052009,10052009,10052009,100520020,-16,-11)
	sysScript.LXX10051088[13] = 		sysScript:AddMonSP(10052008,10052008,10052008,10052008,100520010,-13,-11)
	sysScript.LXX10051088[14] = 		sysScript:AddMonSP(10052009,10052009,10052009,10052009,100520020,-10,-11)
	sysScript.LXX10051088[15] = 		sysScript:AddMonSP(10052008,10052008,10052008,10052008,100520010,-7,-11)
	sysScript.LXX10051088[16] = 		sysScript:AddMonSP(10052009,10052009,10052009,10052009,100520020,-4,-11)
	sysScript.LXX10051088[17] = 		sysScript:AddMonSP(10052008,10052008,10052008,10052008,100520010,-2,-11)
	sysScript.LXX10051088[18] = 		sysScript:AddMonSP(10052009,10052009,10052009,10052009,100520020,-2,-9)
	sysScript.LXX10051088[19] = 		sysScript:AddMonSP(10052008,10052008,10052008,10052008,100520010,-2,-7)
	sysScript.LXX10051088[20] = 		sysScript:AddMonSP(10052009,10052009,10052009,10052009,100520020,-2,-5)
	sysScript.LXX10051088[21] = 		sysScript:AddMonSP(10052008,10052008,10052008,10052008,100520010,-2,-3)
	sysScript.LXX10051088[22] = 		sysScript:AddMonSP(10052009,10052009,10052009,10052009,100520020,-2,-1)	
					sysScript:Story(403501)
end
-----------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Npc,npc_id,npc_fun)
-----------------------------------------------