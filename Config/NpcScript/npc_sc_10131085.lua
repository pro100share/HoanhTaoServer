--保存函数表
local npc_fun = {}
--npcid
local npc_id = 10131085
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
			sysScript.LXX10131085 = sysScript.LXX10131085 or {}
			local sysMap = objPlayer:GetSystem("CMapSystem")
			local sysTask = objPlayer:GetSystem("CTaskSystem")	
			local objMap = sysMap:GetCurMap()
			local mgrMon = objMap:GetMonsterMgr()
			for k,v in pairs(sysScript.LXX10131085) do
				local Mon = mgrMon:GetMonsterInfo(v)
				if Mon and not Mon:IsDead() then
					sysTask:Error(999916)
					return;
				end
			end
			sysScript.LXX10131085[1] = sysScript:AddMonSP(10132015,1117,10132015,10132015,101310070,2,-15)
			sysScript.LXX10131085[2] = sysScript:AddMonSP(10132015,1117,10132015,10132015,101310070,2,-17)
			sysScript.LXX10131085[3] = sysScript:AddMonSP(10132015,1117,10132015,10132015,101310070,2,-19)
			sysScript.LXX10131085[4] = sysScript:AddMonSP(10132015,1117,10132015,10132015,101310070,2,-21)
			sysScript.LXX10131085[5] = sysScript:AddMonSP(10132015,1117,10132015,10132015,101310070,2,-23)
			sysScript.LXX10131085[6] = sysScript:AddMonSP(10132015,1117,10132015,10132015,101310070,-1,-15)	
			sysScript.LXX10131085[7] = sysScript:AddMonSP(10132015,1117,10132015,10132015,101310070,-1,-17)
			sysScript.LXX10131085[8] = sysScript:AddMonSP(10132015,1117,10132015,10132015,101310070,-1,-19)	
			sysScript.LXX10131085[9] = sysScript:AddMonSP(10132015,1117,10132015,10132015,101310070,-1,-21)			
			sysScript.LXX10131085[10] = sysScript:AddMonSP(10132015,1117,10132015,10132015,101310070,-1,-23)
			sysScript.LXX10131085[11] = sysScript:AddMonSP(10132015,1117,10132015,10132015,101310070,-4,-15)
			sysScript.LXX10131085[12] = sysScript:AddMonSP(10132015,1117,10132015,10132015,101310070,-4,-17)
			sysScript.LXX10131085[13] = sysScript:AddMonSP(10132015,1117,10132015,10132015,101310070,-4,-19)
			sysScript.LXX10131085[14] = sysScript:AddMonSP(10132015,1117,10132015,10132015,101310070,-4,-21)
			sysScript.LXX10131085[15] = sysScript:AddMonSP(10132015,1117,10132015,10132015,101310070,-4,-23)
			sysScript.LXX10131085[16] = sysScript:AddMonSP(10132015,1117,10132015,10132015,101310070,-7,-15)
			sysScript.LXX10131085[17] = sysScript:AddMonSP(10132015,1117,10132015,10132015,101310070,-7,-17)
			sysScript.LXX10131085[18] = sysScript:AddMonSP(10132015,1117,10132015,10132015,101310070,-7,-19)	
			sysScript.LXX10131085[19] = sysScript:AddMonSP(10132015,1117,10132015,10132015,101310070,-7,-21)
			sysScript.LXX10131085[20] = sysScript:AddMonSP(10132015,1117,10132015,10132015,101310070,-7,-23)
			sysScript.LXX10131085[21] = sysScript:AddMonSP(10132015,1117,10132015,10132015,101310070,5,-15)
			sysScript.LXX10131085[22] = sysScript:AddMonSP(10132015,1117,10132015,10132015,101310070,5,-17)
			sysScript.LXX10131085[23] = sysScript:AddMonSP(10132015,1117,10132015,10132015,101310070,5,-19)
			sysScript.LXX10131085[24] = sysScript:AddMonSP(10132015,1117,10132015,10132015,101310070,5,-21)
			sysScript.LXX10131085[25] = sysScript:AddMonSP(10132015,1117,10132015,10132015,101310070,5,-23)
			sysScript.LXX10131085[26] = sysScript:AddMonSP(10132015,1117,10132015,10132015,101310070,8,-15)
			sysScript.LXX10131085[27] = sysScript:AddMonSP(10132015,1117,10132015,10132015,101310070,8,-17)
			sysScript.LXX10131085[28] = sysScript:AddMonSP(10132015,1117,10132015,10132015,101310070,8,-19)
			sysScript.LXX10131085[29] = sysScript:AddMonSP(10132015,1117,10132015,10132015,101310070,8,-21)
			sysScript.LXX10131085[30] = sysScript:AddMonSP(10132015,1117,10132015,10132015,101310070,8,-23)			
end
-----------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Npc,npc_id,npc_fun)
-----------------------------------------------