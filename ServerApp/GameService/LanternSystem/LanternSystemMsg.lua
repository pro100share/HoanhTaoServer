--[[

--]]
--------------------------------------------------------------

--------------------------------------------------------------
------ Clt -->

define.LanternOpenMsg
{
	user = NONE;
	Use = 0;
	ID = 0;
}
when{ user = NONE }
LanternOpenMsg = checkUser
when{}
function LanternOpenMsg(user,Use,ID)
	local sys = user:GetSystem("CLanternSystemSystem")
	if not sys then return end;
	sys:OnRecvOpen(Use,ID)
end

define.LanternAnsMsg
{
	user = NONE;
	Ans = 0;
	ID = 0;
}
when{ user = NONE }
LanternAnsMsg = checkUser
when{}
function LanternAnsMsg(user,Ans,ID)
	local sys = user:GetSystem("CLanternSystemSystem")
	if not sys then return end;
	sys:OnRecvAns(Ans,ID)
end


