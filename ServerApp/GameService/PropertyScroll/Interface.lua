--[[
说明：附加属性翻倍符接口
作者：赵旭
时间: 2013-10-14
]] 

-- @brief 是否使用过该系统
-- @param object objEquip 装备对象
-- @return boolean 是否
function CPropertyScrollSystem:IsUsed(objEquip)
    return PropertyScrollScript:IsUsed(self:GetEquipProperty(objEquip));
end

-- @brief 是否有权限
-- @return boolean 是否
function CPropertyScrollSystem:IsHasAuthority()
    return true;
end

-- @brief 获取道具
-- @param number dwItemID 道具标识符
-- @return object 道具对象
function CPropertyScrollSystem:GetItem(dwItemID)
    return self:GetPlayer():GetSystem("CItemSystem"):GetItem(dwItemID);
end

-- @brief 获取道具附加属性
-- @param object 道具对象
-- @return table 附加属性表
function CPropertyScrollSystem:GetEquipProperty(objEquip)
    local setResult = objEquip:GetProperty();
    for k, v in pairs(setResult) do
        v.dwMaxValue = _G.AddAppendPropValueConfig.MaxAppendPropValue;
    end
    return setResult;
end

-- @brief 属性是否极值
-- @param table setProperty 属性表
-- @return boolean 是否
function CPropertyScrollSystem:IsPropertyMaxValue(setProperty)
    for k, v in pairs(setProperty) do
        if v.dwValue < _G.AddAppendPropValueConfig.MaxAppendPropValue then
            return false;
        end
    end
    return true;
end

-- @brief 是否能删除道具
-- @param table setItems 道具列表
-- @return boolean 是否
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

-- @brief 删除道具
-- @param table setItems 道具列表
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

-- @brief 设置属性值
-- @param object objEquip 装备对象
-- @param table setValue 属性值
function CPropertyScrollSystem:SetEquipProperty(objEquip, setValue)
    self:GetPlayer():GetSystem("CItemSystem"):
        SetItemProperty(objEquip:GetInstID(), setValue);
    self:GetPlayer():GetSystem("CMountSystem"):EquipChange(objEquip);
end
