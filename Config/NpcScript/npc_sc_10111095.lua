--保存函数表
local npc_fun = {}
--npcid
local npc_id = 10111095
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
	local sysMap = objPlayer:GetSystem("CMapSystem")
	local sysTask = objPlayer:GetSystem("CTaskSystem")
	local Map = sysMap:GetCurMap()
	local mgrMonster = Map:GetMonsterMgr()
	if Map.dwMonObjId then
	 local objMon = mgrMonster:GetMonsterInfo(Map.dwMonObjId)
	 if objMon and (not objMon.Data.blShow) then
			objMon:Show()
		else
			sysTask:Error(999916)
		end	
		else
		Map.dwMonObjId = sysScript:AddMonSP(10112017,10112017,10112017,10112017,100610020,-7,-3)
	end		


end
-----------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Npc,npc_id,npc_fun)
-----------------------------------------------