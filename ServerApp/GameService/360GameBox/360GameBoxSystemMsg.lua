--[[

--]]
--------------------------------------------------------------

--------------------------------------------------------------
------ Clt -->

define.AskFor360GameBoxRewardMsg
{
	user = NONE;
}
when{ user = NONE }
AskFor360GameBoxRewardMsg = checkUser
when{}
function AskFor360GameBoxRewardMsg(user)
	local sys = user:GetSystem("C360GameBoxSystem")
	if not sys then return end;
	sys:OnRecvAskForReward()
end

define.AskFor360GameBoxResMsg
{
	user = NONE;
}
when{ user = NONE }
AskFor360GameBoxResMsg = checkUser
when{}
function AskFor360GameBoxResMsg(user)
	local sys = user:GetSystem("C360GameBoxSystem")
	if not sys then return end;
	sys:OnRecvAskForRes()
end
