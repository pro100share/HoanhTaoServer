local dwMonsterId = 10092013
local MonsterScript = {}
------蒙古军旗
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

end
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,Enemy)
	local sysTask = Enemy:GetSystem("CTaskSystem")	
	local Task = sysTask:GetTask(7036)
	if not Task then
		return;
	end
	if Task:GetTaskState()==TaskStateConfig.Accept then
		local objBuffSys = Enemy:GetSystem("CBuffSystem");
		if objBuffSys then
			objBuffSys:AddBuff(10092013,1,Monster);
			objBuffSys:AddBuff(100920130,1,Monster);
		end
	end
end
--杀死一个目标时执行
function MonsterScript:CBMonsterOnKill(Monster)
end
--受到攻击时执行
function MonsterScript:CBMonsterOnAttacked(Monster)
	
end

--每秒执行
function MonsterScript:CBMonsterOnUpdate(Monster)

	MonsterScript.JiLu = MonsterScript.JiLu or 0;
	
	MonsterScript.JiLu = MonsterScript.JiLu + 1

	local _,posx,posy = Monster:GetPos()
	
	if (MonsterScript.JiLu%5 == 0) then
		local sysScript = CScriptManager:GetPlayerScript(Monster.dwPlayerRoleID)
		if not sysScript then
			return;
		end
		sysScript:Notice(string.format(SysStringConfigInfo[9000110023],posx,posy),7);
	end
end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------