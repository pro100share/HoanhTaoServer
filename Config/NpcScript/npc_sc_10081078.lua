--保存函数表
local npc_fun = {}
--npcid
local npc_id = 10081078
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
	sysScript.LXX10081078 = sysScript.LXX10081078 or {}
	local sysMap = objPlayer:GetSystem("CMapSystem")
	local sysTask = objPlayer:GetSystem("CTaskSystem")	
	local objMap = sysMap:GetCurMap()
	local mgrMon = objMap:GetMonsterMgr()
	for k,v in pairs(sysScript.LXX10081078) do
		local Mon = mgrMon:GetMonsterInfo(v)
		if Mon and not Mon:IsDead() then
			sysTask:Error(999916)
			return;
		end
	end
	sysScript.LXX10081078[1] = sysScript:AddMonSP(10082015,1079,10082015,10082015,100420040,-6.27,12.85)
	sysScript.LXX10081078[2] =	sysScript:AddMonSP(10082015,1079,10082015,10082015,100420040,-2.39,11.20)
	sysScript.LXX10081078[3] = 	sysScript:AddMonSP(10082015,1079,10082015,10082015,100420040,-2.85,14.68)
	sysScript.LXX10081078[4] = 	sysScript:AddMonSP(10082015,1079,10082015,10082015,100420040,0.21,13.49)
	sysScript.LXX10081078[5] = 	sysScript:AddMonSP(10082015,1079,10082015,10082015,100420040,3.98,15.99)
	sysScript.LXX10081078[6] = 	sysScript:AddMonSP(10082015,1079,10082015,10082015,100420040,1.65,18.32)		
	sysScript.LXX10081078[7] = 	sysScript:AddMonSP(10082015,1079,10082015,10082015,100420040,2.0,22.16)	
	sysScript.LXX10081078[8] = 	sysScript:AddMonSP(10082015,1079,10082015,10082015,100420040,-6.78,23.31)			
	sysScript.LXX10081078[9] = 	sysScript:AddMonSP(10082015,1079,10082015,10082015,100420040,-7.24,27.10)	
	sysScript.LXX10081078[10] = 	sysScript:AddMonSP(10082015,1079,10082015,10082015,100420040,-10.60,27.26)
	sysScript.LXX10081078[11] = 	sysScript:AddMonSP(10082015,1079,10082015,10082015,100420040,-11.76,22.94)
	sysScript.LXX10081078[12] = 	sysScript:AddMonSP(10082015,1079,10082015,10082015,100420040,-9.93,19.3)
	sysScript.LXX10081078[13] = 	sysScript:AddMonSP(10082015,1079,10082015,10082015,100420040,-6.93,17.47)
	sysScript.LXX10081078[14] = 	sysScript:AddMonSP(10082015,1079,10082015,10082015,100420040,-5.59,23.78)
	sysScript.LXX10081078[15] = 	sysScript:AddMonSP(10082015,1079,10082015,10082015,100420040,4.14,29.86)	
	sysScript.LXX10081078[16] = 	sysScript:AddMonSP(10082015,1079,10082015,10082015,100420040,-1.35,30.33)	
	sysScript.LXX10081078[17] = 	sysScript:AddMonSP(10082015,1079,10082015,10082015,100420040,-5.36,10.94)	
	sysScript.LXX10081078[18] = 	sysScript:AddMonSP(10082015,1079,10082015,10082015,100420040,4.53,18.89)	
	sysScript.LXX10081078[19] = 	sysScript:AddMonSP(10082015,1079,10082015,10082015,100420040,7.14,22.10)	
	sysScript.LXX10081078[20] = 	sysScript:AddMonSP(10082015,1079,10082015,10082015,100420040,2.29,26.63)	
	sysScript.LXX10081078[21] = 	sysScript:AddMonSP(10082015,1079,10082015,10082015,100420040,-1.24,27.65)	
	sysScript.LXX10081078[22] = 	sysScript:AddMonSP(10082015,1079,10082015,10082015,100420040,-4.82,27.33)	
	sysScript.LXX10081078[23] = 	sysScript:AddMonSP(10082015,1079,10082015,10082015,100420040,-9.67,24.44)	
	sysScript.LXX10081078[24] = 	sysScript:AddMonSP(10082015,1079,10082015,10082015,100420040,-8.82,15.31)	
	sysScript.LXX10081078[25] = 	sysScript:AddMonSP(10082015,1079,10082015,10082015,100420040,0.25,15.82)	
	sysScript.LXX10081078[26] = 	sysScript:AddMonSP(10082015,1079,10082015,10082015,100420040,4.37,22.40)
	sysScript.LXX10081078[27] = 	sysScript:AddMonSP(10082015,1079,10082015,10082015,100420040,5.7,25.57)
	sysScript.LXX10081078[28] = 	sysScript:AddMonSP(10082015,1079,10082015,10082015,100420040,1.89,30.73)
	sysScript.LXX10081078[29] = 	sysScript:AddMonSP(10082015,1079,10082015,10082015,100420040,1.1,28.12)
	sysScript.LXX10081078[30] = 	sysScript:AddMonSP(10082015,1079,10082015,10082015,100420040,-8.75,27.87)
					sysScript:Story(805301)
end
-----------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Npc,npc_id,npc_fun)
-----------------------------------------------