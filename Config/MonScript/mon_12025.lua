local dwMonsterId = 12025
local MonsterScript = {}
------
--[[
--]]
---------------------------------------------
--��ȡ��ǰҪʹ�õļ���id,���ܵȼ�
function MonsterScript:GetNextSkillId(Monster,Player)
	--��Ĭ����ͨ����
	if not MonsterSilent(Monster) then
		return 10112016,1
	end
	
	--����
	self.GW_Jn = self.GW_Jn or 0
	local HP = MonsterDecision:life(Monster)
	if (HP <= 0.75 and self.GW_Jn == 0) then
		self.GW_Jn= self.GW_Jn + 1
		Monster:Say(58)
		return 101120162,1
	elseif (HP <= 0.5 and self.GW_Jn == 1) then
		self.GW_Jn= self.GW_Jn + 1
		Monster:Say(58)
		return 101120162,1
	elseif (HP <= 0.25 and self.GW_Jn == 2) then
		self.GW_Jn= self.GW_Jn + 1
		Monster:Say(58)
		return 101120162,1
	end
	
	local dwRand = math.random(10000)
	if (dwRand <=3000) then
		return 101120161,1		--Ⱥ��С�У����ˣ�
	elseif (dwRand <=8000) then
		return 101120160,1		--����������
	end
	
	
	return 10112016,1
end
---------------------------------------------
function MonsterScript:GetNextBronTime(dwLine,dwMap,dwYear,dwMonth,dwDay,dwWeek,dwHour,dwMin,dwSec)

end
--����ʱִ��
function MonsterScript:CBMonsterOnDead(Monster,objPlayer,sysScript)
	local GName = Monster:GetName()
	local RName = objPlayer:GetName()
	--CScriptManager:Notice(string.format(SysStringConfigInfo[54],RName,GName).."%s",6,false,dwMapId,15,17,SysStringConfigInfo[55])
end
--ɱ��һ��Ŀ��ʱִ��
function MonsterScript:CBMonsterOnKill(Monster)
end
--�ܵ�����ʱִ��
function MonsterScript:CBMonsterOnAttacked(Monster)
end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------






















