local dwMonsterId = 20002012
local MonsterScript = {}
------
--[[
--]]
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)
	--沉默后普通攻击
	if not MonsterSilent(Monster) then
		return 20002012,1
	end
	local dwRand = math.random(10000);
	if (dwRand < 2000) then
		Monster:Say(60)
		return 200020120,1
	end
	
	return 20002012;
end
---------------------------------------------
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,objPlayer,sysScript)
	local GName = Monster:GetName()
	local RName = objPlayer:GetName()
	CScriptManager:Notice(string.format(SysStringConfigInfo[54],RName,GName).."%s",6,false,dwMapId,15,17,SysStringConfigInfo[55])
end
--杀死一个目标时执行
function MonsterScript:CBMonsterOnKill(Monster)
end
--受到攻击时执行
function MonsterScript:CBMonsterOnAttacked(Monster)
end
--出生前执行
function MonsterScript:CBMonsterBeforeBorn(Monster)
	
end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------






















