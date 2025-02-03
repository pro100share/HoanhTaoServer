
--强化折扣
function CEquipIntensifySystem:SetDiscount_Intersify(value)
	self.nDiscount_Intensify= value;
end;

--升阶折扣
function CEquipIntensifySystem:SetDiscount_LevelUp(value)
	self.nDiscount_LevelUp	= value;
end;

--重置附加属性折扣
function CEquipIntensifySystem:SetDiscount_Append(value)
	self.nDiscount_Append	= value;
end;

--重置属性类型折扣
function CEquipIntensifySystem:SetDiscount_ResetType(value)
	self.nDiscount_ResetType = value;
end;

--增加属性数值折扣
function CEquipIntensifySystem:SetDiscount_AddValue(value)
	self.nDiscount_AddValue = value;
end;



