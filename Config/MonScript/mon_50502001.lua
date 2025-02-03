local dwMonsterId = 50502001
local MonsterScript = {}
------
--[[
--]]
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)
	return 1,1,0
end
---------------------------------------------
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster)
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
			if sysScript:CheckBUff(50500004) then
		        Monster:Hurt(shanghai,isCrit,objPlayer,dwSkillID,dwExecTime,dwActCount)  
		    end   
		    if sysScript:CheckBUff(50500005) then
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
--出生前执行
function MonsterScript:CBMonsterBeforeBorn(Monster)
	
end

----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------