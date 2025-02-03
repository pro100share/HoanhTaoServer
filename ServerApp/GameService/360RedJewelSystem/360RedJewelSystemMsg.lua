--[[
说明：360红钻系统消息
作者：赵旭
]] 

-- 360红钻信息
define.Receive360RedJewelMsg
{
    -- 用户对象
    user = NONE;
	-- 帐号ID
	AccountID = 0;
    -- 等级
    Level = 0;
    -- 类型
    Type = "";
    -- 是否有效
    IsActive = 0;
    -- 成长值
    Growth = 0;
}
when{}
function Receive360RedJewelMsg(user, AccountID, Level, Type, IsActive, Growth)
	--[[
	local objPlayer = CPlayerManager:GetPlayer(AccountID);
	if objPlayer == nil then
		return;
	end
	objPlayer:GetSystem("C360RedJewelSystem"):Receive360RedJewel({
        dwLevel = Level;
        strType = Type;
        dwIsActive = IsActive;
        dwGrowth = Growth;
    });
	--]]
end

-- 360红钻奖励领取
define.Get360RedJewelRewardMsg
{
    -- 用户对象
    user = NONE;
    -- 奖励项目索引
    ItemIndex = 0;
}
when{ user = NONE }
Get360RedJewelRewardMsg = checkUser;
when{}
function Get360RedJewelRewardMsg(user, ItemIndex)
    --user:GetSystem("C360RedJewelSystem"):Get360RedJewelReward(ItemIndex);
end
