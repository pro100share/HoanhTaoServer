--[[
	gs 活动管理（开启 结束） 消息
	周长沙
	2013-5-23
--]]
------------------------------------------------------------
----------------------------------------------------------KS
--KS->所有节日活动消息
define.KSAllFestivalInfoMsg
{
	Info = {}
}
when{}
function KSAllFestivalInfoMsg(Info)
	CFestivalManager:OnRecvAllFestival(Info)
end
--KS->节日开始
define.KSFestivalStartMsg
{
	Info = {}
}
when{}
function KSFestivalStartMsg(Info)
	CFestivalManager:OnRecvFestivalStart(Info)
end
--KS->节日结束
define.KSFestivalEndMsg
{
	Info = {}
}
when{}
function KSFestivalEndMsg(Info)
	CFestivalManager:OnRecvFestivalEnd(Info)
end
--KS->活动开始
define.KSFestivalLineStartMsg
{
	Info = {}
}
when{}
function KSFestivalLineStartMsg(Info)
	CFestivalManager:OnRecvFestivalLineStart(Info)
end
--KS->活动结束
define.KSFestivalLineEndMsg
{
	Info = {}
}
when{}
function KSFestivalLineEndMsg(Info)
	CFestivalManager:OnRecvFestivalLineEnd(Info)
end
--KS->活动奖励
define.KSFestivalLineRewardMsg
{
	Info = {}
}
when{}
function KSFestivalLineRewardMsg(Info)
	CFestivalManager:OnRecvFestivalLineReward(Info)
end

--KS->商业化修改
define.KSFestivalModiMsg
{
}
when{}
function KSFestivalModiMsg()
	CFestivalManager:FestivalModi()
end
--------------------------------------------------------------
-----------------------------------------------------------Clt
--Clt->请求某个节日信息
define.CltAskForFestivalMsg
{
	user = NONE;
	Festival = 0;
}
when{ user = NONE }
CltAskForFestivalMsg = checkUser
when{}
function CltAskForFestivalMsg(user,Festival)
end
--Clt->请求某个活动信息
define.CltAskForFestivalLineMsg
{
	user = NONE;
	Festival = 0;
	Line = 0;
}
when{ user = NONE }
CltAskForFestivalLineMsg = checkUser
when{}
function CltAskForFestivalLineMsg(user,Festival,Line)
end

--Clt->请求领奖
define.CltAskForFestivalLineRewardMsg
{
	user = NONE;
	Info = {};
	Time = 1;
}
when{ user = NONE }
CltAskForFestivalLineRewardMsg = checkUser
when{}
function CltAskForFestivalLineRewardMsg(user,Info,Time)
	local sysF = user:GetSystem("CFestivalSystem")
	if not sysF then return end;
	sysF:RecvGetReward(Info.dwFestival,Info.dwLine,Info.dwIndex,Info.dwChoose,Time)
end










































