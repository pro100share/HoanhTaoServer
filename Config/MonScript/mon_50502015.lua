local dwMonsterId = 50502015	--木桩
local MonsterScript = {}
------
--[[
--]]
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)
end
---------------------------------------------
--获取下次刷新时间(线路、年、月、日、星期、时、分、秒)
function MonsterScript:GetNextBronTime(dwLine,dwMap,dwYear,dwMonth,dwDay,dwWeek,dwHour,dwMin,dwSec)
end
--杀死一个目标时执行
function MonsterScript:CBMonsterOnKill(Monster)
end
--受到攻击时执行
function MonsterScript:CBMonsterOnAttacked(Monster,objPlayer,sysScript)
	local Map = Monster:GetMap()						-----获取地图管理器
	local dwLevelm = Monster:GetLevel()        ----获得怪物等级
	local mgrMonster = Map:GetMonsterMgr()				-----获取怪物管理器
	--local dwLevelp = objPlayer:GetLevel() ---获得玩家等级
	local mgrNpc = Map:GetNpcMgr()				----获得NPC管理器
	
	local current = Monster:GetHP()	--获取当前血量
	local all = Monster:GetMaxHP()		--获取全部血量
	
		if current <= 0 then return end
		if  current/all < 0.05 then
			self.chufa14 = self.chufa14	or false
			if not	self.chufa14 then
			self.chufa14 = true
			mgrMonster:Add(50502004,(2000+dwLevelm+4),50502004,(5050000+(math.floor((dwLevelm+4)/5)*5)),100620040,-18.79,-62.48,dwDelay)
			mgrMonster:Add(50502004,(2000+dwLevelm+4),50502004,(5050000+(math.floor((dwLevelm+4)/5)*5)),100620040,-20.95,-57.83,dwDelay)
			mgrMonster:Add(50502004,(2000+dwLevelm+4),50502004,(5050000+(math.floor((dwLevelm+4)/5)*5)),100620040,-22.33,-65.82,dwDelay)
			mgrMonster:Add(50502004,(2000+dwLevelm+4),50502004,(5050000+(math.floor((dwLevelm+4)/5)*5)),100620040,-26.74,-63.55,dwDelay)
			mgrMonster:Add(50502004,(2000+dwLevelm+4),50502004,(5050000+(math.floor((dwLevelm+4)/5)*5)),100620040,-25.93,-58.65,dwDelay)
			end
			
		elseif  current/all < 0.1 then
			self.chufa13 = self.chufa13	or false
			if not	self.chufa13 then
			self.chufa13 = true
			mgrMonster:Add(50502004,(2000+dwLevelm+3),50502004,(5050000+(math.floor((dwLevelm+3)/5)*5)),100620040,-18.79,-62.48,dwDelay)
			mgrMonster:Add(50502004,(2000+dwLevelm+3),50502004,(5050000+(math.floor((dwLevelm+3)/5)*5)),100620040,-20.95,-57.83,dwDelay)
			mgrMonster:Add(50502004,(2000+dwLevelm+3),50502004,(5050000+(math.floor((dwLevelm+3)/5)*5)),100620040,-22.33,-65.82,dwDelay)
			mgrMonster:Add(50502004,(2000+dwLevelm+3),50502004,(5050000+(math.floor((dwLevelm+3)/5)*5)),100620040,-26.74,-63.55,dwDelay)
			mgrMonster:Add(50502004,(2000+dwLevelm+3),50502004,(5050000+(math.floor((dwLevelm+3)/5)*5)),100620040,-25.93,-58.65,dwDelay)
			end
		
		elseif  current/all < 0.15 then
			self.chufa12 = self.chufa12	or false
			if not	self.chufa12 then
			self.chufa12 = true
			mgrMonster:Add(50502004,(2000+dwLevelm+3),50502004,(5050000+(math.floor((dwLevelm+3)/5)*5)),100620040,-18.79,-62.48,dwDelay)
			mgrMonster:Add(50502004,(2000+dwLevelm+3),50502004,(5050000+(math.floor((dwLevelm+3)/5)*5)),100620040,-20.95,-57.83,dwDelay)
			mgrMonster:Add(50502004,(2000+dwLevelm+3),50502004,(5050000+(math.floor((dwLevelm+3)/5)*5)),100620040,-22.33,-65.82,dwDelay)
			mgrMonster:Add(50502004,(2000+dwLevelm+3),50502004,(5050000+(math.floor((dwLevelm+3)/5)*5)),100620040,-26.74,-63.55,dwDelay)
			mgrMonster:Add(50502004,(2000+dwLevelm+3),50502004,(5050000+(math.floor((dwLevelm+3)/5)*5)),100620040,-25.93,-58.65,dwDelay)
			end
			
		elseif  current/all < 0.2 then
			self.chufa11 = self.chufa11	or false
			if not	self.chufa11 then
			self.chufa11 = true
			mgrMonster:Add(50502004,(2000+dwLevelm+2),50502004,(5050000+(math.floor((dwLevelm+2)/5)*5)),100620040,-18.79,-62.48,dwDelay)
			mgrMonster:Add(50502004,(2000+dwLevelm+2),50502004,(5050000+(math.floor((dwLevelm+2)/5)*5)),100620040,-20.95,-57.83,dwDelay)
			mgrMonster:Add(50502004,(2000+dwLevelm+2),50502004,(5050000+(math.floor((dwLevelm+2)/5)*5)),100620040,-22.33,-65.82,dwDelay)
			mgrMonster:Add(50502004,(2000+dwLevelm+2),50502004,(5050000+(math.floor((dwLevelm+2)/5)*5)),100620040,-26.74,-63.55,dwDelay)
			mgrMonster:Add(50502004,(2000+dwLevelm+2),50502004,(5050000+(math.floor((dwLevelm+2)/5)*5)),100620040,-25.93,-58.65,dwDelay)
			end
			
		elseif  current/all < 0.25 then
			self.chufa10 = self.chufa10	or false
			if not	self.chufa10 then
			self.chufa10 = true
			mgrMonster:Add(50502004,(2000+dwLevelm+2),50502004,(5050000+(math.floor((dwLevelm+2)/5)*5)),100620040,-18.79,-62.48,dwDelay)
			mgrMonster:Add(50502004,(2000+dwLevelm+2),50502004,(5050000+(math.floor((dwLevelm+2)/5)*5)),100620040,-20.95,-57.83,dwDelay)
			mgrMonster:Add(50502004,(2000+dwLevelm+2),50502004,(5050000+(math.floor((dwLevelm+2)/5)*5)),100620040,-22.33,-65.82,dwDelay)
			mgrMonster:Add(50502004,(2000+dwLevelm+2),50502004,(5050000+(math.floor((dwLevelm+2)/5)*5)),100620040,-26.74,-63.55,dwDelay)
			mgrMonster:Add(50502004,(2000+dwLevelm+2),50502004,(5050000+(math.floor((dwLevelm+2)/5)*5)),100620040,-25.93,-58.65,dwDelay)
			end
			
		elseif  current/all < 0.3 then
			self.chufa09 = self.chufa09	or false
			if not	self.chufa09 then
			self.chufa09 = true
			mgrMonster:Add(50502004,(2000+dwLevelm+1),50502004,(5050000+(math.floor((dwLevelm+1)/5)*5)),100620040,-18.79,-62.48,dwDelay)
			mgrMonster:Add(50502004,(2000+dwLevelm+1),50502004,(5050000+(math.floor((dwLevelm+1)/5)*5)),100620040,-20.95,-57.83,dwDelay)
			mgrMonster:Add(50502004,(2000+dwLevelm+1),50502004,(5050000+(math.floor((dwLevelm+1)/5)*5)),100620040,-22.33,-65.82,dwDelay)
			mgrMonster:Add(50502004,(2000+dwLevelm+1),50502004,(5050000+(math.floor((dwLevelm+1)/5)*5)),100620040,-26.74,-63.55,dwDelay)
			mgrMonster:Add(50502004,(2000+dwLevelm+1),50502004,(5050000+(math.floor((dwLevelm+1)/5)*5)),100620040,-25.93,-58.65,dwDelay)
			end
		
		elseif  current/all < 0.35 then
			self.chufa08 = self.chufa08	or false
			if not	self.chufa08 then
			self.chufa08 = true
			mgrMonster:Add(50502004,(2000+dwLevelm+1),50502004,(5050000+(math.floor((dwLevelm+1)/5)*5)),100620040,-18.79,-62.48,dwDelay)
			mgrMonster:Add(50502004,(2000+dwLevelm+1),50502004,(5050000+(math.floor((dwLevelm+1)/5)*5)),100620040,-20.95,-57.83,dwDelay)
			mgrMonster:Add(50502004,(2000+dwLevelm+1),50502004,(5050000+(math.floor((dwLevelm+1)/5)*5)),100620040,-22.33,-65.82,dwDelay)
			mgrMonster:Add(50502004,(2000+dwLevelm+1),50502004,(5050000+(math.floor((dwLevelm+1)/5)*5)),100620040,-26.74,-63.55,dwDelay)
			mgrMonster:Add(50502004,(2000+dwLevelm+1),50502004,(5050000+(math.floor((dwLevelm+1)/5)*5)),100620040,-25.93,-58.65,dwDelay)
			end
			
		elseif  current/all < 0.4 then
			self.chufa07 = self.chufa07	or false
			if not	self.chufa07 then
			self.chufa07 = true
			mgrMonster:Add(50502004,(2000+dwLevelm),50502004,(5050000+(math.floor(dwLevelm/5)*5)),100620040,-18.79,-62.48,dwDelay)
			mgrMonster:Add(50502004,(2000+dwLevelm),50502004,(5050000+(math.floor(dwLevelm/5)*5)),100620040,-20.95,-57.83,dwDelay)
			mgrMonster:Add(50502004,(2000+dwLevelm),50502004,(5050000+(math.floor(dwLevelm/5)*5)),100620040,-22.33,-65.82,dwDelay)
			mgrMonster:Add(50502004,(2000+dwLevelm),50502004,(5050000+(math.floor(dwLevelm/5)*5)),100620040,-26.74,-63.55,dwDelay)
			mgrMonster:Add(50502004,(2000+dwLevelm),50502004,(5050000+(math.floor(dwLevelm/5)*5)),100620040,-25.93,-58.65,dwDelay)
			end
		
		elseif  current/all < 0.45 then
			self.chufa06 = self.chufa06	or false
			if not	self.chufa06 then
			self.chufa06 = true
			mgrMonster:Add(50502004,(2000+dwLevelm),50502004,(5050000+(math.floor(dwLevelm/5)*5)),100620040,-18.79,-62.48,dwDelay)
			mgrMonster:Add(50502004,(2000+dwLevelm),50502004,(5050000+(math.floor(dwLevelm/5)*5)),100620040,-20.95,-57.83,dwDelay)
			mgrMonster:Add(50502004,(2000+dwLevelm),50502004,(5050000+(math.floor(dwLevelm/5)*5)),100620040,-22.33,-65.82,dwDelay)
			mgrMonster:Add(50502004,(2000+dwLevelm),50502004,(5050000+(math.floor(dwLevelm/5)*5)),100620040,-26.74,-63.55,dwDelay)
			mgrMonster:Add(50502004,(2000+dwLevelm),50502004,(5050000+(math.floor(dwLevelm/5)*5)),100620040,-25.93,-58.65,dwDelay)
			end
		
		elseif  current/all < 0.5 then
			self.chufa05 = self.chufa05	or false
			if not	self.chufa05 then
			self.chufa05 = true
			mgrMonster:Add(50502004,(2000+dwLevelm-1),50502004,(5050000+(math.floor((dwLevelm-1)/5)*5)),100620040,-18.79,-62.48,dwDelay)
			mgrMonster:Add(50502004,(2000+dwLevelm-1),50502004,(5050000+(math.floor((dwLevelm-1)/5)*5)),100620040,-20.95,-57.83,dwDelay)
			mgrMonster:Add(50502004,(2000+dwLevelm-1),50502004,(5050000+(math.floor((dwLevelm-1)/5)*5)),100620040,-22.33,-65.82,dwDelay)
			mgrMonster:Add(50502004,(2000+dwLevelm-1),50502004,(5050000+(math.floor((dwLevelm-1)/5)*5)),100620040,-26.74,-63.55,dwDelay)
			mgrMonster:Add(50502004,(2000+dwLevelm-1),50502004,(5050000+(math.floor((dwLevelm-1)/5)*5)),100620040,-25.93,-58.65,dwDelay)
			end
		
		elseif  current/all < 0.6 then
			self.chufa04 = self.chufa04	or false
			if not	self.chufa04 then
			self.chufa04 = true
			mgrMonster:Add(50502004,(2000+dwLevelm-2),50502004,(5050000+(math.floor((dwLevelm-2)/5)*5)),100620040,-18.79,-62.48,dwDelay)
			mgrMonster:Add(50502004,(2000+dwLevelm-2),50502004,(5050000+(math.floor((dwLevelm-2)/5)*5)),100620040,-20.95,-57.83,dwDelay)
			mgrMonster:Add(50502004,(2000+dwLevelm-2),50502004,(5050000+(math.floor((dwLevelm-2)/5)*5)),100620040,-22.33,-65.82,dwDelay)
			mgrMonster:Add(50502004,(2000+dwLevelm-2),50502004,(5050000+(math.floor((dwLevelm-2)/5)*5)),100620040,-26.74,-63.55,dwDelay)
			mgrMonster:Add(50502004,(2000+dwLevelm-2),50502004,(5050000+(math.floor((dwLevelm-2)/5)*5)),100620040,-25.93,-58.65,dwDelay)
			end
		
		elseif  current/all < 0.7 then
			self.chufa03 = self.chufa03	or false
			if not	self.chufa03 then
			self.chufa03 = true
			mgrMonster:Add(50502004,(2000+dwLevelm-3),50502004,(5050000+(math.floor((dwLevelm-3)/5)*5)),100620040,-18.79,-62.48,dwDelay)
			mgrMonster:Add(50502004,(2000+dwLevelm-3),50502004,(5050000+(math.floor((dwLevelm-3)/5)*5)),100620040,-20.95,-57.83,dwDelay)
			mgrMonster:Add(50502004,(2000+dwLevelm-3),50502004,(5050000+(math.floor((dwLevelm-3)/5)*5)),100620040,-22.33,-65.82,dwDelay)
			mgrMonster:Add(50502004,(2000+dwLevelm-3),50502004,(5050000+(math.floor((dwLevelm-3)/5)*5)),100620040,-26.74,-63.55,dwDelay)
			mgrMonster:Add(50502004,(2000+dwLevelm-3),50502004,(5050000+(math.floor((dwLevelm-3)/5)*5)),100620040,-25.93,-58.65,dwDelay)
			end
		
		elseif  current/all < 0.8 then
			self.chufa02 = self.chufa02	or false
			if not	self.chufa02 then
			self.chufa02 = true
			mgrMonster:Add(50502004,(2000+dwLevelm-4),50502004,(5050000+(math.floor((dwLevelm-4)/5)*5)),100620040,-18.79,-62.48,dwDelay)
			mgrMonster:Add(50502004,(2000+dwLevelm-4),50502004,(5050000+(math.floor((dwLevelm-4)/5)*5)),100620040,-20.95,-57.83,dwDelay)
			mgrMonster:Add(50502004,(2000+dwLevelm-4),50502004,(5050000+(math.floor((dwLevelm-4)/5)*5)),100620040,-22.33,-65.82,dwDelay)
			mgrMonster:Add(50502004,(2000+dwLevelm-4),50502004,(5050000+(math.floor((dwLevelm-4)/5)*5)),100620040,-26.74,-63.55,dwDelay)
			mgrMonster:Add(50502004,(2000+dwLevelm-4),50502004,(5050000+(math.floor((dwLevelm-4)/5)*5)),100620040,-25.93,-58.65,dwDelay)
			end
		
		elseif  current/all < 0.9 then
			self.chufa01 = self.chufa01	or false
			if not	self.chufa01 then
			self.chufa01 = true
			mgrMonster:Add(50502004,(2000+dwLevelm-5),50502004,(5050000+(math.floor((dwLevelm-5)/5)*5)),100620040,-18.79,-62.48,dwDelay)
			mgrMonster:Add(50502004,(2000+dwLevelm-5),50502004,(5050000+(math.floor((dwLevelm-5)/5)*5)),100620040,-20.95,-57.83,dwDelay)
			mgrMonster:Add(50502004,(2000+dwLevelm-5),50502004,(5050000+(math.floor((dwLevelm-5)/5)*5)),100620040,-22.33,-65.82,dwDelay)
			mgrMonster:Add(50502004,(2000+dwLevelm-5),50502004,(5050000+(math.floor((dwLevelm-5)/5)*5)),100620040,-26.74,-63.55,dwDelay)
			mgrMonster:Add(50502004,(2000+dwLevelm-5),50502004,(5050000+(math.floor((dwLevelm-5)/5)*5)),100620040,-25.93,-58.65,dwDelay)
		    end
	end
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
	sysScript:TeamNotice(9000660227,7)
	mgrMonster:Add(50502009,(3000+dwLevelm+5),50502009,50502009,100620041,-23.11,-61.72,dwDelay)
	
end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------