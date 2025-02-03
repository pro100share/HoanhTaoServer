--保存函数表
local npc_fun = {}
--npcid
local npc_id = 10031106
----------------------------------------------
-----------------采集npc
--npc开启检查
function npc_fun.cb_npc_on_opera_check(objNpc,objPlayer,sysNpc)
	return true
end
--npc被开启时执行
function npc_fun.cb_npc_on_opera(objNpc,objPlayer,sysNpc)
	-- local sysItem = objPlayer:GetSystem("CItemSystem")
	-- local t = {
		-- {dwItemEnum=7100020;dwItemNumber=1;dwBindType=enItemBindType.eYes;}
	-- }
	-- if sysItem:HaveRoomForGroup( enItemPosition.eTaskRoom, t ) then
		
		-- sysItem:AddItem(7100020, enItemPosition.eTaskRoom, 1, enItemBindType.eYes,true , dwLifeTime)
	-- else
	 -- --[[
	 
		-- --]]
	-- end
	-- if sysItem:GetItemNumber(7100020, enItemPosition.eTaskRoom, enItemBindType.eYes, bNotCheckLife)<5 then
		-- sysNpc:OnOpera(objNpc:GetObjId())
	-- end
end
--设置npc携带任务
function npc_fun.npc_get_task()
	local task = {
		--[1] = 2025;
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