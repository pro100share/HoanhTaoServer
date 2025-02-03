--[[
	--���ܣ��������ϵͳ��Ϣ
	--���ߣ�κ��
	--ʱ�䣺2013-11-29
--]]

--��ҿ�ʼҡ��
define.RequestStartShakeAwardMsg
{
	user = NONE,
};
when {user = NONE}
RequestStartShakeAwardMsg = checkUser;
when{}
function RequestStartShakeAwardMsg(user)
	local sys = user:GetSystem("COnlineAwardsSystem");
	if not sys then
		return;
	end;
	sys:StartShakeAward();
end


--��һ�ȡ����
define.RequestGetShakeAwardsMsg
{
	user = NONE,
};
when {user = NONE}
RequestGetShakeAwardsMsg = checkUser;
when{}
function RequestGetShakeAwardsMsg(user)
	local sys = user:GetSystem("COnlineAwardsSystem");
	if not sys then
		return;
	end;
	sys:GetShakeAwards();
end
---���ǿ�ƹر�ҡ�������ȡ����
define.CloseUiGetShakeAwardsMsg
{
	user = NONE,
};
when {user = NONE}
CloseUiGetShakeAwardsMsg = checkUser;
when{}
function CloseUiGetShakeAwardsMsg(user)
	local sys = user:GetSystem("COnlineAwardsSystem");
	if not sys then
		return;
	end;
	sys:CloseUiGetShakeAwards();
end
----��ȡ�ջ����㲥
define.BroadCastGetShakeAwardsMsg
{
	RoleID	= 0,
	RoleName= "",
	AwardInfo = {};
};
when{}
function BroadCastGetShakeAwardsMsg(RoleID,RoleName,AwardInfo)
	local setNet = {};
	for i,objPlayer in pairs(CPlayerManager.setAllPlayer) do
		table.insert(setNet, objPlayer.objNet);
	end;
	_groupcallout(setNet, "CltBroadCastGetShakeAwardsMsg", {RoleID = RoleID,RoleName = RoleName,AwardInfo = AwardInfo});	
end

-----��ʱ���屾�ս����б�
define.KSClearOnlineAwardsInfoMsg
{
};
when{}
function KSClearOnlineAwardsInfoMsg()
	for k,user in pairs(CPlayerManager.setAllPlayer) do
	    local sys = user:GetSystem("COnlineAwardsSystem");
		if not sys then
			return;
		end;
		sys:ClearOnlineAwardsInfo(); 
	end
end
