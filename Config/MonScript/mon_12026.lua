local dwMonsterId = 12026; 
local MonsterScript = {}
------
--[[
--]]
---------------------------------------------
--��ȡ��ǰҪʹ�õļ���id,���ܵȼ�
function MonsterScript:GetNextSkillId(Monster,Player)
	return 1,1,0
end
---------------------------------------------
--����ʱִ��
function MonsterScript:CBMonsterOnDead(Monster,Enemy)

end
--ɱ��һ��Ŀ��ʱִ��
function MonsterScript:CBMonsterOnKill(Monster)
end
--�ܵ�����ʱִ��
function MonsterScript:CBMonsterOnAttacked(Monster)
end
--�������ʱִ��
function MonsterScript:CBMonsterOnBorn(Monster)

end
--����ǰִ��
function MonsterScript:CBMonsterBeforeBorn(Monster)
	--
end

----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------