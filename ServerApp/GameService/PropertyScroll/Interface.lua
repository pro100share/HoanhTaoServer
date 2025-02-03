--[[
˵�����������Է������ӿ�
���ߣ�����
ʱ��: 2013-10-14
]] 

-- @brief �Ƿ�ʹ�ù���ϵͳ
-- @param object objEquip װ������
-- @return boolean �Ƿ�
function CPropertyScrollSystem:IsUsed(objEquip)
    return PropertyScrollScript:IsUsed(self:GetEquipProperty(objEquip));
end

-- @brief �Ƿ���Ȩ��
-- @return boolean �Ƿ�
function CPropertyScrollSystem:IsHasAuthority()
    return true;
end

-- @brief ��ȡ����
-- @param number dwItemID ���߱�ʶ��
-- @return object ���߶���
function CPropertyScrollSystem:GetItem(dwItemID)
    return self:GetPlayer():GetSystem("CItemSystem"):GetItem(dwItemID);
end

-- @brief ��ȡ���߸�������
-- @param object ���߶���
-- @return table �������Ա�
function CPropertyScrollSystem:GetEquipProperty(objEquip)
    local setResult = objEquip:GetProperty();
    for k, v in pairs(setResult) do
        v.dwMaxValue = _G.AddAppendPropValueConfig.MaxAppendPropValue;
    end
    return setResult;
end

-- @brief �����Ƿ�ֵ
-- @param table setProperty ���Ա�
-- @return boolean �Ƿ�
function CPropertyScrollSystem:IsPropertyMaxValue(setProperty)
    for k, v in pairs(setProperty) do
        if v.dwValue < _G.AddAppendPropValueConfig.MaxAppendPropValue then
            return false;
        end
    end
    return true;
end

-- @brief �Ƿ���ɾ������
-- @param table setItems �����б�
-- @return boolean �Ƿ�
function CPropertyScrollSystem:IsCanDeleteItem(setItems)
    local bResult = false;
    for k, v in pairs(setItems) do
        for dwItemID, dwItemNum in pairs(v) do
            if self:GetPlayer():GetSystem("CItemSystem"):
                CheckDelEnumItemInPacketCond(
                    dwItemID, dwItemNum) then
                bResult = true;
            else
                bResult = false;
                break;
            end
        end
    end
    return bResult;
end

-- @brief ɾ������
-- @param table setItems �����б�
function CPropertyScrollSystem:DeleteItem(setItems)
    for k, v in pairs(setItems) do
        for dwItemID, dwItemNum in pairs(v) do
            self:GetPlayer():GetSystem("CItemSystem"):DelEnumItemInPacket(
                dwItemID,
                dwItemNum,
                false,
                _G.ItemSysOperType.PropertyScroll);
        end
    end
end

-- @brief ��������ֵ
-- @param object objEquip װ������
-- @param table setValue ����ֵ
function CPropertyScrollSystem:SetEquipProperty(objEquip, setValue)
    self:GetPlayer():GetSystem("CItemSystem"):
        SetItemProperty(objEquip:GetInstID(), setValue);
    self:GetPlayer():GetSystem("CMountSystem"):EquipChange(objEquip);
end
