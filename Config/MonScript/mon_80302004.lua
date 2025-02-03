local dwMonsterId = 80302004
local MonsterScript = {}
------玄武塑像
--[[
--]]
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)
end
---------------------------------------------
function MonsterScript:GetNextBronTime(dwLine,dwMap,dwYear,dwMonth,dwDay,dwWeek,dwHour,dwMin,dwSec)

end
--怪物出生时执行
function MonsterScript:CBMonsterOnBorn(Monster)
	local sysMonsterBuff = Monster:GetSystem("CMonsterBuffSystem")
	sysMonsterBuff:AddBuff(9506,1,Monster)
end
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,Enemy)
	local Name = "占领";
	local szName = ""
	szName = Enemy:GetName()
	Name = ""..szName..""..Name
	Monster:SetSendData(1,Name)
	CScriptManager:Notice(string.format(SysStringConfigInfo[13009000001],Name,"%s"),6,false,8030,15,49,SysStringConfigInfo[71])
	local dwRoleID = Enemy:GetRoleID()
	if not dwRoleID then
		return
	end
	--设置归属
	Monster:SetOwner(3,dwRoleID)
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