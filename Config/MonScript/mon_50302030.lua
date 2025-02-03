local dwMonsterId = 50302030	--彭连虎
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
		return 50302030,1
	end
	local dwRand = math.random(10000)
	if (dwRand > 6500) then
		return 503020300,1
	end
	return 50302030,1
end
---------------------------------------------
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,objPlayer)
	local later = _now()
	local losttime = later - now
	local ZhenlongChessSys = objPlayer:GetSystem("CZhenlongChessSystem")
	local ScriptSys = objPlayer:GetSystem("CScriptSystem")
	local Map = Monster:GetMap()						-----获取地图管理器
	local mgrMonster = Map:GetMonsterMgr()				-----获取怪物管理器	
	local MonNum = mgrMonster:GetMonsterById(50302200)		--白棋的ID
	local RemainStar = {
		{5,2},
		{10,3},
		{15,4},
		{20,5},
	};
	if losttime < 5*60*1000 then
		for i = 1 , #RemainStar do
			if #MonNum <= RemainStar[i][1] then
				if ZhenlongChessSys:GetBossStarLevel(dwMonsterId) <= RemainStar[i][2] then
					ZhenlongChessSys:SetBossStarLevel(dwMonsterId, RemainStar[i][2])
				end
			end
		end
	else
		if ZhenlongChessSys:GetBossStarLevel(dwMonsterId) == 0 then
			ZhenlongChessSys:SetBossStarLevel(dwMonsterId, 2)
		end
	end
	ZhenlongChessSys:SetProcess(31)
	for k,v in pairs(MonNum) do
		mgrMonster:Remove(v:GetRoleID())
	end
	ScriptSys:AddSpItem(1,5000)
	ScriptSys:AddSpItem(3,10000)
	-- MonsterDecision:RemainMon(Monster,dwMonsterId,objPlayer,now)
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






















