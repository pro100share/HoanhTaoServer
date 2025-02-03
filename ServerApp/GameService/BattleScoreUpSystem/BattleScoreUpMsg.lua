--[[
	[\brief：战斗力提升     
	[\author：沈祺
	[\date：2014-04-22
	[在原战斗力评分基础之上，拆分战斗力
	[按系统划分战斗力评分
	[上线同步客户端
	[有属性的提升由客户端主动请求战斗力
	]]

-- 战斗力提升,客户端请求战斗力数据
define.BSU_LookBattleScoreUpMsg
{
	--本玩家的player
	user = NONE;
	--0为自己，不为0是其他玩家ID
	RoleId = 0;
}
when{ user = NONE }
BSU_LookBattleScoreUpMsg = checkUser
when{}
function BSU_LookBattleScoreUpMsg(user, RoleId)
	user:GetSystem("CBattleScoreUpSystem"):ViewOtherPlayer(RoleId);
end
