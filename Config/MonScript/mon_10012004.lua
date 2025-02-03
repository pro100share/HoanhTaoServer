local dwMonsterId = 10012004
local MonsterScript = {}
------
--[[
--]]
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)
	--沉默后普通攻击
	if not MonsterSilent(Monster) then
		return 10012004,1
	end
	local Hp = MonsterDecision:life(Monster)
	

	if (Hp <= 0.1) then
		return 10012004,1
	end
	
	
	self.JiShu = self.JiShu or 0
	
	
	if (self.JiShu == 1) then
		self.JiShu = self.JiShu + 1	
		return 100120040,1
	end
	
	self.JiShu = self.JiShu + 1	
	if ((self.JiShu % 4) == 0) then
		return 100120040,1
	end
	return 10012004,1
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
		mgrNpc:Story(141)
		
		local S1 = function()
			Monster:Say(101542)
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

end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------






















