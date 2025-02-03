--通天塔
local dwMonsterId = 51000024
local MonsterScript = {}
------
--[[
--]]
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)
	--沉默后普通攻击
	if not MonsterSilent(Monster) then
		return 50302089,1
	end
	local dwRand = math.random(10000)
	if (dwRand > 5500) then
		return 51000024,1
	end
	return 50302089,1
end
---------------------------------------------
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,Player)
	local TongTianTaSys = Player:GetSystem("CTongTianTowerSystem");
	local now = _now();
	local last = TongTianTaSys.time;
	local dwTime = now - last;
	TongTianTaSys:Win(dwTime)
end
---------------------------------------------
--杀死一个目标时执行
function MonsterScript:CBMonsterOnKill(Monster)
end
---------------------------------------------
--受到攻击时执行
function MonsterScript:CBMonsterOnAttacked(Monster)

end
---------------------------------------------
--怪物出生时执行
function MonsterScript:CBMonsterOnBorn(Monster)
	local buffSys = Monster:GetSystem("CMonsterBuffSystem");
	local yidong = {
		{x=-1,y=13,dwSpeed=5};
		{x=-1,y=12,dwSpeed=5};
		{x=-1,y=-1,dwSpeed=5};
	}
	Monster:MoveTo(yidong,true)
	buffSys:AddBuff(50710007,1,Monster)
end
---------------------------------------------
--出生前执行
function MonsterScript:CBMonsterBeforeBorn(Monster)
end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------






















