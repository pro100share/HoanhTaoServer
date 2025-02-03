--[[
功能：聊天系统消息定义
作者：周兴团
时间：2012-3-15
]]

_define()
--玩家请求发送一条消息
define.RequestSendChatMsg
{
	user = NONE,
	Msg = {};		--聊天消息结构体，SChatMessageNet
}
when{ user = NONE }
RequestSendChatMsg = checkUser
when{}
function RequestSendChatMsg(user, Msg)
	local objSys = user:GetSystem("CChatSystem");
	if not objSys then
--		print("RoleID: ", user:GetRoleID(), "RequestSendChatMsg", Msg.dwChannel);
		return; 
	end;
	--print("RoleID: ", user:GetRoleID(), "RequestSendChatMsg", Msg.dwChannel);
	objSys:SendMessage(Msg);
end
--玩家请求转换频道
define.RequestChangeChannelMsg
{
	user = NONE,
	Channel = 0;--频道枚举
}
when{ user = NONE }
RequestChangeChannelMsg = checkUser
when{}
function RequestChangeChannelMsg(user, Channel)
	local objSys = user:GetSystem("CChatSystem");
	if not objSys then
		print("RoleID: ", user:GetRoleID(), "RequestChangeChannel");
		return; 
	end;
	--print("RoleID: ", user:GetRoleID(), "RequestChangeChannel", Channel);
	objSys:ChangeChannel(Channel);
end
--玩家请求开启或者关闭私聊功能
define.RequestForbidPrivateMsg
{
	user = NONE,
	State = 0;--频道枚举
}
when{ user = NONE }
RequestForbidPrivateMsg = checkUser
when{}
function RequestForbidPrivateMsg(user, State)
	local objSys = user:GetSystem("CChatSystem");
	if not objSys then
		print("RoleID: ", user:GetRoleID(), "RequestForbidPrivate");
		return; 
	end;
	--print("RoleID: ", user:GetRoleID(), "RequestForbidPrivate", State);
	objSys:SetPrivateState(State);
end


--私聊 查询玩家消息
define.RequestPrivateSearchNameMsg
{
	user = NONE,
	Name = ""      --要查询玩家的名字
}
when{ user = NONE }
RequestPrivateSearchNameMsg = checkUser
when{}
function RequestPrivateSearchNameMsg(user, Name)
	local objSys = user:GetSystem("CChatSystem");
	if not objSys then
		_info("RoleID: ", user:GetRoleID(), "RequestPrivateSearchNameMsg");
		return; 
	end;
	objSys:SearchPrivatePlayerByNameList(Name,user:GetRoleID());
end

--私聊 查询玩家信息列表
define.SearchPrivatePlayerNameListMsg
{
	user = NONE,
	Pagenum = 0      --要查询玩家的名字
}
when{ user = NONE }
SearchPrivatePlayerNameListMsg = checkUser
when{}
function SearchPrivatePlayerNameListMsg(user, Pagenum)
	local objSys = user:GetSystem("CChatSystem");
	if not objSys then
		_info("RoleID: ", user:GetRoleID(), "SearchPrivatePlayerNameListMsg");
		return; 
	end;
	objSys:GetSearchPlayerByNameInPage(Pagenum);
end
--KS发来的消息

--私聊 查询玩家消息
define.KGSeaPriPlayerByNameListMsg
{
	RoleID = 0,
	Name = "",
	ParamInfo = {},
}
when{}
function KGSeaPriPlayerByNameListMsg(RoleID,Name,ParamInfo)
	local objSelf = CPlayerManager:GetPlayerByRoleID(RoleID)
	if(not objSelf) then
		_info("kGSearchPrivatePlayerByName is no player roleid:")
		return;
	end
	local objSys = objSelf:GetSystem("CChatSystem");
	if not objSys then
		_info("RoleID: ", objSelf:GetRoleID(), "kGSearchPrivatePlayerByName");
		return; 
	end;
	objSys:KGSearchPrivatePlayerByName(ParamInfo,Name,RoleID)
end


define.OnKSGuildChatMsg
{
	RoleList = {};
	Msg = {};
}
when{}
function OnKSGuildChatMsg(RoleList,Msg)
	local tabPlayerList = {};
	for k in pairs(RoleList) do
		tabPlayerList[k] = CPlayerManager:GetPlayerByRoleID(k);
	end
	for k,v in pairs(tabPlayerList) do
		local objSystem = v:GetSystem('CChatSystem');
		objSystem:ReceiveMessage(Msg);
	end
end;

define.OnKSTrumpetChatMsg
{
	Msg = {};
}
when{}
function OnKSTrumpetChatMsg(Msg)
	for k,v in pairs(CPlayerManager.setAllPlayer) do
		local objSystem = v:GetSystem('CChatSystem');
		objSystem:ReceiveMessage(Msg);
	end
end;

define.OnKSLineChatMsg
{
	Msg = {};
}
when{}
function OnKSLineChatMsg(Msg)
	for k,v in pairs(CPlayerManager.setAllPlayer) do
		local objSystem = v:GetSystem('CChatSystem');
		objSystem:ReceiveMessage(Msg);
	end
end;

define.OnKSSendNoticeMsg
{
	Notice = "";
}
when{}
function OnKSSendNoticeMsg(Notice)
	CChatManager:SendGongGao( Notice );
end;

---KS发送消息过来
define.KSOnBanSpeakMsg
{ 
	user = NONE;
	Param = {};
} 
when{}
function KSOnBanSpeakMsg(user,Param)
	--print("KSOnBanSpeakMsg=========", Param[1],Param[2]);
	local player = CPlayerManager:GetPlayerByRoleID(Param[1]);
	if player then
		local chatsys = player:GetSystem('CChatSystem');
		if chatsys then
			--通知玩家的客户端，被禁言了
			chatsys:BanSpeak( Param[2] or 0, Param[3] or 0 );
		end
	end
end
--KS返回查询到的玩家ID
define.KSOnFindRoleIDMsg
{ 
	user = NONE;
	FromRoleID = 0;
	CashID = 0;
	QueryID = 0;
} 
when{}
function KSOnFindRoleIDMsg(user,FromRoleID,CashID,QueryID)
	--print("KSOnFindRoleIDMsg",FromRoleID,CashID,QueryID)
	local player = CPlayerManager:GetPlayerByRoleID(FromRoleID);
	if player then
		local chatsys = player:GetSystem('CChatSystem');
		if chatsys then
			chatsys:OnKSFindRoleID( CashID, QueryID );
		end
	end
end

