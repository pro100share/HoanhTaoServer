local dwMonsterId = 50862001
local MonsterScript = {}
------
--[[
--]]
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)
	--沉默后普通攻击
	if not MonsterSilent(Monster) then
		return 1,1
	end
	local dwRand = MonsterDecision:odds(Monster,true)
	
	if (dwRand <=4000) then
		return 10042010,1
	end
	
	return 1,1
end
---------------------------------------------
function MonsterScript:GetNextBronTime(dwLine,dwMap,dwYear,dwMonth,dwDay,dwWeek,dwHour,dwMin,dwSec)
	self.xxx = self.xxx
	if self.xxx then return end;
	local Info = {
		year = dwYear;		--年
		month = dwMonth;		--月
		day = dwDay;			--日
		hour = dwHour;		--时
		min = dwMin;			--分
		sec = dwSec;			--秒
	}
	Info.sec = Info.sec + 1
	self.xxx = true
	return Info,Pos;
end
--怪物出生时执行
function MonsterScript:CBMonsterOnBorn(Monster)
		local Map = Monster:GetMap()						-----获取地图管理器
		local mgrNpc = Map:GetNpcMgr()				----获得NPC管理器
		mgrNpc:Story(142)
		
		local S1 = function()
			Monster:Say(303447)
		end
		
		Map:AddTimeEvent( 4000, S1)
end
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,Enemy)
	-- local objBuffSys = Enemy:GetSystem("CBuffSystem");
	-- if objBuffSys then
		-- objBuffSys:AddBuff(100120041,1,Monster);
	-- end
end
--杀死一个目标时执行
function MonsterScript:CBMonsterOnKill(Monster)
end
--受到攻击时执行
function MonsterScript:CBMonsterOnAttacked(Monster)
	 local current = Monster:GetHP()	--获取当前血量
	 local all = Monster:GetMaxHP()		--获取全部血量
	 if current <= 0 then return end
	 if  current/all < 0.1 then
		 Monster:Say(303457)
	elseif  current/all < 0.35 then
		 Monster:Say(303456)		 
	elseif current/all < 0.45 then
		 Monster:Say(303455)
	elseif current/all < 0.55 then
		 Monster:Say(303454)
	elseif current/all < 0.65 then
		 Monster:Say(303453)		 
	elseif current/all < 0.75 then
		 Monster:Say(303452)
	elseif current/all < 0.85 then
		 Monster:Say(303451)		 
	elseif current/all < 0.95 then
		 Monster:Say(303450)
	end
end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------






















