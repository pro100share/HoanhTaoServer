--[[
功能：好友系统消息定义
作者：周兴团
时间：2012-3-5
]]

_define()
--请求玩家所有的好友信息和最近联系人信息
define.RequestFriendMsg
{
	user = NONE,
}
when{ user = NONE }
RequestFriendMsg = checkUser
when{}
function RequestFriendMsg(user)
	local objSys = user:GetSystem("CFriendSystem");
	if not objSys then
		-- print("RoleID: ", user:GetRoleID(), "RequestFriendMsg");
		return; 
	end;
	--print("RoleID: ", user:GetRoleID(), "RequestFriendMsg");
	--local setF = {};
	--local setC = {};
	--objSys:GetNetData( setF, setC );
	--user.OnRequestFriendMsg{ Friends = setF, Contacts = setC };
	--开启服务端发送列表队列
	objSys:StartSendFriendMsg();
	--objSys:SynchronizeWantMarryState( objSys.dwWantMarryState );--同步征婚状态
end
--客户端请求添加一个好友关系
define.RequestAddFriendMsg
{
	user = NONE,
	RoleID = 0,
}
when{ user = NONE }
RequestAddFriendMsg = checkUser
when{}
function RequestAddFriendMsg(user, RoleID)
	local objSys = user:GetSystem("CFriendSystem");
	if not objSys then
		print("RoleID: ", user:GetRoleID(), "RequestAddFriend");
		return; 
	end;
	--print("RoleID: ", user:GetRoleID(), "RequestAddFriend", RoleID);
	local dwTime = GetCurTime();
	objSys:AddFriend( RoleID, dwTime );
end
--客户端请求删除一个好友关系
define.RequestDeleteFriendMsg
{
	user = NONE,
	RoleID = 0,
}
when{ user = NONE }
RequestDeleteFriendMsg = checkUser
when{}
function RequestDeleteFriendMsg(user, RoleID)
	local objSys = user:GetSystem("CFriendSystem");
	if not objSys then
		print("RoleID: ", user:GetRoleID(), "RequestDeleteFriend");
		return; 
	end;
	--print("RoleID: ", user:GetRoleID(), "RequestDeleteFriend", RoleID);
	objSys:DeleteFriend( RoleID );
end
--[[
--客户端请求添加一个仇人关系，用户无法操作仇人关系
define.RequestAddEnemy
{
	user = NONE,
	RoleID = 0,
}
when{ user = NONE }
RequestAddEnemy = checkUser
when{}
function RequestAddEnemy(user, RoleID)
	local objSys = user:GetSystem("CFriendSystem");
	if not objSys then
		print("RoleID: ", user:GetRoleID(), "RequestAddEnemy");
		return; 
	end;
	print("RoleID: ", user:GetRoleID(), "RequestAddEnemy", RoleID);
	local dwMeetTime = GetCurTime();
	objSys:AddEnemy( RoleID, dwMeetTime );
end
-]]
--客户端请求删除一个好友关系
define.RequestDeleteEnemyMsg
{
	user = NONE,
	RoleID = 0,
}
when{ user = NONE }
RequestDeleteEnemyMsg = checkUser
when{}
function RequestDeleteEnemyMsg(user, RoleID)
	local objSys = user:GetSystem("CFriendSystem");
	if not objSys then
		print("RoleID: ", user:GetRoleID(), "RequestDeleteEnemy");
		return; 
	end;
	--print("RoleID: ", user:GetRoleID(), "RequestDeleteEnemy", RoleID);
	objSys:DeleteEnemy( RoleID );
end
--客户端请求添加一个黑名单
define.RequestAddBlackListMsg
{
	user = NONE,
	RoleID = 0,
}
when{ user = NONE }
RequestAddBlackListMsg = checkUser
when{}
function RequestAddBlackListMsg(user, RoleID)
	local objSys = user:GetSystem("CFriendSystem");
	if not objSys then
		print("RoleID: ", user:GetRoleID(), "RequestAddBlackList");
		return; 
	end;
	--print("RoleID: ", user:GetRoleID(), "RequestAddBlackList", RoleID);
	local dwTime = GetCurTime();
	objSys:AddBlackList( RoleID, dwTime );
end
--客户端请求删除一个黑名单
define.RequestDeleteBlackListMsg
{
	user = NONE,
	RoleID = 0,
}
when{ user = NONE }
RequestDeleteBlackListMsg = checkUser
when{}
function RequestDeleteBlackListMsg(user, RoleID)
	local objSys = user:GetSystem("CFriendSystem");
	if not objSys then
		print("RoleID: ", user:GetRoleID(), "RequestDeleteBlackList");
		return; 
	end;
	--print("RoleID: ", user:GetRoleID(), "RequestDeleteBlackList", RoleID);
	objSys:DeleteBlackList( RoleID );
end
--[[
--客户端请求添加一个最近联系人，客户端无法添加，和仇人一样，由系统判定
define.RequestAddContact
{
	user = NONE,
	RoleID = 0,
}
when{ user = NONE }
RequestAddContact = checkUser
when{}
function RequestAddContact(user, RoleID)
	local objSys = user:GetSystem("CFriendSystem");
	if not objSys then
		print("RoleID: ", user:GetRoleID(), "RequestAddContact");
		return; 
	end;
	print("RoleID: ", user:GetRoleID(), "RequestAddContact", RoleID);
	local dwTime = GetCurTime();
	objSys:UpdateContact( RoleID, dwTime );
end
--]]
--客户端请求删除一个最近联系人
define.RequestDeleteContactMsg
{
	user = NONE,
	RoleID = 0,
}
when{ user = NONE }
RequestDeleteContactMsg = checkUser
when{}
function RequestDeleteContactMsg(user, RoleID)
	local objSys = user:GetSystem("CFriendSystem");
	if not objSys then
		print("RoleID: ", user:GetRoleID(), "RequestDeleteContact");
		return;
	end;
	--print("RoleID: ", user:GetRoleID(), "RequestDeleteContact", RoleID);
	objSys:DeleteContact( RoleID );
end
--客户端请求查询玩家
define.RequestSearchMsg
{
	user = NONE,
	Name = "",
}
when{ user = NONE }
RequestSearchMsg = checkUser
when{}
function RequestSearchMsg(user, Name)
	local objSys = user:GetSystem("CFriendSystem");
	if not objSys then
		print("RoleID: ", user:GetRoleID(), "RequestSearch");
		return;
	end;
	--print("RoleID: ", user:GetRoleID(), "RequestSearch", Name);
	objSys:SearchFriend( Name );
end
--客户端请求获取一个查询结果
define.RequestSearchMsgMsg
{
	user = NONE,
	Page = 0,
}
when{ user = NONE }
RequestSearchMsgMsg = checkUser
when{}
function RequestSearchMsgMsg(user, Page)
	local objSys = user:GetSystem("CFriendSystem");
	if not objSys then
		print("RoleID: ", user:GetRoleID(), "RequestSearchMsg");
		return;
	end;
	--print("RoleID: ", user:GetRoleID(), "RequestSearchMsg", Page);
	objSys:RequestSearchMsg( Page );
end
--客户端请求获取一个用户的详细信息
define.RequestPlayerMsg
{
	user = NONE,
	RoleID = 0,
	HaveAvatar = 0;	--0代表客户端没有Avatar信息，需要回传；1说明已有信息，不用回传
}
when{ user = NONE }
RequestPlayerMsg = checkUser
when{}
function RequestPlayerMsg(user, RoleID, HaveAvatar)
	local objSys = user:GetSystem("CFriendSystem");
	if not objSys then
		print("RoleID: ", user:GetRoleID(), "RequestPlayerMsg");
		return;
	end;
	--print("RoleID: ", user:GetRoleID(), "RequestPlayerMsg", RoleID, HaveAvatar);
	objSys:RequestPlayerMsg( RoleID, HaveAvatar );
end
--客户端请求打探某一个玩家的地图和坐标
define.RequestDaTanMsg
{
	user = NONE,
	RoleID = 0,
}
when{ user = NONE }
RequestDaTanMsg = checkUser
when{}
function RequestDaTanMsg(user, RoleID)
	local objSys = user:GetSystem("CFriendSystem");
	if not objSys then
		print("RoleID: ", user:GetRoleID(), "RequestDaTan");
		return;
	end;
	--print("RoleID: ", user:GetRoleID(), "RequestDaTan", RoleID);
	objSys:RequestDaTan( RoleID );
end
--客户端申请好友平台的信息：征友
define.RequestWantFriendMsg
{
	user = NONE,
}
when{ user = NONE }
RequestWantFriendMsg = checkUser
when{}
function RequestWantFriendMsg(user)
	local objSys = user:GetSystem("CFriendSystem");
	if not objSys then
		print("RoleID: ", user:GetRoleID(), "RequestWantFriend");
		return;
	end;
	--print("RoleID: ", user:GetRoleID(), "RequestWantFriend");
	objSys:RequestWantFriend();
end
--客户端申请好友平台的信息：征婚
define.RequestWantMarryMsg
{
	user = NONE,
	Sex = 0;
}
when{ user = NONE }
RequestWantMarryMsg = checkUser
when{}
function RequestWantMarryMsg(user, Sex)
	local objSys = user:GetSystem("CFriendSystem");
	if not objSys then
		print("RoleID: ", user:GetRoleID(), "RequestWantMarry");
		return;
	end;
	--print("RoleID: ", user:GetRoleID(), "RequestWantMarry");
	objSys:RequestWantMarry(Sex);
end
--客户端申请好友平台的信息：共同仇人
define.RequestSameEnemyMsg
{
	user = NONE,
}
when{ user = NONE }
RequestSameEnemyMsg = checkUser
when{}
function RequestSameEnemyMsg(user)
	local objSys = user:GetSystem("CFriendSystem");
	if not objSys then
		print("RoleID: ", user:GetRoleID(), "RequestSameEnemy");
		return;
	end;
	--print("RoleID: ", user:GetRoleID(), "RequestSameEnemy");
	objSys:RequestSameEnemy();
end
--客户端申请好友平台的信息：某一个人和我的共同仇人ID列表，具体信息在客户端获取
define.RequestSameEnemyIDOfMsg
{
	user = NONE,
	RoleID = 0;
}
when{ user = NONE }
RequestSameEnemyIDOfMsg = checkUser
when{}
function RequestSameEnemyIDOfMsg(user, RoleID)
	local objSys = user:GetSystem("CFriendSystem");
	if not objSys then
		print("RoleID: ", user:GetRoleID(), "RequestSameEnemyIDOf");
		return;
	end;
	--print("RoleID: ", user:GetRoleID(), "RequestSameEnemyIDOf");
	objSys:RequestSameEnemyIDOf(RoleID);
end
--客户端申请征婚信息
define.RequestAddWantMarryMsg
{
	user = NONE,
	Message = "";
}
when{ user = NONE }
RequestAddWantMarryMsg = checkUser
when{}
function RequestAddWantMarryMsg(user, Message)
	local objSys = user:GetSystem("CFriendSystem");
	if not objSys then
		print("RoleID: ", user:GetRoleID(), "RequestAddWantMarry");
		return;
	end;
	--print("RoleID: ", user:GetRoleID(), "RequestAddWantMarry");
	objSys:RequestAddWantMarry(Message);
end

--更改心情和签名
define.RequestChangeMoodMsg
{
	user = NONE,
	Message = {};
}
when{ user = NONE }
RequestChangeMoodMsg = checkUser
when{}
function RequestChangeMoodMsg(user, Message)
	local objSys = user:GetSystem("CFriendSystem");
	if not objSys then
		print("RoleID: ", user:GetRoleID(), "RequestChangeMood");
		return;
	end;
	--print("RoleID: ", user:GetRoleID(), "RequestChangeMood");
	objSys:RequestChangeMood(Message);
end

---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
--从KS服务器上面发送过来的消息
--KS发送需要玩家上传数据的命令
define.KSAskForPlayerDataMsg
{ 
	user = NONE;
	Param = 0;
} 
when{}
function KSAskForPlayerDataMsg(user,Param)
	--print("KSAskForPlayerDataMsg=========", Param);
	local fSys = CFriendManager:GetFriendSystem( Param );
	if fSys then
		fSys:RegPlayerDataToKS();
	end
end
--更新一个玩家的信息，第一个参数是IDs，第二个参数是updateData
define.KSSyncPlayerDataMsg
{ 
	user = NONE;
	Param = {};
} 
when{}
function KSSyncPlayerDataMsg(user,Param)
	--print("KSSyncPlayerDataMsg=========", Param[2].dwRoleID);
	for k,dwRoleID in pairs(Param[1]) do
		local fSys = CFriendManager:GetFriendSystem( dwRoleID );
		if fSys then
			fSys:HandleKSNotify(Param[2]);
		end
	end
end
--玩家第一次登陆GS的时候，初始化其他玩家的在线数据
define.KSSyncFriendDataOnInitMsg
{ 
	user = NONE;
	Param = {};
} 
when{}
function KSSyncFriendDataOnInitMsg(user,Param)
	--print("KSSyncFriendDataOnInitMsg=========", Param[1]);
	local fSys = CFriendManager:GetFriendSystem( Param[1] );
	if fSys then
		fSys:HandleUpdateOnInit(Param[2]);
	end
end
--添加一个好友或者最近联系人等会从KS服务器上面获得玩家数据，
--第一个参数是RoleID，是谁想要这个信息
--第二个参数是添加的类型，1是好友，2是黑名单，3是仇人，4是最近联系人
--第三个参数是信息表，获得的信息
define.KSOnAddPlayerMsg
{ 
	user = NONE;
	Param = {};
} 
when{}
function KSOnAddPlayerMsg(user,Param)
	--print("KSOnAddPlayerMsg=========", Param[1], Param[2], Param[3].dwRoleID);
	local fSys = CFriendManager:GetFriendSystem( Param[1] );
	if not fSys then
		return;
	end
	fSys:HandleKSAdd( Param[2], Param[3] );
end
--好友系统出错消息
define.KSOnAddPlayerErrorMsg
{ 
	user = NONE;
	Param = {};
} 
when{}
function KSOnAddPlayerErrorMsg(user,Param)
	--print("KSOnAddPlayerErrorMsg=========", Param[1]);
	local fSys = CFriendManager:GetFriendSystem( Param[1] );
	if not fSys then
		return;
	end
	fSys:OnError( Param[2]);
end
--被别人添加为好友的时候接收到KS发送的消息
define.KSOnBeAddedFriendMsg
{ 
	user = NONE;
	Param = {};
} 
when{}
function KSOnBeAddedFriendMsg(user,Param)
	--print("KSOnBeAddedFriendMsg=========", Param[1]);
	local fSys = CFriendManager:GetFriendSystem( Param[1] );
	if not fSys then return; end
	fSys:NotifyBeAddedFriend( Param[2] );
end
--接收KS发送的删除消息
--第一个参数是RoleID，是谁想要这个信息
--第二个参数是添加的类型，1是好友，2是黑名单，3是仇人，4是最近联系人
--第三个参数是dwRole
--第四个参数是dwFlag
define.KSOnDeletePlayerMsg
{ 
	user = NONE;
	Param = {};
} 
when{}
function KSOnDeletePlayerMsg(user,Param)
	--print("KSOnDeletePlayerMsg=========");
	local fSys = CFriendManager:GetFriendSystem( Param[1] );
	if not fSys then
		return;
	end
	fSys:HandleKSDelete(Param[2], Param[3], Param[4]);
end
--接收当前最近联系人，从KS上面发送过来的，第一个参数是发给谁，第二个参数是Contact列表
define.KSGetContactMsg
{ 
	user = NONE;
	Param = {};
} 
when{}
function KSGetContactMsg(user,Param)
	--print("KSGetContactMsg=========", Param[1]);
	local fSys = CFriendManager:GetFriendSystem( Param[1] );
	if not fSys then
		return;
	end
	fSys:ReceiveContactFromKS( Param[2] );
end
--从KS上面发送过来的收益信息，第一个参数是roleID，第二个参数是收益ID
define.KSFriendIncomeNoticeMsg
{ 
	user = NONE;
	Param = {};
} 
when{}
function KSFriendIncomeNoticeMsg(user,Param)
	--print("KSFriendIncomeNoticeMsg=========", Param[1]);
	local fSys = CFriendManager:GetFriendSystem( Param[1] );
	if not fSys then
		return;
	end
	fSys:IncomeNotice( Param[2] );
end
--从KS上面发送过来的收益信息，第一个参数是roleID，第二个参数是图标ID
define.KSFriendIconNoticeMsg
{ 
	user = NONE;
	Param = {};
} 
when{}
function KSFriendIconNoticeMsg(user,Param)
	--print("KSFriendIconNoticeMsg=========", Param[1]);
	local fSys = CFriendManager:GetFriendSystem( Param[1] );
	if not fSys then
		return;
	end
	fSys:IconNotice( Param[2] );
end
--从KS上面发送来征婚状态的信息,第一个参数是roleID，第二个参数是征婚状态，第三个参数是征婚信息（已发布才有效）
define.KSWantMarryStateMsg
{ 
	user = NONE;
	Param = {};
} 
when{}
function KSWantMarryStateMsg(user,Param)
	--print("KSWantMarryStateMsg=========", Param[1]);
	local fSys = CFriendManager:GetFriendSystem( Param[1] );
	if not fSys then return; end
	fSys:SynchronizeWantMarryState( Param[2], Param[3] );
end
--从KS上面发送来与某一个玩家的共同仇人ID信息,第一个参数是roleID，第二个参数是IDs，第三个是roleID
define.KSOnRequestEnemyIDMsg
{ 
	user = NONE;
	Param = {};
} 
when{}
function KSOnRequestEnemyIDMsg(user,Param)
	--print("KSOnRequestEnemyIDMsg=========", Param[1]);
	local fSys = CFriendManager:GetFriendSystem( Param[1] );
	if not fSys then return; end
	fSys:SynchronizeEnemyIDs( Param[2], Param[3] );
end
--好友平台共同仇人信息,第一个参数是roleID，第二个参数是信息表
define.KSOnRequestSameEnemyMsg
{ 
	user = NONE;
	Param = {};
} 
when{}
function KSOnRequestSameEnemyMsg(user,Param)
	--print("KSOnRequestSameEnemyMsg=========", Param[1]);
	local fSys = CFriendManager:GetFriendSystem( Param[1] );
	if not fSys then return; end
	fSys:SynchronizeSameEnemy( Param[2] );
end
--好友平台共同仇人信息,第一个参数是roleID，第二个参数是信息表
define.KSOnRequestWantMarryMsg
{ 
	user = NONE;
	Param = {};
} 
when{}
function KSOnRequestWantMarryMsg(user,Param)
	--print("KSOnRequestWantMarryMsg=========", Param[1]);
	local fSys = CFriendManager:GetFriendSystem( Param[1] );
	if not fSys then return; end
	fSys:SynchronizeWantMarry( Param[2], Param[3] );
end
--好友平台共同仇人信息,第一个参数是roleID，第二个参数是信息表
define.KSOnRequestWantFriendMsg
{ 
	user = NONE;
	Param = {};
} 
when{}
function KSOnRequestWantFriendMsg(user,Param)
	--print("KSOnRequestWantFriendMsg=========", Param[1]);
	local fSys = CFriendManager:GetFriendSystem( Param[1] );
	if not fSys then return; end
	fSys:SynchronizeWantFriend( Param[2] );
end
--打探玩家,第一个参数是roleID，第二个参数是信息表
define.KSOnDaTanMsg
{ 
	user = NONE;
	Param = {};
} 
when{}
function KSOnDaTanMsg(user,Param)
	--print("KSOnDaTanMsg=========", Param[1]);
	local fSys = CFriendManager:GetFriendSystem( Param[1] );
	if not fSys then return; end
	fSys:SynchronizeDaTan( Param[2] );
end
--搜索玩家,第一个参数是roleID，page，信息表
define.KSOnRequestSearchMsg
{ 
	user = NONE;
	Param = {};
} 
when{}
function KSOnRequestSearchMsg(user,Param)
	--print("KSOnRequestSearchMsg=========", Param[1]);
	local fSys = CFriendManager:GetFriendSystem( Param[1] );
	if not fSys then return; end
	fSys:SynchronizeSearchMsg( Param[2], Param[3] );
end
--返回搜索的页数和数量
define.KSOnRequestSearchNumberMsg
{ 
	user = NONE;
	Param = {};
} 
when{}
function KSOnRequestSearchNumberMsg(user,Param)
	--print("KSOnRequestSearchNumberMsg=========", Param[1]);
	local fSys = CFriendManager:GetFriendSystem( Param[1] );
	if not fSys then return; end
	fSys:SynchronizeSearchNumberMsg( Param[2], Param[3] );
end


--查看玩家信息,第一个参数是roleID，page，信息表
define.KSOnRequestPlayerMsg
{ 
	user = NONE;
	Param = {};
} 
when{}
function KSOnRequestPlayerMsg(user,Param)
	--print("KSOnRequestPlayerMsg=========", Param[1]);
	local fSys = CFriendManager:GetFriendSystem( Param[1] );
	if not fSys then return; end
	fSys:SynchronizePlayerMsgView( Param[2], Param[3], Param[4], Param[5], Param[6], Param[7] );
end
--KS对本地GS发起一个远程回调，Param：id1（KS自己记录的ID），id2（目标玩家），id3（GS自己记录的ID）， args（参数表）
define.KSRemoteCallMsg
{ 
	user = NONE;
	Param = {};
} 
when{}
function KSRemoteCallMsg(user,Param)
	--print("KSRemoteCallMsg=========" );
	CFriendManager:HandleRemoteCall( Param );
end
--远程回调玩家在线/不在线，Param：在线情况，GSID，参数表
define.KSOnRemoteCallResultMsg
{
	user = NONE;
	Param = {};
} 
when{}
function KSOnRemoteCallResultMsg(user,Param)
	--print("KSOnRemoteCallResultMsg=========" );
	CFriendManager:KSRemoteCallResult( Param );
end








