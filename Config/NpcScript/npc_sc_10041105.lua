--保存函数表
local npc_fun = {}
--npcid
local npc_id = 10041105
----------------------------------------------
-----------------采集npc
--npc开启检查
function npc_fun.cb_npc_on_opera_check(objNpc,objPlayer,sysNpc,sysScript)
	return true
end
--npc被开启时执行
function npc_fun.cb_npc_on_opera(objNpc,objPlayer,sysNpc,sysScript)
		sysScript:KillMonster(88888803)
						local t = {
						[1] = 303201;
						[2] = 303201;
						[3] = 303201;
						[4] = 303201;
					}
					local dwProf = sysScript:GetProf()
					local f =function()
				  sysScript:Story(t[dwProf],true)		
				  sysScript:NpcStory(303202)				  
					end			
				  sysScript:Story(303902,nil,f)
end
--设置npc携带任务
function npc_fun.npc_get_task()
	local task = {
		[1] = 3039;
	};
	return task
end
--设置读条时间
function npc_fun.npc_get_time()
	return 2000
end
-----------------------------------------------
------------------其他npc
--npc触发对话时执行（修改对话内容）
function npc_fun.cb_npc_on_talk(talk_page,objPlayer)
	
end
-----------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Npc,npc_id,npc_fun)
-----------------------------------------------