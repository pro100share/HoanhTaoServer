--[[
说明：实战隐藏属性系统
作者：赵旭
时间: 2013-12-10
]] 

-- 系统对象
_G.CBournHideAttrSystem = {};
-- 等级
CBournHideAttrSystem.dwLevel = 0;
-- 数据库对象
CBournHideAttrSystem.objDB = nil;

-- @brief 构造函数
-- @return object 系统
function CBournHideAttrSystem:new()
	local obj = CSystem:new("CBournHideAttrSystem");
	for index, value in pairs(CBournHideAttrSystem) do
		if type(value) == "function" then
			obj[index] = value;
		end
	end
	return obj;
end

-- @brief 创建函数
-- @param boolean bIsChangeLine 是否换线
-- @return boolean 是否创建成功
function CBournHideAttrSystem:Create(bIsChangeLine)
	local objPlayer = self:GetPlayer();
	if objPlayer == nil then
		return false;
	end;
	local objDB = objPlayer:GetDBQuery();
	if objDB == nil then
		return false;
	end;
	self.objDB = CBournHideAttrDB:new(objDB);

    local setData = objPlayer:GetLineData("CBournHideAttrSystem")[1];
    self.dwLevel = setData.Level;
	
    if self.dwLevel ~= 0 then
        self:ModifyProperty(
            BournHideAttrScript:GetProperty(self.dwLevel));
    end
	
    return true;
end

-- @brief 进入场景函数
function CBournHideAttrSystem:OnEnterScene()
    self:GetPlayer().SynActiveHideAttrInfoMsg {
        ActiveLevel = self.dwLevel;
    };
    self:ShowPlayerIcon();
end

-- @brief 换线函数
-- @param number dwNewLineID 新线路ID
function CBournHideAttrSystem:OnChangeLineBegin(dwNewLineID)
    local objPlayer = self:GetPlayer()
    self:GetPlayer():SetLineData("CBournHideAttrSystem", {
        Level = self.dwLevel;
    });
end

-- @brief 兑换
function CBournHideAttrSystem:BournHideAttrExchange()
    local dwErrorCode = BournHideAttrScript:CanDo(self, self.dwLevel + 1);
    if dwErrorCode ~= 0 then
        return;
    end

    BournHideAttrScript:Do(self, self.dwLevel + 1);
    self.dwLevel = self.dwLevel + 1;
    self.objDB:Update(self:GetPlayer():GetRoleID(), self.dwLevel);

    self:GetPlayer().ActiveHideAttrSucMsg {
        ResultType = dwErrorCode;
        ActiveLevel = self.dwLevel;
    };
    CGameApp.BournHideAttrBroadcastMsg {
        SecretKey = BournHideAttrMessage.dwSecretKey;
        RoleID = self:GetPlayer():GetRoleID();
        RoleName = self:GetPlayer():GetInfo().szRoleName;
        Level = self.dwLevel;
    };
    self:ShowPlayerIcon();
end

-- @brief 查看其他玩家角色勋章
function CBournHideAttrSystem:BournHideAttrSeeOtherMsg(dwRoleID)
    local objOtherPlayer = self:GetPlayer():
        GetSystem("CMapSystem"):GetRoleByID(dwRoleID);
    if objOtherPlayer ~= nil then
        self:GetPlayer().HideAttrViewOtherResultMsg {
            ActiveLevel = objOtherPlayer:GetSystem("CBournHideAttrSystem").dwLevel;
        };
    end
end

-- @brief 显示玩家头像旁边图标
function CBournHideAttrSystem:ShowPlayerIcon()
    if self.dwLevel == 0 then
        return;
    end
	local objCGestSystem =self:GetPlayer():GetSystem("CGestSystem");
	if objCGestSystem:GetGestMode() ~= 0 then return end
	
    local objPlayerShowTextSystem =
        self:GetPlayer():GetSystem("PlayerShowTextSystem");
    objPlayerShowTextSystem:DelSp(self:GetPlayer():
        GetSystem("CBournSystem").dwBournLv + 1);
    local setOldTitleInfo = BournHideAttrScript:GetShowInfo(
        self.dwLevel - 1);
    if setOldTitleInfo.bResult then
        objPlayerShowTextSystem:DelSp(setOldTitleInfo.dwType);
    end

    local setTitleInfo = BournHideAttrScript:GetShowInfo(self.dwLevel);
    if setTitleInfo.bResult then
        objPlayerShowTextSystem:SetSp(setTitleInfo.dwType);
    end
end
