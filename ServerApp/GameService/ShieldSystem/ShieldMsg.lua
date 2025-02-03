--[[
	[ \brief：护身镜系统
	[ \author：沈祺
	[ \date：2014-06-16
	[ 护身镜系统为暗器系统姊妹篇
	[ 主要是抵抗暗器技能BUFF等
	]]

--[[
	协议功能：护身镜系统,使用物品升级
	消息名称：ShieldUseItemUpLevelMsg
	参数：
	1.user
	2.nType = 0;				--1为使用物品，2为使用元宝
	3.nItemID = 0;				--使用物品ID
	4.nItemNum = 0;				--物品数量
	]]
define.ShieldUseItemUpLevelMsg
{
	user = NONE;
	nType = 0;			
	nItemID = 0;	
	nItemNum = 0;
}
when{ user = NONE }
ShieldUseItemUpLevelMsg = checkUser
when{}
function ShieldUseItemUpLevelMsg(user, nType, nItemID, nItemNum)
	user:GetSystem("CShieldSystem"):UseItemUpLevel(nType, nItemID, nItemNum);
end

--[[
	协议功能：护身镜系统，公告
	消息名称：AM_AllNoticeMsg
	参数：
	1.playerId			--被查看的玩家ID
	2.playerName		--玩家名称
	3.exp				--经验
	]]
define.ShieldAllNoticeMsg
{
	playerId = 0;
	playerName = "";
	nExp = 0;
}
when{}
function ShieldAllNoticeMsg(playerId, playerName, nExp)
    local setNet = {};
	for i, objPlayer in pairs(CPlayerManager.setAllPlayer) do
		if objPlayer:GetInfo().dwLevel >= 20 then
            table.insert(setNet, objPlayer.objNet);
		end
	end
    _groupcallout(setNet, "ShieldAllNoticeMsg", {
                playerId	= playerId,
                playerName  = playerName,
                nExp     	= nExp,
			});
end

--[[
	协议功能：护身镜系统，查看其他玩家护身镜系统
	消息名称：ShieldLookOtherSystemMsg
	参数：
	1.user 			玩家实例
	2.playerId		--被查看的玩家ID
	]]
define.ShieldLookOtherSystemMsg
{
	user = NONE;
	playerId = 0;
}
when{ user = NONE }
ShieldLookOtherSystemMsg = checkUser
when{}
function ShieldLookOtherSystemMsg(user, playerId)
	user:GetSystem("CShieldSystem"):ViewOtherPlayer(playerId);
end
