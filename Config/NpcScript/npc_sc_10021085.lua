--保存函数表
local npc_fun = {}
--npcid
local npc_id = 10021085
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
function npc_fun.buff(objNpc,objPlayer,sysNpc,tbParam,sysScript)
		local objBuffSys = objPlayer:GetSystem("CBuffSystem");
		if sysScript:CheckBUff(50700025) then
	  sysScript:Notice(3003010005)	
		else		
			objBuffSys:AddBuff(50700024,1);
			objBuffSys:AddBuff(50700025,1);			
		end  
end
-----------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Npc,npc_id,npc_fun)
-----------------------------------------------