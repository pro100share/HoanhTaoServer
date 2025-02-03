--保存函数表
local npc_fun = {}
--npcid
local npc_id = 10081075
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
	sysScript.LXX10081075 = sysScript.LXX10081075 or {}
	local sysMap = objPlayer:GetSystem("CMapSystem")
	local sysTask = objPlayer:GetSystem("CTaskSystem")	
	local objMap = sysMap:GetCurMap()
	local mgrMon = objMap:GetMonsterMgr()
	for k,v in pairs(sysScript.LXX10081075) do
		local Mon = mgrMon:GetMonsterInfo(v)
		if Mon and not Mon:IsDead() then
			sysTask:Error(999916)
			return;
		end
	end
	sysScript.LXX10081075[1] = sysScript:AddMonSP(10082008,1075,10082008,10082008,101120020,-5,-4)
	sysScript.LXX10081075[2] =	sysScript:AddMonSP(10082008,1075,10082008,10082008,101120020,-3,-4)
	sysScript.LXX10081075[3] = 	sysScript:AddMonSP(10082008,1075,10082008,10082008,101120020,-1,-4)
	sysScript.LXX10081075[4] = 	sysScript:AddMonSP(10082008,1075,10082008,10082008,101120020,1,-4)
	sysScript.LXX10081075[5] = 	sysScript:AddMonSP(10082008,1075,10082008,10082008,101120020,3,-4)
	sysScript.LXX10081075[6] = 	sysScript:AddMonSP(10082008,1075,10082008,10082008,101120020,5,-4)		
	sysScript.LXX10081075[7] = 	sysScript:AddMonSP(10082008,1075,10082008,10082008,101120020,7,-4)	
	sysScript.LXX10081075[8] = 	sysScript:AddMonSP(10082008,1075,10082008,10082008,101120020,8,-5)		
	
	sysScript.LXX10081075[9] = 	sysScript:AddMonSP(10082008,1075,10082008,10082008,101120020,-5,-10)	
	sysScript.LXX10081075[10] = 	sysScript:AddMonSP(10082008,1075,10082008,10082008,101120020,-3,-10)
	sysScript.LXX10081075[11] = 	sysScript:AddMonSP(10082008,1075,10082008,10082008,101120020,-1,-10)
	sysScript.LXX10081075[12] = 	sysScript:AddMonSP(10082008,1075,10082008,10082008,101120020,1,-10)
	sysScript.LXX10081075[13] = 	sysScript:AddMonSP(10082008,1075,10082008,10082008,101120020,3,-10)
	sysScript.LXX10081075[14] = 	sysScript:AddMonSP(10082008,1075,10082008,10082008,101120020,5,-10)
	sysScript.LXX10081075[15] = 	sysScript:AddMonSP(10082008,1075,10082008,10082008,101120020,7,-10)	
	sysScript.LXX10081075[16] = 	sysScript:AddMonSP(10082008,1075,10082008,10082008,101120020,9,-10)	

	sysScript.LXX10081075[17] = 	sysScript:AddMonSP(10082008,1075,10082008,10082008,101120020,-22,-4)	
	sysScript.LXX10081075[18] = 	sysScript:AddMonSP(10082008,1075,10082008,10082008,101120020,-24,-4)	
	sysScript.LXX10081075[19] = 	sysScript:AddMonSP(10082008,1075,10082008,10082008,101120020,-26,-4)	
	sysScript.LXX10081075[20] = 	sysScript:AddMonSP(10082008,1075,10082008,10082008,101120020,-28,-4)	
	sysScript.LXX10081075[21] = 	sysScript:AddMonSP(10082008,1075,10082008,10082008,101120020,-30,-4)	
	sysScript.LXX10081075[22] = 	sysScript:AddMonSP(10082008,1075,10082008,10082008,101120020,-32,-4)	
	sysScript.LXX10081075[23] = 	sysScript:AddMonSP(10082008,1075,10082008,10082008,101120020,-34,-4)	
	sysScript.LXX10081075[24] = 	sysScript:AddMonSP(10082008,1075,10082008,10082008,101120020,-35,-5)	

	sysScript.LXX10081075[25] = 	sysScript:AddMonSP(10082008,1075,10082008,10082008,101120020,-22,-10)	
	sysScript.LXX10081075[26] = 	sysScript:AddMonSP(10082008,1075,10082008,10082008,101120020,-24,-10)
	sysScript.LXX10081075[27] = 	sysScript:AddMonSP(10082008,1075,10082008,10082008,101120020,-26,-10)
	sysScript.LXX10081075[28] = 	sysScript:AddMonSP(10082008,1075,10082008,10082008,101120020,-28,-10)
	sysScript.LXX10081075[29] = 	sysScript:AddMonSP(10082008,1075,10082008,10082008,101120020,-30,-10)
	sysScript.LXX10081075[30] = 	sysScript:AddMonSP(10082008,1075,10082008,10082008,101120020,-32,-10)
	sysScript.LXX10081075[31] = 	sysScript:AddMonSP(10082008,1075,10082008,10082008,101120020,-34,-10)	
	sysScript.LXX10081075[32] = 	sysScript:AddMonSP(10082008,1075,10082008,10082008,101120020,-36,-10)	

	sysScript.LXX10081075[33] = 	sysScript:AddMonSP(10082008,1075,10082008,10082008,101120020,-14,-16)	
	sysScript.LXX10081075[34] = 	sysScript:AddMonSP(10082008,1075,10082008,10082008,101120020,-14,-18)
	sysScript.LXX10081075[35] = 	sysScript:AddMonSP(10082008,1075,10082008,10082008,101120020,-14,-20)
	sysScript.LXX10081075[36] = 	sysScript:AddMonSP(10082008,1075,10082008,10082008,101120020,-14,-22)
	sysScript.LXX10081075[37] = 	sysScript:AddMonSP(10082008,1075,10082008,10082008,101120020,-14,-24)
	sysScript.LXX10081075[38] = 	sysScript:AddMonSP(10082008,1075,10082008,10082008,101120020,-14,-26)
	sysScript.LXX10081075[39] = 	sysScript:AddMonSP(10082008,1075,10082008,10082008,101120020,-14,-28)	
	sysScript.LXX10081075[40] = 	sysScript:AddMonSP(10082008,1075,10082008,10082008,101120020,-14,-30)	
end
-----------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Npc,npc_id,npc_fun)
-----------------------------------------------