local dwMonsterId = 20000010
local MonsterScript = {}
------
--[[
--]]
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)
end
---------------------------------------------
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster, objKiller)
end
function MonsterScript:CBMonsterOnBorn(Monster)
	
		local sysSkill = Monster:GetSystem("CMonsterSkillSystem")
		local Map = Monster.Map
		local Players = Map:GetAllPlayer()
		local vMPos = Monster:GetBornPos()
	local aaaaa = function()
		for dwRoleId,objPlayer in pairs(Players) do
			local sysScript = objPlayer:GetSystem("CScriptSystem")
			local dwMapID,x,y = sysScript:GetMapPos()
			if (vMPos.x-x)^2 + (vMPos.y-y)^2 < 2.7^2 then
				local sOtherInfo = objPlayer:GetSystem("CSkillSystem"):GetInfo();
				local all = (sOtherInfo.dwHPMax*0.4);
				sysSkill:DoHurt(objPlayer,(all+500),1,1,1,1)
				--sysSkill:DoHurt(dwRoleId,nil,20000010,dwSkillLevel,1,1)
			end
		end
	end
	Map:AddTimeEvent(950,aaaaa)
	--CMonsterSkillSystem:DoHurt(dwRoleId,dwValue,20000010,dwSkillLevel,bHit,bCrit)
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
