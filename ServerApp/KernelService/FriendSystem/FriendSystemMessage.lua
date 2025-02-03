--[[
功能：好友系统消息定义
作者：周兴团
时间：2012-3-5
]]
--GS中玩家创建时，询问是否需要上传好友数据
define.GSCheckForLoginMsg
{
	user = NONE;
	Param = 0;--玩家的角色ID
}
when{}
function GSCheckForLoginMsg(user,Param) 
	CFriendDataManager:CheckForLogin( Param );
end
--GS中玩家创建时，发送消息到KS中
define.GSRegPlayerDataMsg
{
	user = NONE;
	Param = {};
}
when{}
function GSRegPlayerDataMsg(user,Param) 
	--从GS发送过来的是玩家的更新信息，需要加上KS上面create时保留的玩家好友数据列表；使用完这后删掉列表。
	CFriendDataManager:PlayerLogin( Param );
end
--GS中有数据更改时，通知KS进行广播
define.GSPlayerDataChangeMsg
{
	user = NONE;
	Param = {};
}
when{}
function GSPlayerDataChangeMsg(user,Param) 
	CFriendDataManager:PlayerDataChange(Param)
end
--GS向KS同步玩家的仇恨值信息，仇恨值是GS来Update的，但是查看共同仇人需要看别人的仇恨值
define.GSPlayerEnemyChangeMsg
{
	user = NONE;
	Param = {};
}
when{}
function GSPlayerEnemyChangeMsg(user,Param) 
	local myid, enemyid, enemy = unpack(Param);
	local playerMe = CGameLineManager:GetPlayer( myid );
	if playerMe then
		local fsys = playerMe:GetSystem("CFriendSystem");
		if fsys then
			fsys:GSEnemyChange( enemyid, enemy );
		end
	end
end
--GS请求KS的某个玩家的数据，参数;dwRoleID, dwFromID, dwType
--dwType: 执行添加操作，1是好友，2是黑名单，3是仇人，4是最近联系人
define.GSRequestAddPlayerMsg
{
	user = NONE;
	Param = {};
}
when{}
function GSRequestAddPlayerMsg(user,Param) 
	CFriendDataManager:RequestAddPlayer( Param )
end
--GS请求删除某个玩家的数据，参数;dwRoleID, dwFromID, dwType
--dwType: 执行添加操作，1是好友，2是黑名单，3是仇人，4是最近联系人
define.GSRequestDeletePlayerMsg
{
	user = NONE;
	Param = {};
}
when{}
function GSRequestDeletePlayerMsg(user,Param) 
	CFriendDataManager:RequestDeletePlayer( Param );
end
--GS中的某个一玩家办理或取消宴席，第一个参数是wife，第二个参数是husband，第三个参数是dwYanHui
define.GSRequestBanquetMsg
{
	user = NONE;
	Param = {};
}
when{}
function GSRequestBanquetMsg(user,Param) 
	local updateMsg = { dwRoleID = Param[1], dwYanHui = Param[3] };
	CFriendDataManager:PlayerDataChange(updateMsg);
	updateMsg = { dwRoleID = Param[2], dwYanHui = Param[3] };
	CFriendDataManager:PlayerDataChange(updateMsg);
end
--GS中的某一个玩家申请征婚，第一个参数是dwRoleID，第二个参数是征婚信息
define.GSRequestModifyWantMarryMsg
{
	user = NONE;
	Param = {};
}
when{}
function GSRequestModifyWantMarryMsg(user,Param) 
	local playerMe = CGameLineManager:GetPlayer( Param[1] );
	if not playerMe then return end;
	local mySys = playerMe:GetSystem("CFriendSystem");
	CFriendManager:AddWantMarry( mySys, Param[2] );
end
--取消征婚信息，第一个参数是玩家的ID
define.GSCancelWantMarryMsg
{
	user = NONE;
	Param = {};
}
when{}
function GSCancelWantMarryMsg(user,Param) 
	CFriendManager:CancelWantMarry( Param[1] );
end
--好友平台的信息，第一个参数是玩家的ID
define.GSRequestPlatformMsg
{
	user = NONE;
	Param = {};
}
when{}
function GSRequestPlatformMsg(user,Param) 
	CFriendManager:HandlePlatformRequest(Param);
end
--搜索好友命令，第一个参数是roleID，第二个参数是搜索的名称
define.GSRequestSearchFriendMsg
{
	user = NONE;
	Param = {};
}
when{}
function GSRequestSearchFriendMsg(user,Param) 
	local playerMe = CGameLineManager:GetPlayer( Param[1] );
	if not playerMe then return end;
	local mySys = playerMe:GetSystem("CFriendSystem");
	mySys:SearchFriend( Param[2] );
end
--申请获取搜索到的数据
define.GSRequestSearchPageMsg
{
	user = NONE;
	Param = {};
}
when{}
function GSRequestSearchPageMsg(user,Param) 
	local playerMe = CGameLineManager:GetPlayer( Param[1] );
	if not playerMe then return end;
	local mySys = playerMe:GetSystem("CFriendSystem");
	mySys:RequestSearchMsg( Param[2] );
end
--GS发起一个远程调用，Param：id1（发起人），id2（目标玩家），id3（GS自己记录的ID）， args（参数表）
define.GSRemoteCallMsg
{
	user = NONE;
	Param = {};
}
when{}
function GSRemoteCallMsg(user,Param) 
	CFriendManager:OnGSRemoteCall( Param );
end
--GS远程回调结果，返回到KS，Param：KSID，在线情况，GSID，参数表
define.GSRemoteCallResultMsg
{
	user = NONE;
	Param = {};
}
when{}
function GSRemoteCallResultMsg(user,Param) 
	CFriendManager:GSRemoteCallResult( Param );
end


--GS中有数据更改时，通知KS进行广播
define.GSPlayerLogoutMsg
{
	user = NONE;
	RoleId = 0;
	OnLine = 0,
}
when{}
function GSPlayerLogoutMsg(user, RoleId, OnLine) 
	if OnLine == 0 then
		CFriendManager:DelFriendSystem( RoleId);--将自己从全局管理器注销
		CFriendDataManager:PlayerLogout(RoleId);
	else
		local player = CPlayerManager:GetPlayerByRoleID(RoleId);
		if player then
			--读取数据库好友数据，发送到GS上面
			local system = player:GetSystem("CFriendSystem");
			system.CashFriendList = {};--缓冲列表，当玩家登陆的时候通过注册操作移除列表
			--加载心情信息
			-- self.objDBQuery:SelectMoodMsg( setMood );
			--加载玩家的好友信息
			system.objDBQuery:LoadFriendInfo( system.CashFriendList );	
		end;
	end;
end










