--保存函数表
local npc_fun = {}
--npcid
local npc_id = 10101082
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
	sysScript.LXX10101082 = sysScript.LXX10101082 or {}
	local sysMap = objPlayer:GetSystem("CMapSystem")
	local sysTask = objPlayer:GetSystem("CTaskSystem")	
	local objMap = sysMap:GetCurMap()
	local mgrMon = objMap:GetMonsterMgr()
	for k,v in pairs(sysScript.LXX10101082) do
		local Mon = mgrMon:GetMonsterInfo(v)
		if Mon and not Mon:IsDead() then
			sysTask:Error(999916)
			return;
		end
	end
	sysScript.LXX10101082[1] = sysScript:AddMonSP(10102021,1087,10102021,10102021,11300,-4,6)
	sysScript.LXX10101082[2] = 	sysScript:AddMonSP(10102021,1087,10102021,10102021,11300,1,2)
	sysScript.LXX10101082[3] = 	sysScript:AddMonSP(10102021,1087,10102021,10102021,11300,3,-3)
	sysScript.LXX10101082[4] = 	sysScript:AddMonSP(10102021,1087,10102021,10102021,11300,-4,-1)
	sysScript.LXX10101082[5] = 	sysScript:AddMonSP(10102021,1087,10102021,10102021,11300,-6,3)
	sysScript.LXX10101082[6] = 	sysScript:AddMonSP(10102021,1087,10102021,10102021,11300,-3,-5)	
	sysScript.LXX10101082[7] = 	sysScript:AddMonSP(10102021,1087,10102021,10102021,11300,-7,-5)
	sysScript.LXX10101082[8] = 	sysScript:AddMonSP(10102021,1087,10102021,10102021,11300,-8,0)
	sysScript.LXX10101082[9] = 	sysScript:AddMonSP(10102021,1087,10102021,10102021,11300,-7,-8)
	sysScript.LXX10101082[10] = 	sysScript:AddMonSP(10102021,1087,10102021,10102021,11300,-10,-4)
					sysScript:Story(904701)	
end
-----------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Npc,npc_id,npc_fun)
-----------------------------------------------