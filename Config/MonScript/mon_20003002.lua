local dwMonsterId = 20003002
local MonsterScript = {}
------
--[[
--]]
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)
	--沉默后普通攻击
	if not MonsterSilent(Monster) then
		return 7000,1
	end

	local current = Monster:GetHP()	--获取当前血量
	local all = Monster:GetMaxHP()		--获取全部血量
	if current <= 0 then 
		return 
	end
	self.GW_Jn = self.GW_Jn or 0
	
	if ((current/all) <= 0.75  and self.GW_Jn == 0) then
		self.GW_Jn= self.GW_Jn + 1
		return 20002001,1
	elseif ((current/all) <= 0.5 and (current/all) >= 0.25 and self.GW_Jn == 1) then
		self.GW_Jn= self.GW_Jn + 1
		return 20002001,1
	elseif ((current/all) <= 0.25 and self.GW_Jn == 2) then
		self.GW_Jn= self.GW_Jn + 1
		return 20002001,1
	end


	local dwRand = math.random(10000);
	if (dwRand < 7500) then
		return 7000,1;
	else
		return 200020010;
	end
	
	
	return 7000,1
end
---------------------------------------------
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,Player)
	-- local GName = Monster:GetName()
	-- local RName = Player:GetName()
	-- CScriptManager:Notice(string.format(SysStringConfigInfo[54],RName,GName).."%s",6,false,dwMapId,15,17,SysStringConfigInfo[55])	
end
--杀死一个目标时执行
function MonsterScript:CBMonsterOnKill(Monster)
end
--受到攻击时执行
function MonsterScript:CBMonsterOnAttacked(Monster)
	local current = Monster:GetHP()	--获取当前血量
	local all = Monster:GetMaxHP()		--获取全部血量
	if current <= 0 then 
		return 
	end
	
	self.GW_Js = self.GW_Js or 0
	
	if ((current/all) <= 0.75 and self.GW_Js == 0) then
		Monster:Say(50)
		self.GW_Js= self.GW_Js + 1
	elseif ((current/all) <= 0.5 and (current/all) >= 0.25 and self.GW_Js == 1) then
		Monster:Say(50)
		self.GW_Js= self.GW_Js + 1
	elseif ((current/all) <= 0.25 and self.GW_Js == 2) then
		Monster:Say(50)
		self.GW_Js= self.GW_Js + 1
	end
end
--------------------------------------------------------------------------
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------













