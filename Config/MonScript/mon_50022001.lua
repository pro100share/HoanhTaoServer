local dwMonsterId = 50022001
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
	local current = Monster:GetHP()	--获取当前血量
	local all = Monster:GetMaxHP()		--获取全部血量
	
	self.GW_Jn = self.GW_Jn or 0
	--释放BUFF部分
	if ((current/all) <= 0.6  and self.GW_Jn == 0) then
		self.GW_Jn= self.GW_Jn + 1
		return 500220010,1;
	end
	-- --释放技能部分
	-- if(self.GW_Jn == 1) then
		-- return 50022001,1;
	-- else
		return 1,1;
	-- end
end
---------------------------------------------
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster, objKiller)
	--local duplSystem = objKiller:GetSystem("CDuplSystem");
	--duplSystem:WinDupl();
end
--杀死一个目标时执行
function MonsterScript:CBMonsterOnKill(Monster)
	
end
--受到攻击时执行
function MonsterScript:CBMonsterOnAttacked(Monster,objPlayer,dwSkillId)
	 local current = Monster:GetHP()	--获取当前血量
	 local all = Monster:GetMaxHP()		--获取全部血量
	 if current <= 0 then return end
	 if  current/all < 0.13 then
		 Monster:Say(110)
	elseif current/all < 0.4 then
		 Monster:Say(109)
	elseif current/all < 0.7 then
		 Monster:Say(108)
	elseif current/all < 0.99 then
		 Monster:Say(107)
	end
 end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------
