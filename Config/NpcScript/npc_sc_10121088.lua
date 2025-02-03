--保存函数表
local npc_fun = {}
--npcid
local npc_id = 10121088
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
	sysScript.LXX10121088 = sysScript.LXX10121088 or {}
	local sysMap = objPlayer:GetSystem("CMapSystem")
	local sysTask = objPlayer:GetSystem("CTaskSystem")	
	local objMap = sysMap:GetCurMap()
	local mgrMon = objMap:GetMonsterMgr()
	for k,v in pairs(sysScript.LXX10121088) do
		local Mon = mgrMon:GetMonsterInfo(v)
		if Mon and not Mon:IsDead() then
			sysTask:Error(999916)
			return;
		end
	end
	sysScript.LXX10121088[1] = sysScript:AddMonSP(10122009,1103,10122009,10122009,101020120,0.38,-6.20)
	sysScript.LXX10121088[2] = sysScript:AddMonSP(10122009,1103,10122009,10122009,101020120,-0.91,-9.09)
	sysScript.LXX10121088[3] = sysScript:AddMonSP(10122009,1103,10122009,10122009,101020120,-3.36,-11.05)
	sysScript.LXX10121088[4] = sysScript:AddMonSP(10122009,1103,10122009,10122009,101020120,-6.60,-10.43)
	sysScript.LXX10121088[5] = sysScript:AddMonSP(10122009,1103,10122009,10122009,101020120,-8.58,-8.04)
	sysScript.LXX10121088[6] = sysScript:AddMonSP(10122009,1103,10122009,10122009,101020120,-8.64,-3.86)	
	sysScript.LXX10121088[7] = sysScript:AddMonSP(10122009,1103,10122009,10122009,101020120,-6.62,-4.89)
	sysScript.LXX10121088[8] = sysScript:AddMonSP(10122009,1103,10122009,10122009,101020120,-6.07,-8.34)	
	sysScript.LXX10121088[9] = sysScript:AddMonSP(10122009,1103,10122009,10122009,101020120,-2.27,-7.65)			
	sysScript.LXX10121088[10] = sysScript:AddMonSP(10122009,1103,10122009,10122009,101020120,-2.54,-5.35)		
end
-----------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Npc,npc_id,npc_fun)
-----------------------------------------------