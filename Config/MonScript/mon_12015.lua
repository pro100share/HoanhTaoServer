local dwMonsterId = 12015
local MonsterScript = {}
------
--[[
--]]
---------------------------------------------
--��ȡ��ǰҪʹ�õļ���id,���ܵȼ�
function MonsterScript:GetNextSkillId(Monster,Player)
	--��Ĭ����ͨ����
	if not MonsterSilent(Monster) then
		return 60011006,1
	end
	self.JiShu = self.JiShu or 0
	self.GW_Jn = self.GW_Jn or 0
	
	
	local whether = MonsterDecision:factor(self.JiShu)
	if (whether) then
		self.JiShu = 0;
		return 60011006;
	end
	
	local dwRand = math.random(10000);
	if (dwRand <= 3500) then
		return 600110060,1
	elseif (dwRand <= 7000) then
		return 600110061,1
	end
	self.JiShu = self.JiShu + 1;
	--��ͨ
	return 60011006,1;
end
----------------------------------------------------------------------------
----------------------------------------------------------------------------
--����ʱִ��
function MonsterScript:CBMonsterOnDead(Monster,Player)

end
----------------------------------------------------------------------------
--ɱ��һ��Ŀ��ʱִ��
function MonsterScript:CBMonsterOnKill(Monster)
end
----------------------------------------------------------------------------
--�ܵ�����ʱִ��
function MonsterScript:CBMonsterOnAttacked(Monster)

end
----------------------------------------------------------------------------
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------




















