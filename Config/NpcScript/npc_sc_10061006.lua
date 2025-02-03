--保存函数表
local npc_fun = {}
--npcid
local npc_id = 10061006
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
	sysScript.LXX10061006 = sysScript.LXX10061006 or {}
	local sysMap = objPlayer:GetSystem("CMapSystem")
	local objMap = sysMap:GetCurMap()
	local mgrMon = objMap:GetMonsterMgr()
	for k,v in pairs(sysScript.LXX10061006) do
		local Mon = mgrMon:GetMonsterInfo(v)
		if Mon and not Mon:IsDead() then
			--怪还在
			return;
		end
	end
	sysScript.LXX10061006[1] = sysScript:AddMonSP(10062020,10062020,50042002,10062018,100820040,-16,-2)
	sysScript.LXX10061006[2] = sysScript:AddMonSP(10062020,10062020,50042002,10062018,100820040,-10,-7)
	sysScript.LXX10061006[3] = sysScript:AddMonSP(10062020,10062020,50042002,10062018,100820040,-5,-3)	
end
-----------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Npc,npc_id,npc_fun)
-----------------------------------------------