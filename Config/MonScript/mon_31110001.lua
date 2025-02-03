local dwMonsterId = 31110001	--BOSS
local MonsterScript = {}
-------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)
end

--杀死一个目标时执行
function MonsterScript:CBMonsterOnKill(Monster)
end
--受到攻击时执行
function MonsterScript:CBMonsterOnAttacked(Monster)
end
--出生前执行
function MonsterScript:CBMonsterBeforeBorn(Monster)
	local Mark = ActivityConfig.GongCheng[1][dwMonsterId].sign
	local Name = ActivityConfig.GongCheng[1][Mark].Mon.Name
	
	Monster:SetSendData(1,Name)
end

--怪物出生时执行
function MonsterScript:CBMonsterOnBorn(Monster)
end
--每秒执行
function MonsterScript:CBMonsterOnUpdate(Monster)
	
end
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,objPlayer,sysScript)
	ActivityConfig.GongCheng[1][dwMonsterId].Max = (ActivityConfig.GongCheng[1][dwMonsterId].Max - 1);
	local Max = ActivityConfig.GongCheng[1][dwMonsterId].Max;

	if (Max <= 0) then
		--刷新第2波怪物
		local Mark = ActivityConfig.GongCheng[1][dwMonsterId].sign + 1;
		if (ActivityConfig.GongCheng[1][Mark]) then
			ActivityConfig:Update(1,Mark)	
		end
	end
end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------