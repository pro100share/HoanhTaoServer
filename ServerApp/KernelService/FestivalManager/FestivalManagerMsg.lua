--[[
	ks 活动管理（开启 结束）
	周长沙
	2013-5-20
--]]
---------------------------------------------
------------------------------------------GS
--GS->所有节日活动消息
define.GSAskForFestivalInfoMsg
{
}
when{}
function GSAskForFestivalInfoMsg()
	local objLine = CGameLineManager:GetGameLineBySvrNet(_from);
	CFestivalManager:RecvGetAllInfo(objLine)
end




















