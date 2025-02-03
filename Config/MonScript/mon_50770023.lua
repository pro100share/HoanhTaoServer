--卧虎藏龙——欧雅琪（大乱斗）
local dwMonsterId = 50770023
local MonsterScript = {}
local dwLast = _now()
------
--[[
--]]
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)
	if not MonsterSilent(Monster) then
		return 60011009,1
	end

	local dwRand = math.random(10000);
	if (dwRand <= 3500) then
		return 600110091,1
	end
	--普通
	return 60011009,1;
end
---------------------------------------------
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,Player)
	local Map = Monster:GetMap()						-----获取地图管理器
	
	Map.whcl = (Map.whcl or 0) + 1
	Monster:Say(733)
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
		Monster:Say(732)
		sysMonsterBuff:AddBuff(DuplAddition[6001].DateInfo.MonBuff[6005],1,Monster)
		self.GW_Js= self.GW_Js + 1
	end
end
---------------------------------------------
--怪物出生时执行
function MonsterScript:CBMonsterOnBorn(Monster)
	Monster:Say(731)
end
---------------------------------------------
--出生前执行
function MonsterScript:CBMonsterBeforeBorn(Monster)
end
----------------------------------------------------------------------------
--每秒执行
function MonsterScript:CBMonsterOnUpdate(Monster)
	--间隔10s对目标施放buff
	local CMonsterAISystem = Monster:GetSystem("CMonsterAISystem");		-----获取怪物AI系统
	local dwType,dwRoleID = CMonsterAISystem:GetTargetRoleId();			-----获取怪物目标类型，roleid
	local dwNow = _now()
	if dwType == enEntType.eEntType_Player then
		if dwNow - dwLast > 10*1000 then		--检测时间间隔
			dwLast = dwNow
			local objPlayer  = CPlayerManager:GetPlayerByRoleID(dwRoleID);	--根据roleid获得玩家信息
			local sysScript = objPlayer:GetSystem("CScriptSystem");
			local buff = {
					50770000,	--减速
					50770001,	--沉默
					50770002,	--定身
					50770003,	--眩晕
					50770004,	--扣血
					50770005,	--扣内
					}
			local rand = math.random(#buff)
			sysScript:AddBuff(buff[rand])
		end
	end
end
----------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------
