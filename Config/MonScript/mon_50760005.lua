local dwMonsterId = 50760005
local MonsterScript = {}
------
--[[
--]]
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)
	

	--沉默后普通攻击
	if not MonsterSilent(Monster) then
		return 50760005,1
	end
	
	local dwRand = math.random(10000);
	if (dwRand <= 2000) then
		return 507600050,1
	elseif (dwRand <= 4000) then
		return 507600051,1
	end
	--普通
	return 507600050,1;
end
----------------------------------------------------------------------------
----------------------------------------------------------------------------
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,Player)
	CWarHost:AddXiaKeList(dwMonsterId);
end
----------------------------------------------------------------------------
--杀死一个目标时执行
function MonsterScript:CBMonsterOnKill(Monster)
end
----------------------------------------------------------------------------
--受到攻击时执行
function MonsterScript:CBMonsterOnAttacked(Monster)
	-- local current = Monster:GetHP()	--获取当前血量
	-- local all = Monster:GetMaxHP()		--获取全部血量
	-- if current <= 0 then 
		-- return 
	-- end
	
	-- self.GW_Js = self.GW_Js or 0
	
	-- if ((current/all) <= 1 and self.GW_Js == 0) then
		-- Monster:Say(1003210000)
		-- self.GW_Js= self.GW_Js + 1
	-- elseif ((current/all) <= 0.5 and (current/all) >= 0.25 and self.GW_Js == 1) then
		-- Monster:Say(1003210000)
		-- self.GW_Js= self.GW_Js + 1
	-- elseif ((current/all) <= 0.25 and self.GW_Js == 2) then
		-- local sysMonsterBuff = Monster:GetSystem("CMonsterBuffSystem")
		-- sysMonsterBuff:AddBuff(DuplAddition[6001].DateInfo.MonBuff[6001],1,Monster)		
		-- Monster:Say(1003210001)
		-- self.GW_Js= self.GW_Js + 1
	-- end
end
----------------------------------------------------------------------------
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------




















