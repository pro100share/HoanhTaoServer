--[[
说明：武侠令消息
作者：赵旭
时间: 2013-12-10
]] 

-- 消息对象
_G.WuXiaLingMessage = {
    -- 密钥
    dwSecretKey = 777;
};

-- 兑换勋章
define.WuXiaLingInsigniaExchangeMsg
{
    -- 用户对象
    user = NONE;
}
when{ user = NONE }
WuXiaLingInsigniaExchangeMsg = checkUser;
when{}
function WuXiaLingInsigniaExchangeMsg(user)
	user:GetSystem("CWuXiaLingSystem"):WuXiaLingInsigniaExchange();
end

-- 武侠令兑换勋章成功广播
define.WuXiaLingBroadcastMsg
{
    -- 密钥
    SecretKey = 0;
    -- 角色标识符
    RoleID = 0;
    -- 角色名称
    RoleName = "";
	-- 勋章
    GetLevel = 0;
}
when{}
function WuXiaLingBroadcastMsg(SecretKey, RoleID, RoleName, GetLevel)
    if SecretKey ~= WuXiaLingMessage.dwSecretKey then
        return;
    end

	local setNet = {};
	for i, objPlayer in pairs(CPlayerManager.setAllPlayer) do
		table.insert(setNet, objPlayer.objNet);
	end
	_groupcallout(setNet,
        "CltBroadCastExChangeSucMsg", { 
            RoleID = RoleID;
            RoleName = RoleName;
            GetLevel = GetLevel;
        });	
end

-- 查看其他玩家角色勋章
define.WuXiaLingSeeOtherInsigniaMsg
{
    -- 用户对象
    user = NONE;
    -- 角色标识符
    RoleID = 0;
}
when{ user = NONE }
WuXiaLingSeeOtherInsigniaMsg = checkUser;
when{}
function WuXiaLingSeeOtherInsigniaMsg(user, RoleID)
	user:GetSystem("CWuXiaLingSystem"):WuXiaLingSeeOtherInsignia(RoleID);
end
