local dwMonsterId = 50600010
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
		return 50600010,1
	end
	local dwRand = math.random(10000);
	if (dwRand < 500) then
		return 506000100,1
	end
	return 50600010,1
end
---------------------------------------------
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,objPlayer,sysScript)
	local Map = Monster:GetMap()
	local function Yan()
		Monster:MapNotice(9000660825,7)	
	end
		
	
	
	n = n+1
	if n==35 then
		--Monster:SetDuplData(17)
		Monster:MapNotice(9000660818,7)
		Map:AddTimeEvent(8000,Yan)
		n = 0
	end 
	
	local objMap = Monster.Map
	objMap.qjCount = objMap.qjCount or {}
	objMap.qjCount[50600010] = (objMap.qjCount[50600010] or 0) + 1
		
	local mgrMonster = Map:GetMonsterMgr()		----获得怪物管理器
	
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	local dwLevelt = sysScript:GetDuplLevel()
	
	if (objMap.qjCount[50600010] == 35) then

		DuplAddition[1007]:Grow(mgrMonster,1,dwLevelt,22);
		
		local D1 = function()
			DuplAddition[1007]:Grow(mgrMonster,1,dwLevelt,17);
			for loop = 1,8 do
				DuplAddition[1007]:Grow(mgrMonster,loop,dwLevelt,24);
				DuplAddition[1007]:Grow(mgrMonster,loop,dwLevelt,25);
			end
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

end
--出生前执行
function MonsterScript:CBMonsterBeforeBorn(Monster)
	local Data = {
		{"dwAttack",2};
		{"dwHPMax",1.5};
	};
	MonsterDecision:Ambush(Monster,Data)
end

----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------