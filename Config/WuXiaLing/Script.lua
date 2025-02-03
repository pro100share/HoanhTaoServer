-- [[
	-- 武侠令系统脚本
	-- 时间：2013-12-9
-- ]]

_G.WuXiaLingScript = {};

-- @brief 获取消耗
-- @param number dwLevel 勋章等级
-- @return table 消耗表
-- { 银两; {威望等级, 威望值}; {令牌标识符, 令牌数量}; }
-- { 
--      dwYinLiang = 1;
--      setWeiWang = {dwLevel = 1; dwValue = 1}; 
--      setLingPai = {dwID = 1, dwNumber = 1}; 
-- }
function WuXiaLingScript:GetConsume(dwLevel)
    local setConfig = WuXiaLingConfig.Data[dwLevel][1];
    return {
        dwYinLiang = setConfig[1];
        setWeiWang = {
            dwLevel = setConfig[2][1];
            dwValue = setConfig[2][2];
        };
        setLingPai = {
            dwID = setConfig[3][1];
            dwNumber = setConfig[3][2];
        };
    };
end

-- @brief 获取属性
-- @param number dwLevel 勋章等级
-- @return table 属性表 (K - Config/SkillDefine.lua中SSingleAttrChange名字)
function WuXiaLingScript:GetProperty(dwLevel)
    local setConfig = WuXiaLingConfig.Data[dwLevel][2];
    return {
        dwAttack        = setConfig[1];
        dwDefense       = setConfig[2];
        dwFlee          = setConfig[3];
        dwCrit          = setConfig[4];
        dwHPMax         = setConfig[5];
        dwAppendCrit    = setConfig[6];
        dwMoveSpeed     = setConfig[7];
        dwAttackSpeed   = setConfig[8];
    };
end

-- @brief 能否兑换
-- @param object objSystem 系统对象
-- @param number dwLevel 想要兑换的勋章
-- @return number 错误码(0 - 可以 非0 - 不可)
function WuXiaLingScript:CanDo(objSystem, dwLevel)
    if (objSystem:GetLevel() + 1) ~= dwLevel then
        return 1;
    end

    local setConsume = self:GetConsume(dwLevel);
    if objSystem:GetYinLiang() < setConsume.dwYinLiang then
        return 2;
    end
    local setWeiWang = objSystem:GetWeiWang();
    if setWeiWang.dwLevel < setConsume.setWeiWang.dwLevel or
            setWeiWang.dwValue < setConsume.setWeiWang.dwValue then
        return 3;
    end
    if objSystem:IsCanDeleteItem(
            setConsume.setLingPai.dwID,
            setConsume.setLingPai.dwNumber) == false then
        return 4;
    end

    return 0;
end

-- @brief 兑换
-- @param object objSystem 系统对象
-- @param number dwLevel 想要兑换的勋章
function WuXiaLingScript:Do(objSystem, dwLevel)
    local setConsume = self:GetConsume(dwLevel);
    objSystem:ModifyYinLiang(-setConsume.dwYinLiang);
    objSystem:ModifyWeiWang(-setConsume.setWeiWang.dwValue);
    objSystem:DeleteItem(setConsume.setLingPai.dwID,
        setConsume.setLingPai.dwNumber);

    objSystem:ModifyProperty(self:GetProperty(dwLevel));
end
