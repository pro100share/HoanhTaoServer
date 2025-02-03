--[[
说明：武侠令系统
作者：赵旭
时间: 2013-12-10
]] 

-- 系统对象
_G.CWuXiaLingSystem = {};
-- 勋章
CWuXiaLingSystem.dwInsignia = 0;
-- 数据库对象
CWuXiaLingSystem.objDB = nil;

-- @brief 构造函数
-- @return object 系统
function CWuXiaLingSystem:new()
	local obj = CSystem:new("CWuXiaLingSystem");
	for index, value in pairs(CWuXiaLingSystem) do
		if type(value) == "function" then
			obj[index] = value;
		end
	end
	return obj;
end

-- @brief 创建函数
-- @param boolean bIsChangeLine 是否换线
-- @return boolean 是否创建成功
function CWuXiaLingSystem:Create(bIsChangeLine)
	local objPlayer = self:GetPlayer();
	if objPlayer == nil then
		return false;
	end;
	local objDB = objPlayer:GetDBQuery();
	if objDB == nil then
		return false;
	end;
	self.objDB = CWuXiaLingDB:new(objDB);

    local setData = objPlayer:GetLineData("CWuXiaLingSystem")[1];
    self.dwInsignia = setData.Insignia;
	
    if self.dwInsignia ~= 0 then
        self:ModifyProperty(
            WuXiaLingScript:GetProperty(self.dwInsignia));
    end
	
    return true;
end

-- @brief 进入场景函数
function CWuXiaLingSystem:OnEnterScene()
    self:GetPlayer().SynGetEmpriseOrderInfoMsg {
        GetLevel = self.dwInsignia;
    };
end

-- @brief 换线函数
-- @param number dwNewLineID 新线路ID
function CWuXiaLingSystem:OnChangeLineBegin(dwNewLineID)
    local objPlayer = self:GetPlayer()
    self:GetPlayer():SetLineData("CWuXiaLingSystem", {
        Insignia = self.dwInsignia;
    });
end

-- @brief 兑换勋章
function CWuXiaLingSystem:WuXiaLingInsigniaExchange()
    local dwErrorCode = WuXiaLingScript:CanDo(self, self.dwInsignia + 1);
    if dwErrorCode ~= 0 then
        return;
    end

    WuXiaLingScript:Do(self, self.dwInsignia + 1);
    self.dwInsignia = self.dwInsignia + 1;
    self.objDB:Update(self:GetPlayer():GetRoleID(), self.dwInsignia);

    self:GetPlayer().ExchangeOrderSucMsg {
        ResultType = dwErrorCode;
        GetLevel = self.dwInsignia;
    };
    CGameApp.WuXiaLingBroadcastMsg {
        SecretKey = WuXiaLingMessage.dwSecretKey;
        RoleID = self:GetPlayer():GetRoleID();
        RoleName = self:GetPlayer():GetInfo().szRoleName;
        GetLevel = self.dwInsignia;
    };
end

-- @brief 查看其他玩家角色勋章
function CWuXiaLingSystem:WuXiaLingSeeOtherInsignia(dwRoleID)
    local setInfo = {
        dwSourceRoleID = self:GetPlayer():GetRoleID();
        dwDestinationRoleID = dwRoleID;
    };
    GSRemoteCall(dwRoleID,
                "CWuXiaLingSystem",
                "RemoteGetInfo",
                { setInfo } ,
                nil);
end

-- @brief 远程获取玩家信息
-- @param table setInfo
-- {
--      dwSourceRoleID = 源角色ID;
--      dwDestinationRoleID = 目标角色ID;
--      dwInsignia = 结果数据;
-- };
function CWuXiaLingSystem:RemoteGetInfo(setInfo)
    if setInfo.dwInsignia == nil then
        setInfo.dwInsignia = self.dwInsignia;
    end
    if self:GetPlayer():GetRoleID() == setInfo.dwSourceRoleID then
        self:GetPlayer().EmpriseOrderViewOtherResultMsg {
            GetLevel = setInfo.dwInsignia;
        };
    else
        GSRemoteCall(setInfo.dwSourceRoleID,
            "CWuXiaLingSystem",
            "RemoteGetInfo",
            { setInfo },
            nil);
    end
end
