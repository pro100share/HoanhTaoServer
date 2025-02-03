local dwMonsterId = 50012001
local MonsterScript = {}
------
--[[
--]]
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)
	return 50012001,1,0
end
---------------------------------------------
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster, objKiller)
	local duplSystem = objKiller:GetSystem("CDuplSystem");
	duplSystem:WinDupl();
end
--杀死一个目标时执行
function MonsterScript:CBMonsterOnKill(Monster)
	
end
--受到攻击时执行
 function MonsterScript:CBMonsterOnAttacked(Monster,objPlayer,dwSkillId)
	local current = Monster:GetHP()	--获取当前血量
	local all = Monster:GetMaxHP()		--获取全部血量
	if current <= 0 then return end
	if  current/all < 0.13 then
		Monster:Say(105)
	elseif current/all < 0.4 then
		Monster:Say(104)
	elseif current/all < 0.7 then
		Monster:Say(103)
	elseif current/all < 0.99 then
		Monster:Say(102)
	end
 end

--怪物出生时执行
function MonsterScript:CBMonsterOnBorn(Monster)
end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------
