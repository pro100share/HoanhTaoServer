local dwMonsterId = 50302060	--阿古奇
local MonsterScript = {}
local now = 0
------
--[[
--]]
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)
	--沉默后普通攻击
	if not MonsterSilent(Monster) then
		return 50302060,1
	end
	local dwRand = math.random(10000)
	if (dwRand > 6500) then
		return 503020600,1
	end
	return 50302060,1
end
---------------------------------------------
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,objPlayer)
	local later = _now()
	local losttime = later - now
	local ZhenlongChessSys = objPlayer:GetSystem("CZhenlongChessSystem")
	local ScriptSys = objPlayer:GetSystem("CScriptSystem")
	local TimeStar = {
		{4,5},
		{5,4},
		{6,3},
		{7,2},
	};
	for i = 1 , #TimeStar do
		if losttime < TimeStar[i][1] * 1000 * 60 then
			if ZhenlongChessSys:GetBossStarLevel(dwMonsterId) < TimeStar[i][2] then
				ZhenlongChessSys:SetBossStarLevel(dwMonsterId, TimeStar[i][2])
			end
		end
	end
	ZhenlongChessSys:SetProcess(61)
	ScriptSys:AddSpItem(1,5000)
	ScriptSys:AddSpItem(3,10000)
	-- ZhenlongChessBossList:CalcStarLevel(dwMonsterId, losttime, killCount, remainCount, fightSource, HP)
	-- MonsterDecision:ForTime(dwMonsterId,objPlayer,now)
end
---------------------------------------------
--受到攻击时执行
function MonsterScript:CBMonsterOnAttacked(Monster)
	local current = Monster:GetHP()	--获取当前血量
	local all = Monster:GetMaxHP()		--获取全部血量
	if current <= 0 then 
		return 
	end
	
	self.GW_Js = self.GW_Js or 0
	
	if ((current/all) <= 0.25 and self.GW_Js == 0) then
		local sysMonsterBuff = Monster:GetSystem("CMonsterBuffSystem")
		sysMonsterBuff:AddBuff(50600011,1,Monster)
		self.GW_Js= self.GW_Js + 1
	end
end
---------------------------------------------
--怪物出生时执行
function MonsterScript:CBMonsterOnBorn(Monster)
	now = _now()
end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------






















