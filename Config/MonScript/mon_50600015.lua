local dwMonsterId = 50600015
local MonsterScript = {}
------
--[[
--]]
local n = 0
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)
	--沉默后普通攻击
	if not MonsterSilent(Monster) then
		return 50600015,1
	end
	local dwRand = math.random(10000);
	if (dwRand < 500) then
		return 506000150,1
	end
	return 50600015,1
end
---------------------------------------------
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,objPlayer,sysScript)
	n = n+1
	if n==35 then
		Monster:SetDuplData(18)
		Monster:MapNotice(9000660819,7)	
		n = 0
	end 
	
	local objMap = Monster.Map
	objMap.qjCount = objMap.qjCount or {}
	objMap.qjCount[50600015] = (objMap.qjCount[50600015] or 0) + 1
	
	local Map = Monster:GetMap()
	
	local mgrMonster = Map:GetMonsterMgr()		----获得怪物管理器
	
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	local dwLevelt = sysScript:GetDuplLevel()
	

	if (objMap.qjCount[50600015] == 35) then

		local D1 = function()
			DuplAddition[1007]:Grow(mgrMonster,1,dwLevelt,18);
			DuplAddition[1007]:Grow(mgrMonster,1,dwLevelt,19);
		end
		--循环延迟
		Map:AddTimeEvent(10000,D1)
	end	
end
--杀死一个目标时执行
function MonsterScript:CBMonsterOnKill(Monster)
end
--受到攻击时执行
function MonsterScript:CBMonsterOnAttacked(Monster)
end
--怪物出生时执行
function MonsterScript:CBMonsterOnBorn(Monster)
	local sysMonsterBuff = Monster:GetSystem("CMonsterBuffSystem")
	sysMonsterBuff:AddBuff(198000,1,Monster)
end
--出生前执行
function MonsterScript:CBMonsterBeforeBorn(Monster)
	local Data = {
		{"dwAttack",2.2};
		{"dwHPMax",1.5};
	};
	MonsterDecision:Ambush(Monster,Data)
end

----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------