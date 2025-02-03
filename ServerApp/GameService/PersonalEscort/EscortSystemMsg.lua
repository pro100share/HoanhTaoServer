--ÿ�춨ʱ���¸���Ѻ������
define.UpdateEscortInfoMsg
{
}
when{}
function UpdateEscortInfoMsg()
	CEscortManager:UpdateEscortInfo();
end;

--����򿪽�������
define.ReqEscortInfoMsg
{
	user = NONE,
}
when{ user = NONE }
ReqEscortInfoMsg = checkUser
when{ }
function ReqEscortInfoMsg(user)
	local escortSystem = user:GetSystem("CEscortSystem");
	if not escortSystem then
		return;
	end;
	escortSystem:NotifyClientEscortInfo();
end; 

--��������
define.ReqRubEscortMsg
{
	user = NONE,
	Pos = 0,
}
when{ user = NONE }
ReqRubEscortMsg = checkUser
when{ }
function ReqRubEscortMsg(user, Pos)
	local escortSystem = user:GetSystem("CEscortSystem");
	if not escortSystem then
		return;
	end;
	escortSystem:ReqRubEscort(Pos);
end; 

--ˢ���ڳ�Ʒ��
define.ReqRefreshEscortMsg
{
	user = NONE,
}
when{ user = NONE }
ReqRefreshEscortMsg = checkUser
when{ }
function ReqRefreshEscortMsg(user)
	local escortSystem = user:GetSystem("CEscortSystem");
	if not escortSystem then
		return;
	end;
	escortSystem:ReqRefreshEscort();
end; 

--�����ڳ�
define.ReqBuyEscortMsg
{
	user = NONE,
	Pos = 0,
}
when{ user = NONE }
ReqBuyEscortMsg = checkUser
when{ }
function ReqBuyEscortMsg(user, Pos)
	local escortSystem = user:GetSystem("CEscortSystem");
	if not escortSystem then
		return;
	end;
	escortSystem:ReqBuyEscort(Pos);
end; 

--��ʼѺ��
define.BeginRunEscortMsg
{
	user = NONE,
}
when{ user = NONE }
BeginRunEscortMsg = checkUser
when{ }
function BeginRunEscortMsg(user)
	local escortSystem = user:GetSystem("CEscortSystem");
	if not escortSystem then
		return;
	end;
	escortSystem:BeginRunEscort();
end; 

----�㲥
define.EscortSys_BroadCastMsg
{
	StringId = 0,
    AttrTbl = {},
}
when{}
function EscortSys_BroadCastMsg(StringId, AttrTbl)
	local setNet = {};
	for i,objPlayer in pairs(CPlayerManager.setAllPlayer) do
		table.insert(setNet, objPlayer.objNet);
	end;
	_groupcallout(setNet, "EscortSys_BroadCastMsg", {StringId = StringId, AttrTbl = AttrTbl});	
end;
--���ʼǰ����ʾ��Ϣ
define.EscortSys_StartBroadCastMsg
{

}
when{}
function EscortSys_StartBroadCastMsg()
	local setNet = {};
	for i,objPlayer in pairs(CPlayerManager.setAllPlayer) do
		table.insert(setNet, objPlayer.objNet);
	end;
	_groupcallout(setNet, "EscortSys_StartBroadCastMsg", {});	
end;

----�㲥
define.EscortRefSys_BroadCastMsg
{
	PlayerName	= "",
	PlayerRoleID= 0,
	NewQuality = 0,
}
when{}
function EscortRefSys_BroadCastMsg(PlayerName, PlayerRoleID, NewQuality)
	local n_BroadCastLevel = _G.BroadCastConfig.RefreshEscort;
	local setNet = {};
	for i,objPlayer in pairs(CPlayerManager.setAllPlayer) do
		if objPlayer:GetInfo().dwLevel >= n_BroadCastLevel then
			table.insert(setNet, objPlayer.objNet);
		end;
	end;
	_groupcallout(setNet, "EscortRefSys_BroadCastMsg", {PlayerName = PlayerName, PlayerRoleID = PlayerRoleID, NewQuality = NewQuality});	
end;


