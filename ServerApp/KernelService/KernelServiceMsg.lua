 --[[
文件：BaseService/BaseServiceMsg.lua
作者：周华杰  
]]

------------------------------------------------------------------------------------------
--游戏服务器基础消息
------------------------------------------------------------------------------------------ 


function _G._fromcallout(func, arg)
    _callout(_from, func, arg);
end;

--接收游戏服务器的注册消息
define.GSRegRequestMsg
{
	Sign = ""; --验证串
	Time = 0;
	WarFlag = 0;--战场服务器标志，1--战场，0--普通服务器
}
when {}
function GSRegRequestMsg(Sign,Time,WarFlag)
	local szStr = "themgai1"..tostring(Time);
	szStr = szStr:md5(); 
	if not Sign:lead(szStr) then
		-- print("GSRegRequestMsg Sign check error",szStr,Sign);
        _fromcallout("GSRegResultMsg", {LineID=-1});
		return;
	end; 
	local dwLineID, objLine = CGameLineManager:RegLine(_from,WarFlag);
	if dwLineID <= 0 then
		-- print("reg lien error by !!!!!",dwLineID);
	end;  
	-- print("objLine.GSRegResultMsg!!!!!!!!",objLine.dwLineID);
    objLine.GSRegResultMsg{LineID=objLine.dwLineID,UserPort=CConfig.CrossServiceNetwork.dwUserPort};
end; 

--GS重连到KS的注册消息
define.GSReConnectRequestMsg
{
	LineID = 0;
	Sign = ""; --验证串
	Time = 0;
	WarFlag = 0;--战场服务器标志，1--战场，0--普通服务器
}
when{}
function GSReConnectRequestMsg(LineID,Sign,Time,WarFlag)
	local szStr = "themgai1"..tostring(Time);
	szStr = szStr:md5();
	if not Sign:lead(szStr) then
		_fromcallout("GSReConnectResultMsg", {Code=0});
		return;
	end;
	
	local dwLineID,objLine = CGameLineManager:AddLine(LineID,_from,WarFlag);
	if not objLine then
		_fromcallout("GSReConnectResultMsg", {Code=0});
		return;
	end
	
	objLine.GSReConnectResultMsg{ Code = 1 };
end

--游戏服务器上发送过来添加一个玩家的结果消息
define.AddPlayerResultMsg
{
	AccountID = 0; --对应的玩家
	ResultCode = 0; --返回结果
	--IsChangeLine = false; --  是不是换线
	IsChangeLine = 0; --  是不是换线  （0：不是换线 1：换线 2：跨服战场）
}
when{}
function AddPlayerResultMsg(AccountID,ResultCode,IsChangeLine) 
	local gameLine = CGameLineManager:GetGameLineBySvrNet(_from);
	local dwLineID = gameLine.dwLineID;

	if IsChangeLine == 0 then
		CGameLineManager:AddPlayerResultBySelect(ResultCode,dwLineID,AccountID)
	elseif IsChangeLine == 1 then 
		CGameLineManager:AddPlayerResultByChange(ResultCode,dwLineID,AccountID)
	end;
end;
--游戏服务器上发送过来创建玩家系统
define.CreatePlayerSystemMsg
{
	AccountID = 0; --对应的玩家
	--IsChangeLine = false; --是不是换线
	IsChangeLine = 0; --是不是换线  （0：不是换线 1：换线 2：跨服战场）
}
when{}
function CreatePlayerSystemMsg(AccountID,IsChangeLine)
	-- print("CreatePlayerSystemMsg(AccountID,IsChangeLine)",AccountID,IsChangeLine);
	
	if IsChangeLine == 0  then
		CLoginCall:GSRoleReady(AccountID,_from);
	else
		CTransitManager:ChangeLineClientOK(AccountID);
	end;
	-- if IsChangeLine then
		-- CTransitManager:ChangeLineClientOK(AccountID);
	-- else
		-- CLoginCall:GSRoleReady(AccountID,_from);
	-- end
end;

-------------------------------------------------------------------------------------------------
---------------------------------------******跨服战场相关*******---------------------------------
-------------------------------------------------------------------------------------------------
--游戏服务器上发送过来创建玩家系统
define.CrossCreatePlayerSystemMsg
{
	AccountID = 0; --对应的玩家
	IsChangeLine = 0; --是不是换线  （0：不是换线 1：换线 2：跨服战场）
}
when{}
function CrossCreatePlayerSystemMsg(AccountID,IsChangeLine)
	CTransitManager:CrossLineClientOK(AccountID);
end;
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------

--游戏服务器上发送过来删除一个玩家的消息
define.DelPlayerMsg
{ 
	AccountID =0;
	CheckStr = "";
    Reason  = 0;
} 
when{}
function DelPlayerMsg(AccountID, CheckStr, Reason)
	_info("destroy user by id:".." " .. AccountID .. " " .. Reason);
	CGameLineManager:DelPlayer(AccountID,CheckStr, Reason);
end; 

--游戏服务器上发过来一条广播命令消息
define.GSBroadCastSourceMsg
{
	RoleID = 0;
	Source = "";
}
when{}
function GSBroadCastSourceMsg(RoleID,Source)
	CGameLineManager:DoBroadCastSourc(RoleID,Source);
end

------------------------------------------------------------------------------------------
--同步玩家信息
------------------------------------------------------------------------------------------
--更新玩家元宝信息
define.UpdatePlayerGoldInfoMsg
{
	RoleID 	= 0;
	Gold 	= 0;		--元宝信息
}
when{}
function UpdatePlayerGoldInfoMsg(RoleID, Gold)
	local player = CPlayerManager:GetPlayer(RoleID);
	if player then
		player:UpdateGold(Gold);
	else
        CAccountDBQuery:SaveGoldToDB(RoleID, Gold);
        local dwDB = CAccountDBQuery:GetGoldByAccountID(RoleID)
        CLogSystemManager:gold_change(self,
            Gold,
            dwDB,
            dwDB)
        _err("Error!!!UpdatePlayerAddictedInfoMsg", RoleID, Gold);
	end;
end;
--更新玩家防沉迷信息
define.UpdatePlayerAddictedInfoMsg
{
	RoleID 	= 0;
	Addicted = 0;
}
when{}
function UpdatePlayerAddictedInfoMsg(RoleID, Addicted)
	local player = CPlayerManager:GetPlayer(RoleID);
	if player then
		player:UpdateAddicted(Addicted);
	else
		_err("Error!!!UpdatePlayerAddictedInfoMsg", RoleID, Addicted);
	end;
end;

--更新角色基础信息
define.UpdateRoleExpMsg
{
	user = NONE;
	Exp = 0;		--总经验
	Level =0;		--等级		
}
when{user = NONE}
UpdateRoleExpMsg = checkGSUser
when{}
function UpdateRoleExpMsg(user,Exp,Level)
	if user then
		user:UpdateRoleExp(Exp or 0,Level or 0);
	end;
end;

--更新角色信息
define.UpdateRoleInfoMsg
{
	user = NONE;
	RoleInfo = {};
}
when{user = NONE}
UpdateRoleInfoMsg = checkGSUser
when{}
function UpdateRoleInfoMsg(user,RoleInfo)
	if user then
		user:SaveInfo(RoleInfo);
	end;
end;

--------------------------------------------------------------------------------------------------------------
--客户端消息
--------------------------------------------------------------------------------------------------------------

--玩家切换游戏线路
define.ChangeLineRequestMsg
{
	user = NONE,
	NewGameLine = 0,
	ChangeLineParam = {};
}
when{ user = NONE }
ChangeLineRequestMsg = checkGSUser
when{ }
function ChangeLineRequestMsg(user,NewGameLine,ChangeLineParam)
	CGameLineManager:ChangeGameLine(user,NewGameLine,ChangeLineParam);
end; 




------------------------------------------------------------------------------------------
--账号服务器消息
------------------------------------------------------------------------------------------ 
--账号服务器发送移动玩家物品位置的操作
-- define.ACCSendMoveItemMsg{
	-- ParamMsg = {};
-- }
-- when{}
-- function ACCSendMoveItemMsg( ParamMsg )
	-- if ParamMsg.role == 0 then
		-- return;--保护措施，roleID为0 的物品是邮件物品
	-- end
	-- local update = 'update "T_Role_Item" set "dwPosition"=$1,"dwPosPage"=$2,"dwPosSlot"=$3 where "dwRoleID"=$4 and "dwItemID"=$5';
	-- CPlayerDBQuery:GetDBQuery():execute(update, ParamMsg.position, ParamMsg.page, ParamMsg.slot, ParamMsg.role, ParamMsg.item );
-- end;
--账号服务器发送删除物品信息---周兴团---8-15
-- define.ACCSendDeleteItemMsg{
	-- ParamMsg = {};
-- }
-- when{}
-- function ACCSendDeleteItemMsg( ParamMsg )
	-- if ParamMsg.role == 0 then
		-- return;--保护措施，roleID为0 的物品是邮件物品
	-- end
	-- local del = 'delete from "T_Role_Item" where "dwRoleID"=$1 and "dwItemID"=$2';
	-- CPlayerDBQuery:GetDBQuery():execute(del, ParamMsg.role, ParamMsg.item );
-- end;
--账号服务器发送添加或修改活动的信息---周兴团---8-21
define.ACCChangeMovementMsg{
	ParamMsg = {};
}
when{}
function ACCChangeMovementMsg( ParamMsg )
	
end;
--账号服务器发送添加或修改活动的信息---周兴团---8-21
define.ACCUpdateMovementMsg{
	ParamMsg = {};
}
when{}
function ACCUpdateMovementMsg( ParamMsg )
	
end;
--账号服务器发送更改商城物品的操作---周兴团---8-21
define.ACCChangeMallMsg{
	ParamMsg = {};
}
when{}
function ACCChangeMallMsg( ParamMsg )
	local tabLineList = CGameLineManager:GetAllLine()
	for k,v in pairs(tabLineList) do
		v.KSOnChangeMallRequestMsg { ParamMsg = ParamMsg };
	end
end;
--账号服务器发送禁言、解禁信息---周兴团---8-15
define.ACCSendBanSpeakMsg{
	BanMsg = {};
}
when{}
function ACCSendBanSpeakMsg( BanMsg )
	local dwRoleID = BanMsg[1];
	if not dwRoleID then
		return;
	end;
	--如果玩家在线，那么直接禁言玩家
	local player = CPlayerManager:GetPlayerByRoleID(dwRoleID);
	if player then
		player.objLine.KSOnBanSpeakMsg{ Param = BanMsg };
	end
end;
--账号服务器发送封号、解封信息---周兴团---8-15
define.ACCSendLockRoleMsg{
	LockMsg = {};
}
when{}
function ACCSendLockRoleMsg( LockMsg )
	local dwRoleID = LockMsg[1];
	if not dwRoleID then
		return;
	end;
	--如果玩家在线，那么将玩家直接T下线
	local player = CPlayerManager:GetPlayerByRoleID(dwRoleID);
	if player then
		CPlayerManager:KickPlayerDownByRoleID(dwRoleID);
	end
end;
--账号服务器发送邮件给某一个玩家---周兴团---8-8
define.ACCSendMailMsg{
	MailMsg = {};
}
when{}
function ACCSendMailMsg( MailMsg )
	--查找玩家是否在线，在线则发送到该玩家所在的GS进行处理，不在线则选取一条游戏线路
	local player = CPlayerManager:GetPlayerByRoleID(tonumber(MailMsg.role));
	local lineObj = nil;
	if player then
		lineObj = player.objLine;
	else
		local tabLineList = CGameLineManager:GetAllLine();
		for k,v in pairs(tabLineList) do
			lineObj = v;
			break;
		end
	end
	--这里，只有找到一条线，才能够成功保存邮件，如果游戏服务器的线没有，那么将会失败
	if lineObj then
		lineObj.KSOnSendMailRequestMsg{ MailMsg = MailMsg };
	else
		-- print("Send Mail Failed, line not existed");
	end
end;
--账号服务器发送公告到全服---周兴团---8-8
define.ACCSendNoticeMsg{
	Notice = "";
}
when{}
function ACCSendNoticeMsg( Notice )
	--发送一条公告到全服
	local tabLineList = CGameLineManager:GetAllLine()
	for k,v in pairs(tabLineList) do
		v.OnKSSendNoticeMsg { Notice = Notice };
	end
end;
--账号服务器处理玩家充值的时候，发送充值信息到游戏服务器--周兴团
define.PlayerChargeACCMsg{
	AccountID=0;
	Gold = 0;
	Money = 0;
	Balance = 0;
}
when{}
function PlayerChargeACCMsg(AccountID, Gold, Money, Balance)
	local player = CPlayerManager:GetPlayer(AccountID);
	if not player then
		return;
	end
	--修改玩家的元宝信息
	player:ChargeGold( Gold );
end;



-------------------------------------------------------------------------------
--LiS和KS的登录通信
function _G.OnRoleLoginCheck(nAccountID)
    CPlayerManager:RoleLoginCheck(nAccountID);
end;
--select line
-- define.OnRoleLoginMsg
-- {
	-- AccountID = 0;
	-- LineID = 0;
	-- AdultFlag = 0;
	-- RoleInfo = {};
-- }
-- when{}
function _G.OnRoleLogin(AccountID,LineID,AdultFlag,RoleInfo)
	CPlayerManager:RoleLogin(AccountID,LineID,AdultFlag,RoleInfo)
end;

-- define.OnRoleLoadOverMsg
-- {
	-- AccountID = 0;
	-- SendToLine = 0;
-- }
-- when{}
-- function OnRoleLoadOverMsg(AccountID,SendToLine)
	-- CLoginCall:RoleLoginOver(AccountID,SendToLine);
-- end;


-------------------------------------------------------------------------------
--GS回连的消息
--GS发送角色数据
define.OnGSReConnectRoleInfoMsg
{
	RoleInfoList = {};
}
when{}
function OnGSReConnectRoleInfoMsg(RoleInfoList)
	local objLine = CGameLineManager:GetGameLineBySvrNet(_from);
	if not objLine then
		return;
	end
	
	CPlayerManager:ReConnectRole(RoleInfoList,objLine);
end;
