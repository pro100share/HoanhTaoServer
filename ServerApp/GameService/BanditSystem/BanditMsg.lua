--------------------------------
--[[
服务器 摇奖
消息处理
周长沙
2012-1-31
--]]
--------------------------------

_define()
--接收到玩家点击开始消息
define.RecvStartInfoMsg
{
	user  = NONE ,
}
when{ user = NONE }
RecvStartInfoMsg = checkUser
when{}
function RecvStartInfoMsg(user)
	local sysBandit = user:GetSystem("CBanditSystem")
	if sysBandit then
		sysBandit:OnRecvStartInfo()
	end
end
--接收到玩家点击领取消息
define.RecvGetInfoMsg
{
	user  = NONE ,
}
when{ user = NONE }
RecvGetInfoMsg = checkUser
when{}
function RecvGetInfoMsg(user)
	local sysBandit = user:GetSystem("CBanditSystem")
	if sysBandit then
		sysBandit:OnRecvGetInfo()
	end
end
------------------------------------
--接收到继续的消息
define.RecvContinueMsg
{
	user  = NONE ,
}
when{ user = NONE }
RecvContinueMsg = checkUser
when{}
function RecvContinueMsg(user)
	local sysBandit = user:GetSystem("CBanditSystem")
	if sysBandit then
		sysBandit:OnRecvContinue()
	end
end

