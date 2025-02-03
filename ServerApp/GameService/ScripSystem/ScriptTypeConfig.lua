--脚本类型配置
_G.ScriptTypeConfig = 
{
	Npc 		= 1;	--npc脚本
	NpcTalk 	= 2;	--npc对话脚本
	Monster 	= 3;	--怪物脚本
	Task 		= 4;	--任务脚本
	MapLogic	= 5;--地图脚本
}
-------------------------------------
_G.CScriptMeta = {}--所有脚本的元表
-------------------------------------
local TaskScript = {}
local NpcScript = {}
local MonsterScript = {}

CScriptMeta[ScriptTypeConfig.Task] = TaskScript
CScriptMeta[ScriptTypeConfig.Npc] = NpcScript
CScriptMeta[ScriptTypeConfig.Monster] = MonsterScript
----------------------------------------------------------
---任务
----------------------------------------------------------
--接受任务时执行
function TaskScript:cb_task_on_accept(objPlayer,objTask)
end
--任务更新时执行
function TaskScript:cb_task_on_update(objPlayer,objTask)
end
--完成任务时执行
function TaskScript:cb_task_on_complete(objPlayer,objTask)
end
--放弃任务时执行
function TaskScript:cb_task_on_doff(objPlayer,objTask)
end
--获取任务使用物品信息
function TaskScript:get_item_use_info(objPlayer,objTask)
	local Item = {}
	--[[
	Item[1234567] = {
		{map_id=1001,x=0,y=0,round=5;};
		{map_id=1001,x=0,y=0,round=5;};
	};
	Item[7654321] = {
		{map_id=1001,x=0,y=0,round=5;};
		{map_id=1001,x=0,y=0,round=5;};
	};
	--]]
	return Item;
end
----------------------------------------------------------
---npc
----------------------------------------------------------
--npc开启检查
function NpcScript.cb_npc_on_opera_check(objNpc,objPlayer,sysNpc,sysScript)
	return true
end
--npc被开启时执行
function NpcScript.cb_npc_on_opera(objNpc,objPlayer,sysNpc,sysScript)
end
--设置npc携带任务
function NpcScript.npc_get_task()
	local task = {}
	--[[
		task[1] = 1001;
		task[2] = 1002;
	--]]
	return task
end
--设置读条时间
function NpcScript.npc_get_time()
	return 3000
end
--npc触发对话时执行（修改对话内容）
function NpcScript.cb_npc_on_talk(talk_page,objPlayer,sysScript)
end
----------------------------------------------------------
--Monster
----------------------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)
	return 1,1,0
end
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster)
end
--杀死一个目标时执行
function MonsterScript:CBMonsterOnKill(Monster)
end
--受到攻击时执行
function MonsterScript:CBMonsterOnAttacked(Monster)
end
--怪物出生时执行
function MonsterScript:CBMonsterOnBorn(Monster)
end
--出生前执行
function MonsterScript:CBMonsterBeforeBorn(Monster)
end
-----------------------------------------------------------






































