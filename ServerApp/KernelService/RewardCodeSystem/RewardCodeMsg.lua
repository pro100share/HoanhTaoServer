
--GS询问能否领取
define.KSRewardCodeAskForCheckMsg
{
	user = NONE;
	Info = {};
}
when{ user = NONE }
KSRewardCodeAskForCheckMsg = checkGSUser
when{}
function KSRewardCodeAskForCheckMsg(user,Info)
	local dwRes = CRewardCodeManager:Check(Info[1],Info[2],user:GetRoleID(),Info[3])
	--if dwRes==-1 then return end;
	--反馈
	--user.GSRewardCodeResMsg{Info={dwRes,Info[1],Info[2]}}
end
--GS返回领取成功or失败
define.KSRewardCodeAskForGetMsg
{
	user = NONE;
	Info = {};
}
when{ user = NONE }
KSRewardCodeAskForGetMsg = checkGSUser
when{}
function KSRewardCodeAskForGetMsg(user,Info)
	if Info[1]==0 then
		CRewardCodeManager:Get(Info[2],Info[3],user:GetRoleID())
	else
		CRewardCodeManager:NoGet(Info[3])
	end
end





