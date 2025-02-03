local dwMonsterId = 50604003
local MonsterScript = {}
------
--[[
--]]
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)
	return 1,1,0
end
---------------------------------------------
--杀死一个目标时执行
function MonsterScript:CBMonsterOnKill(Monster)
end
--受到攻击时执行
function MonsterScript:CBMonsterOnAttacked(Monster)
end
--出生前执行
function MonsterScript:CBMonsterBeforeBorn(Monster)

end
--怪物出生时执行
function MonsterScript:CBMonsterOnBorn(Monster)

end
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,objPlayer,sysScript)

	local TeamSystem = objPlayer:GetSystem("CTeamSystem")
	local memberTbl = TeamSystem:GetTeamLeaguer()
	
	if not memberTbl then
		return;
	end
	
	Monster:MapNotice(9000660824,7)	
	
	if (#memberTbl)==0 then
		local objBuffSys = objPlayer:GetSystem("CBuffSystem");
		objBuffSys:AddBuff(50600002,1);
	else
		for i,memberId in ipairs(memberTbl) do
			local objPlayer = CMapManager:GetPlayer(memberId)			
			local objBuffSys = objPlayer:GetSystem("CBuffSystem");
			if objBuffSys then
				objBuffSys:AddBuff(50600002,1);
			end
		end;
	end	

end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------






















