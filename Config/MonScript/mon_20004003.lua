local dwMonsterId = 20004003
local MonsterScript = {}
------
--[[
--]]
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)

	local dwRand = MonsterDecision:odds(Monster,true)
	
	if (dwRand >= 7000) then
		return 90002
	end
	return 1,1
end
---------------------------------------------
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,Player)
	local GName = Monster:GetName()
	local RName = Player:GetName()
	CScriptManager:Notice(string.format(SysStringConfigInfo[54],RName,GName).."%s",6,false,dwMapId,15,17,SysStringConfigInfo[55])	
end
--杀死一个目标时执行
function MonsterScript:CBMonsterOnKill(Monster)
end
--受到攻击时执行
function MonsterScript:CBMonsterOnAttacked(Monster)

end
--------------------------------------------------------------------------
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------






















