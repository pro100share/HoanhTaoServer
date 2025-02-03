--保存函数表
local npc_fun = {}
--npcid
local npc_id = 10091017
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
	sysScript.LXX10091017 = sysScript.LXX10091017 or {}
	local sysMap = objPlayer:GetSystem("CMapSystem")
	local sysTask = objPlayer:GetSystem("CTaskSystem")	
	local objMap = sysMap:GetCurMap()
	local mgrMon = objMap:GetMonsterMgr()
	for k,v in pairs(sysScript.LXX10091017) do
		local Mon = mgrMon:GetMonsterInfo(v)
		if Mon and not Mon:IsDead() then
			sysTask:Error(999916)
			return;
		end
	end
	sysScript.LXX10091017[1] = sysScript:AddMonSP(10092011,1066,10092011,10092011,100410170,-13,4)
	sysScript.LXX10091017[2] = 	sysScript:AddMonSP(10092011,1066,10092011,10092011,100410170,-13,2)
	sysScript.LXX10091017[3] = 	sysScript:AddMonSP(10092011,1066,10092011,10092011,100410170,-13,0)
	sysScript.LXX10091017[4] = 	sysScript:AddMonSP(10092011,1066,10092011,10092011,100410170,-13,-2)
	sysScript.LXX10091017[5] = 	sysScript:AddMonSP(10092011,1066,10092011,10092011,100410170,-13,-4)
	sysScript.LXX10091017[6] = 	sysScript:AddMonSP(10092011,1066,10092011,10092011,100410170,-13,-6)	
	sysScript.LXX10091017[7] = 	sysScript:AddMonSP(10092011,1066,10092011,10092011,100410170,-13,-8)
	sysScript.LXX10091017[8] = 	sysScript:AddMonSP(10092011,1066,10092011,10092011,100410170,-13,-10)
	sysScript.LXX10091017[9] = 	sysScript:AddMonSP(10092011,1066,10092011,10092011,100410170,-12,5)
	sysScript.LXX10091017[10] = 	sysScript:AddMonSP(10092011,1066,10092011,10092011,100410170,-11,2)
	sysScript.LXX10091017[11] = 	sysScript:AddMonSP(10092011,1066,10092011,10092011,100410170,-11,0)
	sysScript.LXX10091017[12] = 	sysScript:AddMonSP(10092011,1066,10092011,10092011,100410170,-11,-2)
	sysScript.LXX10091017[13] = 	sysScript:AddMonSP(10092011,1066,10092011,10092011,100410170,-11,-4)
	sysScript.LXX10091017[14] = 	sysScript:AddMonSP(10092011,1066,10092011,10092011,100410170,-11,-6)
	sysScript.LXX10091017[15] = 	sysScript:AddMonSP(10092011,1066,10092011,10092011,100410170,-11,8)
	sysScript.LXX10091017[16] = 	sysScript:AddMonSP(10092011,1066,10092011,10092011,100410170,-11,-10)
	sysScript.LXX10091017[17] = 	sysScript:AddMonSP(10092011,1066,10092011,10092011,100410170,-9,-1)
	sysScript.LXX10091017[18] = 	sysScript:AddMonSP(10092011,1066,10092011,10092011,100410170,-9,-3)
	sysScript.LXX10091017[19] = 	sysScript:AddMonSP(10092011,1066,10092011,10092011,100410170,-9,-5)
	sysScript.LXX10091017[20] = 	sysScript:AddMonSP(10092011,1066,10092011,10092011,100410170,-7,2)
	sysScript.LXX10091017[21] = 	sysScript:AddMonSP(10092011,1066,10092011,10092011,100410170,-7,0)
	sysScript.LXX10091017[22] = 	sysScript:AddMonSP(10092011,1066,10092011,10092011,100410170,-7,-2)
	sysScript.LXX10091017[23] = 	sysScript:AddMonSP(10092011,1066,10092011,10092011,100410170,-7,-4)
	sysScript.LXX10091017[24] = 	sysScript:AddMonSP(10092011,1066,10092011,10092011,100410170,-7,-6)
	sysScript.LXX10091017[25] = 	sysScript:AddMonSP(10092011,1066,10092011,10092011,100410170,-7,-8)
	sysScript.LXX10091017[26] = 	sysScript:AddMonSP(10092011,1066,10092011,10092011,100410170,-7,-10)
	sysScript.LXX10091017[27] = 	sysScript:AddMonSP(10092011,1066,10092011,10092011,100410170,-5,2)
	sysScript.LXX10091017[28] = 	sysScript:AddMonSP(10092011,1066,10092011,10092011,100410170,-5,0)
	sysScript.LXX10091017[29] = 	sysScript:AddMonSP(10092011,1066,10092011,10092011,100410170,-5,-2)
	sysScript.LXX10091017[30] = 	sysScript:AddMonSP(10092011,1066,10092011,10092011,100410170,-5,-4)
	sysScript.LXX10091017[31] = 	sysScript:AddMonSP(10092011,1066,10092011,10092011,100410170,-5,-6)	
end
-----------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Npc,npc_id,npc_fun)
-----------------------------------------------