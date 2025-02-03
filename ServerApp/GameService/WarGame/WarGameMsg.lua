--世家战消息

define.OnGSAddWarGameMsg
{
	WarID = 0;
}
when{}
function OnGSAddWarGameMsg(WarID)
	CWarJoin:AddWar(WarID);
end;

define.OnGSRmvWarGameMsg
{
	WarID = 0;
}
when{}
function OnGSRmvWarGameMsg(WarID)
	CWarJoin:RmvWar(WarID);
end;

--KS发过来的初始化war列表
define.OnGSWarInfoMsg
{
	WarInfo = {};
}
when{}
function OnGSWarInfoMsg(WarInfo)
	--print("===OnGSWarInfoMsg===")
	CWarJoin:InitWar(WarInfo);
end;

define.OnGSWarLineDataMsg
{
	RoleID = 0;
	WarID = 0;
	LineID = 0;--返回值：-1——》没有这个war；-2——》所有线都忙
}
when{}
function OnGSWarLineDataMsg(RoleID,WarID,LineID)
	local objPlayer = CMapManager:GetPlayer(RoleID);
	if not objPlayer then
		return;
	end
	
	local objWarSys = objPlayer:GetSystem("CWarSystem");
	if objWarSys then
		objWarSys:BeginWar(WarID,LineID);
	end
end;

define.OnGSWarNoticeMsg
{
	NoticeType = 0;
	StringID = 0;
	Param = {};
}
when{}
function OnGSWarNoticeMsg(NoticeType,StringID,Param)
	CWarJoin:BroadcastWarNotice(NoticeType,StringID,Param);
end;


-------------------------------------------------------------------------------
--客户端消息
--申请进入战场
define.OnEnterWarRequestMsg
{
	user = NONE;
	WarID = 0;
}
when {user = NONE}
OnEnterWarRequestMsg = checkUser;
when{}
function OnEnterWarRequestMsg(user,WarID)
	local objWarSys = user:GetSystem("CWarSystem");
	if objWarSys then
		objWarSys:TryJoinWar(WarID);
	end
end;

--申请退出战场
define.OnExitWarRequestMsg
{
	user = NONE;
}
when {user = NONE}
OnExitWarRequestMsg = checkUser;
when{}
function OnExitWarRequestMsg(user)
	local objWarSys = user:GetSystem("CWarSystem");
	if objWarSys then
		objWarSys:TryEixtWar();
	end
end;


-- --测试用
-- define.OnCreateWarRequestMsg
-- {
	-- user = NONE;
	-- WarID = 0;
-- }
-- when {user = NONE}
-- OnCreateWarRequestMsg = checkUser;
-- when{}
-- function OnCreateWarRequestMsg(user,WarID)
	-- CWarHost:CreateWar(WarID)
-- end;

-- define.OnDeleteWarRequestMsg
-- {
	-- user = NONE;
	-- WarID = 0;
-- }
-- when {user = NONE}
-- OnDeleteWarRequestMsg = checkUser;
-- when{}
-- function OnDeleteWarRequestMsg(user,WarID)
	-- CWarHost:BeginDeleteWar(WarID)
-- end;

define.OnWarTimeLimitMsg
{
	user = NONE;
	WarID = 0;
}
when{user = NONE}
OnWarTimeLimitMsg = checkUser;
when{}
function OnWarTimeLimitMsg(user,WarID)
	local dwTime = CWarJoin:GetLastBeginTime(WarID);
	--print("===OnWarTimeLimitMsg===",WarID,dwTime)
	if dwTime then
		user.OnWarLastTimeMsg
		{
			WarID = WarID;
			TimeLength = dwTime;
		}
	end
end;

