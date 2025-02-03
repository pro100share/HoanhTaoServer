--Clt请求领取
define.CltAskForCheckMsg
{
	user = NONE;
	Code = ""
}
when{ user = NONE }
CltAskForCheckMsg = checkUser
when{}
function CltAskForCheckMsg(user,Code)
	local sysRewardCode = user:GetSystem("CRewardCodeSystem")
	if not sysRewardCode then return end;
	sysRewardCode:CltAskForGet(Code)
end

--KS返回领取成功or失败
define.GSRewardCodeResMsg
{
	user = NONE;
	Info = {};
}
when{ user = NONE }
GSRewardCodeResMsg = checkKSUser
when{}
function GSRewardCodeResMsg(user,Info)
	-- print("Res",Info[1],Info[2],Info[3])
	local sysRewardCode = user:GetSystem("CRewardCodeSystem")
	if not sysRewardCode then return end;
	sysRewardCode:RecvKSRes(Info[1],Info[2],Info[3])
end





