
define.KSIncomeRcvMsg
{
	user = NONE,
	RoleID = -1,
	Data = {},
}
when{ user = NONE }
KSIncomeRcvMsg = checkGSUser
when{}
function KSIncomeRcvMsg(user,RoleID,Data)
	CIncomeRecordManager:Rcv(user,RoleID,Data)
end

define.KSIncomeAskMsg
{
	user = NONE,
	RoleID = -1,
}
when{ user = NONE }
KSIncomeAskMsg = checkGSUser
when{}
function KSIncomeAskMsg(user,RoleID)
	CIncomeRecordManager:Ask(user,RoleID)
end



