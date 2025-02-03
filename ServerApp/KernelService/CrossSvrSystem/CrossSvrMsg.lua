-- 接收到游戏服务器信息
define.OnGameServiceServerInfoMsg
{
    -- 服务器编号
    ServerID = 0;
}
when{}
function OnGameServiceServerInfoMsg(ServerID)
    CCrossSvrMgr:Mapping(ServerID, _net_id);
end

-- 接收到跨服战服务器信息
define.OnCrossServiceServerInfoMsg
{
    -- 用户端口号
    UserPort = 0;
}
when{}
function OnCrossServiceServerInfoMsg(UserPort)
    CCrossSvrMgr:OnCrossServiceServerInfoMsg(UserPort);
end

--向KS请求检测跨服战场
define.OnKsRequestCrossMsg
{
	RoleID = 0,
	AccID = 0,
	ToLineId = 0,
	FromLineID = 0,
	CrossId = 0,	
	ServerId = 0, --服务器id
	PlatId = 0, --平台id
}
when{}
function OnKsRequestCrossMsg(RoleID, AccID, ToLineId, FromLineID, CrossId, ServerId, PlatId)
	local info = CCrossSvrMgr:GetCrossInfo(ToLineId, CrossId);
	if not info or CCrossSvrMgr:GetState() == 0 then
		_G.SendFromWarKsToNormalGs("ResponeCrossResToGsMsg", {ResCode = -1, RoleID = RoleID}, FromLineID);
		return;
	end;
	local enterInfo =  CCrossSvrMgr:GetEnterCrossRec(AccID, RoleID);
	local bExist = info.bEnter;
	if not enterInfo and not bExist then
		_G.SendFromWarKsToNormalGs("ResponeCrossResToGsMsg", {ResCode = -2, RoleID = RoleID}, FromLineID);
		return;
	end;
	local num = info.bNum;
	--检测战场是否开启 在ks上。
	if num + 1 > _G.CrossSvrConfig[CrossId].Num then
		_G.SendFromWarKsToNormalGs("ResponeCrossResToGsMsg", {ResCode = -3, RoleID = RoleID}, FromLineID);
		return;
	end;
	--没有进入过跨服战场
	if enterInfo and enterInfo.toLineId ~= ToLineId then		
		_G.SendFromWarKsToNormalGs("ResponeCrossResToGsMsg", {ResCode = -4, RoleID = RoleID}, FromLineID);
		return;	
	end;
	CCrossSvrMgr:AddEnterCrossRec(RoleID, AccID, ToLineId, CrossId, FromLineID , ServerId, PlatId);
	_G.SendFromWarKsToNormalGs("ResponeCrossResToGsMsg", {ResCode = 0, RoleID = RoleID}, FromLineID);		
end;

--向KS请求检测跨服战场
define.OnKsReqCrossLineInfoMsg
{
	RoleID = 0,
	AccID = 0,
	FromLineID = 0,
}
when{}
function OnKsReqCrossLineInfoMsg(RoleID, AccID, FromLineID)
	local Info = CCrossSvrMgr:GetCrossPersonNum();
	local enterInfo = CCrossSvrMgr:GetEnterCrossRec(AccID, RoleID);
	local enteredLineId = 0;
	if enterInfo then
		enteredLineId = enterInfo.toLineId
	end;
	if CCrossSvrMgr:GetState() == 0 then
		Info = {};
		enterInfo = 0;
	end
	_G.SendFromWarKsToNormalGs("ResponseCrossLineInfoMsg", {Info = Info, RoleID = RoleID, AccID = AccID, LineId = enteredLineId}, FromLineID);
end;

--向KS同步跨服战场人数
define.SendCrossNumMsg
{
	CrossId = 0, 
	LineId = 0, 
	PlayerNum = 0,
}
when{}
function SendCrossNumMsg(CrossId, LineId, PlayerNum)
	CCrossSvrMgr:SetCrossPersonNum(LineId, CrossId, PlayerNum);
end;

_G.SendFromWarKsToNormalGs = function(msgName, arrParam, fromLineId)
	_callouttoline(msgName, arrParam, fromLineId, _net_id);  --1，发送到gs
end;

--向KS请求
define.ReceiveCrossDataMsg
{
	AccountId= 0,
	RoleId = 0,
	SystemName= "",
	Data= {},
}
when{}
function ReceiveCrossDataMsg(AccountId, RoleId, SystemName, Data)
	CCrossSvrMgr:ReceiveData(AccountId, RoleId, SystemName, Data);
end; 

define.OnKSCreateCrossMsg
{
	ToLineId = 0,
	CrossId = 0,
	BEnter = false,
	Type = 1,
}
when{}
function OnKSCreateCrossMsg(ToLineId, CrossId, BEnter, Type)
	CCrossSvrMgr:AddCross(ToLineId, CrossId, BEnter, Type);
end;

define.OnKSDelCrossInfoMsg
{
	ToLineId = 0,
	CrossId = 0,
}
when{}
function OnKSDelCrossInfoMsg(ToLineId, CrossId)
	CCrossSvrMgr:DelCross(ToLineId, CrossId)
end;

define.SendExitCrossMsg
{
	Info = {},
	RoleId = 0, 
	AccID = 0,
	Flag = false,
}
when{}
function SendExitCrossMsg(Info, RoleId, AccID, Flag)
	local info = CCrossSvrMgr:GetEnterCrossRec(AccID, RoleId);
	local fromLineId = info.fromLineId;
	local holdServerId = 0;
	local holdName = "";
	if Info.dwHoldId and Info.dwHoldId ~= -1 then
		local tempInfo = CCrossSvrMgr:GetEnterCrossRec(Info.dwHoldAccountId, Info.dwHoldId);
		if tempInfo then
			holdServerId = tempInfo.fromServerId;
			holdName = Info.dwHoldName;
		end;
	end;

	local serverId = info.fromServerId;
	local dwNetId = CCrossSvrMgr:GetCrossServer(info.fromServerId);
	_callouttoline("SendBackDataToNormalGsMsg", {Info = Info,AccID = AccID, RoleID = RoleId, Flag = Flag, HoldServerId = holdServerId, HoldId = Info.dwHoldId, HoldName = holdName}, fromLineId, dwNetId);
    _info("[CrossService] SendExitCrossMsg", AccID, RoleId);
end;

--玩家掉线时同步消息
define.SendDataCrossOutLineMsg
{
	Info = {},
	RoleId = 0, 
	AccID = 0,
}
when{}
function SendDataCrossOutLineMsg(Info, RoleId, AccID)
	CCrossSvrMgr:UpdateCrossData(Info, RoleId, AccID)
end;

--给跨服战场结束不在战场内的人发消息
define.SendCrossOverMsg
{
	AccId = 0, 
	RoleId = 0, 
	Honor = 0, 
	Exp = 0
}
when{}
function SendCrossOverMsg(AccId, RoleId, Honor, Exp)
	CCrossSvrMgr:UpdateCrossAward(Honor, Exp, RoleId)
end;

--游戏ks记录玩家进出信息
define.SendCrossInfoMsg
{
	RoleId = 0,
	AccountID = 0,
	EnterFlag = false,
}
when{}
function SendCrossInfoMsg(RoleId, AccountID, EnterFlag)
	_info("---SendCrossInfoMsg----", RoleId, AccountID, EnterFlag);
	CCrossSvrMgr:PlayerInfoRec(RoleId, AccountID, EnterFlag);
	CPlayerManager:SetEnterCrossPlayer(AccountID, EnterFlag);
end; 

define.GetCrossMemberInfoMsg
{
	RoleId = 0,
	AccID = 0,
	LineId = 0,
}
when{}
function GetCrossMemberInfoMsg(RoleId, AccID, LineId)
	local enterFlag= CCrossSvrMgr:GetPlayerInfoRec(RoleId, AccID);
	local objLine = CGameLineManager:GetLine(LineId);
	if objLine then
		objLine.CheckAllowSendCrossMsg{RoleId = RoleId, AccID = AccID, EnterFlag = enterFlag};
	end;
end; 

--通知ks屠龙刀获得信息
define.SendHoldDataToKsMsg
{	
	CrossId = 0,
	HoldId = 0, 
	HoldName = "",
	OverFlag = false,
}
when{}
function SendHoldDataToKsMsg(CrossId, HoldId, HoldName, OverFlag)
	CCrossSvrMgr:SetHoldInfo(CrossId, HoldId, HoldName, OverFlag);
end;

--清除屠龙刀获得信息
define.ClearHoldInfoToKsMsg
{	
	CrossId = 0,
}
when{}
function ClearHoldInfoToKsMsg(CrossId)
	CCrossSvrMgr:ClearHoldInfo(CrossId);
end;

--上线向ks请求跨服战场屠龙刀信息
define.GetCrossHoldInfoMsg
{	
	
}
when{}
function GetCrossHoldInfoMsg()
	local tbl, bOver = CCrossSvrMgr:GetHoldInfoStr();
	for k,objLine in pairs(CGameLineManager:GetAllLine()) do
		objLine.InitHoldInfoToGsMsg{HoldInfo = tbl, OverFlag = bOver}
	end
end;

--跨服战场ks发给游戏服ks活动开始结束消息
define.SendCrossStartMsg
{	
	CrossId = 0, 
	MsgId = 0,
}
when{}
function SendCrossStartMsg(CrossId, MsgId)
	--清除屠龙刀获得信息
	if MsgId == 13009300002 then
		CCrossSvrMgr:ClearHoldInfo(CrossId);
	end
	
	for k,objLine in pairs(CGameLineManager:GetAllLine()) do
		objLine.SendGameCrossStartMsg{CrossId = CrossId, MsgId = MsgId};
	end
end;

------------------------提前获得屠龙刀存入数据库--------------------------
define.AHeadGetSwordMsg
{	
	CrossId = 0, 
	HoldId = 0, 
	HoldAccountId = 0, 
	HoldName = "",
}
when{}
function AHeadGetSwordMsg(CrossId, HoldId, HoldAccountId, HoldName)
	local info = CCrossSvrMgr:GetEnterCrossRec(HoldAccountId, HoldId);
	local fromLineId = info.fromLineId;
	local holdServerId = info.fromServerId;
	local dwNetId = CCrossSvrMgr:GetCrossServer(holdServerId);
	_callouttoline("SendAHeadGetSwordMsg", {CrossId = CrossId, HoldId = HoldId, HoldAccountId = HoldAccountId, HoldName = HoldName}, fromLineId, dwNetId);  --1，发送到gs
end;
