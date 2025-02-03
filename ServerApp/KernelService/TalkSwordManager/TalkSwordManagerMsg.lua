--[[
    [ \brief 离线战斗
    [ \author 沈祺
    [ \date 2014-07-3
    [ 玩家可以与离线角色进行战斗
    [ 战斗已战斗力高低分胜负
    [ 内含类似排行榜功能
    [ \消息文件
    ]]

_define()

--[[
	协议功能: 申请战斗
	消息名称：RequestBattleMsg
	参数：
	1.PlayerInfo 		组织的玩家信息
	]]
define.RequestBattleMsg
{
	PlayerInfo = {}
}
when{}
function RequestBattleMsg(PlayerInfo)
	CTalkSwordManager:Battle(PlayerInfo);
end

--[[
	协议功能: GS玩家上线申请玩家信息
	消息名称：RequestPlayerInfoMsg
	参数：
	1.RoleID			角色ID
	]]
define.RequestPlayerInfoMsg
{
	RoleID = 0,
}
when{}
function RequestPlayerInfoMsg(RoleID)
	CPlayerManager:GetPlayerByRoleID(RoleID).ReceivePlayerInfoMsg{
                    PlayerInfo = CTalkSwordManager:UpdatePlayerInfo(RoleID);};
end
