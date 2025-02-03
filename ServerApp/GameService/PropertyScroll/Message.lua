--[[
说明：附加属性翻倍符消息
作者：赵旭
时间: 2013-10-14
]] 

-- 消息对象
_G.PropertyScrollMessage = {
    -- 密钥
    dwSecretKey = 777;
};

-- 附加翻倍符
define.PropertyScrollDisposeMsg
{
    -- 用户对象
    user = NONE;
	-- 待操作装备标识符
	EquipID = 0;
    -- 消耗道具标识符
    ItemID = 0;
}
when{ user = NONE }
PropertyScrollDisposeMsg = checkUser;
when{}
function PropertyScrollDisposeMsg(user, EquipID, ItemID)
	user:GetSystem("CPropertyScrollSystem"):PropertyScrollDispose({
        dwEquipID = EquipID;
        dwItemID = ItemID;
    });
end

-- 附加翻倍符广播
define.PropertyScrollBroadCastMsg
{
    -- 密钥
    SecretKey = 0;
    -- 角色标识符
    RoleID = 0;
    -- 角色名称
    RoleName = "";
    -- 是否幸运
    IsLuck = false;
	-- 目标装备标识符
    ItemNetData = {};
}
when{}
function PropertyScrollBroadCastMsg(SecretKey,
        RoleID,
        RoleName,
        IsLuck,
		ItemNetData)
    if SecretKey ~= PropertyScrollMessage.dwSecretKey then
        return;
    end

	local setNet = {};
	for i, objPlayer in pairs(CPlayerManager.setAllPlayer) do
		table.insert(setNet, objPlayer.objNet);
	end
	_groupcallout(setNet,
        "PropertyScrollBroadCastMsg", { 
            RoleID = RoleID;
            RoleName = RoleName;
            IsLuck = IsLuck;
			ItemNetData = ItemNetData;
        });	
end
