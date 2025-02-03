--[[
	--���ñ��������ۿ�
	CAmuletSystem:SetDiscount_UpGrade(value)

	--���ñ�����������
	CAmuletSystem:SetMultiple_Intensify(value)
	
	--ǿ���ۿ�
	CEquipIntensifySystem:SetDiscount_Intersify(value)
	
	--�����ۿ�
	CEquipIntensifySystem:SetDiscount_LevelUp(value)
	
	--���ø��������ۿ�
	CEquipIntensifySystem:SetDiscount_Append(value)
	
	--�������������ۿ�
	CEquipIntensifySystem:SetDiscount_ResetType(value)

	--����������ֵ�ۿ�
	CEquipIntensifySystem:SetDiscount_AddValue(value)
	
	--�������������ۿ�
	CSwordSystem:SetDiscount_SwordMoney(value)
	
	--����������������
	CSwordSystem:SetSwordGasParam(value)
	
	--���ñ�ʯ�ϳ���������
	CStoneSystem:SetDiscount_StoneZQ(value)
	
	--�����������״���
	CMountSystem:SetDisCount_UpGrade(value)
]]

--����ף����
local Buff = BuffBasicInfo[73000]
function Buff:EventCAddbuff(buffObj)
	--��ȡbuffID
	local buffId = buffObj.m_id;
	--��ȡbuff��ID
	local classId = BuffBasicInfo[buffId].dwClassId;
	--��ȡbuff�ȼ�
	local level = buffObj.m_Level;
	--û�еõ�buffID��
	if not _G.CommercialBuff[classId] then
		return;
	end;
	--buffЧ��ֵ
	local percent = _G.CommercialBuff[classId][level];
	--���õ�����
	CSwordSystem:SetDiscount_SwordMoney(percent);
end;
--��buff��ʧʱִ�и��¼�
function Buff:EventCDeletebuff(buffObj)
	local buffId = buffObj.m_id;
	CSwordSystem:SetDiscount_SwordMoney(1);
end;

--����ף����
local Buff = BuffBasicInfo[73001]
function Buff:EventCAddbuff(buffObj)
	local buffId = buffObj.m_id;
	local classId = BuffBasicInfo[buffId].dwClassId;
	local level = buffObj.m_Level;
	if not _G.CommercialBuff[classId] then
		return;
	end;
	local percent = _G.CommercialBuff[classId][level];
	CAmuletSystem:SetDiscount_UpGrade(percent);
end;
function Buff:EventCDeletebuff(buffObj)
	local buffId = buffObj.m_id;
	CAmuletSystem:SetDiscount_UpGrade(1);
end;

--װ������ף����
local Buff = BuffBasicInfo[73002]
function Buff:EventCAddbuff(buffObj)
	local buffId = buffObj.m_id;
	local classId = BuffBasicInfo[buffId].dwClassId;
	local level = buffObj.m_Level;
	if not _G.CommercialBuff[classId] then
		return;
	end;
	local percent = _G.CommercialBuff[classId][level];
	CEquipIntensifySystem:SetDiscount_LevelUp(percent);
end;
function Buff:EventCDeletebuff(buffObj)
	local buffId = buffObj.m_id;
	CEquipIntensifySystem:SetDiscount_LevelUp(1);
end;

--��ʯף����
local Buff = BuffBasicInfo[73003]
function Buff:EventCAddbuff(buffObj)
	local buffId = buffObj.m_id;
	local classId = BuffBasicInfo[buffId].dwClassId;
	local level = buffObj.m_Level;
	if not _G.CommercialBuff[classId] then
		return;
	end;
	local percent = _G.CommercialBuff[classId][level];
	CStoneSystem:SetDiscount_StoneZQ(percent);
end;
function Buff:EventCDeletebuff(buffObj)
	local buffId = buffObj.m_id;
	CStoneSystem:SetDiscount_StoneZQ(1);
end;

--��������
local Buff = BuffBasicInfo[73004]
function Buff:EventCAddbuff(buffObj)
	local buffId = buffObj.m_id;
	local classId = BuffBasicInfo[buffId].dwClassId;
	local level = buffObj.m_Level;
	if not _G.CommercialBuff[classId] then
		return;
	end;
	local percent = _G.CommercialBuff[classId][level];
	CSwordSystem:SetSwordGasParam(percent);
end;
function Buff:EventCDeletebuff(buffObj)
	local buffId = buffObj.m_id;
	CSwordSystem:SetSwordGasParam(1);
end;

--��������
local Buff = BuffBasicInfo[73005]
function Buff:EventCAddbuff(buffObj)
	local buffId = buffObj.m_id;
	local classId = BuffBasicInfo[buffId].dwClassId;
	local level = buffObj.m_Level;
	if not _G.CommercialBuff[classId] then
		return;
	end;
	local percent = _G.CommercialBuff[classId][level];
	CAmuletSystem:SetMultiple_Intensify(percent);
end;
function Buff:EventCDeletebuff(buffObj)
	local buffId = buffObj.m_id;
	CAmuletSystem:SetMultiple_Intensify(1);
end;

--ǿ���ۿ�
local Buff = BuffBasicInfo[73006]
function Buff:EventCAddbuff(buffObj)
	local buffId = buffObj.m_id;
	local classId = BuffBasicInfo[buffId].dwClassId;
	local level = buffObj.m_Level;
	if not _G.CommercialBuff[classId] then
		return;
	end;
	local percent = _G.CommercialBuff[classId][level];
	CEquipIntensifySystem:SetDiscount_Intersify(percent);
end;
function Buff:EventCDeletebuff(buffObj)
	local buffId = buffObj.m_id;
	CEquipIntensifySystem:SetDiscount_Intersify(1);
end;

----���ø��������ۿ� 
local Buff = BuffBasicInfo[73007]
function Buff:EventCAddbuff(buffObj)
	local buffId = buffObj.m_id;
	local classId = BuffBasicInfo[buffId].dwClassId;
	local level = buffObj.m_Level;
	if not _G.CommercialBuff[classId] then
		return;
	end;
	local percent = _G.CommercialBuff[classId][level];
	CEquipIntensifySystem:SetDiscount_Append(percent);
end;
function Buff:EventCDeletebuff(buffObj)
	local buffId = buffObj.m_id;
	CEquipIntensifySystem:SetDiscount_Append(1);
end;

--�������������ۿ�
local Buff = BuffBasicInfo[73008]
function Buff:EventCAddbuff(buffObj)
	local buffId = buffObj.m_id;
	local classId = BuffBasicInfo[buffId].dwClassId;
	local level = buffObj.m_Level;
	if not _G.CommercialBuff[classId] then
		return;
	end;
	local percent = _G.CommercialBuff[classId][level];
	CEquipIntensifySystem:SetDiscount_ResetType(percent);
end;
function Buff:EventCDeletebuff(buffObj)
	local buffId = buffObj.m_id;
	CEquipIntensifySystem:SetDiscount_ResetType(1);
end;

--����������ֵ�ۿ�
local Buff = BuffBasicInfo[73009]
function Buff:EventCAddbuff(buffObj)
	local buffId = buffObj.m_id;
	local classId = BuffBasicInfo[buffId].dwClassId;
	local level = buffObj.m_Level;
	if not _G.CommercialBuff[classId] then
		return;
	end;
	local percent = _G.CommercialBuff[classId][level];
	CEquipIntensifySystem:SetDiscount_AddValue(percent);
end;
function Buff:EventCDeletebuff(buffObj)
	local buffId = buffObj.m_id;
	CEquipIntensifySystem:SetDiscount_AddValue(1);
end;
--���ﱶ��  73010
local Buff = BuffBasicInfo[73010]
function Buff:EventCAddbuff(buffObj)
	local buffId = buffObj.m_id;
	local classId = BuffBasicInfo[buffId].dwClassId;
	local level = buffObj.m_Level;
	if not _G.CommercialBuff[classId] then
		return;
	end;
	local percent = _G.CommercialBuff[classId][level];
	CMountSystem:SetDisCount_UpGrade(percent);
end;
function Buff:EventCDeletebuff(buffObj)
	local buffId = buffObj.m_id;
	CMountSystem:SetDisCount_UpGrade(1);					
end;