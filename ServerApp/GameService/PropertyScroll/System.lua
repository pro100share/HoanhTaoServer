--[[
说明：附加属性翻倍符系统
作者：赵旭
时间: 2013-10-14
]] 

-- 系统对象
_G.CPropertyScrollSystem = {};

-- @brief 构造函数
-- @return object 系统
function CPropertyScrollSystem:new()
	local obj = CSystem:new("CPropertyScrollSystem");
	for index, value in pairs(CPropertyScrollSystem) do
		if type(value) == "function" then
			obj[index] = value;
		end
	end
	return obj;
end

-- @brief 附加翻倍符 
-- @param table setParam 参数表
--      { 待操作装备标识符; 消耗道具标识符; }
--      { dwEquipID; dwItemID; }
function CPropertyScrollSystem:PropertyScrollDispose(setParam)
    local setResult = { 
        dwErrorCode = 0; bIsLuck = false; bIsBroadCast = false;
    };
    setResult.dwErrorCode = PropertyScrollScript:CanDo(self, setParam);

    if setResult.dwErrorCode == 0 then
        local setDoResult = PropertyScrollScript:Do(self, setParam);
        setResult.bIsLuck = setDoResult.bIsLuck;
        setResult.bIsBroadCast = setDoResult.bIsBroadCast;
    end

    if setResult.dwErrorCode >= 0 then
        self:GetPlayer().PropertyScrollDisposeMsg {
            ErrorCode = setResult.dwErrorCode;
            IsLuck = setResult.bIsLuck;
            EquipID = setParam.dwEquipID;
        };
        if setResult.bIsBroadCast == true then
            CGameApp.PropertyScrollBroadCastMsg {
                SecretKey = PropertyScrollMessage.dwSecretKey;
                RoleID = self:GetPlayer():GetRoleID();
                RoleName = self:GetPlayer():GetInfo().szRoleName;
                IsLuck = setResult.bIsLuck;
				ItemNetData = self:GetItem(setParam.dwEquipID):GetNetData();
            };
        end
    end
end
