local dwMonsterId = 50603002
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
		return 1,1
	end
	local dwRand = MonsterDecision:odds(Monster,true)
	if (dwRand < 7500) then
		return 506030021,1
	elseif (dwRand < 10000) then
		return 506030020,1
	end
end
---------------------------------------------
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,objPlayer,sysScript)
	n = n+1
	if n==1 then
		Monster:SetDuplData(11)
		Monster:MapNotice(9000660811,7)
		n = 0
	end
	
	local objMap = Monster.Map
	objMap.qjCount = objMap.qjCount or {}
	objMap.qjCount[50603002] = (objMap.qjCount[50603002] or 0) + 1
	
	local Map = Monster:GetMap()
	
	local mgrMonster = Map:GetMonsterMgr()		----获得怪物管理器
	
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	local dwLevelt = sysScript:GetDuplLevel()
	
	if (objMap.qjCount[50603002] == 1) then
		local BoShu = 11;
		local t = DuplAddition[1007].Monster.Rests(dwLevelt,BoShu)
		local KongZhi = 1;
		local D1 = function()
			for loop = 1,t[KongZhi][1] do
				DuplAddition[1007]:Grow(mgrMonster,loop,dwLevelt,BoShu);
			end
			KongZhi = KongZhi + 1;
		end
		--循环延迟
		for loop = 1,#t do
			Map:AddTimeEvent(t[loop][2],D1)
		end
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


	local Map = Monster:GetMap()
	
	local mgrMonster = Map:GetMonsterMgr()
	
	local D1 = function()
		local Monster1 = mgrMonster:GetMonsterById(50600016)
		local Monster2 = mgrMonster:GetMonsterById(50600017)
		local objBuffSys = Monster:GetSystem("CMonsterBuffSystem");
		if objBuffSys then
			if (#Monster1 >= 1) then
				objBuffSys:AddBuff(9561,#Monster1,Monster)
				--objBuffSys:AddBuff(9561,Monster1);
			end
			if (#Monster2 >= 1) then
				objBuffSys:AddBuff(9562,#Monster2,Monster)
			end
		end

	end
	Map:AddTimeEvent(6000,D1)
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