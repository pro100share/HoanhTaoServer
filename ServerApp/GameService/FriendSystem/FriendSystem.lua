--[[
功能：好友系统
作者：周兴团
时间：2012-3-5
]]
------------------------------------------------------------------------------------------------------------------------------------
--搜索结果排序算法，a，b：key是序号，value是sFriendInfo或sContactInfo的引用
local function SortPlayer(a, b)
	if a.dwLevel == b.dwLevel then
		local aname = string.lower(a.strName);
		local bname = string.lower(b.strName);
		return aname < bname;
	else
		return a.dwLevel > b.dwLevel;
	end
end
------------------------------------------------------------------------------------------------------------------------------------
_G.sFriendInfoServer = {};
function sFriendInfoServer:new()
	local obj = sFriendInfo:new();
	--obj.dwRoleID = 0;		--记录好友的ID
	--obj.dwFlag = enFriendFlag.eNone;--我与好友的关系，详见enFriendFlag
	--obj.dwMeetTime = 0;		--我第一次添加好友的时间
	--obj.dwLastTime = 0;		--我最后一次被仇人击杀的时间
	obj.dwDBOper = enDBOperation.eUpdate;--标记当前的记录，enDBOperation是Update还是Insert、Delete
	obj.bExistInDB = false;	--记录信息是否存在于数据库中
	return obj;
end
_G.sContactInfoServer = {};
function sContactInfoServer:new()
	local obj = sContactInfo:new();
	--obj.dwRoleID = 0;	--记录最近联系人的ID
	--obj.dwLastTime = 0;		--记录最后一次对话的时间
	obj.dwDBOper = enDBOperation.eUpdate;--标记当前的记录，enDBOperation是Update还是Insert、Delete
	obj.bExistInDB = false;	--记录信息是否存在于数据库中
	return obj;
end

_G.CFriendSystem = {};
--CFriendSystem.dwLimited = 200;	--好友、敌人、黑名单上限
function CFriendSystem:new()
	local obj = CSystem:new("CFriendSystem");
	obj.objDBQuery = nil;			--数据库查询模块
	obj.dwRoleID = 0;				--记录自己的角色ID
	obj.strName = "";				--记录自己的名字
	obj.setFriends = {};			--好友关系列表，key是dwRoleID，value是sFriendInfo表结构
	obj.setContacts = {};			--最近联系人列表，key是dwRoleID，value是sContactInfo表结构
	
	obj.setSearchBuffer = {};		--保存搜索的结果
	obj.strSearchName = "";			--保存搜索的字段
	obj.dwWantFriendIndex = 1;		--好友平台显示的交友玩家的Index
	obj.dwWantMarryIndex = 1;		--好友平台显示的征婚玩家的Index
	obj.dwSameEnemyIndex = 1;		--好友平台显示的有共同仇人的Index
	obj.dwWantMarryState = 0;		--记录自己当前是否已经发布了征婚信息
	for i,v in pairs(CFriendSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end
function CFriendSystem:Create(bIsChangeLine)
	--创建数据库处理模块
	local objPlayer = self:GetPlayer();

	local objDB = objPlayer:GetDBQuery();
	self.dwRoleID = objPlayer:GetRoleID();--记录下自己的角色ID
	self.strName = objPlayer:GetInfo().szRoleName;--自己的姓名
	self.objDBQuery = CFriendSystemDB:new(objDB, self);
	--从换线中心获取数据
	local datalist = objPlayer:GetLineData("CFriendSystem")
	self.setMood = datalist[1];
	for k=2,#datalist do
		for _,fMsg in pairs(datalist[k]) do
			if type(fMsg) == "table" then
				local info = sFriendInfoServer:new();
				for i,j in pairs(fMsg) do
					if info[i] then
						info[i] = j;
					end
				end
				info.setMood = fMsg.setMood or SPlayerMoodMsg:new();
				self.setFriends[fMsg.dwRoleID] = info;
				--print("get friend data", fMsg.dwRoleID)
			end
		end
	end
	
	--注册当前系统到VIP系统，监听VIp信息
	self:GetPlayer():GetSystem("CVipSystem"):AddSys( self );
	self:GetPlayer():GetSystem("CPlayerShopSystem"):AddSys( self );
	CFriendManager:AddFriendSystem( self );--将自己注册到全局管理器
	--]]
	if bIsChangeLine == 0 then
	--if not bIsChangeLine then
		self.setSendQueue = {};--队列发送的对象列表
	end
	self.bIsReadyToSend = false;
	self.dwSendCount = nil;	--发送的计时
	self.dwSendNumber = nil;--发送的计数
	
	--系统创建之后会向KS发送自己的数据和好友的数据
	--CKernelApp.GSCheckForLoginMsg{ Param = self.dwRoleID };
	return true;
end
function CFriendSystem:Update(dwInterval)
	-- if not self.bIsReadyToSend then
		-- return true;
	-- end
	-- self.dwSendCount = self.dwSendCount + dwInterval;
	-- if self.dwSendCount >= 1000 then
		-- self.dwSendCount = 0;
		-- local list = self:GetNextQueueList();
		-- self:SendPatchFriendMsg( list );
	-- end
	return true;
end;
function CFriendSystem:Destroy()
	CFriendManager:DelFriendSystem( self.dwRoleID, self:GetPlayer():GetInfo().szRoleName );--将自己从全局管理器注销
	--保存玩家的好友信息到数据库
	if self.objDBQuery then
		self.objDBQuery:UpdateMoodMsg( self.setMood );
		-- print("Role "..tostring(self.dwRoleID).."Update Mood");
		-- for k,v in pairs(self.setMood) do
			-- print(k,v)
		-- end
	end
end
function CFriendSystem:OnChangeLineBegin(dwNewLineID)
	local objPlayer = self:GetPlayer()
	--自己的心情和签名
	local setFriendList = {};
	for k,fMsg in pairs(self.setFriends) do
		local f = sFriendInfo:new();
		for i,j in pairs(fMsg) do
			if f[i] then
				f[i] = j;
			end
		end
		f.setMood = fMsg.setMood;
		table.insert( setFriendList, f );
	end
	--将数据提交到换线中心
	objPlayer:SetLineData("CFriendSystem", self.setMood);--提交背包数据
	local count = 0;
	local data = {};
	for k,fMsg in pairs(setFriendList) do
		count = count + 1;
		table.insert(data, fMsg);
		if count >= 10 then
			objPlayer:SetLineData("CFriendSystem",data);
			count = 0;
			data = {};
		end
	end
	if #data > 0 then
		objPlayer:SetLineData("CFriendSystem",data);
	end
end
--启动换线时候的检查
function CFriendSystem:OnChangeLineCheck(dwNewLineID)
	if self.setSendQueue then
		if #self.setSendQueue > 0 then
			return false;
		else
			self.setSendQueue = nil;
		end
	end
	return true;
end;

--客户端进入游戏登入所有场景之后
function CFriendSystem:OnEnterScene()
end;
function CFriendSystem:OnDead(dwEnemyType,dwEnemyID)
	--被人杀死就要记录仇人
	--print("OnDead",self.dwRoleID,dwEnemyID)
	if dwEnemyType == enEntType.eEntType_Player then
		self:AddEnemy(dwEnemyID);
	end
end;

function CFriendSystem:RegPlayerDataToKS()
	local setMyMsg = {};
	local myinfo = self:GetPlayer():GetInfo();
	setMyMsg.dwRoleID = self.dwRoleID;		--记录对方的ID
	setMyMsg.dwProf = myinfo.dwProf;			--职业
	setMyMsg.dwHead = self:GetPlayer():GetIncoID();			--头像的ID
	setMyMsg.strName = self.strName;		--记录玩家的姓名
	--玩家在游戏过程中实时更改的数据
	setMyMsg.dwYanHui = 0;		--0没有宴会，1有宴会
	setMyMsg.dwTanWei = 0;		--0没有摊位，1有摊位
	if CPlayerShopManager:GetShop(self.dwRoleID) then
		setMyMsg.dwTanWei = 1;
	end
	setMyMsg.dwOnLine = 1;		--0是不在线，1是在线
	setMyMsg.dwVip = 0;			--0不是VIP，1是VIP
	if self:GetPlayer():GetSystem("CVipSystem"):IsVip() then
		setMyMsg.dwVip = 1;
	end
	setMyMsg.dwLevel = self:GetPlayer():GetLevel();	--记录玩家的等级
	setMyMsg.strBangPai = self:
        GetPlayer():
        GetSystem("CGuildSystem"):
        GetGuildName() or "";	--帮派名称
	setMyMsg.dwBangPaiID = self:
        GetPlayer():
        GetSystem("CGuildSystem"):
        GetGuildID() or 0;	--帮派的ID
	setMyMsg.dwMood1 = self.setMood[dwMood1] or 0;		--心情1
	setMyMsg.dwMood2 = self.setMood[dwMood2] or 0;		--心情2
	setMyMsg.dwMood3 = self.setMood[dwMood3] or 0;		--心情3
	setMyMsg.dwMood4 = self.setMood[dwMood4] or 0;		--心情4
	setMyMsg.szSign = self.setMood[szSign] or "";		--签名
	--发送消息
	CKernelApp.GSRegPlayerDataMsg{ Param = { setMyMsg }; };
end

--从KS接收最近联系人信息
function CFriendSystem:ReceiveContactFromKS( setContacts )
	for k,msg in pairs(setContacts) do
		local sInfo = sContactInfoServer:new();
		self.setContacts[dwRoleID] = sInfo;
		for i,j in pairs(msg) do
			if sInfo[i] then
				sInfo[i] = j;
			end
		end
	end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------
--下面的消息都会同步发送到KS上进行广播
--客户端申请添加征婚信息
function CFriendSystem:RequestAddWantMarry(strMessage)
	if self:GetPlayer():GetLevel() < 34 then
		return self:OnError( 6000110021 );
	end
	if self:GetPlayer():GetSystem("CMarriageSystem"):IsMarried() then
		return self:OnError( 6000110022 );
	end
	--发送消息到KS服务器
	CKernelApp.GSRequestModifyWantMarryMsg{ Param = { self.dwRoleID, strMessage } };
end
--通知某一个玩家更改了VIp信息，注册到VIPSystem的函数
function CFriendSystem:OnVipChange(bIsVip)
	local vip = 0;
	if bIsVip then vip = 1; end;
	local updateMsg = { dwRoleID = self.dwRoleID, dwVip = vip };
	--发送消息到KS服务器
	CKernelApp.GSPlayerDataChangeMsg{ Param = updateMsg };
end
--通知某一个玩家更改了商城信息，注册到ShopSystem的函数
function CFriendSystem:OnPlayerShopChange(bHaveShop)
	local dwTanWei = 0;
	if bHaveShop then dwTanWei = 1; end;
	local updateMsg = { dwRoleID = self.dwRoleID, dwTanWei = dwTanWei };
	--发送消息到KS服务器
	CKernelApp.GSPlayerDataChangeMsg{ Param = updateMsg };
end
--更改自己的心情和签名
function CFriendSystem:RequestChangeMood(sMsg)
	local updateMsg = { dwRoleID = self.dwRoleID };
	for k,v in pairs(sMsg) do
		if self.setMood[k] ~= v then
			self.setMood[k] = v;
			updateMsg[k] = v;
		end
	end
	updateMsg.dwRoleID = self.dwRoleID;
	--发送消息到KS服务器
	CKernelApp.GSPlayerDataChangeMsg{ Param = updateMsg };
end
--事件中心，升级和结婚
function CFriendSystem:OnEventCenter(strEventName,dwArg1,dwArg2)
	if strEventName == "EventLevelUp" then--玩家升级了
		local dwLevel = self:GetPlayer():GetLevel();
		--发送消息到KS
		local updateMsg = { dwRoleID = self.dwRoleID, dwLevel = dwLevel };
		CKernelApp.GSPlayerDataChangeMsg{ Param = updateMsg };
	elseif strEventName == "EventGetMarry" then--玩家已经结婚，将玩家的信息从征婚列表上移除
		--发送消息到KS
		CKernelApp.GSCancelWantMarryMsg{ Param = { self.dwRoleID }; };
	elseif strEventName == enumPlayerEventType.EventJoinGuild then
		local guildSystem = self:GetPlayer():GetSystem("CGuildSystem");
		dwArg1 = guildSystem:GetGuildID();
		dwArg2 = guildSystem:GetGuildName();
		local updateMsg = { dwRoleID=self.dwRoleID, dwBangPaiID=dwArg1, strBangPai=dwArg2 };
		CKernelApp.GSPlayerDataChangeMsg{ Param = updateMsg };
	elseif strEventName == enumPlayerEventType.EventQuitGuild then
		local updateMsg = { dwRoleID=self.dwRoleID, dwBangPaiID=0, strBangPai="" };
		CKernelApp.GSPlayerDataChangeMsg{ Param = updateMsg };
	elseif strEventName == "EventKillPlayer" then--杀死某个玩家
		local dwRoleID = dwArg2;
		local info = self.setFriends[dwRoleID];
		--print("EventKillPlayer",self.dwRoleID,dwArg2)
		if info then
			info.dwEnemy = info.dwEnemy - 1;
			--更新数据库中的信息
			--print("EventKillPlayer update",self.dwRoleID,dwArg2)
			self:UpdateOperation( info, enDBOperation.eUpdate, { "dwEnemy" } );
			self:SynchronizeRoleEnemy( dwRoleID, info.dwEnemy );
			--通知KS，玩家的dwEnemy更改
			CKernelApp.GSPlayerEnemyChangeMsg{ Param = { self.dwRoleID, dwRoleID, info.dwEnemy }; };
		end
	elseif strEventName == "EventBeKilledByPlayer" then--被某一个玩家杀死
		
	end
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
--在GS登陆的时候，需要获取KS上面玩家的数据
function CFriendSystem:HandleUpdateOnInit( msglist )
	for k, msg in pairs(msglist) do
		self:HandleKSNotify( msg, true );
	end
end
--数据从KS通知GS的接口，因为数据的更改都在KS上，由KS进行广播
local MoodAttr = { "dwMood1", "dwMood2", "dwMood3", "dwMood4", "szSign" };
local TableKeyFind = function( tab, tab2 )
	for k,v in pairs(tab) do
		if tab2[v] then
			return true;
		end
	end
	return false;
end
function CFriendSystem:HandleKSNotify(updateData, bFirstNotify)
	if updateData.dwYanHui then
		self:NotifyYanHuiChange(updateData.dwRoleID, updateData.dwYanHui);
	end
	if updateData.dwVip then
		self:NotifyPlayerVip(updateData.dwRoleID, updateData.dwVip);
	end
	if updateData.dwTanWei then
		self:NotifyPlayerTanWei(updateData.dwRoleID, updateData.dwTanWei);
	end
	if updateData.dwOnLine then
		self:NotifyRoleOnLine(updateData.dwRoleID, updateData.dwOnLine, bFirstNotify);
	end
	if updateData.dwLevel then
		self:NotifyPlayerLevelUp(updateData.dwRoleID, updateData.dwLevel);
	end
	if updateData.dwBangPaiID then
		self:NotifyPlayerBangPai(updateData.dwRoleID, updateData.dwBangPaiID, updateData.strBangPai);
	end
	if TableKeyFind( MoodAttr, updateData ) then
		local mood = { dwRoleID = updateData.dwRoleID }
		for k,v in pairs(MoodAttr) do
			if updateData[v] then
				mood[v] = updateData[v];
			end
		end
		self:NotifyPlayerMood( mood );
	end
end
--通知玩家婚宴改变了
function CFriendSystem:NotifyYanHuiChange(dwRoleID, dwYanHui)
	local bNotify = false;
	local sInfo = self.setFriends[dwRoleID];
	if sInfo and sInfo.dwFlag ~= enFriendFlag.eNone 
		and sInfo.dwDBOper ~= enDBOperation.eDelete then
		sInfo.dwYanHui = dwYanHui;
		bNotify = true;
	end
	sInfo = self.setContacts[dwRoleID];
	if sInfo and sInfo.dwDBOper ~= enDBOperation.eDelete then
		sInfo.dwYanHui = dwYanHui;
		bNotify = true;
	end
	if bNotify then
		self:SynchronizeRoleHunYan( dwRoleID, dwYanHui );
	end
end
--通知VIP信息
function CFriendSystem:NotifyPlayerVip( dwRoleID, dwVip )
	local bNotify = false;
	if self.setFriends[dwRoleID] then
		self.setFriends[dwRoleID].dwVip = dwVip;
		bNotify = true;
		--更新数据库中的VIP信息
		self:UpdateOperation( self.setFriends[dwRoleID], enDBOperation.eUpdate, { "dwVip" } );
	end
	if self.setContacts[dwRoleID] then
		self.setContacts[dwRoleID].dwVip = dwVip;
		bNotify = true;
	end
	if bNotify then
		self:SynchronizeRoleVip( dwRoleID, dwVip );
	end
end
--通知商城信息
function CFriendSystem:NotifyPlayerTanWei(dwRoleID, dwTanWei)
	local bNotify = false;
	if self.setFriends[dwRoleID] then
		self.setFriends[dwRoleID].dwTanWei = dwTanWei;
		bNotify = true;
	end
	if self.setContacts[dwRoleID] then
		self.setContacts[dwRoleID].dwTanWei = dwTanWei;
		bNotify = true;
	end
	if bNotify then
		self:SynchronizeRoleTanWei( dwRoleID, dwTanWei );
	end
end
--通知Player，玩家上线信息
function CFriendSystem:NotifyRoleOnLine( dwRoleID, dwOnLine, bFirstNotify )
	local bNotify = false;
	if self.setFriends[dwRoleID] then
		self.setFriends[dwRoleID].dwOnLine = dwOnLine;
		bNotify = true;
	end
	if self.setContacts[dwRoleID] then
		self.setContacts[dwRoleID].dwOnLine = dwOnLine;
		bNotify = true;
	end
	--通知客户端玩家上线信息
	if bNotify then
		self:SynchronizeRoleOnLine(dwRoleID, dwOnLine, bFirstNotify);
	end
end
--通知Player，玩家升级
function CFriendSystem:NotifyPlayerLevelUp( dwRoleID, dwLevel )
	local bNotify = false;
	if self.setFriends[dwRoleID] then
		self.setFriends[dwRoleID].dwLevel = dwLevel;
		bNotify = true;
		--更新数据库中的VIP信息
		self:UpdateOperation( self.setFriends[dwRoleID], enDBOperation.eUpdate, { "dwLevel" } );
	end
	if self.setContacts[dwRoleID] then
		self.setContacts[dwRoleID].dwLevel = dwLevel;
		bNotify = true;
	end
	--通知客户端玩家上线信息
	if bNotify then
		self:SynchronizeRoleLevelUp( dwRoleID, dwLevel );
	end
end
--通知Player，玩家帮会改变信息
function CFriendSystem:NotifyPlayerBangPai( dwRoleID, dwBangPaiID, strBangPai )
	local bNotify = false;
	if self.setFriends[dwRoleID] then
		self.setFriends[dwRoleID].dwBangPaiID = dwBangPaiID;
		self.setFriends[dwRoleID].strBangPai = strBangPai;
		bNotify = true;
	end
	if self.setContacts[dwRoleID] then
		self.setContacts[dwRoleID].dwBangPaiID = dwBangPaiID;
		self.setContacts[dwRoleID].strBangPai = strBangPai;
		bNotify = true;
	end
	--通知客户端玩家上线信息
	if bNotify then
		self:SynchronizeRoleBangPai( dwRoleID, dwBangPaiID, strBangPai );
	end
end
--通知Player，玩家的心情信息改变
function CFriendSystem:NotifyPlayerMood( setMood )
	local bNotify = false;
	local dwRoleID = setMood.dwRoleID;
	if self.setFriends[dwRoleID] then
		for k,v in pairs(setMood) do
			if self.setFriends[dwRoleID].setMood[k] then
				self.setFriends[dwRoleID].setMood[k] = v;
			end
		end
		bNotify = true;
	end
	if self.setContacts[dwRoleID] then
		for k,v in pairs(setMood) do
			if self.setContacts[dwRoleID].setMood[k] then
				self.setContacts[dwRoleID].setMood[k] = v;
			end
		end
		bNotify = true;
	end
	if bNotify then
		self:SynchronizeRoleMood( setMood );
	end
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
--添加好友，删除好友等操作，需要和KS服务端进行交互；1是好友，2是黑名单，3是仇人，4是最近联系人
function CFriendSystem:HandleKSAdd( dwType, playerMsg )
	-- for k,v in pairs(playerMsg) do
		-- print(k,v)
	-- end
	if dwType == 1 then
		return self:OnKSAddFriend( playerMsg );
	elseif dwType == 2 then
		return self:OnKSAddBlackList( playerMsg );
	elseif dwType == 3 then
		return self:OnKSAddEnemy( playerMsg );
	elseif dwType == 4 then
		return self:OnKSAddContact( playerMsg );
	end
end
function CFriendSystem:HandleKSDelete(dwType, dwRoleID, dwFlag)
	if dwType == 1 then
		return self:OnKSDeleteFriend( dwRoleID, dwFlag );
	elseif dwType == 2 then
		return self:OnKSDeleteBlackList( dwRoleID, dwFlag );
	elseif dwType == 3 then
		return self:OnKSDeleteEnemy( dwRoleID, dwFlag );
	elseif dwType == 4 then
		return self:OnKSDeleteContact( dwRoleID );
	end
end
--添加一个好友关系，如果只是更新，那么就不要传入dwMeetTime的值
function CFriendSystem:AddFriend( dwRoleID, dwMeetTime )
	dwMeetTime = dwMeetTime or GetCurTime();
	if dwRoleID == self.dwRoleID then
		return;
	end
	if self:IsHaveInFriend(dwRoleID) then
		return;
	end
	--判断玩家是否有权限交友
	if not self:HasAuthority("Friend") then
		self:OnError(9000210029);
		return;
	end
	--发送添加命令到KS服务器
	CKernelApp.GSRequestAddPlayerMsg{ Param = { dwRoleID, self.dwRoleID, 1 }; };
end
--从KS返回添加好友的结果
function CFriendSystem:OnKSAddFriend( playerMsg )
	local sInfo = self.setFriends[playerMsg.dwRoleID];
	if not sInfo then
		sInfo = sFriendInfoServer:new();
		sInfo.setMood = SPlayerMoodMsg:new();
		--拷贝数据
		for k,v in pairs(playerMsg) do
			if sInfo[k] then
				sInfo[k] = v;
			end
			if sInfo.setMood[k] then
				sInfo.setMood[k] = v;
			end
		end
		self.setFriends[playerMsg.dwRoleID] = sInfo;
		--更新数据库操作操作
		self:UpdateOperation( sInfo, enDBOperation.eInsert );
	else
		--拷贝数据
		for k,v in pairs(playerMsg) do
			if sInfo[k] then
				sInfo[k] = v;
			end
			if sInfo.setMood[k] then
				sInfo.setMood[k] = v;
			end
		end
		--更新数据库操作操作
		self:UpdateOperation( sInfo, enDBOperation.eUpdate, { "dwFlag", "dwVip", "dwLevel" } );
	end
	--更新消息到客户端
	self:SynchronizeUpdateFriend( sInfo );
	--通知增加了一个好友
	self:GetPlayer():GetSystem("CPlayerEventCenterSystem"):DoEvent(enumPlayerEventType.EventAddFriend,1);
	
	CLogSystemManager:friend(self:GetPlayer(), playerMsg.dwRoleID, 1);
end
--删除一个好友关系
function CFriendSystem:DeleteFriend( dwRoleID )
	--检查玩家是否存在于仇人列表中
	if not self:IsHaveInFriend(dwRoleID) then
		--print("CFriendSystem:DeleteFriend Not Found ", dwRoleID)
		local sInfo = {};
		sInfo.dwRoleID = dwRoleID;
		self:SynchronizeDeleteFriend(sInfo);
		return;
	end
	local sInfo = self.setFriends[dwRoleID];
	if not sInfo then
		return;
	end
	--通知KS服务器进行删除操作
	CKernelApp.GSRequestDeletePlayerMsg{ Param = { dwRoleID, self.dwRoleID, 1 } };
end
function CFriendSystem:OnKSDeleteFriend( dwRoleID, dwFlag )
	local sInfo = self.setFriends[dwRoleID];
	if not sInfo then
		return;
	end
	sInfo.dwFlag = dwFlag;
	if dwFlag == enFriendFlag.eNone then
		--修改数据库标记
		self:UpdateOperation( sInfo, enDBOperation.eDelete );
		self:SynchronizeDeleteFriend( sInfo );
	else
		self:UpdateOperation( sInfo, enDBOperation.eUpdate, { "dwFlag" } );
		local setUpdateColumn = { "dwRoleID", "dwFlag" };
		self:SynchronizeUpdateFriend( sInfo, setUpdateColumn );
	end
	self:GetPlayer():GetSystem("CPlayerEventCenterSystem"):DoEvent(enumPlayerEventType.EventAddFriend,-1);
	
	CLogSystemManager:friend(self:GetPlayer(), dwRoleID, 2);
end
--添加一个仇人关系；如果只是更新，那么就不要传入dwMeetTime的值
function CFriendSystem:AddEnemy( dwRoleID, dwLastTime, dwMeetTime )
	if dwRoleID == self.dwRoleID then
		return;
	end
	--检测如果已经存在于仇人列表中，那么将会更新这条记录，不会再添加
	
	--发送添加命令到KS服务器
	CKernelApp.GSRequestAddPlayerMsg{ Param = { dwRoleID, self.dwRoleID, 3 }; };
end
--从KS返回添加仇人的结果
function CFriendSystem:OnKSAddEnemy( playerMsg )
	local sInfo = self.setFriends[playerMsg.dwRoleID];
	if not sInfo then
		sInfo = sFriendInfoServer:new();
		sInfo.setMood = SPlayerMoodMsg:new();
		for k,v in pairs(playerMsg) do
			if sInfo[k] then
				sInfo[k] = v;
			end
			if sInfo.setMood[k] then
				sInfo.setMood[k] = v;
			end
		end
		self.setFriends[playerMsg.dwRoleID] = sInfo;
		sInfo.dwEnemy = sInfo.dwEnemy + 1;
		--更新数据库操作操作
		self:UpdateOperation( sInfo, enDBOperation.eInsert );
	else
		for k,v in pairs(playerMsg) do
			if sInfo[k] then
				sInfo[k] = v;
			end
			if sInfo.setMood[k] then
				sInfo.setMood[k] = v;
			end
		end
		sInfo.dwEnemy = sInfo.dwEnemy + 1;
		--更新数据库操作操作
		self:UpdateOperation( sInfo, enDBOperation.eUpdate, { "dwLastTime", "dwFlag", "dwVip", "dwLevel", "dwEnemy" } );
	end
	--if sInfo then
	--	self:SynchronizeRoleEnemy( playerMsg.dwRoleID, sInfo.dwEnemy );
	--end
	--更新消息到客户端
	self:SynchronizeUpdateFriend( sInfo );
	--通知KS，玩家的dwEnemy更改
	CKernelApp.GSPlayerEnemyChangeMsg{ Param = { self.dwRoleID, playerMsg.dwRoleID, sInfo.dwEnemy }; };
end
--删除一个仇人关系
function CFriendSystem:DeleteEnemy( dwRoleID )
	--检查玩家是否存在于仇人列表中
	if not self:IsHaveInEnemy(dwRoleID) then
		--print("CFriendSystem:DeleteFriend Not Found ", dwRoleID)
		local sInfo = {};
		sInfo.dwRoleID = dwRoleID;
		self:SynchronizeDeleteFriend(sInfo);
		return;
	end
	local sInfo = self.setFriends[dwRoleID];
	if not sInfo then
		return;
	end
	--通知KS服务器进行删除操作
	CKernelApp.GSRequestDeletePlayerMsg{ Param = { dwRoleID, self.dwRoleID, 3 } };
end
function CFriendSystem:OnKSDeleteEnemy( dwRoleID, dwFlag )
	local sInfo = self.setFriends[dwRoleID];
	if not sInfo then
		return;
	end
	sInfo.dwFlag = dwFlag;
	if dwFlag == enFriendFlag.eNone then
		--修改数据库标记
		self:UpdateOperation( sInfo, enDBOperation.eDelete );
		self:SynchronizeDeleteFriend( sInfo );
	else
		self:UpdateOperation( sInfo, enDBOperation.eUpdate, { "dwFlag" } );
		local setUpdateColumn = { "dwRoleID", "dwFlag" };
		self:SynchronizeUpdateFriend( sInfo, setUpdateColumn )
	end
end
--添加一个黑名单
function CFriendSystem:AddBlackList( dwRoleID, dwMeetTime )
	if dwRoleID == self.dwRoleID then
		return;
	end
	--发送添加命令到KS服务器
	CKernelApp.GSRequestAddPlayerMsg{ Param = { dwRoleID, self.dwRoleID, 2 }; };
end
--从KS返回添加黑名单的结果
function CFriendSystem:OnKSAddBlackList( playerMsg )
	local sInfo = self.setFriends[playerMsg.dwRoleID];
	if not sInfo then
		sInfo = sFriendInfoServer:new();
		sInfo.setMood = SPlayerMoodMsg:new();
		for k,v in pairs(playerMsg) do
			if sInfo[k] then
				sInfo[k] = v;
			end
			if sInfo.setMood[k] then
				sInfo.setMood[k] = v;
			end
		end
		self.setFriends[playerMsg.dwRoleID] = sInfo;
		--更新数据库操作操作
		self:UpdateOperation( sInfo, enDBOperation.eInsert );
	else
		for k,v in pairs(playerMsg) do
			if sInfo[k] then
				sInfo[k] = v;
			end
			if sInfo.setMood[k] then
				sInfo.setMood[k] = v;
			end
		end
		--如果玩家存在于好友列表里面，那么调用删除好友事件
		if self:IsHaveInFriend(playerMsg.dwRoleID) then
			self:GetPlayer():GetSystem("CPlayerEventCenterSystem"):DoEvent(enumPlayerEventType.EventAddFriend,-1);
		end
		--更新数据库操作操作
		self:UpdateOperation( sInfo, enDBOperation.eUpdate, { "dwFlag", "dwVip", "dwLevel" } );
	end
	--更新消息到客户端
	self:SynchronizeUpdateFriend( sInfo );
end
--删除一个黑名单
function CFriendSystem:DeleteBlackList( dwRoleID )
	--检查玩家是否存在于仇人列表中
	if not self:IsHaveInBlackList(dwRoleID) then
		--print("CFriendSystem:DeleteFriend Not Found ", dwRoleID)
		local sInfo = {};
		sInfo.dwRoleID = dwRoleID;
		self:SynchronizeDeleteFriend(sInfo);
		return;
	end
	local sInfo = self.setFriends[dwRoleID];
	if not sInfo then
		return;
	end
	--通知KS服务器进行删除操作
	CKernelApp.GSRequestDeletePlayerMsg{ Param = { dwRoleID, self.dwRoleID, 2 } };
end
function CFriendSystem:OnKSDeleteBlackList( dwRoleID, dwFlag )
	local sInfo = self.setFriends[dwRoleID];
	if not sInfo then
		return;
	end
	sInfo.dwFlag = dwFlag;
	if dwFlag == enFriendFlag.eNone then
		--修改数据库标记
		self:UpdateOperation( sInfo, enDBOperation.eDelete );
		self:SynchronizeDeleteFriend( sInfo );
	else
		self:UpdateOperation( sInfo, enDBOperation.eUpdate, { "dwFlag" } );
		local setUpdateColumn = { "dwRoleID", "dwFlag" };
		self:SynchronizeUpdateFriend( sInfo, setUpdateColumn )
	end
end
--添加或者更新一个最近联系人
function CFriendSystem:UpdateContact( dwRoleID, dwTime )
	if dwRoleID == self.dwRoleID then
		print("Update Contact Error, add self=========");
		return;
	end
	--检测如果已经存在于仇人列表中，那么将会更新这条记录，不会再添加
	
	--发送添加命令到KS服务器
	CKernelApp.GSRequestAddPlayerMsg{ Param = { dwRoleID, self.dwRoleID, 4  }; };
end
--从KS返回添加最近联系人的结果
function CFriendSystem:OnKSAddContact( playerMsg )
	local sInfo = self.setContacts[playerMsg.dwRoleID];
	if not sInfo then
		sInfo = sFriendInfoServer:new();
		sInfo.setMood = SPlayerMoodMsg:new();
		self.setContacts[playerMsg.dwRoleID] = sInfo;
		--更新数据库操作操作
		--self:UpdateOperation( sInfo, enDBOperation.eInsert, nil, true );
	else
		--更新数据库操作操作
		--self:UpdateOperation( sInfo, enDBOperation.eUpdate, nil, true );
	end
	for k,v in pairs(playerMsg) do
		if sInfo[k] then
			sInfo[k] = v;
		end
		if sInfo.setMood[k] then
			sInfo.setMood[k] = v;
		end
	end
	self:SynchronizeUpdateContact( sInfo );
end
--删除一个最近联系人
function CFriendSystem:DeleteContact( dwRoleID )
	local sInfo = self.setContacts[dwRoleID];
	if not sInfo then
		return;
	end
	--通知KS服务器进行删除操作
	CKernelApp.GSRequestDeletePlayerMsg{ Param = { dwRoleID, self.dwRoleID, 4 } };
end
function CFriendSystem:OnKSDeleteContact( dwRoleID )
	local sInfo = self.setContacts[dwRoleID];
	if not sInfo then
		return;
	end
	--self:UpdateOperation( sInfo, enDBOperation.eDelete, nil, true );
	--同步信息到客户端
	self:SynchronizeDeleteContact( sInfo );
end


--通知Player，自己被别人添加为好友
function CFriendSystem:NotifyBeAddedFriend( sMsg )
	--判断自己需不需要提示
	local settingSys = self:GetPlayer():GetSystem("CSettingSystem");
	if settingSys:CanPopBeAddedFriend() then
		self:SynchronizeBeAddedFriend( sMsg );
	end
end
--获取自己的心情和签名
function CFriendSystem:GetMood()
	return self.setMood;
end

--客户端获取征友信息
function CFriendSystem:RequestWantFriend()
	--发送消息到KS服务器
	CKernelApp.GSRequestPlatformMsg{ Param = { self.dwRoleID, 1 }; };
end
--客户端获取征婚信息
function CFriendSystem:RequestWantMarry( dwSex )
	--发送消息到KS服务器
	CKernelApp.GSRequestPlatformMsg{ Param = { self.dwRoleID, 2, dwSex }; };
end
--客户端获取共同仇人信息
function CFriendSystem:RequestSameEnemy()
	--发送消息到KS服务器
	CKernelApp.GSRequestPlatformMsg{ Param = { self.dwRoleID, 3 }; };
end
--客户端获取某一个人和我的共同仇人ID
function CFriendSystem:RequestSameEnemyIDOf( dwRoleID )
	--发送消息到KS服务器
	CKernelApp.GSRequestPlatformMsg{ Param = { self.dwRoleID, 4, dwRoleID }; };
end
--执行搜索玩家，传入字符串，执行搜索，第一次返回5条消息
function CFriendSystem:SearchFriend( strName )
	--发送搜索的命令到服务端
	CKernelApp.GSRequestSearchFriendMsg{ Param = { self.dwRoleID, strName }; };
end
--玩家请求显示查询的消息
function CFriendSystem:RequestSearchMsg( dwPage )
	--发送获取消息到服务端
	CKernelApp.GSRequestSearchPageMsg{ Param = { self.dwRoleID, dwPage }; };
end
-- sFriendInfo 信息优化
local FriendMsgTable = {
	dwRoleID = 1;		--记录好友的ID
	dwFlag = 2;--我与好友的关系，详见enFriendFlag
	dwMeetTime = 3;		--我第一次添加好友的时间
	dwLastTime = 4;		--我最后一次被仇人击杀的时间
	dwYanHui = 5;		--0没有宴会，1有宴会
	dwTanWei = 6;		--0没有摊位，1有摊位
	dwOnLine = 7;		--0是不在线，1是在线
	dwVip = 8;			--0不是VIP，1是VIP
	dwLevel = 9;		--记录玩家的等级
	dwProf = 10;			--职业
	dwHead = 11;			--头像的ID
	strName = 12;		--记录玩家的姓名
	strBangPai = 13;	--帮派名称
	dwBangPaiID = 14;	--帮派的ID
	dwEnemy = 15;		--仇恨值
	dwInjectFlag = 16;		--是否灌注过
};
-- sContactInfo 信息优化
local ContactMsgTable = {
	dwRoleID = 1;		--记录最近联系人的ID
	dwLastTime = 2;		--记录最后一次对话的时间
	dwYanHui = 3;		--0没有宴会，1有宴会
	dwTanWei = 4;		--0没有摊位，1有摊位
	dwOnLine = 5;		--0是不在线，1是在线
	dwVip = 6;			--0不是VIP，1是VIP
	dwLevel = 7;		--记录玩家的等级
	dwProf = 8;			--职业
	dwHead = 9;			--头像的ID
	strName = 10;		--记录玩家的姓名
	strBangPai = 11;	--帮派名称
	dwBangPaiID = 12;	--帮派的ID
};
--查看玩家信息的消息优化
local SPMsgTable = {
	dwRoleID = 1;
	dwHP = 2;
	dwMP = 3;
	dwHPMax = 4;
	dwMPMax = 5;
	dwAttack = 6;
	dwDefense = 7;
	dwFlee = 8;--身法
	dwCrit = 9;--暴击
	dwAttackSpeed = 10;
	dwMoveSpeed = 11;
	dwLevel = 12;
	strName = 13;--姓名
	strMate = 14;--配偶
	strFaction = 15;--帮派
	dwProf = 16;	--职业
	dwPlayerScore = 17;--玩家评分
	dwHitPercent = 18;--命中
	dwIgnoreDefense= 19;--忽视防御
	dwAppendAttack = 20;--追加伤害
	dwRemitAttack = 21;--伤害减免
	dwBounceAttack= 22;--伤害反弹
	dwAbsorbHP= 23;--生命吸取
	dwAbsorbMP = 24;--内力吸取
	dwDuck = 25;--闪避率
	dwAppendCrit = 26;--暴击伤害（百分比）
	dwAllSkillUpLv = 27; --武功层数
	dwDander = 28;--怒气值
	dwPoint = 29;--潜力点
	dwPKForbid = 30;--禁止PK标志：0-可以；1-等级不够；2-杀死保护
	dwCaromCount = 31;--连击次数
	dwSkillForbidFlag = 32;--技能禁止标志
	dwMoveForbidFlag = 33;--移动禁止标志
	dwUseItemForbidFlag = 34;--物品使用禁止标志
	dwDanderUp = 35;--怒气增加
	dwExpUp = 36;--经验增加
	dwMountExpUp = 37;--坐骑经验增加
	dwSitUp = 38;--打坐收益增加
	dwSkillKlgUp = 39;--技能熟练度增加
	dwMonsterAppend = 40;--怪物再伤害系数
	dwPoJiaValue = 41;--破甲
	dwPoJiaDiKang = 42;--破甲抵抗
	dwCritDown = 43; --暴击抵抗
	dwForbidValue = 44;--霸体值
	dwForbidValueMax = 45;--霸体值上限
};
local SAMsgTable = {
	szRoleName		= 1;		--玩家名字
	dwSex			= 2;		--玩家性别
	dwFace			= 3;		--玩家脸型
	dwHair			= 4;		--玩家发型
	dwProf 			= 5;		--玩家职业
	dwIncoID		= 6;		--头像ID
	dwDress			= 7;		--衣服
	dwHand			= 8;		--护手
	dwShoe			= 9;		--鞋子
	dwArms			= 10;		--武器开始的时候没有武器
	dwHorseID       = 11;		--坐骑为空
	dwDefDress		= 12;		--衣服
	dwDefHand		= 13;		--护手
	dwDefShoe		= 14;		--鞋子
	dwDefHair		= 15;		--头部
	dwDefFace		= 16;		--脸型
	--lw：增加装备的强化等级
	dwDressLevel	= 17;			--衣服强化等级
	dwHandLevel		= 18;			--护手强化等级
	dwShoeLevel		= 19;			--鞋子强化等级
	dwArmsLevel		= 20;			--武器强化等级
	setSuitPfx 		= 21;
	setActSuitList	= 22;
	dwDefIncoID		= 23;
};
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
--获取玩家信息的远程调用函数
function CFriendSystem:PlayerMsgCB( dwRoleID, dwHaveAvatar, szName )
	--local dwHaveAvatar = args[1];
	--print("dwHaveAvatar==========================", dwHaveAvatar)
	local player = self:GetPlayer();
	
	if dwRoleID ~= player:GetRoleID() then
		player.OnBeLookedNoticeMsg
		{
			RoleID = dwRoleID;
			RoleName = szName;
		}
	end
	
	local sysItem = player:GetSystem("CItemSystem");
	--获取玩家的详细信息，返回客户端：装备，属性，装备具体信息、Avatar信息等
	local spMsg = SPlayerPropertyViewMsg:new();
	local skillInfo = player:GetSystem("CSkillSystem"):GetInfo();
	for k,v in pairs(spMsg) do
		if skillInfo[k] then
			spMsg[k] = skillInfo[k];
			--print("===================skillInfo["..k.."] : "..skillInfo[k]);
		end
	end
	local marrySys = player:GetSystem("CMarriageSystem");
	local roleInfo = player:GetInfo();
	roleInfo.setModelList = player.setModelList;
	spMsg.dwLevel = player:GetLevel();
	spMsg.strName = roleInfo.szRoleName;--姓名
	spMsg.dwRoleID = self.dwRoleID;
	spMsg.strMate = marrySys:GetMateName();--配偶
	spMsg.strFaction = player:GetSystem("CGuildSystem"):GetGuildName() or "";	--帮派名称
	spMsg.dwProf = roleInfo.dwProf;
	--转换成数字key
	spMsg = KeyToNumber( spMsg, SPMsgTable );
	--获取玩家的Avatar信息，用于渲染
	local saMsg = {};
	saMsg = SPlayerAvatarViewMsg:new();
	saMsg.setModelList = {};
	for k,v in pairs(saMsg) do
		saMsg[k] = roleInfo[k];
	end
	--转换成数字key
	saMsg = KeyToNumber( saMsg, SAMsgTable );
	
	--获取玩家的装备信息
	local siMsg = sysItem:GetEquipsNetData();
	--转换成数字key
	--siMsg = CItemSystem:KeyNameToNumber( siMsg );
	--print("CFriendSystem:RequestPlayerMsg Get Equip Count", dwCount);
	--获取玩家的境界信息
	local sjMsg;-- = player:GetSystem("CBournSystem"):GetPlayerViewMsg();
	if not self:HasAuthority( 'Bourn',false ) then
		sjMsg = { dwHaveAuthor = 1; };
	else
		sjMsg = player:GetSystem("CBournSystem"):GetPlayerViewMsg();
	end
	
	--获取玩家的五行套装信息
	local wxMsg = player:GetSystem("CFiveElemSystem"):GetPlayerViewMsg();
	--获取玩家的经脉信息
	local jmMsg;
	if not self:HasAuthority( 'Pulse',false ) then
		jmMsg = { dwHaveAuthor = 1; };
	else
		jmMsg = player:GetSystem("CPulseSystem"):GetPlayerViewMsg();
	end
	--玩家战斗力数据
	local tbInfo = player:GetSystem("CSkillSystem"):CountBattleScoreInfo();
	local zhanMsg = {};
	for n,v in pairs(tbInfo)do
		local id = BattleScoreName2Index(n);
		if id then
			zhanMsg[id] = v;
		end
	end
	
	--宝石数据
	local stoneMsg = sysItem:GetStoneNetData()
	
	--罪恶值，风云勋章，威望值
	local sysPK = player:GetSystem("CPKSystem");
	local sysWeiWang = player:GetSystem("CMissionDailySystem");
	local sysErrantHonor = player:GetSystem("CErrantHonorSystem");
	local splMsg = {};
	splMsg[1] = sysPK.dwPKValue;
	splMsg[2] = sysWeiWang:GetTotalActivePoint();
	splMsg[3] = sysErrantHonor.dwErrantValue;
	--通知客户端
	local a = { spMsg, siMsg, sjMsg, saMsg, jmMsg, zhanMsg,splMsg };
	--print("length=============",#_encode(a))
	--table.print(siMsg);
	--return a;
	--发起远程调用返回数据
	GSRemoteCall(dwRoleID,"CFriendSystem","PlayerMsgCBResult", { a } ,nil);
	local b = {self.dwRoleID,stoneMsg};
	GSRemoteCall(dwRoleID,"CFriendSystem","PlayerMsgStoneCBResult", { b } ,nil);
end
----
function CFriendSystem:PlayerMsgStoneCBResult(data)
	local dwRoleID,stoneMsg = unpack(data);
	self:GetPlayer().OnRequestPlayerStoneMsg
	{
		RoleID = dwRoleID;
		StoneInfo = stoneMsg;
	}
end
--远程调用返回参数
function CFriendSystem:PlayerMsgCBResult(playerdata)
	local spMsg, siMsg, sjMsg, saMsg, jmMsg, zhanMsg,splMsg = unpack(playerdata);
	local tbSend = {spMsg, siMsg, saMsg, sjMsg, jmMsg,splMsg};
	local dwProf = spMsg.dwProf or saMsg.dwProf;
	self:SynchronizePlayerZhanMsgView(spMsg.dwRoleID,dwProf,zhanMsg);  -----切割战斗消息
	
	self:SynchronizePlayerMsgView(tbSend);
end
--获取一个玩家的详细信息
function CFriendSystem:RequestPlayerMsg( dwRoleID, dwHaveAvatar )
	local objSelf = self:GetPlayer();
	
	local args = { self.dwRoleID, dwHaveAvatar, objSelf:GetName() };
	--发起远程调用,请求对方的数据
	local cbfunc = function(_, result, _)
		if result == -1 then
			--通知客户端，玩家已经下线
			self:OnError( 6000110006, dwRoleID );
		end;
	end;
	GSRemoteCall(dwRoleID,"CFriendSystem","PlayerMsgCB",args,cbfunc);
end
--打探回调函数
function CFriendSystem:DaTanCB( dwRoleID )
	--获取玩家信息
	local mapSys = self:GetPlayer():GetSystem("CMapSystem");
	local dtMsg = {
		dwMapID = 0,
		dwLineID = 0;
		dwX = 0,
		dwY = 0,
	};
	
	dtMsg.dwRoleID = self.dwRoleID;
	--dtMsg.dwX = mapSys.fXPos;
	--dtMsg.dwY = mapSys.fYPos;
	dtMsg.dwMapID,dtMsg.dwX,dtMsg.dwY,dtMsg.dwDuplID = mapSys:GetPlayerMapPos();
	dtMsg.dwLineID = CKernelApp.dwLineID;--mapSys.dwCurLine;--获取玩家所在的线ID
	--return dtMsg;
	--发起远程调用返回数据
	GSRemoteCall(dwRoleID,"CFriendSystem","DaTanCBResult",{ dtMsg },nil);
end
--打探接收信息函数
function CFriendSystem:DaTanCBResult( dtMsg )
	--检查讨伐令的数量
	local itemSys = self:GetPlayer():GetSystem("CItemSystem");
	local dwItemEnum = 5500030;
	local dwCounts, dwNumBind, dwNumNotBind = itemSys:GetEnumItemNumInPacket(dwItemEnum);
	if 1 > dwCounts then
		return;
	end;
	--使用讨伐令
	itemSys:DelEnumItemInPacket(dwItemEnum, 1, false, _G.ItemSysOperType.Friend);
	
	self:SynchronizeDaTan( dtMsg );
end
--打探玩家
function CFriendSystem:RequestDaTan( dwRoleID )
	--发送打探命令到KS
	--[[
	local onlinecb = function( args )
		--检查讨伐令的数量
		local itemSys = self:GetPlayer():GetSystem("CItemSystem");
		local dwItemEnum = 5500030;
		local dwCounts, dwNumBind, dwNumNotBind = itemSys:GetEnumItemNumInPacket(dwItemEnum);
		if 1 > dwCounts then
			return;
		end;
		--使用讨伐令
		itemSys:DelEnumItemInPacket(dwItemEnum, 1, false, _G.ItemSysOperType.Friend);
		self:SynchronizeDaTan( args );
	end
	local offlinecb = function( args )
		--通知客户端，玩家已经下线
		self:OnError( 4107, dwRoleID );
	end
	local fromid = self.dwRoleID;
	local toid = dwRoleID;
	--]]
	local args = { self.dwRoleID };
	--发起远程调用,请求对方的数据
	local cbfunc = function(_, result, _)
		if result == -1 then
			--通知客户端，玩家已经下线
			self:OnError( 6000110012, dwRoleID );
		end;
	end;
	GSRemoteCall(dwRoleID,"CFriendSystem","DaTanCB",args,cbfunc);
end
--获取好友的数目
function CFriendSystem:GetFriendCount()
	local dwCount = 0;
	for dwRoleID,sInfo in pairs(self.setFriends) do
		if sInfo.dwDBOper ~= enDBOperation.eDelete then
			if sInfo.dwFlag == enFriendFlag.eFriend or 
				sInfo.dwFlag == enFriendFlag.eFriendAndEnemy then
				dwCount = dwCount + 1;
			end
		end
	end
	return dwCount;
end
--获取仇人的数目
function CFriendSystem:GetEnemyCount()
	local dwCount = 0;
	for dwRoleID,sInfo in pairs(self.setFriends) do
		if sInfo.dwDBOper ~= enDBOperation.eDelete then
			if sInfo.dwFlag == enFriendFlag.eEnemy or 
				sInfo.dwFlag == enFriendFlag.eFriendAndEnemy or
				sInfo.dwFlag == enFriendFlag.eBlackAndEnemy then
				dwCount = dwCount + 1;
			end
		end
	end
	return dwCount;
end
--获取黑名单的数目
function CFriendSystem:GetBlackCount()
	local dwCount = 0;
	for dwRoleID,sInfo in pairs(self.setFriends) do
		if sInfo.dwDBOper ~= enDBOperation.eDelete then
			if sInfo.dwFlag == enFriendFlag.eBlackList or
				sInfo.dwFlag == enFriendFlag.eBlackAndEnemy then
				dwCount = dwCount + 1;
			end
		end
	end
	return dwCount;
end
--获取最近联系人的数目
function CFriendSystem:GetContactCount()
	local dwCount = 0;
	for dwRoleID,sInfo in pairs(self.setContacts) do
		if sInfo.dwDBOper ~= enDBOperation.eDelete then
			dwCount = dwCount + 1;
		end
	end
	return dwCount;
end
--获取好友信息列表，key是序号，value是sFriendInfo的引用
function CFriendSystem:GetFriendList()
	local List = {};
	for dwRoleID,sInfo in pairs(self.setFriends) do
		if sInfo.dwDBOper ~= enDBOperation.eDelete and
			sInfo.dwFlag == enFriendFlag.eFriend or 
			sInfo.dwFlag == enFriendFlag.eFriendAndEnemy then
			table.insert(List, sInfo);
		end
	end
	return List;
end
--获取仇人的ID列表
function CFriendSystem:GetEnemyID()
	local List = {};
	for dwRoleID,sInfo in pairs(self.setFriends) do
		if sInfo.dwDBOper ~= enDBOperation.eDelete and 
			sInfo.dwFlag == enFriendFlag.eEnemy or 
			sInfo.dwFlag == enFriendFlag.eFriendAndEnemy or
			sInfo.dwFlag == enFriendFlag.eBlackAndEnemy then
			table.insert(List, dwRoleID);
		end
	end
	return List;
end
--获取仇人信息
function CFriendSystem:GetEnemyMsg()
	local List = {};
	for dwRoleID,sInfo in pairs(self.setFriends) do
		if sInfo.dwDBOper ~= enDBOperation.eDelete and 
			sInfo.dwFlag == enFriendFlag.eEnemy or 
			sInfo.dwFlag == enFriendFlag.eFriendAndEnemy or
			sInfo.dwFlag == enFriendFlag.eBlackAndEnemy then
			--获取信息
			local msg = SSameEnemyMessage:new();
			for k,v in pairs(msg) do
				msg[k] = sInfo[k];
			end
			table.insert( List, msg );
		end
	end
	return List;
end
--获取共同仇人的信息
function CFriendSystem:GetSameEnemyMsg( fSys )
	local IDs = self:GetSameEnemyID( fSys );
	local List = {};
	for k,dwRoleID in pairs(IDs) do
		local sInfo = self.setFriends[dwRoleID];
		if sInfo then
			--获取信息
			local msg = SSameEnemyMessage:new();
			for k,v in pairs(msg) do
				msg[k] = sInfo[k];
			end
			table.insert( List, msg );
		end
	end
	return List;
end
--获取仇人信息列表，key是序号，value是sFriendInfo的引用
function CFriendSystem:GetEnemyList()
	local List = {};
	for dwRoleID,sInfo in pairs(self.setFriends) do
		if sInfo.dwDBOper ~= enDBOperation.eDelete and 
			sInfo.dwFlag == enFriendFlag.eEnemy or 
			sInfo.dwFlag == enFriendFlag.eFriendAndEnemy or
			sInfo.dwFlag == enFriendFlag.eBlackAndEnemy then
			table.insert(List, sInfo);
		end
	end
	return List;
end
--获取黑名单信息列表，key是序号，value是sFriendInfo的引用
function CFriendSystem:GetBlackList()
	local List = {};
	for dwRoleID,sInfo in pairs(self.setFriends) do
		if sInfo.dwDBOper ~= enDBOperation.eDelete and
			sInfo.dwFlag == enFriendFlag.eBlackList or
			sInfo.dwFlag == enFriendFlag.eBlackAndEnemy then
			table.insert(List, sInfo);
		end
	end
	return List;
end
--获取最近联系人信息列表，key是序号，value是sContactInfo的引用
function CFriendSystem:GetContactList()
	local List = {};
	for dwRoleID,sInfo in pairs(self.setContacts) do
		if sInfo.dwDBOper ~= enDBOperation.eDelete then
			table.insert(List, sInfo);
		end
	end
	return List;
end
--检查两个人是否有共同好友
function CFriendSystem:IsHaveSameEnemy( fSys )
	local myEnemy = self:GetEnemyID();
	local hisEnemy = fSys:GetEnemyID();
	--从小到大排序
	local IDSort = function(a, b)
		return a < b;
	end
	table.sort( myEnemy, IDSort );
	table.sort( hisEnemy, IDSort );
	local mylen = #myEnemy;
	local hislen = #hisEnemy;
	if mylen == 0 or hislen == 0 then
		return false;
	end
	local myindex = 1;
	local hisindex = 1;
	while myindex <= mylen and hisindex <= hislen do
		if myEnemy[myindex] == hisEnemy[hisindex] then
			return true;
		elseif myEnemy[myindex] > hisEnemy[hisindex] then
			hisindex = hisindex + 1;
		else --myEnemy[myindex] < hisEnemy[hisindex]
			myindex = myindex + 1;
		end
	end
	return false;
end
--获取两个人共同仇人的数量
function CFriendSystem:GetSameEnemyCount( fSys )
	local count = 0;
	local myEnemy = self:GetEnemyID();
	local hisEnemy = fSys:GetEnemyID();
	--从小到大排序
	local IDSort = function(a, b)
		return a < b;
	end
	table.sort( myEnemy, IDSort );
	table.sort( hisEnemy, IDSort );
	local mylen = #myEnemy;
	local hislen = #hisEnemy;
	if mylen == 0 or hislen == 0 then
		return 0;
	end
	local myindex = 1;
	local hisindex = 1;
	while myindex <= mylen and hisindex <= hislen do
		if myEnemy[myindex] == hisEnemy[hisindex] then
			count = count + 1;
			myindex = myindex + 1;
			hisindex = hisindex + 1;
		elseif myEnemy[myindex] > hisEnemy[hisindex] then
			hisindex = hisindex + 1;
		else --myEnemy[myindex] < hisEnemy[hisindex]
			myindex = myindex + 1;
		end
	end
	return count;
end
--获取两个人共同仇人的ID列表
function CFriendSystem:GetSameEnemyID( fSys )
	local list = {};
	local myEnemy = self:GetEnemyID();
	local hisEnemy = fSys:GetEnemyID();
	--从小到大排序
	local IDSort = function(a, b)
		return a < b;
	end
	table.sort( myEnemy, IDSort );
	table.sort( hisEnemy, IDSort );
	local mylen = #myEnemy;
	local hislen = #hisEnemy;
	if mylen == 0 or hislen == 0 then
		return list;
	end
	local myindex = 1;
	local hisindex = 1;
	while myindex <= mylen and hisindex <= hislen do
		if myEnemy[myindex] == hisEnemy[hisindex] then
			table.insert(list, myEnemy[myindex]);
			myindex = myindex + 1;
			hisindex = hisindex + 1;
		elseif myEnemy[myindex] > hisEnemy[hisindex] then
			hisindex = hisindex + 1;
		else --myEnemy[myindex] < hisEnemy[hisindex]
			myindex = myindex + 1;
		end
	end
	return list;
end
--检测某一个人是否是自己的好友
function CFriendSystem:IsHaveInFriend(dwRoleID)
	local sInfo = self.setFriends[dwRoleID];
	if sInfo and sInfo.dwDBOper ~= enDBOperation.eDelete then
		if sInfo.dwFlag == enFriendFlag.eFriend or 
			sInfo.dwFlag == enFriendFlag.eFriendAndEnemy then
			return true;
		end
	end
	return false;
end
--检测某一个人是否在自己的仇人列表里面
function CFriendSystem:IsHaveInEnemy(dwRoleID)
	local sInfo = self.setFriends[dwRoleID];
	if sInfo and sInfo.dwDBOper ~= enDBOperation.eDelete then
		if sInfo.dwFlag == enFriendFlag.eEnemy or 
			sInfo.dwFlag == enFriendFlag.eFriendAndEnemy or
			sInfo.dwFlag == enFriendFlag.eBlackAndEnemy then
			return true;
		end
	end
	return false;
end
--检测某一个人是否在自己黑名单里面
function CFriendSystem:IsHaveInBlackList(dwRoleID)
	local sInfo = self.setFriends[dwRoleID];
	if sInfo  and sInfo.dwDBOper ~= enDBOperation.eDelete then
		if sInfo.dwFlag == enFriendFlag.eBlackList or
			sInfo.dwFlag == enFriendFlag.eBlackAndEnemy then
			return true;
		end
	end
	return false;
end
--查询当前的列表中是否包含有相应角色
function CFriendSystem:IsHaveRole(dwRoleID)
	local sInfo = self.setFriends[dwRoleID];
	if sInfo and sInfo.dwFlag ~= enFriendFlag.eNone 
		and sInfo.dwDBOper ~= enDBOperation.eDelete then
		return true;
	end
	sInfo = self.setContacts[dwRoleID];
	if sInfo and sInfo.dwDBOper ~= enDBOperation.eDelete then
		return true;
	end
	return false;
end
--获取玩家的性别，1为男，2为女
local ProfSex = { 
		[enProfType.eProfType_Sickle] = 2,
		[enProfType.eProfType_Knife] = 1,
		[enProfType.eProfType_Sword] = 1,
		[enProfType.eProfType_Spear] = 2,
	};
function CFriendSystem:GetSex()
	local sRoleInfo = self:GetPlayer():GetInfo();
	return ProfSex[sRoleInfo.dwProf] or 1;
end
--获取一条朋友信息
function CFriendSystem:GetFriendInfo(dwRoleID)
	return self.setFriends[dwRoleID];
end
--获取一条最近联系人信息
function CFriendSystem:GetContactInfo(dwRoleID)
	return self.setContacts[dwRoleID];
end
--获取自己的角色ID
function CFriendSystem:GetRoleID()
	return self.dwRoleID;
end
--获取自己的名字
function CFriendSystem:GetName()
	return self.strName;
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
--系统信息同步
--操作出错消息发送
function CFriendSystem:OnError(dwError, dwCode1, dwCode2)
	self:GetPlayer().OnFriendSystemErrorMsg{ Error=dwError, Code1=dwCode1 or 0, Code2=dwCode2 or 0 };
end
--发送一个玩家的消息回到客户端
function CFriendSystem:SynchronizePlayerMsgView(playerdata)
	playerdata.bAllianceLeader = (CAllianceLeaderManager:GetAllianceLeaderName() == playerdata[1][13])
	self:GetPlayer().OnRequestPlayerMsg{ PlayerData = playerdata; };
end

---发送一个玩家的战斗消息回到客户端
function CFriendSystem:SynchronizePlayerZhanMsgView(dwRoleID,dwProf,zhanMsg)  -----切割战斗消息
	self:GetPlayer().OnRequestPlayerZhanMsg{dwRoleID = dwRoleID,dwProf = dwProf, zhanMsg = zhanMsg};
end
--发送一次搜索的查询消息
function CFriendSystem:SynchronizeSearchMsg(dwPage, setMsg)
	self:GetPlayer().OnRequestSearchMsg{ Page=dwPage,Msg=setMsg };
end
--发送查询的数量信息
function CFriendSystem:SynchronizeSearchNumberMsg(dwPage, dwTotalCount)
	self:GetPlayer().OnRequestSearchNumberMsg{	TotalPage = dwPage, TotalCount=dwTotalCount };
end
--更新一条朋友关系，必须的参数： dwRoleID, dwFlag
function CFriendSystem:SynchronizeUpdateFriend( sInfo, setUpdateColumn )
	local si;
	if not setUpdateColumn then
		si = sFriendInfo:new();--更新全部
		for k, v in pairs(si) do
			si[k] = sInfo[k];
		end
		si.setMood = sInfo.setMood;
	else
		si = { };--更新部分
		for k,v in pairs(setUpdateColumn) do
			si[v] = sInfo[v];
		end
	end
	si.dwRoleID = sInfo.dwRoleID;
	si.dwFlag = sInfo.dwFlag;
	--转换成数字key
	si = KeyToNumber( si, FriendMsgTable );
	
	self:GetPlayer().OnUpdateFriendMsg{ Friend = si };
end
--删除一条朋友关系
function CFriendSystem:SynchronizeDeleteFriend( sInfo )
	self:GetPlayer().OnDeleteFriendMsg{ ID = sInfo.dwRoleID; }
end
--更新一个最近联系人
function CFriendSystem:SynchronizeUpdateContact( sInfo, setUpdateColumn )
	local si;
	if not setUpdateColumn then
		si = sContactInfo:new();--更新全部
		for k, v in pairs(si) do
			si[k] = sInfo[k];
		end
	else
		si = {};--更新部分
		for k,v in pairs(setUpdateColumn) do
			si[v] = sInfo[v];
		end
	end
	si.setMood = sInfo.setMood;
	si.dwRoleID = sInfo.dwRoleID;
	si.dwFlag = sInfo.dwFlag;
	--转换成数字key
	si = KeyToNumber( si, ContactMsgTable );
	
	self:GetPlayer().OnUpdateContactMsg{ Contact = si };
end
--删除了一个联系人
function CFriendSystem:SynchronizeDeleteContact( sInfo )
	self:GetPlayer().OnDeleteContactMsg{ ID = sInfo.dwRoleID; }
end
--通知客户端一个玩家的在线信息
function CFriendSystem:SynchronizeRoleOnLine( dwRoleID, dwOnLine, bFirstNotify )
	if bFirstNotify then
		dwOnLine = 2;--第一次通知的话，传递online值为2
	end
	self:GetPlayer().OnUpdateOnLineMsg{ RoleID=dwRoleID, OnLine=dwOnLine };
end
--通知客户端一个玩家的VIP信息
function CFriendSystem:SynchronizeRoleVip( dwRoleID, dwVip )
	self:GetPlayer().OnUpdateVIPMsg{ RoleID = dwRoleID,VIP = dwVip };
end
--通知客户端一个玩家的商城信息
function CFriendSystem:SynchronizeRoleTanWei( dwRoleID, dwTanWei )
	self:GetPlayer().OnUpdateTanWeiMsg{ RoleID = dwRoleID, TanWei = dwTanWei, };
end
--通知客户端，一个玩家的等级改变
function CFriendSystem:SynchronizeRoleLevelUp( dwRoleID, dwLevel )
	self:GetPlayer().OnUpdateLevelMsg{ RoleID = dwRoleID, Level = dwLevel, };
end
--通知客户端，一个玩家的帮派信息改变
function CFriendSystem:SynchronizeRoleBangPai( dwRoleID, dwBangPaiID, strBangPai )
	self:GetPlayer().OnUpdateBangPaiMsg{ RoleID = dwRoleID, BangPaiID = dwBangPaiID, BangPai = strBangPai };
end
--通知客户端，一个玩家的心情改变了
function CFriendSystem:SynchronizeRoleMood( setMood )
	self:GetPlayer().OnUpdateRoleMoodMsg{ Mood = setMood };
end
--通知客户端婚宴信息改变了
function CFriendSystem:SynchronizeRoleHunYan(dwRoleID, dwYanHui)
	self:GetPlayer().OnUpdateYanHuiMsg{ RoleID=dwRoleID, YanHui=dwYanHui };
end
--通知客户端，玩家的仇恨值改变了
function CFriendSystem:SynchronizeRoleEnemy( dwRoleID, dwEnemy )
	self:GetPlayer().OnUpdateEnemyCountMsg{ RoleID=dwRoleID, Enemy=dwEnemy };
end

--通知客户端，自己被别人添加为了好友
function CFriendSystem:SynchronizeBeAddedFriend( sMsg )
	self:GetPlayer().OnBeAddedFriendMsg{ Msg=sMsg };
end
--通知客户端打探结果
function CFriendSystem:SynchronizeDaTan(sMsg)
	self:GetPlayer().OnDaTanMsg{ Msg = sMsg };
	
	self:GetPlayer():GetSystem('CPlayerEventCenterSystem'):
    DoEvent(enumPlayerEventType.EventDaTan, 1);
end

--通知客户端更改好友平台好友信息
function CFriendSystem:SynchronizeWantFriend( setMsgs )
	self:GetPlayer().OnRequestWantFriendMsg{ Msgs=setMsgs };
end
--通知客户端更改好友平台征婚信息
function CFriendSystem:SynchronizeWantMarry( setMsgs, dwSex )
	self:GetPlayer().OnRequestWantMarryMsg{ Msgs=setMsgs, Sex=dwSex };
end
--通知客户端更改好友平台共同仇人信息
function CFriendSystem:SynchronizeSameEnemy( setMsgs )
	self:GetPlayer().OnRequestSameEnemyMsg{ Msgs=setMsgs };
end
--通知客户端，获取了哪个玩家的共同仇人ID列表，具体信息到客户端再获取
function CFriendSystem:SynchronizeEnemyIDs( setIDs, dwRoleID )
	self:GetPlayer().OnRequestEnemyIDMsg{ Msgs=setIDs, RoleID=dwRoleID };
end
--通知客户端，自己的征婚信息状态
function CFriendSystem:SynchronizeWantMarryState( dwState, strMessage )
	self.dwWantMarryState = dwState;
	self:GetPlayer().OnUpdateWantMarryStateMsg{ State = dwState, Message = strMessage };
end
--通知客户端，自己的签名和心情
function CFriendSystem:SynchronizeMood( msg )
	self:GetPlayer().OnFriendSyncMoodMsg{ Msg = msg };
end
--通知客户端，征婚信息的收益提示
function CFriendSystem:IncomeNotice( dwID )
	self:GetPlayer().OnFriendSystemIncomeNoticeMsg{ ID=dwID };
end
--通知客户端，弹出提示图标
function CFriendSystem:IconNotice(dwID)
	self:GetPlayer().OnFriendIconNoticeMsg{ ID=dwID };
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------
--内部操作
--更新一个Friend字段或Contact字段的数据库操作
function CFriendSystem:UpdateOperation( sInfo, dwOper, setUpdateColumn, bForbidDB )
	sInfo.dwDBOper = dwOper;
	--如果没有禁止数据库操作，那么更新数据
	if not bForbidDB then
		if dwOper == enDBOperation.eDelete then
			self.objDBQuery:DeleteFriend( sInfo );
			self.setFriends[sInfo.dwRoleID] = nil;--删除好友列表数据
			--print("delete friend", sInfo.dwRoleID)
		elseif dwOper == enDBOperation.eInsert then
			self.objDBQuery:InsertFriend( sInfo );
			--print("insert friend", sInfo.dwRoleID)
		elseif dwOper == enDBOperation.eUpdate then
			self.objDBQuery:UpdateFriend( sInfo, setUpdateColumn );
			--print("update friend", sInfo.dwRoleID)
		end
	end
end
--dwOperType说明操作的是哪一个类型：Friend，Enemy，Blacklist
_G.enOperateType = 
{
	eFriend = 1,
	eEnemy = 2,
	eBlackList = 3,
};
--寻找好友关系的下一个状态，传入当前sFriendInfo信息的结构体，确定是Add操作还是Delete操作
function CFriendSystem:UpdateFriendFlag( sInfo, bAdd, dwOperType )
	local changeState = nil;
	if bAdd then
		--Add操作的状态转换关系
		local AddState = {
			[enFriendFlag.eNone] = {	--由None关系转换到其它三个关系
				[enOperateType.eFriend] = enFriendFlag.eFriend;
				[enOperateType.eEnemy] = enFriendFlag.eEnemy;
				[enOperateType.eBlackList] = enFriendFlag.eBlackList;
			};
			[enFriendFlag.eFriend] = {	--由朋友关系转到好友兼敌人关系
				[enOperateType.eEnemy] = enFriendFlag.eFriendAndEnemy;
				[enOperateType.eBlackList] = enFriendFlag.eBlackList;--如果是增加黑名单，那么删除好友关系
			};
			[enFriendFlag.eEnemy] = {	--由敌人关系转到敌人朋友、敌人黑名单关系
				[enOperateType.eFriend] = enFriendFlag.eFriendAndEnemy;
				[enOperateType.eBlackList] = enFriendFlag.eBlackAndEnemy;
			};
			[enFriendFlag.eBlackList] = {--由黑名单转到敌人黑名单
				[enOperateType.eEnemy] = enFriendFlag.eBlackAndEnemy;
				[enOperateType.eFriend] = enFriendFlag.eFriend;--如果是增加好友，那么删除黑名单关系
			};
			[enFriendFlag.eFriendAndEnemy] = {
				[enOperateType.eBlackList] = enFriendFlag.eBlackAndEnemy;--如果是增加黑名单，那么删除好友关系
			};
			[enFriendFlag.eBlackAndEnemy] = {
				[enOperateType.eFriend] = enFriendFlag.eFriendAndEnemy;--如果是增加好友，那么删除黑名单关系
			};
		};
		changeState = AddState;
	else
		--Delete操作的状态转换关系
		local DeleteState = {
			[enFriendFlag.eFriend] = {
				[enOperateType.eFriend] = enFriendFlag.eNone;
			};
			[enFriendFlag.eEnemy] = {
				[enOperateType.eEnemy] = enFriendFlag.eNone;
			};
			[enFriendFlag.eBlackList] = {
				[enOperateType.eBlackList] = enFriendFlag.eNone;
			};
			[enFriendFlag.eFriendAndEnemy] = {
				[enOperateType.eFriend] = enFriendFlag.eEnemy;
				[enOperateType.eEnemy] = enFriendFlag.eFriend;
			};
			[enFriendFlag.eBlackAndEnemy] = {
				[enOperateType.eEnemy] = enFriendFlag.eBlackList;
				[enOperateType.eBlackList] = enFriendFlag.eEnemy;
			};
		};
		changeState = DeleteState;
	end
	if changeState[sInfo.dwFlag] then
		if changeState[sInfo.dwFlag][dwOperType] then
			sInfo.dwFlag = changeState[sInfo.dwFlag][dwOperType];
		end
	end
end
---获取网络传输的数据
function CFriendSystem:GetNetData( setFriends, setContacts )
	if setFriends then
		for dwRoleID,sInfo in pairs(self.setFriends) do
			if sInfo.dwFlag ~= enFriendFlag.eNone and sInfo.dwDBOper ~= enDBOperation.eDelete then
				local si = sFriendInfo:new();
				for k, v in pairs(si) do
					si[k] = sInfo[k];
				end
				si.setMood = sInfo.setMood;
				table.insert(setFriends, si);
			end
		end
	end
	if setContacts then
		for dwRoleID,sInfo in pairs(self.setContacts) do
			if sInfo.dwDBOper ~= enDBOperation.eDelete then
				local si = sContactInfo:new();
				for k, v in pairs(si) do
					si[k] = sInfo[k];
				end
				si.setMood = sInfo.setMood;
				table.insert(setContacts, si);
			end
		end
	end
end
function CFriendSystem:StartSendFriendMsg()
	self.setSendQueue = {};
	self:GetNetData( self.setSendQueue );
	if #self.setSendQueue == 0 then
		self.setSendQueue = nil;
		--发送自己的心情和签名
		self:SynchronizeMood( self:GetMood() );
		--发送结束的消息
		self:InitializeMsgEnd();
		return;
	end
	local sortFunc = function(a, b)
		return a.dwMeetTime < b.dwMeetTime;
	end
	table.sort( self.setSendQueue, sortFunc );
	self.bIsReadyToSend = true;
	self.dwSendCount = 0;
	self.dwSendNumber = 0;
	--发送第一批数据
	local list = self:GetNextQueueList();
	while #list ~= 0 do
		self:SendPatchFriendMsg( list );
		list = self:GetNextQueueList();
	end
	--发送自己的心情和签名
	self:SynchronizeMood( self:GetMood() );
end
--获取下一批要发送的好友信息
function CFriendSystem:GetNextQueueList()
	if not self.setSendQueue then
		return {};
	end
	local list = {};
	local lastNumber = self.dwSendNumber;
	for k=lastNumber+1,#self.setSendQueue do
		table.insert( list, self.setSendQueue[k] );
		self.dwSendNumber = self.dwSendNumber + 1;
		if self.dwSendNumber - lastNumber >= 12 then
			break;
		end
	end
	--已经没有消息需要发送，停止队列
	if #list == 0 then
		self.bIsReadyToSend = false;
		self.setSendQueue = nil;
		self.dwSendCount = nil;
		self.dwSendNumber = nil;
		self:InitializeMsgEnd();
	end
	return list;
end
--发送一批好友列表
function CFriendSystem:SendPatchFriendMsg( setFriends )
	if #setFriends == 0 then
		return;
	end
	--转换数字key
	local flist = {};
	for k,sinfo in pairs(setFriends) do
		local si = KeyToNumber( sinfo, FriendMsgTable );
		table.insert(flist, si);
	end
	
	self:GetPlayer().OnInitializeFriendMsg{ Friends = flist };
end
--发送队列结束消息
function CFriendSystem:InitializeMsgEnd()
	self:GetPlayer().OnInitializeMsgEndMsg{};
	
	self.setSendQueue = nil;
	--系统创建之后会向KS发送自己的数据和好友的数据
	--print("Initialize Msg End Check for login")
	CKernelApp.GSCheckForLoginMsg{ Param = self.dwRoleID };
end

function CFriendSystem:OnKSReConnect()
	CKernelApp.GSCheckForLoginMsg{ Param = self.dwRoleID };
end;

-------------------------------------------------------------------------------
function CFriendSystem:SetFriendInject(dwRoleID)
	local tbInfo = self.setFriends[dwRoleID];
	if not tbInfo then
		return;
	end
	tbInfo.dwInjectFlag = tbInfo.dwInjectFlag + 1;
	
	local setUpdateColumn = {"dwInjectFlag"};
	self:SynchronizeUpdateFriend( tbInfo, setUpdateColumn );
	
	self.objDBQuery:UpdateFriend(tbInfo, setUpdateColumn)
end;

function CFriendSystem:ClearAllInject()
	--清理的时候已经优先清除了DB
	for k,tbInfo in pairs(self.setFriends)do
		tbInfo.dwInjectFlag = 0;
	end
	--清空的消息和灌注数据一起，这里就不发了
end;

function CFriendSystem:IsCanInject(dwRoleID)
	local sInfo = self.setFriends[dwRoleID];
	if not sInfo then
		return false;
	end
	if sInfo.dwDBOper == enDBOperation.eDelete then
		return false;
	end
	if sInfo.dwFlag ~= enFriendFlag.eFriend and sInfo.dwFlag ~= enFriendFlag.eFriendAndEnemy then
		return false;
	end
	if sInfo.dwInjectFlag >= InjectConfig.dwFriendInjectMax then
		return false;
	end
	
	local dwFriendLevel = sInfo.dwLevel;
	local dwMyLevel = self:GetPlayer():GetLevel();
	
	local dwDis = dwFriendLevel - dwMyLevel;
	if dwDis < 0 then
		dwDis = 0-dwDis;
	end
	
	if dwDis > InjectConfig.dwLevelDistance then
		return false;
	end
	
	return true;
end;




