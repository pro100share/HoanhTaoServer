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
local TableCount = function( tab )
	local count = 0;
	for k,v in pairs(tab) do
		count = count + 1;
	end
	return count;
end

_G.CFriendSystem = {};
function CFriendSystem:new()
	local obj = CSystem:new("CFriendSystem");
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
--获取玩家的性别，1为男，2为女
local ProfSex = { 
		[enProfType.eProfType_Sickle] = 2,
		[enProfType.eProfType_Knife] = 1,
		[enProfType.eProfType_Sword] = 1,
		[enProfType.eProfType_Spear] = 2,
	};
function CFriendSystem:Create()
	--创建数据库处理模块
	local objPlayer = self:GetPlayer();
	self.dwRoleID = objPlayer:GetRoleID();--记录下自己的角色ID
	self.strName = string.lower( objPlayer:GetInfo().szRoleName );--自己的姓名
	
	--读取数据库好友数据，发送到GS上面
	local objDB = objPlayer:GetDBQuery();
	self.objDBQuery = CFriendSystemDB:new(objDB, self);
	--自己的心情和签名
	-- local setMood = SPlayerMoodMsg:new();
	self.CashFriendList = {};--缓冲列表，当玩家登陆的时候通过注册操作移除列表
	--加载心情信息
	-- self.objDBQuery:SelectMoodMsg( setMood );
	--加载玩家的好友信息
	self.objDBQuery:LoadFriendInfo( self.CashFriendList );
	
	--将数据提交到换线中心
	-- objPlayer:SetLineData("CFriendSystem", setMood);--提交背包数据
	local count = 0;
	local data = {};
	for k,fMsg in pairs(self.CashFriendList) do
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
	---初始化玩家的性别
	local sRoleInfo = self:GetPlayer():GetInfo();
	self.dwSexType = ProfSex[sRoleInfo.dwProf] or 1;
	
	return true;
end
function CFriendSystem:Update(dwInterval)
	return true;
end;
function CFriendSystem:Destroy()
	CFriendManager:DelFriendSystem( self.dwRoleID );--将自己从全局管理器注销
	CFriendDataManager:PlayerLogout( self.dwRoleID );
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------
--系统对外操作
--获取并移除create时保存的好友数据列表
function CFriendSystem:GetAndDelFriendCash()
	local list = self.CashFriendList;
	self.CashFriendList = nil;
	return list;
end
--检查是否需要发送玩家的最近联系人数据
function CFriendSystem:CheckToSendContact()
	if TableCount( self.setContacts ) ~= 0 then
		local contacts = {};
		for k,msg in pairs(self.setContacts) do
			local sInfo = sContactInfo:new();
			for i,j in pairs(sInfo) do
				if msg.data[i] then
					sInfo[i] = msg.data[i];
				end
			end
			sInfo.dwLastTime = msg.dwLastTime;
			table.insert( contacts, sInfo );
		end
		self:GetPlayer().objLine.KSGetContactMsg{ Param = { self.dwRoleID, contacts }; };
	end
end
--玩家换线的时候，需要传回玩家好友数据
function CFriendSystem:CheckToSendFriend()
	local changeList = {};
	for dwRoleID, sInfo in pairs(self.setFriends) do
		local updateData = { dwRoleID=dwRoleID };
		for k,name in pairs(CFriendDataManager.UpdateColumnName) do
			if sInfo.data[name] then
				updateData[name] = sInfo.data[name];
			end
		end
		table.insert( changeList, updateData );
	end
	if #changeList > 0 then
		self:GetPlayer().objLine.KSSyncFriendDataOnInitMsg{ Param={ self.dwRoleID, changeList }; };
	end
end
--当 GS 发送消息到KS之后，初始化好友列表和最近联系人列表；如果当前的最近联系人不为空，那么是玩家换线，同步最近联系人到GS
function CFriendSystem:InitializeFromGS( setFriendList )
	--更新玩家的好友列表
	for k,sMsg in pairs(setFriendList) do
		local otherMsg = CFriendDataManager:GetRoleData( sMsg.dwRoleID );
		local sInfo = { dwFlag = sMsg.dwFlag, 
			dwLastTime = sMsg.dwLastTime, 
			data = otherMsg,
			dwEnemy = sMsg.dwEnemy};
		self.setFriends[otherMsg.dwRoleID] = sInfo;
	end
	--添加好友系统到全局管理器
	CFriendManager:AddFriendSystem( self );
end
--GS上面更改dwEnemy的值
function CFriendSystem:GSEnemyChange( dwRoleID, dwEnemy )
	local fmsg = self.setFriends[dwRoleID];
	if fmsg then
		fmsg.dwEnemy = dwEnemy;
	end
end
--客户端获取征友信息
function CFriendSystem:RequestWantFriend()
	local msgs;
	msgs, self.dwWantFriendIndex = CFriendManager:GetWantFriend( self, self.dwWantFriendIndex );
	return self:SynchronizeWantFriend( msgs );
end
--客户端获取征婚信息
function CFriendSystem:RequestWantMarry( dwSex )
	local msgs;
	msgs, self.dwWantMarryIndex = CFriendManager:GetWantMarry( self, self.dwWantMarryIndex, dwSex );
	return self:SynchronizeWantMarry( msgs, dwSex );
end
--客户端获取共同仇人信息
function CFriendSystem:RequestSameEnemy()
	local msgs;
	msgs, self.dwSameEnemyIndex = CFriendManager:GetSameEnemy( self, self.dwSameEnemyIndex );
	return self:SynchronizeSameEnemy( msgs );
end
--客户端获取某一个人和我的共同仇人ID
function CFriendSystem:RequestSameEnemyIDOf( dwRoleID )
	local IDs = CFriendManager:GetSameEnemyIDOf( dwRoleID, self );
	self:SynchronizeEnemyIDs( IDs, dwRoleID )
end
--执行搜索玩家，传入字符串，执行搜索，第一次返回5条消息
function CFriendSystem:SearchFriend( strName )
	strName = string.lower(strName);
	self.strSearchName = strName;
	self.setSearchBuffer = {};
	--获取当前在线玩家
	local psysList = CFriendManager:GetFriendSysList();
	--匹配查找
	for k,psys in pairs(psysList) do
		if psys:GetRoleID() ~= self.dwRoleID then
			local name = psys:GetName();
			if string.find(name, strName) then
				local sInfo = psys:GetMySearchMsg();
				table.insert(self.setSearchBuffer, sInfo);
			end
		end
	end
	--对结果进行排序
	table.sort(self.setSearchBuffer, SortPlayer);
	--发送页数给玩家
	local z,f = math.modf(#self.setSearchBuffer / 5);
	local dwCount = z;
	if f > 0 or z == 0 then
		dwCount = dwCount + 1;
	end
	self:GetPlayer().objLine.KSOnRequestSearchNumberMsg{ Param = { self.dwRoleID, dwCount, #self.setSearchBuffer } };
	--获取前5个发送给客户端，不足则全部发送
	self:RequestSearchMsg( 1 );
end
--玩家请求显示查询的消息
function CFriendSystem:RequestSearchMsg( dwPage )
	--获取当前页的玩家信息发送给客户端
	local setMsg = {};
	for i=(dwPage*5-4),dwPage*5 do
		local sInfo = self.setSearchBuffer[i];
		if sInfo then
			table.insert(setMsg, sInfo);
		end
	end
	self:SynchronizeSearchMsg(dwPage, setMsg);
end


--获取好友的数目
function CFriendSystem:GetFriendCount()
	local dwCount = 0;
	for dwRoleID,sInfo in pairs(self.setFriends) do
		if sInfo.dwFlag == enFriendFlag.eFriend or 
			sInfo.dwFlag == enFriendFlag.eFriendAndEnemy then
			dwCount = dwCount + 1;
		end
	end
	return dwCount;
end
--获取仇人的数目
function CFriendSystem:GetEnemyCount()
	local dwCount = 0;
	for dwRoleID,sInfo in pairs(self.setFriends) do
		if sInfo.dwFlag == enFriendFlag.eEnemy or 
			sInfo.dwFlag == enFriendFlag.eFriendAndEnemy or
			sInfo.dwFlag == enFriendFlag.eBlackAndEnemy then
			dwCount = dwCount + 1;
		end
	end
	return dwCount;
end
--获取黑名单的数目
function CFriendSystem:GetBlackCount()
	local dwCount = 0;
	for dwRoleID,sInfo in pairs(self.setFriends) do
		if sInfo.dwFlag == enFriendFlag.eBlackList or
			sInfo.dwFlag == enFriendFlag.eBlackAndEnemy then
			dwCount = dwCount + 1;
		end
	end
	return dwCount;
end
--获取最近联系人的数目
function CFriendSystem:GetContactCount()
	local dwCount = 0;
	for dwRoleID,sInfo in pairs(self.setContacts) do
		dwCount = dwCount + 1;
	end
	return dwCount;
end
--获取好友信息列表，key是序号，value是sFriendInfo的引用
function CFriendSystem:GetFriendList()
	local List = {};
	for dwRoleID,sInfo in pairs(self.setFriends) do
		if sInfo.dwFlag == enFriendFlag.eFriend or 
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
		if sInfo.dwFlag == enFriendFlag.eEnemy or 
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
		if sInfo.dwFlag == enFriendFlag.eEnemy or 
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
		if sInfo.dwFlag == enFriendFlag.eEnemy or 
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
		if sInfo.dwFlag == enFriendFlag.eBlackList or
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
		table.insert(List, sInfo);
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
--获取两个人共同仇人的ID列表，返回数据格式：key是dwRoleID，value是dwEnemy的值
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
	local dwRoleID
	while myindex <= mylen and hisindex <= hislen do
		if myEnemy[myindex] == hisEnemy[hisindex] then
			dwRoleID = myEnemy[myindex];
			local fmsg = self.setFriends[dwRoleID];
			if fmsg then
				list[dwRoleID] = fmsg.dwEnemy;
			else
				list[dwRoleID] = 0;
			end
			--table.insert(list, myEnemy[myindex]);
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
	if sInfo then
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
	if sInfo then
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
	if sInfo then
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
	if sInfo and sInfo.dwFlag ~= enFriendFlag.eNone then
		return true;
	end
	sInfo = self.setContacts[dwRoleID];
	if sInfo then
		return true;
	end
	return false;
end
--获取玩家的性别，1为男，2为女
function CFriendSystem:GetSex()
	return self.dwSexType or 1;
end

--添加一个好友关系，如果只是更新，那么就不要传入dwMeetTime的值
function CFriendSystem:AddFriend( playerMsg )
	if playerMsg.dwRoleID == self.dwRoleID then
		return;
	end
	--如果玩家已经存在于列表中，不再添加
	if self:IsHaveInFriend(playerMsg.dwRoleID) then
		return;
	end
	--检查玩家列表中的数量
	--local count = self:GetFriendCount();
	if self:GetFriendCount() >= FriendSysConfig.dwLimited then
		return;
	end
	local sInfo = self.setFriends[playerMsg.dwRoleID];
	if not sInfo then
		sInfo = { dwFlag = enFriendFlag.eNone, dwLastTime = _now(), data = playerMsg };
		self.setFriends[playerMsg.dwRoleID] = sInfo;
	end
	--添加好友的时候，给被添加的玩家发送被添加的信息
	local player =  CGameLineManager:GetPlayer( playerMsg.dwRoleID );
	if player then
		local sMsg = self:GetMySearchMsg();
		--添加VIP信息
		local myData = CFriendDataManager:GetRoleData( self.dwRoleID );
		if myData then
			sMsg.dwVip = myData.dwVip;
		else
			sMsg.dwVip = 0;
		end
		player.objLine.KSOnBeAddedFriendMsg{ Param = { playerMsg.dwRoleID, sMsg }; };
	end
	self:UpdateFriendFlag( sInfo, true, enOperateType.eFriend );
	return sInfo.dwFlag;
end
--删除一个好友关系
function CFriendSystem:DeleteFriend( dwRoleID )
	--检查玩家是否存在于仇人列表中
	if not self:IsHaveInFriend(dwRoleID) then
		return;
	end
	local sInfo = self.setFriends[dwRoleID];
	if not sInfo then
		return;
	end
	self:UpdateFriendFlag( sInfo, false, enOperateType.eFriend );
	if sInfo.dwFlag == enFriendFlag.eNone then
		self.setFriends[dwRoleID] = nil;
		--从关系列表中清除掉通知关系--
	end
	--更新删除消息到GS
	self:GetPlayer().objLine.KSOnDeletePlayerMsg{ Param = { self.dwRoleID, 1, dwRoleID, sInfo.dwFlag }; };
end
--添加一个仇人关系；如果只是更新，那么就不要传入dwMeetTime的值
function CFriendSystem:AddEnemy( playerMsg )
	if playerMsg.dwRoleID == self.dwRoleID then
		return;
	end
	--检查数量，如果达到上限则删除时间最久的一个
	local dwCount = self:GetEnemyCount();
	if dwCount >= FriendSysConfig.dwLimited then
		self:DeleteLongestEnemy();
	end
	--
	local sInfo = self.setFriends[playerMsg.dwRoleID];
	if not sInfo then
		sInfo = { dwFlag = enFriendFlag.eNone, dwLastTime = _now(), data = playerMsg };
		self.setFriends[playerMsg.dwRoleID] = sInfo;
	end
	self:UpdateFriendFlag( sInfo, true, enOperateType.eEnemy );
	CFriendManager:AddEnemyReverse( playerMsg.dwRoleID, self.dwRoleID );
	return sInfo.dwFlag;
end
--删除时间最久的一个仇人
function CFriendSystem:DeleteLongestEnemy()
	--寻找时间最久的一个仇人ID
	local dwTime = _now();
	local dwID = 0;
	for dwRoleID,sInfo in pairs(self.setFriends) do
		if sInfo.dwLastTime < dwTime then
			dwID = dwRoleID;
		end
	end
	if dwID ~= 0 then
		self:DeleteEnemy( dwID );
	end
end
--删除一个仇人关系
function CFriendSystem:DeleteEnemy( dwRoleID )
	--检查玩家是否存在于仇人列表中
	if not self:IsHaveInEnemy(dwRoleID) then
		return;
	end
	local sInfo = self.setFriends[dwRoleID];
	if not sInfo then
		return;
	end
	self:UpdateFriendFlag( sInfo, false, enOperateType.eEnemy );
	if sInfo.dwFlag == enFriendFlag.eNone then
		self.setFriends[dwRoleID] = nil;
		--从关系列表中清除掉通知关系--
	end
	
	CFriendManager:RemoveEnemyReverse( dwRoleID, self.dwRoleID );
	--更新删除消息到GS
	self:GetPlayer().objLine.KSOnDeletePlayerMsg{ Param = { self.dwRoleID, 3, dwRoleID, sInfo.dwFlag }; };
end
--添加一个黑名单
function CFriendSystem:AddBlackList( playerMsg )
	if playerMsg.dwRoleID == self.dwRoleID then
		return;
	end
	if self:GetBlackCount() >= FriendSysConfig.dwLimited then
		return;
	end
	local sInfo = self.setFriends[playerMsg.dwRoleID];
	if not sInfo then
		sInfo = { dwFlag = enFriendFlag.eNone, dwLastTime = _now(), data = playerMsg };
		self.setFriends[playerMsg.dwRoleID] = sInfo;
	end
	self:UpdateFriendFlag( sInfo, true, enOperateType.eBlackList );
	return sInfo.dwFlag;
end
--删除一个黑名单
function CFriendSystem:DeleteBlackList( dwRoleID )
	--检查玩家是否存在于仇人列表中
	if not self:IsHaveInBlackList(dwRoleID) then
		return;
	end
	local sInfo = self.setFriends[dwRoleID];
	if not sInfo then
		return;
	end
	self:UpdateFriendFlag( sInfo, false, enOperateType.eBlackList );
	if sInfo.dwFlag == enFriendFlag.eNone then
		self.setFriends[dwRoleID] = nil;
		--从关系列表中清除掉通知关系--
	end
	--更新删除消息到GS
	self:GetPlayer().objLine.KSOnDeletePlayerMsg{ Param = { self.dwRoleID, 2, dwRoleID, sInfo.dwFlag }; };
end
--添加或者更新一个最近联系人
function CFriendSystem:UpdateContact( playerMsg )
	if playerMsg.dwRoleID == self.dwRoleID then
		return;
	end
	--检查数量，联系人达到上限则替换掉时间最久的一个
	local dwCount = self:GetContactCount();
	if dwCount >= FriendSysConfig.dwLimited then
		self:DeleteLongestContact();
	end
	local sInfo = self.setContacts[playerMsg.dwRoleID];
	if not sInfo then
		sInfo = { dwLastTime = _now(), data = playerMsg };
		self.setContacts[playerMsg.dwRoleID] = sInfo;
	end
	return enFriendFlag.eNone;
end
--删除时间最久的一个最近联系人
function CFriendSystem:DeleteLongestContact()
	--寻找时间最久的一个联系人
	local dwTime = _now();
	local dwID = 0;
	for dwRoleID,sInfo in pairs(self.setContacts) do
		if sInfo.dwLastTime < dwTime then
			dwID = dwRoleID;
		end
	end
	if dwID ~= 0 then
		self:DeleteContact( dwID );
	end
end
--删除一个最近联系人
function CFriendSystem:DeleteContact( dwRoleID )
	local sInfo = self.setContacts[dwRoleID];
	if not sInfo then
		return;
	end
	self.setContacts[dwRoleID] = nil;
	--更新删除消息到GS
	self:GetPlayer().objLine.KSOnDeletePlayerMsg{ Param = { self.dwRoleID, 4, dwRoleID, 0 }; };
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
--获取自己征婚的信息
function CFriendSystem:GetMyPlatformMsg( sInfo )
	local myData = CFriendDataManager:GetRoleData( self.dwRoleID );
	if not myData then
		return;
	end
	for k,v in pairs(sInfo) do
		if myData[k] then
			sInfo[k] = myData[k];
		end
	end
	--sInfo.strBangPai = myData.szSign;--
end
--获取自己的搜索消息结构 sSearchMessage
function CFriendSystem:GetMySearchMsg()
	local myData = CFriendDataManager:GetRoleData( self.dwRoleID );
	local sInfo = sSearchMessage:new();
	if not myData then
		return sInfo;
	end
	for k,v in pairs(sInfo) do
		if myData[k] then
			sInfo[k] = myData[k];
		end
	end
	return sInfo;
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------
--系统信息同步
--发送一个玩家的消息回到客户端
function CFriendSystem:SynchronizePlayerMsgView(spMsg, siMsg, sjMsg, saMsg, suMsg, wxMsg)
	self:GetPlayer().objLine.KSOnRequestPlayerMsg{ Param = { self.dwRoleID , spMsg, siMsg, sjMsg, saMsg, suMsg, wxMsg }; };
end
--发送一次搜索的查询消息
function CFriendSystem:SynchronizeSearchMsg(dwPage, setMsg)
	self:GetPlayer().objLine.KSOnRequestSearchMsg{ Param = { self.dwRoleID , dwPage, setMsg }; };
end
--通知客户端打探结果
function CFriendSystem:SynchronizeDaTan(sMsg)
	self:GetPlayer().objLine.KSOnDaTanMsg{ Param = { self.dwRoleID , sMsg }; };
end
--通知客户端更改好友平台好友信息
function CFriendSystem:SynchronizeWantFriend( setMsgs )
	self:GetPlayer().objLine.KSOnRequestWantFriendMsg{ Param = { self.dwRoleID , setMsgs }; };
end
--通知客户端更改好友平台征婚信息
function CFriendSystem:SynchronizeWantMarry( setMsgs, dwSex )
	self:GetPlayer().objLine.KSOnRequestWantMarryMsg{ Param = { self.dwRoleID , setMsgs, dwSex }; };
end
--通知客户端更改好友平台共同仇人信息
function CFriendSystem:SynchronizeSameEnemy( setMsgs )
	self:GetPlayer().objLine.KSOnRequestSameEnemyMsg{ Param = { self.dwRoleID , setMsgs }; };
end
--通知客户端，获取了哪个玩家的共同仇人ID列表，具体信息到客户端再获取
function CFriendSystem:SynchronizeEnemyIDs( setIDs, dwRoleID )
	self:GetPlayer().objLine.KSOnRequestEnemyIDMsg{ Param = { self.dwRoleID , setIDs, dwRoleID }; };
end
--通知客户端，自己的征婚信息状态
function CFriendSystem:SynchronizeWantMarryState( dwState, strMessage )
	self.dwWantMarryState = dwState;
	self:GetPlayer().objLine.KSWantMarryStateMsg{ Param = { self.dwRoleID ,dwState, strMessage }; };
end
--通知客户端，弹出提示图标
function CFriendSystem:IconNotice(dwID)
	self:GetPlayer().objLine.KSFriendIconNoticeMsg{ Param = { self.dwRoleID ,dwID }; };
end
--通知客户端，征婚信息的收益提示
function CFriendSystem:IncomeNotice( dwID )
	self:GetPlayer().objLine.KSFriendIncomeNoticeMsg{ Param = { self.dwRoleID ,dwID }; };
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






