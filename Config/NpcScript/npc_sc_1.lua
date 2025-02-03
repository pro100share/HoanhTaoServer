--保存函数表
local npc_fun = {}
--npcid
local npc_id = 1
----------------------------------------------
-----------------采集npc
--npc开启检查
function npc_fun.cb_npc_on_opera_check(objNpc,objPlayer,sysNpc,sysScript)
	print("ccccc",objNpc,objPlayer,sysNpc)
	return true
end

--npc被开启时执行
function npc_fun.cb_npc_on_opera(objNpc,objPlayer,sysNpc,sysScript)
	print("zcs--------",objNpc,objPlayer,sysNpc)
end
--设置npc携带任务
function npc_fun.npc_get_task()
	local task = {
		[1] = 1001;
		[2] = 1002;
	};
	return task
end
--设置读条时间
function npc_fun.npc_get_time()
	return 3000
end
-----------------------------------------------
------------------其他npc
--npc触发对话时执行（修改对话内容）
function npc_fun.cb_npc_on_talk(talk_page,objPlayer,sysScript)
	
end
----------------------------------------------
function npc_fun.zcs(objNpc,objPlayer,sysNpc,tbParam,sysScript)
	local sysMap = objPlayer:GetSystem("CMapSystem")
	local Map = sysMap:GetCurMap()
	local mgrNpc = Map:GetNpcMgr()
	local ObjId = mgrNpc:Add(1001,1,2,0, szName, szTitle,dwObjId,objPlayer)
	mgrNpc:Remove(ObjId)
	
	local mgrMonster = Map:GetMonsterMgr()
	local ObjId = mgrMonster:Add(1001,1,2,Map,bNoShow,dwObjId)
	mgrMonster:Remove(ObjId)

end
-----------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Npc,npc_id,npc_fun)
-----------------------------------------------