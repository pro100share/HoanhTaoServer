--世家战消息


--创建新的war
define.OnKSCreateWarMsg
{
	WarID = 0;
	LineID = 0;
}
when{}
function OnKSCreateWarMsg(WarID,LineID)
	CWarManager:AddWarGame(WarID,LineID);
end;

--删除war
define.OnKSDeleteWarMsg
{
	WarID = 0;
	LineID = 0;
}
when{}
function OnKSDeleteWarMsg(WarID,LineID)
	CWarManager:DelWarGame(WarID,LineID);
end;

--申请war的所在GS
define.OnKSRequestWarLineMsg
{
	RoleID = 0;
	WarID = 0;
	LineID = 0;
}
when{}
function OnKSRequestWarLineMsg(RoleID,WarID,LineID)
	CWarManager:RequestWarLine(RoleID,WarID,LineID);
end;

--广播全服战场通知
define.OnKSWarNoticeMsg
{
	NoticeType = 0;
	StringID = 0;
	Param = {};
}
when{}
function OnKSWarNoticeMsg(NoticeType,StringID,Param)
	CWarManager:BroadcastWarNotice(NoticeType,StringID,Param);
end;

--ws发送自己的战场
define.OnKSWarInitMsg
{
	WarList = {};
}
when{}
function OnKSWarInitMsg(WarList)
	local objLine = CGameLineManager:GetGameLineBySvrNet(_from);
	if objLine then
		CWarManager:InitLineWar(WarList,objLine:GetID());
	end
end;
