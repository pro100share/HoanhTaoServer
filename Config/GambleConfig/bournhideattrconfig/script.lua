-- [[
	-- 实战隐藏属性系统配置脚本
	-- 时间：2013-12-19
-- ]]

-- 实战隐藏属性脚本对象
_G.BournHideAttrScript = {};

function BournHideAttrScript:GetMaxLevel()
    return #BournHideAttrConfig.Data;
end

-- @brief 获取人物头顶显示信息
    -- @param number dwLevel 等级
    -- @return table 信息
    -- {
        -- -- 是否有效(true - 有效, false - 无效)
        -- bResult
        -- -- 显示类型
        -- dwType
    -- }
function BournHideAttrScript:GetShowInfo(dwLevel)
		local bResult = true;
        local dwIcon = 0;
		if dwLevel and dwLevel >= 1 and dwLevel <= 10 then
			dwIcon = dwLevel + 16;	
		else
			bResult = false;
		end
		
		local setResult = {
            bResult = bResult;
			dwType = dwIcon;
        };
        return setResult;
end;

-- @brief 获取消耗
-- @param number dwLevel 隐藏属性等级
-- @return table 消耗表
-- { {无字天书标识符, 无字天书数量}; }
-- { 
--      setAirBookUp = {dwID = 1, dwNumber = 1}; 
--      setAirBookDown = {dwID = 1, dwNumber = 1}; 
-- }
function BournHideAttrScript:GetConsume(dwLevel)
    local setConfig = BournHideAttrConfig.Data[dwLevel][1];
    return {
        setAirBookUp = {
            dwID = setConfig[1][1];
            dwNumber = setConfig[1][2];
        };
        setAirBookDown = {
            dwID = setConfig[2][1];
            dwNumber = setConfig[2][2];
        };
    };
end

-- @brief 获取属性
-- @param number dwLevel 隐藏属性等级
-- @return table 属性表 (K - Config/SkillDefine.lua中SSingleAttrChange名字)
function BournHideAttrScript:GetProperty(dwLevel)
    local setConfig = BournHideAttrConfig.Data[dwLevel][2];
    return {
		dwHPMax         = setConfig[1];
        dwAttack        = setConfig[2];
        dwDefense       = setConfig[3];
        dwCrit          = setConfig[4];
		dwFlee          = setConfig[5];
        dwRemitAttack   = setConfig[6];
        dwAllSkillUpLv   = setConfig[7];
    };
end

-- @brief 激活条件
-- @param object objSystem 系统对象
-- @param number dwLevel 想要激活的隐藏属性等级
-- @return number 错误码(0 - 可以 非0 - 不可)
function BournHideAttrScript:CanDo(objSystem, dwLevel)
    local setConsume = self:GetConsume(dwLevel);
    if objSystem:IsCanDeleteItem(
            setConsume.setAirBookUp.dwID,
            setConsume.setAirBookUp.dwNumber) == false then
        return 1;
    end
	if objSystem:IsCanDeleteItem(
            setConsume.setAirBookDown.dwID,
            setConsume.setAirBookDown.dwNumber) == false then
        return 2;
    end

    return 0;
end

-- @brief 兑换
-- @param object objSystem 系统对象
-- @param number dwLevel 想要激活的隐藏属性等级
function BournHideAttrScript:Do(objSystem, dwLevel)
    local setConsume = self:GetConsume(dwLevel);
    objSystem:DeleteItem(setConsume.setAirBookUp.dwID,
        setConsume.setAirBookUp.dwNumber);
    objSystem:DeleteItem(setConsume.setAirBookDown.dwID,
        setConsume.setAirBookDown.dwNumber);

    objSystem:ModifyProperty(self:GetProperty(dwLevel));
end
