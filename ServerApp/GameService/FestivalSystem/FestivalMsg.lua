--[[
	gs ��������� ������ ��Ϣ
	�ܳ�ɳ
	2013-5-23
--]]
------------------------------------------------------------
----------------------------------------------------------KS
--KS->���н��ջ��Ϣ
define.KSAllFestivalInfoMsg
{
	Info = {}
}
when{}
function KSAllFestivalInfoMsg(Info)
	CFestivalManager:OnRecvAllFestival(Info)
end
--KS->���տ�ʼ
define.KSFestivalStartMsg
{
	Info = {}
}
when{}
function KSFestivalStartMsg(Info)
	CFestivalManager:OnRecvFestivalStart(Info)
end
--KS->���ս���
define.KSFestivalEndMsg
{
	Info = {}
}
when{}
function KSFestivalEndMsg(Info)
	CFestivalManager:OnRecvFestivalEnd(Info)
end
--KS->���ʼ
define.KSFestivalLineStartMsg
{
	Info = {}
}
when{}
function KSFestivalLineStartMsg(Info)
	CFestivalManager:OnRecvFestivalLineStart(Info)
end
--KS->�����
define.KSFestivalLineEndMsg
{
	Info = {}
}
when{}
function KSFestivalLineEndMsg(Info)
	CFestivalManager:OnRecvFestivalLineEnd(Info)
end
--KS->�����
define.KSFestivalLineRewardMsg
{
	Info = {}
}
when{}
function KSFestivalLineRewardMsg(Info)
	CFestivalManager:OnRecvFestivalLineReward(Info)
end

--KS->��ҵ���޸�
define.KSFestivalModiMsg
{
}
when{}
function KSFestivalModiMsg()
	CFestivalManager:FestivalModi()
end
--------------------------------------------------------------
-----------------------------------------------------------Clt
--Clt->����ĳ��������Ϣ
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
--Clt->����ĳ�����Ϣ
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

--Clt->�����콱
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










































