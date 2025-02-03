--[[
	在线奖励 系统 GS
	周长沙
--]]
--------------------------------------------------------------
-----  KS -->
--收到KS的服务器信息消息
define.TimeRewardServerTimeMsg
{
	Info = {}
}
when{}
function TimeRewardServerTimeMsg(Info)
	CTimeRewardManager:OnRecvServerInfo(Info)
end;
--------------------------------------------------------------
------ Clt -->
--领取工资
define.CLtAskForTimeRewardGetWageMsg
{
	user = NONE;
}
when{ user = NONE }
CLtAskForTimeRewardGetWageMsg = checkUser
when{}
function CLtAskForTimeRewardGetWageMsg(user)
	local sys = user:GetSystem("CTimeRewardSystem")
	if not sys then return end;
	sys:OnRecvGetWage()
end

--领取签到奖励
define.CLtAskForTimeRewardGetSigninMsg
{
	user = NONE;
	Index = 0;
}
when{ user = NONE }
CLtAskForTimeRewardGetSigninMsg = checkUser
when{}
function CLtAskForTimeRewardGetSigninMsg(user,Index)
	local sys = user:GetSystem("CTimeRewardSystem")
	if not sys then return end;
	sys:OnRecvGetSignin(Index)
end

--签到
define.CLtAskForTimeRewardSigninMsg
{
	user = NONE;
	day = 0;
}
when{ user = NONE }
CLtAskForTimeRewardSigninMsg = checkUser
when{}
function CLtAskForTimeRewardSigninMsg(user,day)
	local sys = user:GetSystem("CTimeRewardSystem")
	if not sys then return end;
	sys:OnRecvSignin(day)
end

--全部补签
define.CLtAskForAllTimeRewardSigninMsg
{
	user = NONE;
}
when{ user = NONE }
CLtAskForAllTimeRewardSigninMsg = checkUser
when{}
function CLtAskForAllTimeRewardSigninMsg(user)
	local sys = user:GetSystem("CTimeRewardSystem")
	if not sys then return end;
	sys:OnRecvAllSignin()
end

--领取登陆奖励
define.CLtAskForTimeRewardGetLoginMsg
{
	user = NONE;
	Index = 0;
}
when{ user = NONE }
CLtAskForTimeRewardGetLoginMsg = checkUser
when{}
function CLtAskForTimeRewardGetLoginMsg(user,Index)
	local sys = user:GetSystem("CTimeRewardSystem")
	if not sys then return end;
	sys:OnRecvGetLogin(Index)
end












