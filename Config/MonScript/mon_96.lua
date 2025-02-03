local dwMonsterId = 96
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
function MonsterScript:CBMonsterOnDead(Monster,Enemy)
	local Name = "占领";
	local szGuildName = ""
	local dwGuildID = 0;
	local objGuildSys = Enemy:GetSystem("CGuildSystem");
	if objGuildSys then
		szGuildName = objGuildSys:GetGuildName();
		dwGuildID = objGuildSys:GetGuildID();
	end
	
		
	-- not szGuildName then
		-- szGuildName = "";
	-- end
	
	Name = ""..szGuildName..""..Name
	Monster:SetSendData(1,Name)
	Monster:SetGuildID(dwGuildID);
end
--杀死一个目标时执行
function MonsterScript:CBMonsterOnKill(Monster)
end
--受到攻击时执行
function MonsterScript:CBMonsterOnAttacked(Monster,objPlayer)
	self.JiShu = self.JiShu or 0
	local loop = WarTrophyConfig[dwMonsterId]
	local objWarSystem = objPlayer:GetSystem("CWarSystem");
	local objWar = CWarHost:FindWar(objWarSystem.dwCurWarID);
	local Iem = objWar:GetTrophyTime(loop)
	if (self.JiShu == 0) then
		if (Iem >= WarAddition.LongDing.Count) then
			local sysMonsterBuff = Monster:GetSystem("CMonsterBuffSystem")
			sysMonsterBuff:AddBuff(199000,1,Monster)
			self.JiShu = self.JiShu + 1;
		end
	end
end
--怪物出生时执行
function MonsterScript:CBMonsterOnBorn(Monster)
	local sysMonsterBuff = Monster:GetSystem("CMonsterBuffSystem")
	sysMonsterBuff:AddBuff(9503,2,Monster)
end
--出生前执行
function MonsterScript:CBMonsterBeforeBorn(Monster)
	--
end

----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------