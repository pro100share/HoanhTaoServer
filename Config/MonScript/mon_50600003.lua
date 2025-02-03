local dwMonsterId = 50600003
local MonsterScript = {}
------
--[[
--]]
local n = 0
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)
	return 1,1,0
end
---------------------------------------------
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,objPlayer,sysScript)
	n = n+1
	if n==35 then
		Monster:SetDuplData(4)
		Monster:MapNotice(9000660804,7)
		n = 0
	end 
	

	
	local objMap = Monster.Map
	
	objMap.qjCount = objMap.qjCount or {}
	
	
	
	objMap.qjCount[50600003] = (objMap.qjCount[50600003] or 0) + 1
	
	local Map = Monster:GetMap()
	
	local mgrMonster = Map:GetMonsterMgr()		----获得怪物管理器
	
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	local dwLevelt = sysScript:GetDuplLevel()
	
	if (objMap.qjCount[50600003] == 35) then
		local BoShu = 4;
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

end
--出生前执行
function MonsterScript:CBMonsterBeforeBorn(Monster)
	local Data = {
		{"dwHPMax",1.5};
		{"dwAttack",2};
	};
	MonsterDecision:Ambush(Monster,Data)
end

----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------