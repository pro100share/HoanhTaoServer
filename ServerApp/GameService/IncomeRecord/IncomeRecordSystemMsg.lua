
define.GSRecvKSDataMsg
{
	user = NONE,
	Data = {},
}
when{ user = NONE }
GSRecvKSDataMsg = checkKSUser
when{}
function GSRecvKSDataMsg(user,Data)
	if not user then return end;
	local sysIncomeRecor = user:GetSystem("CIncomeRecordSystem")
	sysIncomeRecor:RcvDataFromKS(Data)
end

define.GSIncomeAskMsg
{
	user = NONE,
}
when{ user = NONE }
GSIncomeAskMsg = checkUser
when{}
function GSIncomeAskMsg(user)
	local sysIncomeRecor = user:GetSystem("CIncomeRecordSystem")
	if not sysIncomeRecor then return end;
	sysIncomeRecor:RcvAskFromCnt()
end



