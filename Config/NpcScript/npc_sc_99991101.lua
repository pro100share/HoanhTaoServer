--保存函数表
local npc_fun = {}
--npcid
local npc_id = 99991101

local BaoHu = {};
----------------------------------------------
-----------------采集npc
--npc开启检查
function npc_fun.cb_npc_on_opera_check(objNpc,objPlayer,sysNpc,sysScript)
	if objPlayer then
		if not objPlayer:IsDead() then
			return true;
		end
	end
	return false
end
--npc被开启时执行
function npc_fun.cb_npc_on_opera(objNpc,objPlayer,sysNpc,sysScript)
	local corssSvrSystem = objPlayer:GetSystem("CCrossSvrSystem");
	if not corssSvrSystem then
		_err("npc_fun.cb_npc_on_opera 99991101 cant get CCrossSvrSystem!!!")
		return;
	end
	
	local objCrossSvr = corssSvrSystem:GetCrossObj()
	if objCrossSvr then
		if objCrossSvr.itemHoldRoleId == -1 then
			objCrossSvr:ItemHoldBegin(objPlayer);
		
			--移除ncp
			local cross = CrossSvrConfig[10001];
			if cross and cross.tulongdao then
				CScriptManager:DelNpcObj(9999, cross.tulongdao);
			else
				_err("npc_fun.cb_npc_on_opera 99991101 there is not cross.tulongdao!!!")
			end
		end
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
	return 5000
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