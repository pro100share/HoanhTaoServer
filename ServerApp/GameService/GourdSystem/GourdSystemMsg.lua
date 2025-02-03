
--[[
	ʱ�䣺2014-1-2
	���ܣ��ƺ�«��Ϣ��
	���ߣ�κ��
--]]

-----�ύ��Ʒ��ȡ������
define.RequestHandInItemMsg
{
	user = NONE,
	Index = 0,
};
when {user = NONE}
RequestHandInItemMsg = checkUser;
when{}
function RequestHandInItemMsg(user,Index)
	local Sys = user:GetSystem("CGourdSystem");
	if not Sys then
		return;
	end;
	Sys:HandInItem(Index);
end

---�ȸ���
define.Gourd_KSGourdHotUpdateMsg
{
};
when{}
function Gourd_KSGourdHotUpdateMsg()
	UpdateGourdConfig:Reload()
	for k,user in pairs(CPlayerManager.setAllPlayer) do
		local Sys = user:GetSystem("CGourdSystem");
		if not Sys then
			return;
		end;
		Sys:GourdHotUpdate();
	end
end

----���ȸ���
define.Gourd_KSClearHotUpdateInfoMsg
{
	
};
when{}
function Gourd_KSClearHotUpdateInfoMsg()
	if(_G.UpdateGourdCofig) then
		_G.UpdateGourdCofig.bOpen = false;
	end
end

----���������
define.Gourd_KSClearAddTimesInfoMsg
{
	
};
when{}
function Gourd_KSClearAddTimesInfoMsg()
	for k,user in pairs(CPlayerManager.setAllPlayer) do
		local Sys = user:GetSystem("CGourdSystem");
		if not Sys then
			return;
		end;
		Sys:ClearAddTimesInfo();
	end
end

--�鿴�Է���«��Ϣ
define.ViewOtherGourdMsg
{
	user = NONE,
	RoleID = 0, 
}
when{ user = NONE }
ViewOtherGourdMsg = checkUser
when{ }
function ViewOtherGourdMsg(user, RoleID)
	local sys = user:GetSystem("CGourdSystem");
	if not sys then
		return;
	end;
	sys:ViewOtherGourd(RoleID);
end

----�㲥
define.GourdBroadCastAddLevelMsg
{
	RoleID	= 0,
	RoleName= "",
	Level = 0,
}
when{}
function GourdBroadCastAddLevelMsg(RoleID,RoleName,Level)
	local setNet = {};
	for i,objPlayer in pairs(CPlayerManager.setAllPlayer) do
		table.insert(setNet, objPlayer.objNet);
	end;
	_groupcallout(setNet, "CltGourdBroadCastAddLevelMsg", {RoleID = RoleID,RoleName = RoleName,Level = Level});	
end

----�����«
define.AdornGourdMsg
{
	user = NONE,
	Level = 0,
}
when{ user = NONE }
AdornGourdMsg = checkUser
when{ }
function AdornGourdMsg(user,Level)
	local sys = user:GetSystem("CGourdSystem");
	if not sys then
		return;
	end;
	sys:AdornGourd(Level);
end

