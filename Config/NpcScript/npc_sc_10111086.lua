--保存函数表
local npc_fun = {}
--npcid
local npc_id = 10111086
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
	sysScript.LXX10111086 = sysScript.LXX10111086 or {}
	local sysMap = objPlayer:GetSystem("CMapSystem")
	local sysTask = objPlayer:GetSystem("CTaskSystem")	
	local objMap = sysMap:GetCurMap()
	local mgrMon = objMap:GetMonsterMgr()
	for k,v in pairs(sysScript.LXX10111086) do
		local Mon = mgrMon:GetMonsterInfo(v)
		if Mon and not Mon:IsDead() then
			sysTask:Error(999916)
			return;
		end
	end
	sysScript.LXX10111086[1] = sysScript:AddMonSP(10112023,2096,10112023,10112023,101120040,16,-18)
	sysScript.LXX10111086[2] = sysScript:AddMonSP(10112023,2096,10112023,10112023,101120040,14,-18)
	sysScript.LXX10111086[3] = sysScript:AddMonSP(10112023,2096,10112023,10112023,101120040,12,-18)
	sysScript.LXX10111086[4] = sysScript:AddMonSP(10112023,2096,10112023,10112023,101120040,10,-18)
	sysScript.LXX10111086[5] = sysScript:AddMonSP(10112023,2096,10112023,10112023,101120040,10,-22)
	sysScript.LXX10111086[6] = sysScript:AddMonSP(10112023,2096,10112023,10112023,101120040,12,-22)	
	sysScript.LXX10111086[7] = sysScript:AddMonSP(10112023,2096,10112023,10112023,101120040,14,-22)	
	sysScript.LXX10111086[8] = sysScript:AddMonSP(10112023,2096,10112023,10112023,101120040,16,-22)		
end
-----------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Npc,npc_id,npc_fun)
-----------------------------------------------