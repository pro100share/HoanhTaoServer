-- 附加属性翻倍符脚本
-- 脚本对象
_G.PropertyScrollScript = {};

-- @brief 是否使用过该系统
-- @param table setValue 属性值
-- @return boolean 是否
function PropertyScrollScript:IsUsed(setValue)
	local dwFlag = 0;
    for k, v in pairs(setValue) do
        if v.dwValue > v.dwMaxValue then
            dwFlag = dwFlag + 1;
        end
    end
	return (dwFlag > 0 and dwFlag == #setValue);
end

-- @brief 获取当前阶段
-- @param table setValue =	{
-- 			[1] = {dwPropertyType,
-- 				dwValue,
--				dwMaxValue};		--dwPropertyType类型，dwValue数值，dwMaxValue上限值
--					 }
-- @return table {[1] = 0,      --dwStage 当前等级
--                         [2] =0,     --dwExtent 等级进度
--			};

function PropertyScrollScript:GetStage(setValue)
	local flag = 0
	local dwMax = _G.AddAppendPropValueConfig.MaxAppendPropValue;
	for k,v in pairs(setValue)do
		if v.dwValue >= dwMax then
			flag = flag +1
		end
	end
	if flag ~= #setValue or #setValue == 0 then return {0,0} end
	local cfg = PropertyScrollConfig.levelqj
	local dwlevel = math.floor(setValue[1].dwValue/dwMax*100)
	local dwStage = #cfg
	local dwExtent = 100
	for k,v in pairs(cfg) do
		if dwlevel >= v[1] and dwlevel < v[2] then
			dwStage = k
			dwExtent= math.floor((dwlevel-v[1]) / (v[2]-v[1])*100)
		end
	end
	return {
		dwStage;
		dwExtent;
	};
end

-- @brief 获取消耗材料
-- @param table setValue =	{
-- 			[1] = {dwPropertyType,dwValue,dwMaxValue};		--dwPropertyType类型，dwValue数值，dwMaxValue上限值
--					 }
-- @return table Item 消耗材料
--   Item=   { 索引 = { 物品标识; 物品数量; } }
--    Item=  { [1] = { [ItemID]=ItemNum; } }
-- @notice 全部可能的消耗材料
function PropertyScrollScript:GetConsume(setValue, dwItemID)
	local Item = {};
	local progress = PropertyScrollScript:GetStage(setValue)
	local Consume = PropertyScrollConfig.Consume
	for i = progress[1],#(Consume) do
		if dwItemID then
			for ks,vs in pairs(Consume[i]) do
				if ks == dwItemID then
					table.insert(Item,Consume[i]);
				end
			end
		else
			table.insert(Item,Consume[i]);
		end
	end;
	
    return Item;
end

-- @brief 是否能进行操作
-- @param object objSystem 系统对象
-- @param table setParam 参数表
--      {
--          装备标识符; 消耗道具标识符;
--          dwEquipID; dwItemID;
--      }
-- @return number 错误码 0正常 大于0需提示异常 小于0不需提示异常
function PropertyScrollScript:CanDo(objSystem, setParam)
    if not setParam.dwEquipID or not setParam.dwItemID then
        return -1;
    end
    if objSystem:IsHasAuthority() == false then
       return PropertyScrollConfig.Error.NotHasAuthority;
    end
    local objEquip = objSystem:GetItem(setParam.dwEquipID);
    if objEquip == nil then
        return PropertyScrollConfig.Error.NotHaveEquip;
    end
    local setProperty = objSystem:GetEquipProperty(objEquip);
    if objSystem:IsPropertyMaxValue(setProperty) == false then
        return PropertyScrollConfig.Error.NotMax;
    end
	if PropertyScrollScript:IsPropertyFullValue(setProperty) == true then
        return PropertyScrollConfig.Error.Full;
    end
    if objSystem:IsCanDeleteItem(
            self:GetConsume(setProperty, setParam.dwItemID)) == false then
        return PropertyScrollConfig.Error.NotEnoughConsume;
    end
    return 0;
end

-- @brief 是否满值状态
-- @param table setProperty 属性表
-- @return boolean 是否
function PropertyScrollScript:IsPropertyFullValue(setProperty)

	local pro = PropertyScrollScript:GetStage(setProperty)
	if pro[1] == #PropertyScrollConfig.levelqj and pro[2] == 100 then
		return true;
	end
    return false;
end

-- @brief 进行操作
-- @param object objSystem 系统对象
-- @param table setParam 参数表
--      {
--          装备标识符; 消耗道具标识符;
--          dwEquipID; dwItemID;
--      }
-- @return table 结果集
--      {
--          是否幸运; 是否广播;
--          bIsLuck; bIsBroadCast;
--      }
function PropertyScrollScript:Do(objSystem, setParam)
    local setResult = { bIsLuck = false; bIsBroadCast = false };

    local objEquip = objSystem:GetItem(setParam.dwEquipID);
    local setProperty = objSystem:GetEquipProperty(objEquip);
    local setOldStage = PropertyScrollScript:GetStage(setProperty);

    objSystem:DeleteItem(PropertyScrollScript:GetConsume(
            setProperty,
            setParam.dwItemID));

    local setRise = PropertyScrollScript:CalculateRise(setOldStage);
    for k, v in pairs(setProperty) do
        v.dwValue = v.dwValue + setRise.dwValue;
    end
    objSystem:SetEquipProperty(objEquip, setProperty);
    setResult.bIsLuck = setRise.bIsLuck;

    local setNewStage = PropertyScrollScript:GetStage(
        objSystem:GetEquipProperty(objEquip));
    setResult.bIsBroadCast = PropertyScrollScript:IsBroadCast(
        setResult.bIsLuck,
        setOldStage,
        setNewStage);

    return setResult;
end

-- @brief 计算加成
-- @param table setStage 当前阶段
--     
--          阶段; 进度;
--        setStage={[1] = 0,      -- 当前等级
--                         [2] =0,     -- 等级进度 
--      }
-- @return table 结果
--      { 加成值; 是否幸运; }
--      { dwValue; bIsLuck; }
local shuzhi = {
	[1] = {150,250};
	[2] = {150,250};
	[3] = {150,250};
	[4] = {150,250};
	[5] = {150,250};
	[6] = {150,250};
};
local xyshuzhi = {
	[1] = {300,500};
	[2] = {300,500};
	[3] = {300,500};
	[4] = {300,500};
	[5] = {300,500};
	[6] = {300,500};
};
function PropertyScrollScript:CalculateRise(setStage)
    local dwValue = 0;
	local bIsLuck = false;

	local xy = math.random(100);
	local jcrnd = 0;
	if xy <= 5 then
		jcrnd = math.random(xyshuzhi[setStage[1]][1],xyshuzhi[setStage[1]][2]);
		bIsLuck = true
	else
		jcrnd = math.random(shuzhi[setStage[1]][1],shuzhi[setStage[1]][2]);
	end

    dwValue = jcrnd;
    local setConfig = PropertyScrollConfig.levelqj;
    local dwMaxValue = (setConfig[#setConfig][2] - setStage[1]*100 - setStage[2])*10;
    if dwValue > dwMaxValue then
        dwValue = dwMaxValue;
    end
	dwValue = dwValue * 1000;

    return { dwValue = dwValue; bIsLuck = bIsLuck};
end

-- @brief 是否广播
-- @param boolean bIsLuck 是否幸运
-- @param table setOldStage 操作前阶段
-- @param table setNewStage 操作后阶段
-- @return boolean 是否
function PropertyScrollScript:IsBroadCast(bIsLuck, setOldStage, setNewStage)
    -- if bIsLuck then
    --     return true;
    -- end
    if setOldStage[1] < setNewStage[1] then
        return true;
    end
end
