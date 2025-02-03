--保存函数表
local npc_fun = {}
--npcid
local npc_id = 10131108
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
			sysScript.LXX10131108 = sysScript.LXX10131108 or {}
			local sysMap = objPlayer:GetSystem("CMapSystem")
			local sysTask = objPlayer:GetSystem("CTaskSystem")	
			local objMap = sysMap:GetCurMap()
			local mgrMon = objMap:GetMonsterMgr()
			for k,v in pairs(sysScript.LXX10131108) do
				local Mon = mgrMon:GetMonsterInfo(v)
				if Mon and not Mon:IsDead() then
					sysTask:Error(999916)
					return;
				end
			end
			sysScript.LXX10131108[1] = sysScript:AddMonSP(10132016,1118,10132016,10132016,101310090,3,-5)
			sysScript.LXX10131108[2] = sysScript:AddMonSP(10132016,1118,10132016,10132016,101310090,3,-4)
			sysScript.LXX10131108[3] = sysScript:AddMonSP(10132016,1118,10132016,10132016,101310090,3,-3)
			sysScript.LXX10131108[4] = sysScript:AddMonSP(10132016,1118,10132016,10132016,101310090,3,-2)
			sysScript.LXX10131108[5] = sysScript:AddMonSP(10132016,1118,10132016,10132016,101310090,2,-3)
			sysScript.LXX10131108[6] = sysScript:AddMonSP(10132016,1118,10132016,10132016,101310090,2,-1)	
			sysScript.LXX10131108[7] = sysScript:AddMonSP(10132016,1118,10132016,10132016,101310090,2,-4)
			
			sysScript.LXX10131108[8] = sysScript:AddMonSP(10132016,1118,10132016,10132016,101310090,-7,-3)	
			sysScript.LXX10131108[9] = sysScript:AddMonSP(10132016,1118,10132016,10132016,101310090,-7,-2)			
			sysScript.LXX10131108[10] = sysScript:AddMonSP(10132016,1118,10132016,10132016,101310090,-7,-1)
			sysScript.LXX10131108[11] = sysScript:AddMonSP(10132016,1118,10132016,10132016,101310090,-7,0)
			sysScript.LXX10131108[12] = sysScript:AddMonSP(10132016,1118,10132016,10132016,101310090,-8,-1)
			sysScript.LXX10131108[13] = sysScript:AddMonSP(10132016,1118,10132016,10132016,101310090,-9,-1)
			sysScript.LXX10131108[14] = sysScript:AddMonSP(10132016,1118,10132016,10132016,101310090,-8,0)
			
			sysScript.LXX10131108[15] = sysScript:AddMonSP(10132016,1118,10132016,10132016,101310090,-12,9)
			sysScript.LXX10131108[16] = sysScript:AddMonSP(10132016,1118,10132016,10132016,101310090,-13,8)
			sysScript.LXX10131108[17] = sysScript:AddMonSP(10132016,1118,10132016,10132016,101310090,-13,7)
			sysScript.LXX10131108[18] = sysScript:AddMonSP(10132016,1118,10132016,10132016,101310090,-14,7)	
			sysScript.LXX10131108[19] = sysScript:AddMonSP(10132016,1118,10132016,10132016,101310090,-14,8)
			sysScript.LXX10131108[20] = sysScript:AddMonSP(10132016,1118,10132016,10132016,101310090,-14,9)
			sysScript.LXX10131108[21] = sysScript:AddMonSP(10132016,1118,10132016,10132016,101310090,-12,8)			
end
-----------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Npc,npc_id,npc_fun)
-----------------------------------------------