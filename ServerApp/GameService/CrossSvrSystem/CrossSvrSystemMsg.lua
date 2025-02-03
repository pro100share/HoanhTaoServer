--玩家请求进入战场
define.ReqEnterCorssSvrMsg
{
	user = NONE,  
	LineID = 0,
	CrossId = 0, --跨服战场id，目前只有一个
}
when{ user = NONE }
ReqEnterCorssSvrMsg = checkUser
when{ }
function ReqEnterCorssSvrMsg(user, LineID, CrossId)
	local corssSvrSystem = user:GetSystem("CCrossSvrSystem");
	if not corssSvrSystem then
		return;
	end;
	corssSvrSystem:ReqEnterCorssSvr(LineID, CrossId);
end;

--玩家打开战场列表向服务器发送请求
define.ReqCorssSvrLineMsg
{
	user = NONE,  
}
when{ user = NONE }
ReqCorssSvrLineMsg = checkUser
when{ }
function ReqCorssSvrLineMsg(user)
	local corssSvrSystem = user:GetSystem("CCrossSvrSystem");
	if not corssSvrSystem then
		return;
	end;
	corssSvrSystem:ReqCorssLineSvr();
end;
--------------------------------------------------------------------------------------
--------------------------------------ks向gs发送的消息--------------------------------
--------------------------------------------------------------------------------------
--接收到跨服战服务器信息
define.ResponseCSInfoMsg
{
    UserPort = 0,
}
when{}
function ResponseCSInfoMsg(UserPort)
    CConfig.CrossServiceNetwork.dwUserPort = UserPort;
end;

--ks返回跨服战请求结果
define.ResponeCrossResToGsMsg
{
	ResCode = 0, 
	RoleID = 0, 
	
}
when{}
function ResponeCrossResToGsMsg(ResCode, RoleID)
	local objPlayer = CPlayerManager:GetPlayerByRoleID(RoleID)
	local objCrossSystem = objPlayer:GetSystem("CCrossSvrSystem");
	objCrossSystem:AllowEnterCrossSvr(ResCode)
end;

--ks返回跨服战请求结果
define.ResponseCrossLineInfoMsg
{
	Info = {},
	RoleID = 0, 
	AccID = 0,
	LineId = 0,
}
when{}
function ResponseCrossLineInfoMsg(Info, RoleID, AccID, LineId)
	local objPlayer = CPlayerManager:GetPlayerByRoleID(RoleID)
	local objCrossSystem = objPlayer:GetSystem("CCrossSvrSystem");
	objCrossSystem:ReturnCrossLineInfo(Info, LineId);
end;

--ks返回跨服战请求结果
define.ReceiveCrossDataMsg
{
	AccountID = 0,
	SystemName = "", 
	Param = {},
	NetId = 0,
}
when{}
function ReceiveCrossDataMsg(AccountID, SystemName, Param, NetId)
	CTransitManager:RecvData(AccountID, SystemName, Param)
	if SystemName == "Player" then
		CCrossSvrManager:SetDataFlag(AccountID, NetId)
	end;
end

--客户端连接服务端的消息
define.ClientConnectCSMsg
{
	AccountId = 0,
	SzSign = "",
}
when{ }
function ClientConnectCSMsg(AccountId, SzSign)
	CCrossSvrManager:ClientConnectFlag(AccountId, SzSign);
end;

-----------------------------------------------------------------------------------------
------------------------------------------退出跨服战场-----------------------------------
-----------------------------------------------------------------------------------------
--玩家请求退出跨服战场
define.ReqExitCorssSvrMsg
{
	user = NONE,  
}
when{ user = NONE }
ReqExitCorssSvrMsg = checkUser
when{ }
function ReqExitCorssSvrMsg(user)
	local corssSvrSystem = user:GetSystem("CCrossSvrSystem");
	if not corssSvrSystem then
		return;
	end;
	corssSvrSystem:ReqExitCross();
end;

--退出跨服战场传送数据
define.SendBackDataToNormalGsMsg
{
	Info = {},
	AccID = 0,
	RoleID = 0,
	Flag = false,
	HoldServerId = 0, 
	HoldId = 0,
	HoldName = "",
}
when{}
function SendBackDataToNormalGsMsg(Info, AccID, RoleID, Flag, HoldServerId, HoldId, HoldName)
	CPlayerManager:RecoverCrossPlayer(AccID, Flag);
	if Info.bOver then
		--if HoldServerId == CConfig.Network.dwServerHostID then
			CCrossSvrHoldManager:SendHoldDataToKs(Info.dwCrossId, HoldId, HoldName, Info.bOver);
		--end;
	end;
	local objPlayer = CPlayerManager:GetPlayerByRoleID(RoleID);
	if not objPlayer then
		return;
	end;
	local crossSystem = objPlayer:GetSystem("CCrossSvrSystem");
	if crossSystem then
		Info.dwHoldServerId = HoldServerId;
        Info.bFlag = Flag;
		crossSystem:UpdateDateLeaveCross(Info);
	end;
end;

--给跨服战场结束时不在线的人发奖励
define.SendBackAwardMsg
{
	AccID = 0, 
	RoleID = 0,
	Honor = 0, 
	Exp= 0,
}
when{}
function SendBackAwardMsg(AccID, RoleID, Honor, Exp)	
	--print("==========SendBackAwardMsg1================", Exp);
	CCrossSvrMgr:UpdateCrossAward(Honor, Exp, RoleID)
end;

define.CheckAllowSendCrossMsg
{
	RoleId = 0, 
	AccID = 0, 
	EnterFlag = false,
}
when{}
function CheckAllowSendCrossMsg(RoleId, AccID, EnterFlag)	
	local objPlayer = CPlayerManager:GetPlayerByRoleID(RoleId);
	if objPlayer then
		objPlayer:GetSystem("CCrossSvrSystem"):ReCheckEnterCross(EnterFlag);
	end;
end;

--同步ks发过来的屠龙刀获得者
define.SendHoldInfoToGsMsg
{	
	CrossId = 0,
	SzHoldInfo = "",
	OverFlag = false, 
}
when{}
function SendHoldInfoToGsMsg(CrossId, SzHoldInfo, OverFlag)
	CCrossSvrHoldManager:SetHoldInfo(CrossId, SzHoldInfo, OverFlag)		
end;
--上线时从ks获得信息初始化gs的manager
define.InitHoldInfoToGsMsg
{	
	HoldInfo = {},
	OverFlag = false,
}
when{}
function InitHoldInfoToGsMsg(HoldInfo, OverFlag)
	CCrossSvrHoldManager:InitHoldInfo(HoldInfo, OverFlag)
end;

define.SendGameCrossStartMsg
{	
	CrossId = 0, 
	MsgId = 0,
}
when{}
function SendGameCrossStartMsg(CrossId, MsgId)
	local msg = SysStringConfigInfo[MsgId]
	--显示广播消息和聊天框消息
	CScriptManager:ChatNotice(msg,nil,true)
end;

--请求显示经验和荣誉值
define.ReqExpDataMsg
{
	user = NONE,  
}
when{ user = NONE }
ReqExpDataMsg = checkUser
when{ }
function ReqExpDataMsg(user)
	local corssSvrSystem = user:GetSystem("CCrossSvrSystem");
	if not corssSvrSystem then
		return;
	end;
	corssSvrSystem:ReqExpData();
end;

define.ClientConnectGSMsg
{
	user = NONE,  
}
when{ user = NONE }
ClientConnectGSMsg = checkUser
when{ }
function ClientConnectGSMsg(user)
	local corssSvrSystem = user:GetSystem("CCrossSvrSystem");
	if not corssSvrSystem then
		return;
	end;
	corssSvrSystem:DealChgGameServer();
end;

--提前获得屠龙刀存入数据库
--退出跨服战场传送数据
define.SendAHeadGetSwordMsg
{
	CrossId = 0, 
	HoldId = 0, 
	HoldAccountId = 0, 
	HoldName = "",
}
when{}
function SendAHeadGetSwordMsg(CrossId, HoldId, HoldAccountId, HoldName)	
	CKernelApp.SendHoldDataToKsMsg{CrossId = CrossId, HoldId = HoldId, HoldName = HoldName, OverFlag = false};
end;


define.CSHonorShopBuyMsg
{
	user = NONE,  
	ItemID = 0,
	ItemCount = 0,
	ItemIndex = 0,
}
when{ user = NONE }
CSHonorShopBuyMsg = checkUser
when{ }
function CSHonorShopBuyMsg(user, ItemID, ItemCount, ItemIndex)
	local corssSvrSystem = user:GetSystem("CCrossSvrSystem");
	if not corssSvrSystem then
		return;
	end;
	corssSvrSystem:HonorShopBuy(ItemID, ItemCount, ItemIndex);
end;
