--[[
说明：实战隐藏属性消息
作者：赵旭
时间: 2013-12-10
]] 

-- 消息对象
_G.BournHideAttrMessage = {
    -- 密钥
    dwSecretKey = 777;
};

-- 兑换
define.BournHideAttrExchangeMsg
{
    -- 用户对象
    user = NONE;
}
when{ user = NONE }
BournHideAttrExchangeMsg = checkUser;
when{}
function BournHideAttrExchangeMsg(user)
	user:GetSystem("CBournHideAttrSystem"):BournHideAttrExchange();
end

-- 兑换广播
define.BournHideAttrBroadcastMsg
{
    -- 密钥
    SecretKey = 0;
    -- 角色标识符
    RoleID = 0;
    -- 角色名称
    RoleName = "";
	-- 等级
    Level = 0;
}
when{}
function BournHideAttrBroadcastMsg(SecretKey, RoleID, RoleName, Level)
    if SecretKey ~= BournHideAttrMessage.dwSecretKey then
        return;
    end

	local setNet = {};
	for i, objPlayer in pairs(CPlayerManager.setAllPlayer) do
		table.insert(setNet, objPlayer.objNet);
	end
	_groupcallout(setNet,
        "CltBroadCastActiveSucMsg", { 
            RoleID = RoleID;
            RoleName = RoleName;
            ActiveLevel = Level;
        });	
end

-- 查看其他玩家角色勋章
define.BournHideAttrSeeOtherMsg
{
    -- 用户对象
    user = NONE;
    -- 角色标识符
    RoleID = 0;
}
when{ user = NONE }
BournHideAttrSeeOtherMsg = checkUser;
when{}
function BournHideAttrSeeOtherMsg(user, RoleID)
	user:GetSystem("CBournHideAttrSystem"):BournHideAttrSeeOtherMsg(RoleID);
end
