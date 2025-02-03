--保存函数表
local npc_fun = {}
--npcid
local npc_id = 8090
function npc_fun.buff(objNpc,objPlayer,sysNpc,tbParam,sysScript)
		local objBuffSys = objPlayer:GetSystem("CBuffSystem");
		if sysScript:CheckBUff(50700028) then
			sysScript:Notice(13009200010)	
		else		
			objBuffSys:AddBuff(50700027,1);
			objBuffSys:AddBuff(50700028,1);			
		end 
end

function npc_fun.item(objNpc,objPlayer,sysNpc,tbParam,sysScript)
		local sysScript = objPlayer:GetSystem("CScriptSystem")
		if not sysScript then
			return 0;
		end
		
		local a = sysScript:GetItemNum(5501171);
		if (a < 10) then 
			sysScript:Notice(13009200017)
		elseif (a >= 10) then
			sysScript:DelItem(5501171,10);
			sysScript:AddPackItem(5501170,1);
		end
end



-----------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Npc,npc_id,npc_fun)
-----------------------------------------------



