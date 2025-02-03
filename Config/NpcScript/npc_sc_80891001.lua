--保存函数表
local npc_fun = {}
--npcid
local npc_id = 80891001
----------------------------------------------

-----------------------------------
--npc触发对话时执行（修改对话内容）
function npc_fun.JiangLi(objNpc,objPlayer,sysNpc,tbParam,sysScript)
	local objWarSystem = objPlayer:GetSystem("CWarSystem");
	local objWar = CWarHost:FindWar(objWarSystem.dwCurWarID);
	if not (objWar) then return end
	
	local dwRoleID = objPlayer:GetRoleID()
	--重复领取保护
	if not (dwRoleID) then	return	end
	
	objWar.Protect = objWar.Protect or {};
	if (objWar.Protect[dwRoleID]) then
		sysScript:Notice(13009100003);
		return
	end
	objWar.Protect[dwRoleID] = 1;
	
	objWar:ChangeNumber("num10060",1)
	local dwNum = objWar:GetNumber("num10060");
	
	
	--设置积分
	local objWar = nil;
	local objWarSys = objPlayer:GetSystem("CWarSystem");
	if objWarSys then
		objWar = CWarHost:FindWar(objWarSys.dwCurWarID);
	end
	

	--排名
	local Condition = 0;
	if (dwNum <= 3) then
		Condition = dwNum;
		if objWar then
			objWar:ChangeRoleScore(objPlayer,(100-Condition))
		end
	else
		Condition = 4;
	end
	
	--增加限制进入的BUFF
	local objBuffSys = objPlayer:GetSystem("CBuffSystem");
	if objBuffSys then
		objBuffSys:AddBuff(9563,1);
	end
	
	--奖励
	WarAddition[10060]:Award(objWar,objPlayer,objWarSystem,Condition)
		
	--公告
	local Name = objPlayer:GetName()
	if (Condition <= 3) then
		CScriptManager:ChatNoticeAll(string.format(SysStringConfigInfo[13009100000],Name,Condition),1,true)
	end
	
	local objEventCenter = objPlayer:GetSystem("CPlayerEventCenterSystem");
	if objEventCenter then
		objEventCenter:DoEvent(enumPlayerEventType.EventTaoHuaMiZhen);
	end
	
	
	--领取完传送回城
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;
	if objWarSystem.dwCurWarID ~= 0 then
		objWarSystem:Back();
	else
		if not objMapSys:ExecTransforMap(1002,99) then
			return false;
		end
	end;
end
-----------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Npc,npc_id,npc_fun)
-----------------------------------------------
