--C TO S

--[[
	协议功能：暗器系统，开启或关闭暗器功能
	消息名称：HW_OpenOrCloseSystem
	参数：
	1.player
	2.isOpen		--开启或关闭系统
	]]
define.HW_OpenOrCloseSystemMsg
{
	user = NONE;			--本玩家的player
}
when{ user = NONE }
HW_OpenOrCloseSystemMsg = checkUser
when{}
function HW_OpenOrCloseSystemMsg(user)
	local objSystem = user:GetSystem("CHiddenWeaponSystem");
	objSystem:ChangeOpenFlg();
end

--[[
	协议功能：暗器系统，使用消耗品提升暗器修炼值
	消息名称：HW_UseItemUpLevel
	参数：
	1.player
	2.itemId		--消耗品ID,防止有多种消耗品所以发个ID便于扩展
	3.itemNum		--使用数量
	]]
define.HW_UseItemUpLevelMsg
{
	user = NONE;			--本玩家的player
	itemId = 0;			--消耗品ID,防止有多种消耗品所以发个ID便于扩展
	itemNum	=0;			--使用数量
}
when{ user = NONE }
HW_UseItemUpLevelMsg = checkUser
when{}
function HW_UseItemUpLevelMsg(user, itemId, itemNum)
	local objSystem = user:GetSystem("CHiddenWeaponSystem");
	objSystem:UseItemUpLevel(itemId, itemNum);
end


--[[
	协议功能：暗器系统，升阶请求
	消息名称：HW_UpClass
	参数：
	1.player
	2.isAutoBuyItem = false;		--是否自动购买物品
	3.isUseGold = false;			--是否使用元宝
	4.isFirstUseBind = false;		--优先使用的物品，绑定or非绑定
	]]
define.HW_UpClassMsg
{
	user = NONE;				--本玩家的player
	isAutoBuyItem = false;		--是否自动购买物品
	isUseGold = false;			--是否使用元宝
	isUseBindItem = false;		--优先使用的物品，绑定or非绑定
}
when{ user = NONE }
HW_UpClassMsg = checkUser
when{}
function HW_UpClassMsg(user, isAutoBuyItem, isUseGold, isUseBindItem)
	local objSystem = user:GetSystem("CHiddenWeaponSystem");
	objSystem:UpClass(isAutoBuyItem, isUseGold, isUseBindItem);
end

--[[
	协议功能：暗器系统，公告
	消息名称：HW_AllNoticeMsg
	参数：
	1.playerId			--被查看的玩家ID
	2.playerName		--玩家名称
	3.level				--暗器等级
	]]
define.HW_AllNoticeMsg
{
	playerId = 0;			--被查看的玩家ID
	playerName = "";		--玩家名称
	level = 0;				--暗器等级
}
when{}
function HW_AllNoticeMsg(playerId, playerName, level)
    local setNet = {};
	for i, objPlayer in pairs(CPlayerManager.setAllPlayer) do
		if objPlayer:GetInfo().dwLevel >= 20 then
            table.insert(setNet, objPlayer.objNet);
		end;
	end;
    _groupcallout(setNet, "HW_AllNoticeMsg", {
                playerId	= playerId,
                playerName  = playerName,
                level     	= level,
			});
end

--[[
	协议功能：暗器系统，查看其他玩家暗器系统
	消息名称：HW_LookOtherSystem
	参数：
	1.player
	2.playerId		--被查看的玩家ID
	]]
define.HW_LookOtherSystemMsg
{
	user = NONE;			--本玩家的player
	playerId = 0;			--被查看的玩家ID
}
when{ user = NONE }
HW_LookOtherSystemMsg = checkUser
when{}
function HW_LookOtherSystemMsg(user, playerId)
	local objSystem = user:GetSystem("CHiddenWeaponSystem");
	objSystem:ViewOtherPlayer(playerId);
end
