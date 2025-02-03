--[[
说明：武侠令接口
作者：赵旭
时间: 2013-12-13
]] 

-- @brief 获取勋章
-- @return number 勋章
function CWuXiaLingSystem:GetLevel()
    return self.dwInsignia;
end

-- @brief 获取银两
-- @return number 银两
function CWuXiaLingSystem:GetYinLiang()
    return self:GetPlayer():GetSystem("CItemSystem"):GetPacketMoney();
end

-- @brief 获取威望
-- @return table 
-- {
    -- dwLevel - 等级
    -- dwValue - 值
-- }
function CWuXiaLingSystem:GetWeiWang()
    local objMissionDailySystem = self:GetPlayer():
        GetSystem("CMissionDailySystem");
    return {
        dwLevel = objMissionDailySystem:GetWeiWangLevel();
        dwValue = objMissionDailySystem:GetTotalActivePoint();
    };
end

-- @brief 是否能删除道具
-- @param number dwID 道具标识符
-- @param number dwNumber 道具数量
-- @return boolean 是否
function CWuXiaLingSystem:IsCanDeleteItem(dwID, dwNumber)
    if self:GetPlayer():GetSystem("CItemSystem"):
        CheckDelEnumItemInPacketCond(
            dwID, dwNumber) then
        return true;
    else
        return false;
    end
end

-- @brief 修改银两值
-- @param number dwValue 值
function CWuXiaLingSystem:ModifyYinLiang(dwValue)
    local objItemSystem = self:GetPlayer():GetSystem("CItemSystem");
    if dwValue > 0 then
        objItemSystem:AddPacketMoney(dwValue, _G.ItemSysOperType.WuXiaLing);
    else
        objItemSystem:CostPacketMoney(-dwValue, _G.ItemSysOperType.WuXiaLing);
    end
end

-- @brief 修改威望值
-- @param number dwValue 值
function CWuXiaLingSystem:ModifyWeiWang(dwValue)
    self:GetPlayer():GetSystem("CMissionDailySystem"):
        ChangeActivePoint(dwValue);
end

-- @brief 删除道具
-- @param number dwID 道具标识符
-- @param number dwNumber 道具数量
function CWuXiaLingSystem:DeleteItem(dwID, dwNumber)
    self:GetPlayer():GetSystem("CItemSystem"):DelEnumItemInPacket(
        dwID,
        dwNumber,
        false,
        _G.ItemSysOperType.WuXiaLing);
end

-- @brief 改变属性值
-- @param table setValue
function CWuXiaLingSystem:ModifyProperty(setValue)
    local setAttribute = SSingleAttrChange:new();
    for k, v in pairs(setValue) do
        if setAttribute[k] ~= nil then
            setAttribute[k] = v;
        end
    end
	self:GetPlayer():GetSystem('CSkillSystem'):
        NotifyWuXiaLing(setAttribute);
end
