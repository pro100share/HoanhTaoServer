local dwMonsterId = 50603003
local MonsterScript = {}
------
--[[
--]]
-- local n = 0
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)
	--沉默后普通攻击
	if not MonsterSilent(Monster) then
		return 7000,1
	end
	local dwRand = MonsterDecision:odds(Monster,true)
	
	if (dwRand <=4000) then
		return 506030030,1
	end
	
	return 7000,1
end
---------------------------------------------
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,objPlayer,sysScript)
	
	local objScriptSys = objPlayer:GetSystem("CScriptSystem");
	if not objScriptSys then
		return;
	end
	
	local BOSSMonster = objScriptSys:GetMonsterById(50604001)

	if #BOSSMonster==0 then   
		Monster:MapNotice(9000660820,7)
		local duplSystem = objPlayer:GetSystem("CDuplSystem");
		duplSystem:WinDupl();
	end
	
end
--杀死一个目标时执行
function MonsterScript:CBMonsterOnKill(Monster)
end
--受到攻击时执行
function MonsterScript:CBMonsterOnAttacked(Monster,objPlayer)
	local objScriptSys = objPlayer:GetSystem("CScriptSystem");
	if not objScriptSys then
		return;
	end

	local objBuffSys = Monster:GetSystem("CMonsterBuffSystem");

	--另外一个怪物的
	local sMonster = objScriptSys:GetMonsterById(50604001)
	
	local hp = Monster:GetHP()
	
	if (#sMonster >= 1) then
		local current = sMonster[1]:GetHP()	--获取当前血量
		local BuffSys = sMonster[1]:GetSystem("CMonsterBuffSystem");
		--血上限的10%
		local Max = Monster:GetMaxHP()*0.1
		--计算
		local JiSuan = hp - current
		if (math.abs(JiSuan) > Max) then
			objBuffSys:AddBuff(9502,1,Monster)
			BuffSys:AddBuff(9502,1,sMonster[1])
		end
	end
end
--怪物出生时执行
function MonsterScript:CBMonsterOnBorn(Monster)

end
--出生前执行
function MonsterScript:CBMonsterBeforeBorn(Monster)
	local Data = {
		{"dwAttack",1.5};
		{"dwHPMax",2};
	};
	MonsterDecision:Ambush(Monster,Data)
end

----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------