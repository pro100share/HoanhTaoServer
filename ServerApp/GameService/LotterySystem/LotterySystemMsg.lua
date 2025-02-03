--[[
功能：抽奖系统消息处理（服务器）
版本：v1.0
作者：lzc
时间：2013-09-11 
]]

--从KS返回的初始化信息
define.OnKSInitLotteryInfoMsg
{
	SetTikcetList = {},
	SetLastDrawInfo = {},
	SetCurDrawInfo = {},
}
when{}
function OnKSInitLotteryInfoMsg(SetTikcetList, SetLastDrawInfo, SetCurDrawInfo)
	CLotterySystemManager:UpdateTicketList(SetTikcetList)
	CLotterySystemManager:UpdateLastDrawInfo(SetLastDrawInfo)
	CLotterySystemManager:UpdateCurDrawInfo(SetCurDrawInfo)
end;




--客户端购买标签的请求
define.OnRequestBuyLotteryTicketMsg
{
	user = NONE;
	TicketIndex = 0;
}
when{user = NONE}
OnRequestBuyLotteryTicketMsg = checkUser
when{}
function OnRequestBuyLotteryTicketMsg(user,TicketIndex)
	local objLotterySys = user:GetSystem("CLotterySystem");
	if objLotterySys then
		objLotterySys:TryBuyTicket(TicketIndex);
	end
end;

--从KS返回的购买返回消息
define.OnKSBuyTicketResultMsg
{
	RoleID = 0;
	TicketIndex = 0;
	Code = -1; --  Code = 0购买成功, 1被自己买，2被别人买，3背包空格不够, 4消耗材料不足,5 银币不足
}
when{}
function OnKSBuyTicketResultMsg(RoleID,TicketIndex,Code)
	local objPlayer = CPlayerManager:GetPlayerByRoleID(RoleID);
	if not objPlayer then
		_err("can not find player",RoleID);
		return;
	end
	
	local objLotterySys = objPlayer:GetSystem("CLotterySystem");
	if objLotterySys then
		objLotterySys:BuyTicketKSResult(TicketIndex,Code);
	end
end;


define.OnKSUpdateTicketMsg
{
	TicketIndex = 0,
	RoleID = {},
	SelectedCount = 0,
	DrawCount = 0,
}
when{}
function OnKSUpdateTicketMsg(TicketIndex, RoleID, SelectedCount, DrawCount)
	CLotterySystemManager:UpdateSingleTikcet(TicketIndex, RoleID, SelectedCount, DrawCount)
end;


--从KS返回的开奖消息
define.OnKSLotteryDrawMsg
{
	-- SetTikcetList = {},
	-- SetLastDrawInfo = {},
	-- SetCurDrawInfo = {},
}
when{}
function OnKSLotteryDrawMsg()
	CLotterySystemManager:Draw()
end;

--从KS返回的剩余标签数量消息（客户端需要广播）
define.OnKSRemainTicketMsg
{
}
when{}
function OnKSRemainTicketMsg()
	CLotterySystemManager:RemainTicket()
end;
