--[[
���ܣ�����ȫ��
���ߣ���Ө
ʱ�䣺2014-03-11
]]
_G.CGestObj = {}
function CGestObj:new()
	local obj = {}
	obj.dwGestLevel = 1;   --����ȫ�µȼ�
	obj.dwGestProgress = 0; --�������н���
	obj.dwMode = 0;   --����ȫ��ģʽ
	obj.r_BaseProp = _G.GestBasicConfig;  --��������
	obj.r_DataProp = _G.GestDataConfig;   --��ֵ����
	obj.r_DesConfig = _G.GestDesConfig;        --����
	for i,v in pairs(CGestObj) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;  
	return obj;
end; 

function CGestObj:Create()
	return true;
end;

function CGestObj:Update(dwInterval)

end;

function CGestObj:Destroy()

end;
--��������ȫ�µȼ�
function CGestObj:SetGestLevel(ladder)
	self.dwGestLevel = ladder;
end;
--�������н���
function CGestObj:SetGestProgress(dwValue)
	self.dwGestProgress = dwValue;
end;
--�������ȫ�µȼ�
function CGestObj:GetGestLevel()
	return self.dwGestLevel;
end;
--����������н���
function CGestObj:GetGestProgress()
	return self.dwGestProgress;
end;
--��������ȫ��ģʽ
function CGestObj:SetGestMode(dwMode)
	self.dwMode = dwMode
end;
function CGestObj:GetGestMode()
	return self.dwMode;
end;
--[[
--��ù���ֵ
function CSword:GetAttackValue(attackValue)
	return self.r_DataProp.AttackValue(attackValue, self);
end;
--��ô�������
function CSword:GetHappenRate()
	return self.r_DataProp.HappenRate(self);
end;
--���ÿ�׵ĵȼ�
function CSword:GetLevelByLadder(ladder)
	local maxLevel = self.r_BaseProp[ladder].level;
	return maxLevel;
end;
--�����ʾ����
function CSword:GetShowRate()
	return self.r_DataProp.ShowRate(self);
end;
--����������������
function CSword:GetNeedGold()
	return self.r_DataProp.NeedGold(self);
end;
--�����������Ľ���ʯ
function CSword:GetNeedStone()
	return self.r_DataProp.NeedStone(self);
end;
--�������ʯͷid
function CSword:GetNeedStoneId()
	return self.r_DataProp.StoneId(self);
end;
--��������ĳɹ���
function CSword:GetSuccessRate(tgValue)
	return self.r_DataProp.SuccessRate(self, tgValue);
end;

----��ȡ�������Կ�ID
function CSword:GetPropertyCardItemID()
	return self.r_DataProp.PropertyCardItemID();
end
----��ȡ�������Կ�Ƭ���ܼ���������Ϣ
function CSword:GetActProCardConInfo()
	return self.r_DataProp.ActProCardConInfo();
end
---��ȡ�������Կ�Ƭ���ܼ������Լӳ�
function CSword:GetAddProCardAttr()
	return self.r_DataProp.AddProCardAttr();
end
--��û������Լӳ�
function CSword:GetPropertyValue()
	return self.r_DataProp.PropertyType(self);
end;
--��ñ����Ļ�������
function CSword:GetSwordBaseInfo()
	local ladder = self:GetSwordLadder();
	return self.r_BaseProp[ladder];
end;
--���ģ��
function CSword:GetSwordModel()
	local ladder = self:GetSwordLadder();
	local model = self.r_BaseProp[ladder].model;
	return model;
end;
--��ñ����ļ���id
function CSword:GetSwordSkillId()
	local ladder = self:GetSwordLadder();
	return self.r_BaseProp[ladder].skillId;
end;
--��ñ�����󹥻�����
function CSword:GetSwordAttackNum()
	local level = self:GetSwordLevel();
	return self.r_LevelProp[level].dwAttackNum;
end;
--��ü���
function CSword:GetSkillTbl()
	local ladder = self:GetSwordLadder();
	return self.r_BaseProp[ladder].skillTbl;
end;
--���ÿ�εĽ���ֵ
function CSword:GetPerSwordGas()
	return self.r_DataProp.AddSwordGas(self);
end;
--���ÿ��ÿ���Ľ�����ֵ
function CSword:GetTotalSwordGas()
	local level = self:GetSwordLevel();
	return self.r_LevelProp[level].dwGas;
end;
--��õ�ǰ��������ߵȼ�
function CSword:GetMaxLevel()
	local ladder = self:GetSwordLadder();
	local maxLevel = table.maxn(self.r_BaseProp[ladder]);
	return maxLevel;
end;
--������ȼ�
function CSword:GetMaxLadder()
	return table.maxn(self.r_BaseProp);
end;
--����¸��ȼ�
function CSword:GetNextLevel()
	local info = self:GetSwordBaseInfo();
	return info.level;
end;
--����½�
function CSword:GetNextLadder()
	local ladder = self:GetSwordLadder();
	return self.r_BaseProp[ladder].nextLadder;
end;

--��ñ�����ѧ����
function CSword:GetSwordType()
	local ladder = self:GetSwordLadder();
	return self.r_BaseProp[ladder].skillType;
end;

function CSword:GetNetData()
	local netData = {};
	--�����Ƚ�
	netData[1] 	= self.dwSwordLadder;
	--�����ȼ�
	netData[2] 	= self.dwSwordLevel;
	--��������
	netData[3]	= self.dwSwordGas;
	return netData
end;

]]
