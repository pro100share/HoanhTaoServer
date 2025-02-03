--保存函数表
local npc_fun = {}
--npcid
local npc_id = 10131089
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
	sysScript.LXX10131089 = sysScript.LXX10131089 or {}
	local sysMap = objPlayer:GetSystem("CMapSystem")
	local sysTask = objPlayer:GetSystem("CTaskSystem")	
	local objMap = sysMap:GetCurMap()
	local mgrMon = objMap:GetMonsterMgr()
	for k,v in pairs(sysScript.LXX10131089) do
		local Mon = mgrMon:GetMonsterInfo(v)
		if Mon and not Mon:IsDead() then
			sysTask:Error(999916)
			return;
		end
	end
	sysScript.LXX10131089[1] = sysScript:AddMonSP(10132012,1100,10132012,10132012,101310040,15,53)
	sysScript.LXX10131089[2] = sysScript:AddMonSP(10132012,1100,10132012,10132012,101310040,12,53)
	sysScript.LXX10131089[3] = sysScript:AddMonSP(10132012,1100,10132012,10132012,101310040,9,52)
	sysScript.LXX10131089[4] = sysScript:AddMonSP(10132012,1100,10132012,10132012,101310040,6,52)
	sysScript.LXX10131089[5] = sysScript:AddMonSP(10132012,1100,10132012,10132012,101310040,15,50)
	sysScript.LXX10131089[6] = sysScript:AddMonSP(10132012,1100,10132012,10132012,101310040,12,50)	
	sysScript.LXX10131089[7] = sysScript:AddMonSP(10132012,1100,10132012,10132012,101310040,9,49)
	sysScript.LXX10131089[8] = sysScript:AddMonSP(10132012,1100,10132012,10132012,101310040,6,49)		
end
-----------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Npc,npc_id,npc_fun)
-----------------------------------------------