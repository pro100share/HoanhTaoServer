--[[
���ܣ��齱ϵͳ��Ϣ��
���ߣ����в�
ʱ�䣺2013-910
--]]

define.OnRequestLotteryInfoMsg
{
	LineID = 0;
}
when{}
function OnRequestLotteryInfoMsg(LineID)
	CLotterySystemMgr:SendInfoToGS(LineID);
end;

define.OnLotteryTryBuyTicketMsg
{
	RoleID = 0,
	TicketIndex = 0,
}
when{}
function OnLotteryTryBuyTicketMsg(RoleID, TicketIndex)
	CLotterySystemMgr:TryBuyTicket(RoleID, TicketIndex)
end


define.OnLotteryRealBuyTicketMsg
{
	RoleID = 0,
	TicketIndex = 0,
	BuySucess = 0,
}
when{}
function OnLotteryRealBuyTicketMsg(RoleID, TicketIndex, BuySucess)
	CLotterySystemMgr:RealBuyTicket(RoleID, TicketIndex, BuySucess)
end
