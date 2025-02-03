local dwMonsterId = 1001
local MonsterScript = {}
------
local function set_born(b_info,t_info)
	for i=1,#b_info do
		local t = b_info[i]
		t.year = t.year or t_info.year
		t.month = t.month or t_info.month
		t.day = t.day or t_info.day
		t.hour = t.hour or t_info.hour
		t.min = t.min or t_info.min
		t.sec = t.sec or t_info.sec
		local b_time = _time(1, t)
		local n_time = _time(1, t_info)
		if b_time>n_time then
			return t
		end
	end
end
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)
	return 1,1
end

--获取下次刷新时间(线路、地图、年、月、日、星期、时、分、秒)
function MonsterScript:GetNextBronTime(dwLine,dwMap,dwYear,dwMonth,dwDay,dwWeek,dwHour,dwMin,dwSec)
	local Info = {
		year = dwYear;		--年
		month = dwMonth;		--月
		day = dwDay;			--日
		hour = dwHour;		--时
		min = dwMin;			--分
		sec = dwSec;			--秒
	}
	--Info.sec = Info.sec + 10
	local b_info = {
		{hour=20,min=30,sec=0};
		{hour=21,min=30,sec=0};
		{hour=22,min=30,sec=0};
	}
	Info = set_born(b_info,Info)
	
	local P = 
	{
		{x=1,y=1},
		{x=1,y=1},
		{x=1,y=1},
		{x=1,y=1},
		{x=1,y=1},
	}
	local rand = math.random(1,#P)
	local Pos = P[rand]
	
	return Info,Pos;
end
--获取刷新提示
--[[
_G.enChatChannel = {
	eNearby = 1,			--附近
	ePrivate = 2,			--私聊
	eTeam = 3,				--队伍
	eFaction = 4,			--帮派
	eLine = 5,				--同一条线，世界频道
	eNotice = 7,			--系统通知
};
--]]
function MonsterScript:GetBronNotice(dwLine,dwMap,Info)
	local Notice = {};
	Notice[1] = {dwTime=1000*60*30;szStr=SysStringConfigInfo[1];dwChannel=0;bSystem=true;};--刷出前半小时
	Notice[2] = {dwTime=1000*60*10;szStr=SysStringConfigInfo[2];dwChannel=0;bSystem=true;};--刷出前10分钟
	Notice[3] = {dwTime=0;szStr=SysStringConfigInfo[3];dwChannel=0;bSystem=true;};--刷出时
	return Notice
end
---------------------------------------------
--空闲时执行
function MonsterScript:CBMonsterOnIdel(Monster)
end
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,objKiller)
end
--受到攻击时执行
function MonsterScript:CBMonsterOnAttacked(Monster,objEnemy,dwSkillID)

end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------