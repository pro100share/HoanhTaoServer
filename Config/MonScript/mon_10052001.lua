local dwMonsterId = 10052001
local MonsterScript = {}
------
--[[
--]]
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)
	return 10052001,1,0
end
---------------------------------------------
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster)
--[[	
	local sysTask = objKiller:GetSystem("CTaskSystem")
	local Task = sysTask:GetTask(1023) 
--	if Task and Task:GetTaskState()==4 then
		local Map = Monster:GetMap()
		local mgrNpc = Map:GetNpcMgr()
		local Pos = Monster:GetVectorPos()
		mgrNpc:Add(10011004,-71,-65,0, szName, szTitle,dwObjId)
	end
	]]--
end
--杀死一个目标时执行
function MonsterScript:CBMonsterOnKill(Monster)
end
--受到攻击时执行
function MonsterScript:CBMonsterOnAttacked(Monster)
end
--出生前执行
function MonsterScript:CBMonsterBeforeBorn(Monster)
	
end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------






















