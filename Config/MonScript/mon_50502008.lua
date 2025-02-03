local dwMonsterId = 50502008	--BOSS
local MonsterScript = {}
------
--[[
--]]
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)
	--沉默后普通攻击
	if not MonsterSilent(Monster) then
		return 50502008,1
	end
	self.JiShu = self.JiShu or 0
	local whether = MonsterDecision:factor(self.JiShu)
	if whether then
		self.JiShu = 0;
		return 505020080,1
	end
	self.JiShu = self.JiShu + 1;
	return 50502008,1
end
---------------------------------------------
--获取下次刷新时间(线路、年、月、日、星期、时、分、秒)
function MonsterScript:GetNextBronTime(dwLine,dwMap,dwYear,dwMonth,dwDay,dwWeek,dwHour,dwMin,dwSec)
end
--杀死一个目标时执行
function MonsterScript:CBMonsterOnKill(Monster)
end
--受到攻击时执行
function MonsterScript:CBMonsterOnAttacked(Monster,objPlayer)
      ---local Map = Monster:GetMap()  ----------获取地图管理器
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	local dwLevelt = sysScript:GetDuplLevel()
	local shanghai = dwLevelt * 80
	self.Jiance = self.Jiance or false
	local fnFunction = fnFunction or function(sysScript)
		if not self.Jiance then
			self.Jiance = true
			if sysScript:CheckBUff(50500005) then
		        Monster:Hurt(shanghai,isCrit,objPlayer,dwSkillID,dwExecTime,dwActCount)  
		    end   
		    if sysScript:CheckBUff(50500001) then
		        Monster:Hurt(-shanghai,isCrit,objPlayer,dwSkillID,dwExecTime,dwActCount)				
		    end
		    self.Jiance = false
		end	
	end
	
	CScriptManager:DoFunction(Monster,fnFunction)
end
--怪物出生时执行
function MonsterScript:CBMonsterOnBorn(Monster)
end
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,objPlayer,sysScript)
	local Map = Monster:GetMap()						-----获取地图管理器
	local dwLevelm = Monster:GetLevel()        ----获得怪物等级
	local mgrMonster = Map:GetMonsterMgr()				-----获取怪物管理器
	--local dwLevelp = objPlayer:GetLevel() ---获得玩家等级
	local mgrNpc = Map:GetNpcMgr()				----获得NPC管理器
	
	local Monster1 = mgrMonster:GetMonsterById(50502012)	--获得活着的怪物ID
	local Monster2 = mgrMonster:GetMonsterById(50502013)	--获得活着的怪物ID
	local Monster3 = mgrMonster:GetMonsterById(50502014)	--获得活着的怪物ID
	local Monster4 = mgrMonster:GetMonsterById(50502015)	--获得活着的怪物ID
	local Monster5 = mgrMonster:GetMonsterById(50502016)	--获得活着的怪物ID
	local Monster6 = mgrMonster:GetMonsterById(50502006)	--获得活着的怪物ID
	local Monster7 = mgrMonster:GetMonsterById(50502007)	--获得活着的怪物ID
	local Monster8 = mgrMonster:GetMonsterById(50502008)	--获得活着的怪物ID
	local Monster9 = mgrMonster:GetMonsterById(50502009)	--获得活着的怪物ID
	local Monster10 = mgrMonster:GetMonsterById(50502010)	--获得活着的怪物ID
	
	if #Monster1<1 and
		#Monster2<1 and
		#Monster3<1 and
		#Monster4<1 and
		#Monster5<1 and
		#Monster6<1 and
		#Monster7<1 and
		#Monster8<1 and
		#Monster9<1 and
		#Monster10<1 then
		sysScript:TeamNotice(9000660234,7)
		
		local fnFunction = function(sysScript)
			sysScript:Story(5050002)
			sysScript:PlayPfx(5050001,-17.53,-20.28,3000,bAll)
		end
		CScriptManager:DoFunction(Monster,fnFunction)
		
		
		mgrMonster:Add(50509080,(4000+dwLevelm+5),80,-1,100120011,-6.51,-9.66)
		mgrMonster:Add(50509081,(4000+dwLevelm+5),80,-1,100520031,-23.81,-7.85)
		mgrMonster:Add(50509082,(4000+dwLevelm+5),80,-1,100520050,-31.38,-22.56)
		mgrMonster:Add(50509083,(4000+dwLevelm+5),80,-1,100620041,-19.07,-34.27)
		mgrMonster:Add(50509084,(4000+dwLevelm+5),80,-1,100720011,-3.70,-26.49)

		
		-- mgrMonster:DelayAdd(50502011,(4000+dwLevelm+5),50502011,50502011,505020110,-17.53,-20.28,dwObjId,3500)    --换到演示怪物去刷
		
	else
	sysScript:TeamNotice(9000660231,7)
	end
	
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	
	local fnFunction = fnFunction or function(sysScript)
        if sysScript:CheckBUff(50500001) then
			sysScript:DelBuff(50500001)
			sysScript:AddBuff(50500003)
		
		else
			sysScript:AddBuff(50500003)
		
		end
		
        if sysScript:CheckBUff(50500002) then
			sysScript:DelBuff(50500002)
			sysScript:AddBuff(50500003)
		
		else
			sysScript:AddBuff(50500003)
		
		end
		
		if sysScript:CheckBUff(50500004) then
			sysScript:DelBuff(50500004)
			sysScript:AddBuff(50500003)
		
		else
			sysScript:AddBuff(50500003)
		
		end
		
		if sysScript:CheckBUff(50500005) then
			sysScript:DelBuff(50500005)
			sysScript:AddBuff(50500003)
		
		else
			sysScript:AddBuff(50500003)
		
		end
	end
	
	CScriptManager:DoFunction(Monster,fnFunction)



end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------