--[[
���ܣ��ٶ�Ӱ���ƹ� ��Ϣ����������
���ߣ��ܳ�ɳ
ʱ�䣺2013-9-9
]]
_define()
------------------------------------------------------
--�յ���ȡ��װ��������
define.BaiduPlayerGetOnceMsg
{
	user = NONE;
}
when{ user = NONE }
BaiduPlayerGetOnceMsg = checkUser
when{}
function BaiduPlayerGetOnceMsg(user)
	local sys = user:GetSystem("CBaiduPlayerSystem");
	if not sys then return end;
	sys:OnRecvAskForOnceReward()
end

--�յ���ȡÿ�ս�������
define.BaiduPlayerGetDailyMsg
{
	user = NONE;
}
when{ user = NONE }
BaiduPlayerGetDailyMsg = checkUser
when{}
function BaiduPlayerGetDailyMsg(user)
	local sys = user:GetSystem("CBaiduPlayerSystem");
	if not sys then return end;
	sys:OnRecvAskForDailyReward()
end
--------------------------------------------------------------











