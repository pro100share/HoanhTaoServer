local dwMonsterId = 12010
local MonsterScript = {}
------
--[[
--]]
---------------------------------------------
--��ȡ��ǰҪʹ�õļ���id,���ܵȼ�
function MonsterScript:GetNextSkillId(Monster,Player)
	--��Ĭ����ͨ����
	if not MonsterSilent(Monster) then
		return 10102017,1
	end
	
	local num  = math.random( 10000 )
	if num <= 1000 then
		return 101020170,1
	end
	
	return 10102017,1;
end
---------------------------------------------
--------------------------------------------------------------------------
--����ʱִ��
function MonsterScript:CBMonsterOnDead(Monster,Player)
end
--------------------------------------------------------------------------
--ɱ��һ��Ŀ��ʱִ��
function MonsterScript:CBMonsterOnKill(Monster)
end
--------------------------------------------------------------------------
--�ܵ�����ʱִ��
function MonsterScript:CBMonsterOnAttacked(Monster)
	
end

----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------






















