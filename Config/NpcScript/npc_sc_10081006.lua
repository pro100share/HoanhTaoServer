--保存函数表
local npc_fun = {}
--npcid
local npc_id = 10081006
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
	sysScript.LXX10081006 = sysScript.LXX10081006 or {}
	local sysMap = objPlayer:GetSystem("CMapSystem")
	local sysTask = objPlayer:GetSystem("CTaskSystem")	
	local objMap = sysMap:GetCurMap()
	local mgrMon = objMap:GetMonsterMgr()
	for k,v in pairs(sysScript.LXX10081006) do
		local Mon = mgrMon:GetMonsterInfo(v)
		if Mon and not Mon:IsDead() then
			sysTask:Error(999916)
			return;
		end
	end
	sysScript.LXX10081006[1] = sysScript:AddMonSP(10082013,1076,10082013,10082013,100710100,-2,-49)
	sysScript.LXX10081006[2] = sysScript:AddMonSP(10082013,1076,10082013,10082013,100710100,0,-47)
	sysScript.LXX10081006[3] = sysScript:AddMonSP(10082013,1076,10082013,10082013,100710100,3,-46)
	sysScript.LXX10081006[4] = sysScript:AddMonSP(10082013,1076,10082013,10082013,100710100,-8,-46)
	sysScript.LXX10081006[5] = sysScript:AddMonSP(10082013,1076,10082013,10082013,100710100,-9,-44)
	sysScript.LXX10081006[6] = sysScript:AddMonSP(10082013,1076,10082013,10082013,100710100,-6,-42)
	
end
-----------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Npc,npc_id,npc_fun)
-----------------------------------------------