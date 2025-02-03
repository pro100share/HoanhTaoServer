--卧虎藏龙——阿熊（大乱斗）
local dwMonsterId = 50770020
local MonsterScript = {}
local dwLast = _now()
------
--[[
--]]
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)
end
---------------------------------------------
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,Player)
	local Map = Monster:GetMap()						-----获取地图管理器
	
	Map.whcl = (Map.whcl or 0) + 1
	Monster:Say(727)
	if Map.whcl == 12 then
		local duplSystem = Player:GetSystem("CDuplSystem");
		-- duplSystem:WinDupl();
		duplSystem.objCurDupl.m_WinFlag = true;
		duplSystem:WoHuCangLongLeave()
	end
end
---------------------------------------------
--杀死一个目标时执行
function MonsterScript:CBMonsterOnKill(Monster)
end
---------------------------------------------
--受到攻击时执行
function MonsterScript:CBMonsterOnAttacked(Monster)
end
---------------------------------------------
--怪物出生时执行
function MonsterScript:CBMonsterOnBorn(Monster)
	Monster:Say(726)
end
---------------------------------------------
--出生前执行
function MonsterScript:CBMonsterBeforeBorn(Monster)
end
----------------------------------------------------------------------------
--每秒执行
function MonsterScript:CBMonsterOnUpdate(Monster)
	--间隔10s对当前地图所有玩家施放buff
	local Map = Monster:GetMap();						-----获取地图管理器
	local player = Map:GetAllPlayer();					-----获取地图玩家管理器
	local dwNow = _now();
	local Hanhua = {"试试这个！","诶，这个还没用过！","哈哈哈，真好玩！看你那倒霉样儿~"}
	if dwNow - dwLast > 10*1000 then		--检测时间间隔
		dwLast = dwNow
		for i,v in pairs(player) do
			local sysScript = v:GetSystem("CScriptSystem");
			local buff = {
					50770000,	--减速
					50770001,	--沉默
					50770002,	--定身
					50770003,	--眩晕
					50770004,	--扣血
					50770005,	--扣内
					};
			local rand = math.random(#buff);
			local dwRand = math.random(#Hanhua);
			if sysScript then
				sysScript:AddBuff(buff[rand]);
				Monster:Say(Hanhua[dwRand])
			end
		end
	end
end
----------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------
