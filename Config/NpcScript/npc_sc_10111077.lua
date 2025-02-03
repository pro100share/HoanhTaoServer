--保存函数表
local npc_fun = {}
--npcid
local npc_id = 10111077
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
	sysScript.LXX10111077 = sysScript.LXX10111077 or {}
	local sysMap = objPlayer:GetSystem("CMapSystem")
	local sysTask = objPlayer:GetSystem("CTaskSystem")	
	local objMap = sysMap:GetCurMap()
	local mgrMon = objMap:GetMonsterMgr()
	for k,v in pairs(sysScript.LXX10111077) do
		local Mon = mgrMon:GetMonsterInfo(v)
		if Mon and not Mon:IsDead() then
			sysTask:Error(999916)
			return;
		end
	end
	sysScript.LXX10111077[1] = sysScript:AddMonSP(10112015,1099,10112015,10112015,101120100,2,14)
	sysScript.LXX10111077[2] = sysScript:AddMonSP(10112015,1099,10112015,10112015,101120100,0,14)
	sysScript.LXX10111077[3] = sysScript:AddMonSP(10112015,1099,10112015,10112015,101120100,-2,14)
	sysScript.LXX10111077[4] = sysScript:AddMonSP(10112015,1099,10112015,10112015,101120100,-3,14)
	sysScript.LXX10111077[5] = sysScript:AddMonSP(10112015,1099,10112015,10112015,101120100,-5,14)	
	sysScript.LXX10111077[6] = sysScript:AddMonSP(10112015,1099,10112015,10112015,101120100,2,11)
	sysScript.LXX10111077[7] = sysScript:AddMonSP(10112015,1099,10112015,10112015,101120100,0,11)
	sysScript.LXX10111077[8] = sysScript:AddMonSP(10112015,1099,10112015,10112015,101120100,-2,11)
	sysScript.LXX10111077[9] = sysScript:AddMonSP(10112015,1099,10112015,10112015,101120100,-3,11)
	sysScript.LXX10111077[10] = sysScript:AddMonSP(10112015,1099,10112015,10112015,101120100,-5,11)
	sysScript.LXX10111077[11] = sysScript:AddMonSP(10112015,1099,10112015,10112015,101120100,2,8)
	sysScript.LXX10111077[12] = sysScript:AddMonSP(10112015,1099,10112015,10112015,101120100,0,8)
	sysScript.LXX10111077[13] = sysScript:AddMonSP(10112015,1099,10112015,10112015,101120100,-2,8)	
	sysScript.LXX10111077[14] = sysScript:AddMonSP(10112015,1099,10112015,10112015,101120100,-3,8)
	sysScript.LXX10111077[15] = sysScript:AddMonSP(10112015,1099,10112015,10112015,101120100,-5,8)			
					sysScript:NpcStory(1006701)	
end
-----------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Npc,npc_id,npc_fun)
-----------------------------------------------