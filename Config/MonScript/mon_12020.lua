local dwMonsterId = 12020
local MonsterScript = {}
------
--[[
--]]
---------------------------------------------
--��ȡ��ǰҪʹ�õļ���id,���ܵȼ�
function MonsterScript:GetNextSkillId(Monster,Player)
	--��Ĭ����ͨ����
	if not MonsterSilent(Monster) then
		return 20002007,1
	end
	
	self.JiShu = self.JiShu or 0
	self.GW_Jn = self.GW_Jn or 0
	
	--����
	local HP = MonsterDecision:life(Monster)
	if (HP <= 0.75 and self.GW_Jn == 0) then
		self.GW_Jn= self.GW_Jn + 1
		Monster:Say(55)
		return 200020071,1
	elseif (HP <= 0.5 and self.GW_Jn == 1) then
		self.GW_Jn= self.GW_Jn + 1
		Monster:Say(55)
		return 200020071,1
	elseif (HP <= 0.25 and self.GW_Jn == 2) then
		self.GW_Jn= self.GW_Jn + 1
		Monster:Say(55)
		return 200020071,1
	end
	
	local whether = MonsterDecision:factor(self.JiShu)
	if (whether) then
		self.JiShu = 0;
		return 200020070
	end
	
	local dwRand = math.random(10000);
	if (dwRand <= 2000) then
		return 200020072,1
	end
	self.JiShu = self.JiShu + 1;
	--��ͨ
	return 20002007,1;
end
--��ȡ�´�ˢ��ʱ��(��·���ꡢ�¡��ա����ڡ�ʱ���֡���)
function MonsterScript:GetNextBronTime(dwLine,dwMap,dwYear,dwMonth,dwDay,dwWeek,dwHour,dwMin,dwSec)

end
---------------------------------------------
--����ʱִ��
function MonsterScript:CBMonsterOnDead(Monster,Player)
	local GName = Monster:GetName()
	local RName = Player:GetName()
	--CScriptManager:Notice(string.format(SysStringConfigInfo[54],RName,GName).."%s",6,false,dwMapId,15,17,SysStringConfigInfo[55])	
end	
--�ܵ�����ʱִ��
function MonsterScript:CBMonsterOnAttacked(Monster,objEnemy,dwSkillID)
end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------