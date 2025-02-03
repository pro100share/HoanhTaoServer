--[[
功能：聊天系统
作者：周兴团
时间：2012-3-12
]]

------------------------------------------------------------------------------------------------------------------------------------
_G.CChatSystem = {};
CChatSystem.dwLimited = 20;	--记录消息的上限
CChatSystem.dwSaveTime = 20 * 60 * 1000;--数据保存到数据库的时间间隔
function CChatSystem:new()
	local obj = CSystem:new("CChatSystem");
	obj.objDBQuery = nil;		--数据库查询模块
	obj.dwRoleID = 0;			--记录自己的角色ID
	obj.dwSaveCount = CChatSystem.dwSaveTime;--保存到数据库的计时
	obj.setSendMsg = {};	--记录自己发送的消息列表，key是序号,value是SChatMessage结构体
	obj.setTypeToMsg = {
		[enChatChannel.eNearby]={};
		[enChatChannel.ePrivate]={};
		[enChatChannel.eTeam]={};
		[enChatChannel.eFaction]={};
		[enChatChannel.eLine]={};
	};
	obj.dwIDSequence = 0;		--聊天信息的ID序列号，序列号先自增，然后再返回
	obj.dwChannel = enChatChannel.eAll;--记录客户端接收的消息频道，默认是综合频道
	obj.dwPrivateState = 1;--默认不禁止私聊,0为禁止
	obj.dwBanStart = 0;	--管理员设置的禁言开始时间
	obj.dwBanTime = 0;	--管理员设置的禁言时间
	obj.setPrivateChatCash = {};--本地私聊缓存信息，当需要去KS上面查找玩家ID的时候，需要缓存消息
	obj.dwPrivateChatID = 0;	--本地私聊缓存的ID
	obj.setMsgSendCash = {};	--发给某一个玩家的所有消息缓存列表，规则：每个update只发送5条消息，最多累计缓存100条，发不完就替换最老的
	obj.dwSendStart = 1;		--缓存中开始的下标
	obj.dwSendEnd	= 1;		--缓存中结束的下标
	
	obj.dwSplOwner = 0;	--游戏内服务人员标志，不消耗喇叭，字体颜色改变
	
	for i,v in pairs(CChatSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end
function CChatSystem:Create(bIsChangeLine)
	--记录自己的角色ID
	local objPlayer = self:GetPlayer();
	self.dwRoleID = objPlayer:GetRoleID();--记录下自己的角色ID
	--将自己注册到CChatManager中
	if bIsChangeLine == 1 then
	--if bIsChangeLine then
		CChatManager:RegChatSystem( self );--移动到进入场景之后再记录系统
	end
	if bIsChangeLine ~= 2 then
		--创建数据库查询模块
		local objDB = objPlayer:GetDBQuery();
		--print("objDB============================== ", objDB);
		self.objDBQuery = CChatSystemDB:new(objDB, self);
		--从换线中心获取数据
		local datalist = objPlayer:GetLineData("CChatSystem")
		self.dwBanStart = datalist[1].dwBanStart;
		self.dwBanTime = datalist[1].dwBanTime;
		--print("dwBanStart,dwBanTime",self.dwBanStart,self.dwBanTime)
	end;
	return true;
end
function CChatSystem:Update(dwInterval)
	self.dwSaveCount = self.dwSaveCount - dwInterval;
	--时间到达的话，保存数据到数据库，同时清理当前自己发送的聊天记录
	if self.dwSaveCount <= 0 then
		--self.objDBQuery:SaveSendMsg( self.setSendMsg );
		self.setSendMsg = {};
		self.dwSaveCount = CChatSystem.dwSaveTime;
	end
	--发送缓存的聊天消息
	self:SendMsgListNow();
	return true;
end;
function CChatSystem:Destroy()
	--将自己从CChatManager中注销
	CChatManager:UnRegChatSystem( self.dwRoleID );
	--保存剩余的聊天信息到数据库
	if self.objDBQuery then
		--self.objDBQuery:SaveSendMsg( self.setSendMsg );
	end
end
--进入场景之后
function CChatSystem:OnEnterScene()
	--将自己注册到CChatManager中
	CChatManager:RegChatSystem( self );
end
function CChatSystem:OnChangeLineBegin(dwNewLineID)
	local objPlayer = self:GetPlayer();
	--将数据提交到换线中心
	local banmsg = { dwBanStart=self.dwBanStart, dwBanTime=self.dwBanTime };
	objPlayer:SetLineData("CChatSystem", banmsg);
end
function CChatSystem:SetSpecialFlag(dwFlag)
	if dwFlag == 0 then
		self.dwSplOwner = 0;
		return;
	end
	
	dwFlag = dwFlag or 1;
	
	local dwMode1 = 10^(dwFlag-1);
	local dwMode2 = 10^dwFlag;
	local dwCurMode = math.floor((self.dwSplOwner%dwMode2)/dwMode1);
	
	if dwCurMode == 0 then
		local dwAdd = 10^(dwFlag-1);
		self.dwSplOwner = self.dwSplOwner + dwAdd;
	end
end;
-------------------------------------------------------------------------------------------------------------------------------------------------------------
--玩家被管理员禁言或者解禁的操作接口---8-20，单位都是秒
function CChatSystem:BanSpeak( dwBanStart, dwBanTime )
	self.dwBanStart = dwBanStart;
	self.dwBanTime = dwBanTime;
end
--检查玩家是否被禁言
function CChatSystem:IsBanSpeak()
	if self.dwBanTime == 0 then
		return false;
	end
	local curTime = math.floor(GetCurTime()/1000)--_time(1,{year=1970,month=1,day=1,hour=0,min=0,sec=0});
	--print("ban speak",self.dwBanStart, self.dwBanTime, curTime)
	if self.dwBanStart + self.dwBanTime < curTime then
		return false;
	end
	return true;
end
--获取玩家是否禁止私聊
function CChatSystem:IsForbidPrivate()
	return self.dwPrivateState == 0;
end
--设置私聊状态
function CChatSystem:SetPrivateState(dwState)
	self.dwPrivateState = dwState;
end
--客户端修改当前接收的消息频道，接收的类型只有0~5
function CChatSystem:ChangeChannel(dwChannel)
	--同一个频道则不响应，也不应该会有这种情况；不接受转换到喇叭频道
	if self.dwChannel == dwChannel or dwChannel == enChatChannel.eTrumpet then
		return;
	end
	self.dwChannel = dwChannel;
end
--拷贝所有缓存的消息到一个列表，同时按照时间排序，返回列表
function CChatSystem:GetAndClearAllMsg(bClear)
	local msgl = {};
	--获取所有信息的列表
	for dwChannel,mList in pairs(self.setTypeToMsg) do
		for k,sMsg in pairs(mList) do
			table.insert(msgl, sMsg);
		end
	end
	if bClear then
		self.setTypeToMsg = {
			[enChatChannel.eNearby]={};
			[enChatChannel.ePrivate]={};
			[enChatChannel.eTeam]={};
			[enChatChannel.eFaction]={};
			[enChatChannel.eLine]={};
		};
	end
	return msgl;
end

local function IsHaveFlag(dwNumber,dwCode)
	if not dwNumber then
		return false;
	end
	local dwMode1 = 10^(dwCode-1);
	local dwMode2 = 10^dwCode;
	local dwCurMode = math.floor((dwNumber%dwMode2)/dwMode1);
	
	return dwCurMode > 0;
end;

--使用一个喇叭，返回true和false说明使用情况
function CChatSystem:UseTrumpet()
	if self.dwSplOwner ~= 0 then
		for k,v in pairs(ChatSplMem)do
			if IsHaveFlag(self.dwSplOwner,v) then
				if not ChatSplMemberText[v].isNeedTrumpet then
					return true;
				end
			end
		end
	end
	local dwItemEnum = 5500010;
	local itemSys = self:GetPlayer():GetSystem("CItemSystem");
	local dwCounts, _, _ = itemSys:GetEnumItemNumInPacket(dwItemEnum);
	if dwCounts < 1 then
		return false;
	end;
	--使用喇叭
	--事件中心,抛出使用道具事件
    if itemSys:DelEnumItemInPacket(dwItemEnum, 1, false, _G.ItemSysOperType.ChatCost) then
		local objEventCenter = self:GetPlayer():GetSystem('CPlayerEventCenterSystem');
		if objEventCenter then
			objEventCenter:DoEvent(enumPlayerEventType.EventUseItem, dwItemEnum)
			objEventCenter:DoEvent(enumPlayerEventType.EventTrumpet)
		end
		return true;
    end;
    return false;
end
--发送一个世界频道的信息
function CChatSystem:SendLineMsg( strText )
	local sMsgNet = SChatMessageNet:new();
	sMsgNet.strSender = self:GetRoleName();--记录自己的名字
	sMsgNet.dwChannel = enChatChannel.eLine;
	sMsgNet.strText = strText;
	sMsgNet.strSendTo = "";
	sMsgNet.Items = {};
	sMsgNet.Mounts = {};
	sMsgNet.Booth = {};
	self:SendMessage(sMsgNet,true);
end

--接收从客户端发送的一条消息，sMsgNet参数是SChatMessageNet结构
function CChatSystem:SendMessage(sMsgNet,isSys)
	if not sMsgNet.strText then
		return;
	end
	--检查玩家是否被禁言
	if self:IsBanSpeak() then
		self:Error( 6000310016 );
		return;
	end
	--检测权限
	local szAuth = ChannelAuthority[sMsgNet.dwChannel];
	if szAuth then
		if not self:HasAuthority(szAuth) then
			return;
		end
	end
	
	local sMsg = SChatMessage:new();
	for k,v in pairs(sMsgNet) do
		sMsg[k] = v;
	end
	--判断消息是不是喇叭消息，使用喇叭
	if sMsgNet.dwChannel == enChatChannel.eTrumpet and not self:UseTrumpet() then
		return;
	end
	
	
	local objSelf = self:GetPlayer();
	local itemSys = objSelf:GetSystem("CItemSystem");
	local skillSys = objSelf:GetSystem("CSkillSystem");
	--判断消耗
	if not isSys then
		local tbCost = enChatCost[sMsgNet.dwChannel];
		if tbCost then
			if tbCost.dwMoney > 0 then
				if itemSys:IsPacketMoneyEnough(tbCost.dwMoney) then
					itemSys:CostPacketMoney(tbCost.dwMoney, _G.ItemSysOperType.ChatCost);
				else
					itemSys:OnError(6000360002);
					return;
				end
			end
			
			local tbInfo = skillSys:GetInfo();
			local dwMP = tbInfo.dwMP;
			local dwMPCost = tbInfo.dwMPMax * tbCost.dwMP / 10000;
			if dwMP < dwMPCost then
				itemSys:OnError(6000350020);
				return;
			end
			skillSys:ChgMP(0-dwMPCost,false,-1,0);
		end
	end
	
	sMsg.dwSysFlag = 0;
	if isSys then
		sMsg.dwSysFlag = 1;
	end
	sMsg.dwRoleID = objSelf:GetRoleID();
	sMsg.dwMessageID = self:GetNextMsgID();
	sMsg.dwTime = GetCurTime();
	sMsg.dwSendVip = 0;
	if not CConfig.bIsCrossSvr then
		if objSelf:GetSystem("CVipSystem"):IsVip() then
			sMsg.dwSendVip = 1;
		end
	end;
	if self.dwSplOwner then
		sMsg.dwSplFlag = self.dwSplOwner;
	end
	
	if not CConfig.bIsCrossSvr then
		sMsg.dwSendLeader = objSelf:GetSystem("CAllianceLeaderSystem").dwType;
	end;
	--table.insert(self.setSendMsg, sMsg);
	--查看玩家是否发送了物品信息，去物品系统找出相应物品
	local Items = {};
	local dwCount = 0;
	for k,dwItemID in pairs(sMsgNet.Items) do
		local objItem = itemSys:GetItem( dwItemID );
		if objItem then
			--local itMsg = SItemMessage:new();
			local itMsg = objItem:GetNetData();
			Items[dwItemID] = itMsg;
			dwCount = dwCount + 1;
		end
	end
--	print("Server dwCount Item Msg Send " .. dwCount);
	--Items = CItemSystem:KeyNameToNumber( Items );
	sMsg.Items = Items;
	if sMsg.dwChannel == enChatChannel.ePrivate then
		self:SendPrivateChat( sMsg );
	else
		--让Manager进行消息的发送
		CChatManager:SendMsg( sMsg );
	end
	
	if sMsgNet.dwChannel == enChatChannel.eLine then
		objSelf:GetSystem('CPlayerEventCenterSystem'):DoEvent(enumPlayerEventType.EventChatLineMsg, 1)
	end
	
	CLogSystemManager:chat(objSelf, sMsg.dwSendTo, sMsg.strSendTo, sMsg.strText , sMsg.dwChannel)
end
--保存一条私聊消息到缓存，返回缓存ID
function CChatSystem:PrivateChatCash( sMsg )
	self.dwPrivateChatID = self.dwPrivateChatID + 1;
	self.setPrivateChatCash[self.dwPrivateChatID] = sMsg;
	return self.dwPrivateChatID;
end
--获取一条私聊缓存的消息
function CChatSystem:GetPrivateChatCash( dwID )
	return self.setPrivateChatCash[dwID];
end
--删除一条私聊信息的缓存
function CChatSystem:RemovePrivateChatCash(dwID)
	self.setPrivateChatCash[dwID] = nil;
end
--发送一个远程调用函数，用来发送私聊
function CChatSystem:SendPrivateChat( sMsg )
	--缓存sMsg到本地，等待KS返回消息
	local dwID = self:PrivateChatCash( sMsg );
	--判断客户端传送过来的信息是否携带dwSendTo，不存在就先查当地是否存在，不存在就去KS获取
	local cbfunc = function(_, result, _)
		if result == -1 then
			--通知客户端，玩家已经下线
			self:Error(6000310002, 0, 0, sMsg.strSendTo);
			self:RemovePrivateChatCash(dwID);
		end;
	end;
	local func = function(dwRoleID)
		GSRemoteCall(dwRoleID,"CChatSystem","PrivateCB", { sMsg, dwID },cbfunc);
		--print("GSRemoteCall to",dwRoleID,dwID);
	end
	if sMsg.dwSendTo ~= 0 then
		func(sMsg.dwSendTo);
		--print("id find at client..............")
	else
		local toid = CFriendManager:QueryID( sMsg.strSendTo );
		if toid then
			--当地查到ID，直接发送消息
			--print("find toid at local ", toid)
			func(toid);
		else
			--到KS上面查询玩家的ID
			CKernelApp.GSFindRoleIDMsg{ RoleName=sMsg.strSendTo, FromRoleID=self.dwRoleID, CashID=dwID };
			--print("==================query role id")
		end
	end
end

----私聊中，玩家不存在或下线
function CChatSystem:PrivatePlayerError(strSendTo)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	objPlayer.OnRecSearchPlayerByNameErrorMsg{ Name = strSendTo }
end
---私聊中 根据玩家名字查询玩家
function CChatSystem:SearchPrivatePlayerByNameList(name,dwRoleID)
	CChatManager:GKSearchPrivatePlayerByName(name,dwRoleID) 
end
-----获取搜寻玩家列表中的某一页
function CChatSystem:GetSearchPlayerByNameInPage(pagenum)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return
	end;
	if(pagenum < 1 or pagenum > #CChatManager.setSearchPlayerInfoByName) then
		_info("GetSearchPlayerByNameInPage(pagenum) pagenum is error",pagenum)
		return;
	end
	local t = CChatManager:GetSearchPlayerByNameInPage(pagenum)
	local index = 1
	local tt = {}
	for k,v in pairs (t) do
		tt[index] = v
		index = index + 1
	end
	objPlayer.OnRecSearchPlayerByNameListMsg{paramInfo = tt}
end
-------私聊中 根据玩家名字查询玩家 ks 返回
function CChatSystem:KGSearchPrivatePlayerByName(paramInfo,strName,dwRoleID)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return
	end;
	if( dwRoleID ~= objPlayer:GetRoleID() ) then
		return
	end
	CChatManager.setSearchPlayerInfoByName = {}
	for k , v in pairs (paramInfo) do
		if(k ~= dwRoleID) then
			local iteminfo = {
			name = "",
			level = 0,
			prof = ""
			}
			strName = string.lower(strName);
			local name = v.name;
			local s = string.sub(name, 6, #name)
			if string.find(s, strName) then
				iteminfo.name = name
				iteminfo.level = v.level
				iteminfo.prof = v.prof
				iteminfo.roleid = k
				table.insert(CChatManager.setSearchPlayerInfoByName, iteminfo);
			end
		end
	end
	if( (#CChatManager.setSearchPlayerInfoByName) == 0) then
		objPlayer.NoticeSystemNoticeStrMsg{Type=1,Str=string.format(_G.SysStringConfigInfo[6000310002],strName)}
		return
	end
	self:GetSearchPlayerByNameInPage(1);
	objPlayer.SearchPrivatePlayerByNameTotalPageMsg{maxpagenum = math.ceil(#CChatManager.setSearchPlayerInfoByName/5)}
end


--KS上面查询到了玩家ID，调用回调发送消息
function CChatSystem:OnKSFindRoleID( dwCashID, dwQueryID )
	local sMsg = self:GetPrivateChatCash(dwCashID);
	if not sMsg then
		return;
	end
	if dwQueryID == 0 then
		--print("消息发送对象的玩家不在线或不存在");
		self:Error(6000310002, 0, 0, sMsg.strSendTo);
		self:PrivatePlayerError(sMsg.strSendTo)
		self:RemovePrivateChatCash(dwCashID);
	-- elseif(dwQueryID == -1) then ---玩家自己
		-- self:Error(6000310001, 0, 0, sMsg.strSendTo);
		-- self:PrivatePlayerError(sMsg.strSendTo)
		-- self:RemovePrivateChatCash(dwCashID);
	else
		local cbfunc = function(_, result, _)
			if result == -1 then
				--通知客户端，玩家已经下线
				self:Error(6000310002, 0, 0, sMsg.strSendTo);
				self:RemovePrivateChatCash(dwCashID);
			end;
		end;
		GSRemoteCall(dwQueryID,"CChatSystem","PrivateCB", { sMsg, dwCashID },cbfunc);
	end
end
--处理私聊远程调用的函数
function CChatSystem:PrivateCB( chatMsg, dwCashID )
	local settingsys = self:GetPlayer():GetSystem("CSettingSystem");
	local result = nil;
	if not settingsys:CanAcceptPrivateChat() then
		result = { 0 };--不接受私聊，返回结果
	else
		--可以接收私聊，同时更新自己的信息给发送方
		local vip = 0;
		if self:GetPlayer():GetSystem("CVipSystem"):IsVip() then
			vip = 1;
		end
		chatMsg.dwSendTo = self.dwRoleID;
		chatMsg.dwRecvVip = vip;
		chatMsg.dwRecvLeader = self:GetPlayer():GetSystem("CAllianceLeaderSystem").dwType;
		--发送消息给当前玩家
		self:ReceiveMessage( chatMsg );
		--添加对方到最近联系人
		--local friSys = self:GetPlayer():GetSystem("CFriendSystem");
		--friSys:UpdateContact( chatMsg.dwRoleID );
		result = { 1, self.dwRoleID, vip, chatMsg.dwRecvLeader };
	end
	GSRemoteCall(chatMsg.dwRoleID,"CChatSystem","PrivateCBResult", { result, dwCashID },nil);
end
--接收远程私聊的返回信息
function CChatSystem:PrivateCBResult( result, dwCashID )
	--获取缓存的sMsg
	local sMsg = self:GetPrivateChatCash(dwCashID);
	if not sMsg then
		return;
	end
	if result[1] == 0 then
		--玩家拒绝接收私聊
		self:Error(6000310009);
	else
		--发送成功，给自己发送私聊信息
		sMsg.dwSendTo = result[2];
		sMsg.dwRecvVip = result[3];
		sMsg.dwRecvLeader = result[4];
		self:ReceiveMessage( sMsg );
		--添加对方到最近联系人
		local friSys = self:GetPlayer():GetSystem("CFriendSystem");
		friSys:UpdateContact( sMsg.dwSendTo );
	end
	self:RemovePrivateChatCash(dwCashID);
end

--从Manager接收到一条消息，发送的类型只有1~6,6是喇叭
function CChatSystem:ReceiveMessage( sMsg )
	--判断是喇叭则直接转发--喇叭的优先级要高于黑名单--10-9
	if sMsg.dwChannel == enChatChannel.eTrumpet then
		return self:SynchronizeMsg( sMsg );
	end
	--检测对方是否是在自己黑名单里面，如果存在则不接收这条消息
	--print("========CConfig.bIsCrossSvr========", CConfig.bIsCrossSvr);
	if not CConfig.bIsCrossSvr then
		local friSys = self:GetPlayer():GetSystem("CFriendSystem");
		if friSys:IsHaveInBlackList(sMsg.dwRoleID) then
			return;
		end
	end;
	--[[  --加最近联系人在发送私聊成功的地方---消息缓存取消--10-9
	--判断是私聊则将对方加为自己的最近联系人
	local dwRoleID = sMsg.dwRoleID;
	if sMsg.dwChannel == enChatChannel.ePrivate then
		-- if self:IsForbidPrivate() or not self:GetPlayer():GetSystem("CSettingSystem"):CanAcceptPrivateChat() then
			-- GSRemoteCall(dwRoleID,"CChatSystem","Error",{6000310009},nil);
			-- return;
		-- end
		-- print("Private Channel Update Contact================", dwRoleID, self.dwRoleID);
		-- if dwRoleID ~= self.dwRoleID then--不是自己发的消息
			-- self:GetPlayer():GetSystem("CFriendSystem"):UpdateContact( dwRoleID );
		-- end
	end
	--除了世界频道之外，私聊、队伍、帮派、附近信息都会直接通知玩家
	if sMsg.dwChannel == enChatChannel.eLine then
		if sMsg.dwChannel ~= self.dwChannel then
			local mList = self:GetMsgList( sMsg.dwChannel );
			if mList then
				--查看当前列表是否超过规定数量，超过则删除时间最长的一个，第一个进入的就是时间最长的
				if #mList > CChatSystem.dwLimited then
					table.remove(mList, 1);
				end
				return table.insert(mList, sMsg);
			end
			print("cash world message==================",dwRoleID)
		end
	end
	--]]
	--如果接收类型相同就直接发送回客户端
	return self:SynchronizeMsg( sMsg );
end
--接收一条公告消息
function CChatSystem:ReceiveGongGao( dwTime, strText )
	self:GetPlayer().OnReceiveGongGaoMsg{ Time=dwTime, Text=strText };
end
--获取当前玩家附近的玩家ID列表
function CChatSystem:GetNearbys()
	local setIDs = {};
	local IDPlayer = self:GetPlayer():GetOtherPlayer(0, 1);
	for dwRoleID,player in pairs(IDPlayer) do
		table.insert(setIDs, dwRoleID);
	end
	return setIDs;
end
--获取同一个帮派的玩家ID列表
function CChatSystem:GetFactions()
	local setIDs = {};
	local dwMyFactionID = self:GetFactionID();
	if dwMyFactionID == 0 then
		--print("您还没有加入帮会");
		self:Error(6000310004);
		return setIDs;
	end
	if not CConfig.bIsCrossSvr then
		local objSystem = self:GetPlayer():GetSystem('CGuildSystem')
		local tabMemberList = objSystem:GetGuildMember()
		for dwRoleID in pairs(tabMemberList or {}) do
			table.insert( setIDs, dwRoleID );
		end	
	end;
	return setIDs;
end
--获取同一个队伍的玩家ID列表
function CChatSystem:GetTeams()
	local setIDs = {};
	local dwMyTeamID = self:GetTeamID();
	if dwMyTeamID == 0 then
		--print("您还没有加入队伍");
		self:Error(6000310003);
		return setIDs;
	end
	if not CConfig.bIsCrossSvr then
		local teamSys = self:GetPlayer():GetSystem("CTeamSystem");
		for _, roleId in pairs(teamSys:GetTeamLeaguer()) do
			table.insert( setIDs, roleId );
		end
		return setIDs;
	end;
end
--获取同一个世界（同一条线）的玩家ID列表
function CChatSystem:GetLines()
	local setIDs = {};
	local IDPlayer = self:GetPlayer():GetOtherPlayer(0, 3);
	for dwRoleID,player in pairs(IDPlayer) do
		table.insert(setIDs, dwRoleID);
	end
	--print("Player Online Number", #setIDs)
	return setIDs;
end
--根据频道枚举获取信息列表
function CChatSystem:GetMsgList(dwChannel)
	return self.setTypeToMsg[dwChannel];
end
--获取下一个消息的ID
function CChatSystem:GetNextMsgID()
	self.dwIDSequence = self.dwIDSequence + 1;--序列号自增
	return self.dwIDSequence;
end
--获取玩家队伍的ID
function CChatSystem:GetTeamID()
	if not CConfig.bIsCrossSvr then
		return self:GetPlayer():GetSystem("CTeamSystem"):GetTeamId() or 0;
	end;
	return 0;
end
--获取玩家帮派的ID
function CChatSystem:GetFactionID()
	if not CConfig.bIsCrossSvr then
		return self:GetPlayer():GetSystem("CGuildSystem"):GetGuildID() or 0;
	end;
	return 0;
end
--获取玩家的姓名
function CChatSystem:GetRoleName()
	return self:GetPlayer():GetInfo().szRoleName;
end
--获取玩家当前所在线的ID
function CChatSystem:GetLineID()
	local map = seld:GetPlayer():GetSystem("CMapSystem");
	return map:GetCurLine():GetID();
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------
local KeyToNumber = function( sMsg, msgTable )
	--拷贝已知数字key的数据到新表中
	local info = {};
	for name,value in pairs(sMsg) do
		if msgTable[name] then
			info[ msgTable[name] ] = value;
		else--防止出现未知数据没有拷贝过去的情况
			info[name] = value;
		end
	end
	return info;
end
local ChatMsgTable = {
	dwRoleID = 1;		--记录消息发送发送者的ID
	dwMessageID = 2;	--记录消息的ID，ID属于发送者
	strSender = 3;		--记录消息发送者的名称
	dwSendVip = 4;			--0不是VIP，1是VIP
	strSendTo = 5;		--记录消息发送的对象，如果SendToID是0，服务端则使用这个值进行搜索
	dwSendTo = 6;		--记录消息接受者的ID
	dwRecvVip = 7;			--0不是VIP，1是VIP
	dwTime = 8;			--记录消息发送的时间，以服务器时间为准
	dwChannel = 9;		--消息发送的频道
	strText = 10;		--消息的字符串
	Items = 11;			--保存传送的物品列表，key是dwItemID，value是SItemMessage对象，数据库中并不保存这个信息
	Mounts = 12;		--保存传送的坐骑列表，key是dwID，value是坐骑名字和颜色
	Booth = 13;			--保存传送的摊位列表，key是dwRoleID，value是名字
	dwSendLeader = 14;	--武林盟主标记
	dwRecvLeader = 15;	--武林盟主标记
	dwSysFlag = 16;
	dwSplFlag = 17;
};

--同步消息到客户端SChatMessage结构
function CChatSystem:SynchronizeMsg( sMsg )
	sMsg = KeyToNumber( sMsg, ChatMsgTable );
	--消息不再直接发送，而是进入缓存列表
	self:CashSendMsg( sMsg );
	--self:GetPlayer().OnReceiveMsg{ Msg=sMsg };
end
--同步消息到客户端，SChatMessage结构列表
function CChatSystem:SynchronizeMsgList( sMsgList )
	--local msglist = {};
	for k,smsg in pairs(sMsgList) do
		local s = KeyToNumber( smsg, ChatMsgTable );
		--msglist[k] = s;
		self:CashSendMsg( smsg );
	end
	--消息不再直接发送，而是进入缓存列表
	
	--self:GetPlayer().OnReceiveMsgListMsg{ MsgList=msglist };
end
-- 真正提交消息的函数
function CChatSystem:SendMsgListNow()
	if self.dwSendStart == self.dwSendEnd then
		return;--没有需要发送的消息
	end
	local msglist = {};
	--获取缓存列表的前5条消息
	local sendEnd = self.dwSendStart + 4;
	if sendEnd >= self.dwSendEnd then
		sendEnd = self.dwSendEnd -1;
	end
	for k=self.dwSendStart, sendEnd do
		table.insert( msglist, self.setMsgSendCash[k] );
		self.setMsgSendCash[k] = nil;--清掉数据
	end
	self.dwSendStart = sendEnd + 1;
	--print("sendmsgnow=====",self.dwRoleID, self.dwSendStart, self.dwSendEnd, #_encode(msglist))
	self:GetPlayer().OnReceiveMsgListMsg{ MsgList=msglist };
end
--缓存消息到队列
function CChatSystem:CashSendMsg( msg )
	self.setMsgSendCash[self.dwSendEnd] = msg;
	self.dwSendEnd = self.dwSendEnd + 1;
	--如果缓存超过100条消息，那么丢弃最早的消息
	if self.dwSendEnd - self.dwSendStart > 100 then
		self.setMsgSendCash[self.dwSendStart] = nil;--清掉数据
		self.dwSendStart = self.dwSendStart + 1;
	end
end
--发送错误消息
function CChatSystem:Error(dwError, dwCode1, dwCode2, strName)
	self:GetPlayer().OnChatSystemErrorMsg{	Error=dwError,Code1=dwCode1,Code2=dwCode2,Name=strName };
end





