--保存函数表
local npc_fun = {}
--npcid
local npc_id = 10051087
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
	sysScript.LXX10051087 = sysScript.LXX10051087 or {}
	local sysMap = objPlayer:GetSystem("CMapSystem")
	local sysTask = objPlayer:GetSystem("CTaskSystem")	
	local objMap = sysMap:GetCurMap()
	local mgrMon = objMap:GetMonsterMgr()
	for k,v in pairs(sysScript.LXX10051087) do
		local Mon = mgrMon:GetMonsterInfo(v)
		if Mon and not Mon:IsDead() then
			sysTask:Error(999916)
			return;
		end
	end
	sysScript.LXX10051087[1] = sysScript:AddMonSP(10052011,10052011,10052011,10052011,100520010,-1,0)
	sysScript.LXX10051087[2] =	sysScript:AddMonSP(10052011,10052011,10052011,10052011,100520010,1,0)
	sysScript.LXX10051087[3] =	sysScript:AddMonSP(10052011,10052011,10052011,10052011,100520010,3,0)
	sysScript.LXX10051087[4] =	sysScript:AddMonSP(10052011,10052011,10052011,10052011,100520010,5,0)
	sysScript.LXX10051087[5] = 	sysScript:AddMonSP(10052011,10052011,10052011,10052011,100520010,7,0)
	sysScript.LXX10051087[6] = 	sysScript:AddMonSP(10052011,10052011,10052011,10052011,100520010,9,0)	
	
	sysScript.LXX10051087[7] = 	sysScript:AddMonSP(10052012,10052012,10052012,10052012,100520020,-16,0)
	sysScript.LXX10051087[8] = 	sysScript:AddMonSP(10052012,10052012,10052012,10052012,100520020,-18,0)
	sysScript.LXX10051087[9] = 	sysScript:AddMonSP(10052012,10052012,10052012,10052012,100520020,-20,0)
	sysScript.LXX10051087[10] = 	sysScript:AddMonSP(10052012,10052012,10052012,10052012,100520020,-22,0)
	sysScript.LXX10051087[11] = 	sysScript:AddMonSP(10052012,10052012,10052012,10052012,100520020,-24,0)
	sysScript.LXX10051087[12] = 	sysScript:AddMonSP(10052012,10052012,10052012,10052012,100520020,-26,0)

	sysScript.LXX10051087[13] = 	sysScript:AddMonSP(10052011,10052011,10052011,10052011,100520010,-16,-8)
	sysScript.LXX10051087[14] = 	sysScript:AddMonSP(10052011,10052011,10052011,10052011,100520010,-18,-8)
	sysScript.LXX10051087[15] = 	sysScript:AddMonSP(10052011,10052011,10052011,10052011,100520010,-20,-8)
	sysScript.LXX10051087[16] = 	sysScript:AddMonSP(10052011,10052011,10052011,10052011,100520010,-22,-8)
	sysScript.LXX10051087[17] = 	sysScript:AddMonSP(10052011,10052011,10052011,10052011,100520010,-24,-8)
	sysScript.LXX10051087[18] = 	sysScript:AddMonSP(10052011,10052011,10052011,10052011,100520010,-26,-8)

	sysScript.LXX10051087[19] = 	sysScript:AddMonSP(10052012,10052012,10052012,10052012,100520020,-1,-8)
	sysScript.LXX10051087[20] = 	sysScript:AddMonSP(10052012,10052012,10052012,10052012,100520020,1,-8)
	sysScript.LXX10051087[21] = 	sysScript:AddMonSP(10052012,10052012,10052012,10052012,100520020,3,-8)
	sysScript.LXX10051087[22] = 	sysScript:AddMonSP(10052012,10052012,10052012,10052012,100520020,5,-8)
	sysScript.LXX10051087[23] = 	sysScript:AddMonSP(10052012,10052012,10052012,10052012,100520020,7,-8)
	sysScript.LXX10051087[24] = 	sysScript:AddMonSP(10052012,10052012,10052012,10052012,100520020,9,-8)	
end
-----------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Npc,npc_id,npc_fun)
-----------------------------------------------