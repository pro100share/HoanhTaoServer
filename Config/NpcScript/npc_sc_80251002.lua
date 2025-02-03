--保存函数表
local npc_fun = {}
--npcid
local npc_id = 80251002
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
function npc_fun.Charge(objNpc,objPlayer,sysNpc,tbParam,sysScript)
	local XiaoHao = 500;
	
	local ItemSystem = objPlayer:GetSystem("CItemSystem")
	local YuanBao = ItemSystem:GetGoldNum()
	
	local objScriptSys = objPlayer:GetSystem("CScriptSystem");
	if not objScriptSys then
		return;
	end
	
	--判断buff
	local objBufSys = objPlayer:GetSystem("CBuffSystem");
	if not objBufSys then
		return;
	end
	--如果有相同BUFF返回
	if objBufSys:GetBuffObj(50600000) ~= nil then
		objScriptSys:Notice(13006001302,7);
		return
	end
	--判定背包货币数量
	if (YuanBao < XiaoHao) then
		objScriptSys:Notice(7000110019,7);
		return
	end

	ItemSystem:CostGold(XiaoHao, _G.ItemSysOperType.BuyNpc)
	--增加货币BUFF
	local objBuffSys = objPlayer:GetSystem("CBuffSystem");
	if objBuffSys then
		objBuffSys:AddBuff(50600000,1);
	end
end
-----------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Npc,npc_id,npc_fun)
-----------------------------------------------