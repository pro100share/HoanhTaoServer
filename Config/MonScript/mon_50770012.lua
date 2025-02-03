--卧虎藏龙——刘雨（大乱斗）
local dwMonsterId = 50770012
local MonsterScript = {}
local dwLast = _now()
local mon = 0;	--计数
------
--[[
--]]
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)
	--沉默后普通攻击
	if not MonsterSilent(Monster) then
		return 60011003,1
	end

	local dwRand = math.random(10000);
	if (dwRand <= 3500) then
		return 600110031,1

	elseif (dwRand <= 7000) then
		return 600110030,1
	end
	--普通
	return 60011003,1;
end
---------------------------------------------
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,Player)
	local Map = Monster:GetMap()						-----获取地图管理器
	Monster:Say(709)
	Map.whcl = (Map.whcl or 0) + 1
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
	local current = Monster:GetHP()	--获取当前血量
	local all = Monster:GetMaxHP()		--获取全部血量
	if current <= 0 then 
		return 
	end
	
	self.GW_Js = self.GW_Js or 0
	
	if ((current/all) <= 1 and self.GW_Js == 0) then
		self.GW_Js= self.GW_Js + 1
	elseif ((current/all) <= 0.5 and (current/all) >= 0.25 and self.GW_Js == 1) then
		self.GW_Js= self.GW_Js + 1
	elseif ((current/all) <= 0.25 and self.GW_Js == 2) then
		local sysMonsterBuff = Monster:GetSystem("CMonsterBuffSystem")
		Monster:Say(708)
		sysMonsterBuff:AddBuff(DuplAddition[6001].DateInfo.MonBuff[6005],1,Monster)
		self.GW_Js= self.GW_Js + 1
	end
end
---------------------------------------------
--怪物出生时执行
function MonsterScript:CBMonsterOnBorn(Monster)
	Monster:Say(707)
end
---------------------------------------------
--出生前执行
function MonsterScript:CBMonsterBeforeBorn(Monster)
end
----------------------------------------------------------------------------
--每秒执行
function MonsterScript:CBMonsterOnUpdate(Monster)
	local dwNow = _now()
	local Map = Monster:GetMap();						-----获取地图
	local mgrMonster = Map:GetMonsterMgr();				-----获取怪物管理器
	local player = Map:GetAllPlayer();					-----获取地图玩家管理器
	if dwNow - dwLast > 10*1000 then
		dwLast = dwNow;
		for i,v in pairs(player) do
			local sysScript = v:GetSystem("CScriptSystem");
			local dwLevelt = sysScript:GetDuplLevel(); ---获得创建副本的等级
			if mon == 0 then
				mgrMonster:Add(50770013,(50771000+dwLevelt),50770011,20005,12110,-3,-22); --青象
				Monster:Say(710)
				mon = 1
				break;
			elseif mon == 1 then
				mgrMonster:Add(50770014,(50771000+dwLevelt),50770011,20005,12010,-9,-28); --大宛马
				Monster:Say(711)
				mon = 2
				break;
			elseif mon == 2 then
				mgrMonster:Add(50770015,(50771000+dwLevelt),50770011,20005,12210,-24,-14); --银犀
				Monster:Say(712)
				mon = 3
				break;
			elseif mon == 3 then
				mgrMonster:Add(50770016,(50771000+dwLevelt),50770011,20005,12310,-18,-8); --玄豹
				Monster:Say(713)
				mon = 4
				break;
			end
		end
	end
end
----------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------
