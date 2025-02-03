--[[
	--设置宝甲升阶折扣
	CAmuletSystem:SetDiscount_UpGrade(value)

	--设置宝甲熔炼倍数
	CAmuletSystem:SetMultiple_Intensify(value)
	
	--强化折扣
	CEquipIntensifySystem:SetDiscount_Intersify(value)
	
	--升阶折扣
	CEquipIntensifySystem:SetDiscount_LevelUp(value)
	
	--重置附加属性折扣
	CEquipIntensifySystem:SetDiscount_Append(value)
	
	--重置属性类型折扣
	CEquipIntensifySystem:SetDiscount_ResetType(value)

	--增加属性数值折扣
	CEquipIntensifySystem:SetDiscount_AddValue(value)
	
	--设置名剑升阶折扣
	CSwordSystem:SetDiscount_SwordMoney(value)
	
	--设置名剑剑气倍数
	CSwordSystem:SetSwordGasParam(value)
	
	--设置宝石合成消耗真气
	CStoneSystem:SetDiscount_StoneZQ(value)
	
	--设置坐骑升阶打折
	CMountSystem:SetDisCount_UpGrade(value)
]]

--名剑祝福符
local Buff = BuffBasicInfo[73000]
function Buff:EventCAddbuff(buffObj)
	--获取buffID
	local buffId = buffObj.m_id;
	--获取buff组ID
	local classId = BuffBasicInfo[buffId].dwClassId;
	--获取buff等级
	local level = buffObj.m_Level;
	--没有得到buffID组
	if not _G.CommercialBuff[classId] then
		return;
	end;
	--buff效果值
	local percent = _G.CommercialBuff[classId][level];
	--作用的类型
	CSwordSystem:SetDiscount_SwordMoney(percent);
end;
--该buff消失时执行该事件
function Buff:EventCDeletebuff(buffObj)
	local buffId = buffObj.m_id;
	CSwordSystem:SetDiscount_SwordMoney(1);
end;

--宝甲祝福符
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

--装备升阶祝福符
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

--宝石祝福符
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

--剑气倍数
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

--熔炼倍数
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

--强化折扣
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

----重置附加属性折扣 
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

--重置属性类型折扣
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

--增加属性数值折扣
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
--坐骑倍数  73010
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