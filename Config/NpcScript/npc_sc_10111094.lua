--保存函数表
local npc_fun = {}
--npcid
local npc_id = 10111094
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
	sysScript.LXX10111094 = sysScript.LXX10111094 or {}
	local sysMap = objPlayer:GetSystem("CMapSystem")
	local sysTask = objPlayer:GetSystem("CTaskSystem")	
	local objMap = sysMap:GetCurMap()
	local mgrMon = objMap:GetMonsterMgr()
	for k,v in pairs(sysScript.LXX10111094) do
		local Mon = mgrMon:GetMonsterInfo(v)
		if Mon and not Mon:IsDead() then
			sysTask:Error(999916)
			return;
		end
	end
	sysScript.LXX10111094[1] = sysScript:AddMonSP(10112008,1090,10112008,10112008,101120130,-60,-38)
	sysScript.LXX10111094[2] = sysScript:AddMonSP(10112008,1090,10112008,10112008,101120130,-62,-38)
	sysScript.LXX10111094[3] = sysScript:AddMonSP(10112008,1090,10112008,10112008,101120130,-64,-38)
	sysScript.LXX10111094[4] = sysScript:AddMonSP(10112008,1090,10112008,10112008,101120130,-66,-38)
	sysScript.LXX10111094[5] = sysScript:AddMonSP(10112008,1090,10112008,10112008,101120130,-59,-46)
	sysScript.LXX10111094[6] = sysScript:AddMonSP(10112008,1090,10112008,10112008,101120130,-61,-46)
	sysScript.LXX10111094[7] = sysScript:AddMonSP(10112008,1090,10112008,10112008,101120130,-63,-46)
	sysScript.LXX10111094[8] = sysScript:AddMonSP(10112008,1090,10112008,10112008,101120130,-65,-46)
	sysScript.LXX10111094[9] = sysScript:AddMonSP(10112008,1090,10112008,10112008,101120130,-57,-40)
	sysScript.LXX10111094[10] = sysScript:AddMonSP(10112008,1090,10112008,10112008,101120130,-56,-39)
	sysScript.LXX10111094[11] = sysScript:AddMonSP(10112008,1090,10112008,10112008,101120130,-55,-40)
	sysScript.LXX10111094[12] = sysScript:AddMonSP(10112008,1090,10112008,10112008,101120130,-53,-39)
	sysScript.LXX10111094[13] = sysScript:AddMonSP(10112008,1090,10112008,10112008,101120130,-57,-42)
	sysScript.LXX10111094[14] = sysScript:AddMonSP(10112008,1090,10112008,10112008,101120130,-55,-42)
	sysScript.LXX10111094[15] = sysScript:AddMonSP(10112008,1090,10112008,10112008,101120130,-54,-42)
	sysScript.LXX10111094[16] = sysScript:AddMonSP(10112008,1090,10112008,10112008,101120130,-53,-42)
	sysScript.LXX10111094[17] = sysScript:AddMonSP(10112008,1090,10112008,10112008,101120130,-59,-37)
	sysScript.LXX10111094[18] = sysScript:AddMonSP(10112008,1090,10112008,10112008,101120130,-57,-45)	
end
-----------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Npc,npc_id,npc_fun)
-----------------------------------------------