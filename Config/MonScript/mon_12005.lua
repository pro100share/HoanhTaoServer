local dwMonsterId = 12005	--������
local MonsterScript = {}
------
--[[
--]]
---------------------------------------------
--��ȡ��ǰҪʹ�õļ���id,���ܵȼ�
function MonsterScript:GetNextSkillId(Monster,Player)
	--��Ĭ����ͨ����
	if not MonsterSilent(Monster) then
		return 50302073,1
	end
	local dwRand = MonsterDecision:odds(Monster,true)
	if (dwRand < 7500) then
		return 50302073,1
	else
		return 503020730,1
	end
end
---------------------------------------------
--��ȡ�´�ˢ��ʱ��(��·���ꡢ�¡��ա����ڡ�ʱ���֡���)
function MonsterScript:GetNextBronTime(dwLine,dwMap,dwYear,dwMonth,dwDay,dwWeek,dwHour,dwMin,dwSec)
end
--ɱ��һ��Ŀ��ʱִ��
function MonsterScript:CBMonsterOnKill(Monster)
end
--�ܵ�����ʱִ��
function MonsterScript:CBMonsterOnAttacked(Monster)
end
--����ǰִ��
function MonsterScript:CBMonsterBeforeBorn(Monster)
		
		
end
--�������ʱִ��
function MonsterScript:CBMonsterOnBorn(Monster)
	
end
--����ʱִ��
function MonsterScript:CBMonsterOnDead(Monster,objPlayer)
		
end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------