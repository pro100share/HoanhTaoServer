--[[
	功能：在线奖励 系统（服务器）
	作者：周长沙
	时间：2013-4-7
--]]



define.OnGSAskForServerTimeInfoMsg
{
	LineID = 0
}
when{}
function OnGSAskForServerTimeInfoMsg(LineID)
	CTimeRewardManager:SendServerTimeInfo(LineID)
end;







