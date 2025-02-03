--玩家请求离开副本
define.ReqLeaveFbSceneMsg
{
	user = NONE, 
	BFlag = false,
}
when{ user = NONE }
ReqLeaveFbSceneMsg = checkUser
when{ }
function ReqLeaveFbSceneMsg(user, BFlag)
	local duplSystem = user:GetSystem("CDuplSystem");
	if not duplSystem then
		return;
	end;
	duplSystem:ReqLeaveFbScene(BFlag);
end;

define.OnReqEnterByItemMsg
{
	user = NONE, 
	DuplId = 0,
	Index = 0,
	ItemEnum = 0,
}
when{ user = NONE }
OnReqEnterByItemMsg = checkUser
when{ }
function OnReqEnterByItemMsg(user, DuplId, Index, ItemEnum)
	local mapSystem = user:GetSystem("CMapSystem");
	if not mapSystem then return end; 
	local dwPointID = 1;
	mapSystem:ReqEnterByItem(DuplId,dwPointID, Index, ItemEnum);
end;

define.ReqChangeMapMsg
{
	user = NONE, 
	MapId = 0,
}
when{ user = NONE }
ReqChangeMapMsg = checkUser
when{ }
function ReqChangeMapMsg(user, MapId)
	local mapSystem = user:GetSystem("CMapSystem");
	if not mapSystem then return end; 
	local dwPointID = 1
	mapSystem:ExecTransforMap(MapId,dwPointID);
end;
--进入副本并设置副本难度
define.ReqEnterDuplMsg
{
	user = NONE;
	DuplId = 0;
	Index = 0;
}
when{ user = NONE }
ReqEnterDuplMsg = checkUser
when{ }
function ReqEnterDuplMsg(user,DuplId, Index)
	local mapSystem = user:GetSystem("CMapSystem");
	if not mapSystem then return end; 
	local dwPointID = 1;
	mapSystem:ReqEnterDupl(DuplId,dwPointID, Index);
end;

define.GiveUpDuplMsg
{
	user = NONE;
	DuplId = 0;
}
when{ user = NONE }
GiveUpDuplMsg = checkUser
when{ }
function GiveUpDuplMsg(user,DuplId)
	local duplSystem = user:GetSystem("CDuplSystem");
	if not duplSystem then return end; 
	duplSystem:GiveUpDupl(DuplId);
end;

define.ReqOverDuplMsg{
	user = NONE,
	DuplId = 0,
}
when{user = NONE}
ReqOverDuplMsg = checkUser;
when{}

function ReqOverDuplMsg(user, DuplId)
	if CConfig.bIsCrossSvr then
		return;
	end
	
	local duplSystem = user:GetSystem("CDuplSystem");
	if not duplSystem then
		return;
	end;
	--进入副本场景
	duplSystem:OnOverDupl(DuplId);
end;

--------------------------------ks与gs交互----------------------------------------
_define()
--创建副本
define.DuplMgr_OrderRespondMsg
{
	user = NONE,
	OrderID = 0,		--副本id
	DuplId = 0,
	Record = {},
}
when{user = NONE}
DuplMgr_OrderRespondMsg = checkKSUser
when{}
function DuplMgr_OrderRespondMsg(user, OrderID, DuplId, Record)
	if not user then
		return;
	end;
	local duplSystem = user:GetSystem("CDuplSystem");
	if not duplSystem then return end;	
	if DuplConfig[DuplId].bInShow ~= 0 or _G.ChallengeQunXiaConfig.IsQunXiaFB(DuplId) then
		duplSystem:ResponseDuplOrder(OrderID, DuplId, Record);
	end;
end;

--同步Record信息
define.CreateDuplInfoMsg
{
	OrderID = 0, 
	DuplId = 0,
	RoleId = 0, 
	Level = 0,
	Line = 0,
	Info = {},
}
when{}
function CreateDuplInfoMsg(OrderID, DuplId, RoleId, Level, Line, Info)
	-- print("===CreateDuplInfoMsg 1===")
	if not CGutDuplManager:CreateGutDupl(OrderID, DuplId, RoleId, Level, Line) then
		return;
	end;
	-- print("===CreateDuplInfoMsg 2===")
	_G.GSRemoteCall(RoleId, "CDuplSystem", "ChangeLineEnterDupl", {DuplId, OrderID, Info, Line}, nil);
end;

--从ks获得副本record
define.OnKSInitRecordMsg
{
	RecordInfo = {},	
}
when{}
function OnKSInitRecordMsg(RecordInfo)
	CDuplManager:SetDuplRecord(RecordInfo);
end;
--从ks上获得珍珑record
define.OnInitZLRecordMsg
{
	RecordInfo = {},	
}
when{}
function OnInitZLRecordMsg(RecordInfo)
	CDuplManager:SetZLDuplRecord(RecordInfo);
end;

--从ks上获得珍珑record
define.OnInitZLKingMsg
{
	RecordInfo = {},	
}
when{}
function OnInitZLKingMsg(RecordInfo)
	CDuplManager:SetZLKingRecord(RecordInfo);
end;

--从ks上获得积分信息
define.OnInitJiFenInfoMsg
{
	RecordInfo = {},	
}
when{}
function OnInitJiFenInfoMsg(RecordInfo)
	CDuplManager:SetJiFenRecord(RecordInfo);
end;

--同步Record信息
define.ChgDuplRecordMsg
{
	DuplId = 0,
	RoleId = 0, 
	LifeTime = 0,
	RoleName = "",
	IconId = 0,
}
when{}
function ChgDuplRecordMsg(DuplId, RoleId, LifeTime, RoleName, IconId)
	CDuplManager:ChgDuplRecordRep(DuplId, RoleId, LifeTime, RoleName, IconId);
end;

--同步珍珑之王信息
define.ChgZLKingInfoMsg
{
	ZLKingInfo = {},
}
when{}
function ChgZLKingInfoMsg(ZLKingInfo)
	CDuplManager:SetZLKingRecord(ZLKingInfo)
end;

--同步更新积分信息
define.ChgJiFenInfoMsg
{
	JiFenTbl = {},
	DuplId = 0,
}
when{}
function ChgJiFenInfoMsg(JiFenTbl, DuplId)
	CDuplManager:ChgJiFenInfoReq(JiFenTbl, DuplId);
end;

--每天00点定时更新珍珑副本进度数据
define.UpdateZLPlanMsg
{
}
when{}
function UpdateZLPlanMsg()
	CDuplManager:UpdateZLBossPlan();
end;
---------------------------------------------------------------------------------------
--通知服务端刷新怪物
define.NoticeRefMonsterMsg{
	user = NONE,
	DuplId = 0,
	WaveId = 0,
}
when{user = NONE}
NoticeRefMonsterMsg = checkUser;
when{}

function NoticeRefMonsterMsg(user, DuplId, WaveId)
	local duplSystem = user:GetSystem("CDuplSystem");
	if not duplSystem then
		return;
	end;
	duplSystem:RefMonster(DuplId, WaveId)
end;

--获取宝箱内物品信息
define.ReqBXItemInfoMsg{
	user = NONE,
	GoldBXFlag = 0,
}
when{user = NONE}
ReqBXItemInfoMsg = checkUser;
when{}

function ReqBXItemInfoMsg(user, GoldBXFlag)
	local duplSystem = user:GetSystem("CDuplSystem");
	if not duplSystem then
		return;
	end;
	duplSystem:ReqBXItemInfo(GoldBXFlag)
end;
--请求奖励物品
define.ReqPullItemMsg{
	user = NONE,
	--GoldBXFlag = 0,
	GoldBXNumFlag = 0,
}
when{user = NONE}
ReqPullItemMsg = checkUser;
when{}

function ReqPullItemMsg(user, GoldBXNumFlag)
	local duplSystem = user:GetSystem("CDuplSystem");
	if not duplSystem then
		return;
	end;
	duplSystem:ReqGetAward(GoldBXNumFlag)
end;
--关闭界面时发奖励
define.ReqSendAwardMsg{
	user = NONE,
}
when{user = NONE}
ReqSendAwardMsg = checkUser;
when{}

function ReqSendAwardMsg(user)
	local duplSystem = user:GetSystem("CDuplSystem");
	if not duplSystem then
		return;
	end;
	duplSystem:ReqSendAward()
end;

define.ReqPeepSussMsg{
	user = NONE,
}
when{user = NONE}
ReqPeepSussMsg = checkUser;
when{}

function ReqPeepSussMsg(user)
	local duplSystem = user:GetSystem("CDuplSystem");
	if not duplSystem then
		return;
	end;
	duplSystem:ReqPeepSuss()
end;

--向服务端发消息请求获得副本记录和积分信息
define.ReqGetFbShowInfoMsg{
	user = NONE,
	Flag = false,
}
when{user = NONE}
ReqGetFbShowInfoMsg = checkUser;
when{}

function ReqGetFbShowInfoMsg(user, Flag)
	local duplSystem = user:GetSystem("CDuplSystem");
	if not duplSystem then
		return;
	end;
	duplSystem:ResGetFbShowInfo(Flag);
end;

--向服务端发消息请求获得珍珑之王及珍珑进度信息
define.GetZLInfoMsg{
	user = NONE,
}
when{user = NONE}
GetZLInfoMsg = checkUser;
when{}

function GetZLInfoMsg(user)
	local duplSystem = user:GetSystem("CDuplSystem");
	if not duplSystem then
		return;
	end;
	duplSystem:GetZLInfo();
end;

--机器人演武截堂刷怪
define.ReqCreateMsg{
	user = NONE,
}
when{user = NONE}
ReqCreateMsg = checkUser;
when{}
function ReqCreateMsg(user)
	local duplSystem = user:GetSystem("CDuplSystem");
	if not duplSystem then
		return;
	end;
	duplSystem:CreateMonsterByRobot();
end;

--副本一键完成
define.ReqCompleteDuplMsg
{
	user = NONE;
	DuplId = 0;
}
when{ user = NONE }
ReqCompleteDuplMsg = checkUser
when{ }
function ReqCompleteDuplMsg(user,DuplId)
	local duplSystem = user:GetSystem("CDuplSystem");
	if not duplSystem then return end; 
	duplSystem:CompleteDupl(DuplId);
end;

define.ReqRefreshTollMsg
{
	user = NONE;
	Continue = false,
}
when{ user = NONE }
ReqRefreshTollMsg = checkUser
when{ }
function ReqRefreshTollMsg(user, Continue)
	local duplSystem = user:GetSystem("CDuplSystem");
	if not duplSystem then return end; 
	duplSystem:RefreshToll(Continue);
end;

-- 卧虎藏龙副本-大乱斗时间到结束消息
define.DuplDaLuanDouOverMsg
{
    user = NONE;
}
when{ user = NONE}
DuplDaLuanDouOverMsg = checkUser
when{ }
function DuplDaLuanDouOverMsg(user)
    local duplSystem = user:GetSystem("CDuplSystem");
	if not duplSystem then return end; 
    if duplSystem.objCurDupl and duplSystem.objCurDupl.bIsDaLuanDou then
        duplSystem:WoHuCangLongLeave();
    end
end
