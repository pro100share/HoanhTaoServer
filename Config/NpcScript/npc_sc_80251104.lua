--保存函数表
local npc_fun = {}
--npcid
local npc_id = 80251104

local BaoHu = {};
----------------------------------------------
-----------------采集npc
--npc开启检查
function npc_fun.cb_npc_on_opera_check(objNpc,objPlayer,sysNpc,sysScript)
	return true
end
--npc被开启时执行
function npc_fun.cb_npc_on_opera(objNpc,objPlayer,sysNpc,sysScript)
	BaoHu[objPlayer] = BaoHu[objPlayer] or 0;

	if (BaoHu[objPlayer] < 4) then
		if sysScript:AddPackItem(5501030, 1, enItemBindType.eYes) then
			BaoHu[objPlayer] = BaoHu[objPlayer] + 1;
		else
			sysScript:Notice(9000110029)			
		end;
	else
		sysScript:Notice(9000110029)
	end	
end
--设置npc携带任务
function npc_fun.npc_get_task()
	local task = {
	0;
	};
	return task
end
--设置读条时间
function npc_fun.npc_get_time()
	return 9000
end
--删除回调
function npc_fun.npc_on_del()
	BaoHu = {};
end
-----------------------------------------------
------------------其他npc
--npc触发对话时执行（修改对话内容）
function npc_fun.cb_npc_on_talk(talk_page,objPlayer)
	
end
-----------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Npc,npc_id,npc_fun)
-----------------------------------------------