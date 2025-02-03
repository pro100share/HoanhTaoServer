--[[
说明：实战隐藏属性接口
作者：赵旭
时间: 2013-12-13
]] 

-- @brief 是否能删除道具
-- @param number dwID 道具标识符
-- @param number dwNumber 道具数量
-- @return boolean 是否
function CBournHideAttrSystem:IsCanDeleteItem(dwID, dwNumber)
    if self:GetPlayer():GetSystem("CItemSystem"):
        CheckDelEnumItemInPacketCond(
            dwID, dwNumber) then
        return true;
    else
        return false;
    end
end

-- @brief 删除道具
-- @param number dwID 道具标识符
-- @param number dwNumber 道具数量
function CBournHideAttrSystem:DeleteItem(dwID, dwNumber)
    self:GetPlayer():GetSystem("CItemSystem"):DelEnumItemInPacket(
        dwID,
        dwNumber,
        false,
        _G.ItemSysOperType.BournHideAttr);
end

-- @brief 改变属性值
-- @param table setValue
function CBournHideAttrSystem:ModifyProperty(setValue)
    local setAttribute = SSingleAttrChange:new();
    for k, v in pairs(setValue) do
        if setAttribute[k] ~= nil then
            setAttribute[k] = v;
        end
    end
	self:GetPlayer():GetSystem('CSkillSystem'):
        NotifyBournHideAttr(setAttribute);

    local dwSkillLevel = math.floor(setValue.dwAllSkillUpLv);
    if dwSkillLevel ~= 0 then
        local tbChg = {};
        for k,v in pairs(BournAddSkillLevel)do
            tbChg[v] = dwSkillLevel;
        end
        self:GetPlayer():GetSystem('CSkillSystem'):
            SetSkillLevel(tbChg, "CBournHideAttrSystem");
    end
end

-- @brief 是否已使用
-- @return boolean 是否
function CBournHideAttrSystem:IsUsed()
    if self.dwLevel > 0 then
        return true;
    else
        return false;
    end
end
