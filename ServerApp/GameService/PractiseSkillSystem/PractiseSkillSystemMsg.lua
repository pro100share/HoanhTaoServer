
--[[
	--���ܣ�ͯ�ѹ�ϵͳ��Ϣ
	--���ߣ�κ��
	--ʱ�䣺2013-12-20
--]]

--�������һ���Ϊ
define.ReqExchangeMendValueMsg
{
	user = NONE,
	ExchangeExp = 0;
};
when {user = NONE}
ReqExchangeMendValueMsg = checkUser;
when{}
function ReqExchangeMendValueMsg(user,ExchangeExp)
	local Sys = user:GetSystem("CPractiseSkillSystem");
	if not Sys then
		return;
	end;
	Sys:ExchangeMendValue(ExchangeExp);
end

----ʹ�����Ͱ˻� ��ȡ��Ϊֵ
define.ButtonExchangeMendValueMsg
{
	user = NONE,
};
when {user = NONE}
ButtonExchangeMendValueMsg = checkUser;
when{}
function ButtonExchangeMendValueMsg(user)
	local Sys = user:GetSystem("CPractiseSkillSystem");
	if not Sys then
		return;
	end;
	Sys:ButtonExchangeMendValue();
end

----������װ����
define.ReqOpenSuitStarMsg
{
	user = NONE,
	StarLevel = 0,
};
when {user = NONE}
ReqOpenSuitStarMsg = checkUser;
when{}
function ReqOpenSuitStarMsg(user,StarLevel)
	local Sys = user:GetSystem("CPractiseSkillSystem");
	if not Sys then
		return;
	end;
	Sys:OpenSuitStar(StarLevel);
end

---ʹ������ͷ��

define.ReqUseSpecialPortraitMsg
{
	user = NONE,
};
when {user = NONE}
ReqUseSpecialPortraitMsg = checkUser;
when{}
function ReqUseSpecialPortraitMsg(user)
	local Sys = user:GetSystem("CPractiseSkillSystem");
	if not Sys then
		return;
	end;
	Sys:UseSpecialPortrait();
end
----�鿴�Է�ͯ�ѹ���Ϣ
define.ReqViewOtherPractiseSkillMsg
{
	user = NONE,
	OtherRoleID = 0,
};
when {user = NONE}
ReqViewOtherPractiseSkillMsg = checkUser;
when{}
function ReqViewOtherPractiseSkillMsg(user,OtherRoleID)
	local Sys = user:GetSystem("CPractiseSkillSystem");
	if not Sys then
		return;
	end;
	Sys:ViewOtherPractiseSkill(OtherRoleID);
end
----�㲥��װ
define.BroadCastSuitStarOpenMsg
{
	RoleID	= 0,
	RoleName= "",
	Level = 0,
};
when{}
function BroadCastSuitStarOpenMsg(RoleID,RoleName,Level)
	local setNet = {};
	for i,objPlayer in pairs(CPlayerManager.setAllPlayer) do
		table.insert(setNet, objPlayer.objNet);
	end;
	_groupcallout(setNet, "CltBroadCastSuitStarOpenMsg", {RoleID = RoleID,RoleName = RoleName,Level = Level});	
end

----�㲥�ȼ�

define.BroadCastAddLevelMsg
{
	RoleID	= 0,
	RoleName= "",
	Level = 0,
};
when{}
function BroadCastAddLevelMsg(RoleID,RoleName,Level)
	local setNet = {};
	for i,objPlayer in pairs(CPlayerManager.setAllPlayer) do
		table.insert(setNet, objPlayer.objNet);
	end;
	_groupcallout(setNet, "CltBroadCastAddLevelMsg", {RoleID = RoleID,RoleName = RoleName,Level = Level});	
end


