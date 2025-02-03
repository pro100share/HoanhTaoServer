--[[
功能：好友系统全局管理器
作者：周兴团
时间：2012-3-5
]]

_G.SWantMarryMessage = {};
function SWantMarryMessage:new( t )
	local obj = t or {};
	obj.dwRoleID = 0;		--角色ID
	obj.strMessage = ""; 	--结婚信息
	obj.dwTime = 0;			--登记的时间
	obj.objSys = nil;		--记录自己的好友系统
	return obj;
end
_G.CFriendManager = CSingle:new();
CSingleManager:AddSingle(CFriendManager);
CFriendManager.dwTime = 40000;--测试代码

CFriendManager.setFriendSys = {};--记录所有已登录玩家的好友列表
CFriendManager.setWantMarry = {};--记录征婚信息，key是 dwRoleID ，value是 SWantMarryMessage 结构
CFriendManager.setLogInTime = {};--记录玩家系统上一次登记的时间，key是 dwRoleID ，value是 time 结构
CFriendManager.setPlayerNameToID = {};	--记录玩家名字到RoleID的反查表，玩家上线下线维护
CFriendManager.setEnemyReverseList = {};	--仇人关系的反查列表

CFriendManager.setRemoteCall = {};--key是RemoteID，value是fromID，需要返回信息给Player--取消该机制
function CFriendManager:Create()
	return true;
end
function CFriendManager:Update(dwInterval)
	return true;
end;
function CFriendManager:Destroy()
end;
-----------------------------------------------------------------------------------------------------------------------------------------------
--处理GS发送的好友平台的消息
function CFriendManager:HandlePlatformRequest(Param)
	local dwfrom, dwtype, dwarg = unpack(Param);
	local playerFrom =  CGameLineManager:GetPlayer( dwfrom );
	if not playerFrom then return end;
	local fsysFrom = playerFrom:GetSystem("CFriendSystem");
	if dwtype == 1 then
		fsysFrom:RequestWantFriend();
	elseif dwtype == 2 then
		fsysFrom:RequestWantMarry( dwarg );
	elseif dwtype == 3 then
		fsysFrom:RequestSameEnemy();
	elseif dwtype == 4 then
		fsysFrom:RequestSameEnemyIDOf( dwarg );
	end
end
function CFriendManager:AddFriendSystem( mySys )
	local player = mySys:GetPlayer();
	local dwRoleID = player:GetRoleID();
	CFriendManager:DelFriendSystem( dwRoleID );--先删除旧的
	table.insert( self.setFriendSys, mySys );
	--玩家上线的时候，先搜寻玩家是否登记征婚
	local sMsg = self:ReadWantMarryMsg( dwRoleID );
	if sMsg then
		sMsg.objSys = mySys;--记录下自己的系统
		table.insert(self.setWantMarry, sMsg);
		--通知客户端当前的征婚状态
		mySys:SynchronizeWantMarryState( 1, sMsg.strMessage );
	else
		mySys:SynchronizeWantMarryState(0);
	end
	--记录下玩家当前登录的时间，首次登录记为0，往后的登录记为time
	if not self.setLogInTime[dwRoleID] then
		self.setLogInTime[dwRoleID] = _now();
	end
	--记录玩家名字对应RoleID的反查表
	self.setPlayerNameToID[player:GetInfo().szRoleName] = dwRoleID;
end
function CFriendManager:DelFriendSystem( dwRoleID )
	for k,fSys in pairs(self.setFriendSys) do
		if dwRoleID == fSys.dwRoleID then
			table.remove( self.setFriendSys, k );
			--清除玩家Name对应的RoleID反查表
			local player = fSys:GetPlayer();
			self.setPlayerNameToID[player:GetInfo().szRoleName] = nil;
		end
	end
	--玩家下线的时候重置玩家征婚信息
	for k,sMsg in pairs(self.setWantMarry) do
		if dwRoleID == sMsg.dwRoleID then
			table.remove( self.setWantMarry, k );
		end
	end
	
end
--获取有记录的玩家系统列表
function CFriendManager:GetFriendSysList()
	return self.setFriendSys;
end
--根据玩家名字获得玩家ID，不存在则返回nil
function CFriendManager:QueryID( szRoleName )
	return self.setPlayerNameToID[szRoleName];
end
--建立仇人关系反查表
function CFriendManager:AddEnemyReverse( dwEnemyID, dwMeID )
	if not self.setEnemyReverseList[dwEnemyID] then
		self.setEnemyReverseList[dwEnemyID] = {};
	end
	self.setEnemyReverseList[dwEnemyID][dwMeID] = dwMeID;
end
--删除仇人反查表关系
function CFriendManager:RemoveEnemyReverse( dwEnemyID, dwMeID )
	if not self.setEnemyReverseList[dwEnemyID] then
		return;
	end
	self.setEnemyReverseList[dwEnemyID][dwMeID] = nil;
end
--获取某一个Enemy的关系表
function CFriendManager:GetEnemyReverse( dwEnemyID )
	return self.setEnemyReverseList[dwEnemyID];
end

--玩家摊位更改的时候调用的函数
function CFriendManager:OnPlayerShopChange(dwRoleID, bHaveShop)
	local dwTanWei = 0;
	if bHaveShop then dwTanWei = 1; end;
	local updateMsg = { dwRoleID = dwRoleID, dwTanWei = dwTanWei };
	CFriendDataManager:PlayerDataChange(updateMsg);
end
--玩家加入世家或者退出世家的时候调用的函数
function CFriendManager:BangPaiChange(dwRoleID, bInBangPai, dwBangPaiID, strBangPai)
	if bInBangPai then
		local updateMsg = { dwRoleID=dwRoleID, dwBangPaiID=dwBangPaiID, strBangPai=strBangPai };
		CFriendDataManager:PlayerDataChange(updateMsg);
	else
		local updateMsg = { dwRoleID=dwRoleID, dwBangPaiID=0, strBangPai="" };
		CFriendDataManager:PlayerDataChange(updateMsg);
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------
--获取一个玩家是否在规定时间内重复登录
function CFriendManager:IsLogInRepeat( dwRoleID, dwGap )
	if not self.setLogInTime[dwRoleID] then
		return false;
	end
	return _now() - self.setLogInTime[dwRoleID] <= dwGap;
end
--通知某一个Player的宴席取消了
function CFriendManager:NotifyHeldBanquet( dwRoleWife, dwRoleHusband, bHeld )
	-- local dwYanHui = 0;
	-- if bHeld then
		-- dwYanHui = 1;
	-- end
	-- for k,fSys in pairs(self.setFriendSys) do
		-- fSys:OnYanHuiChange(dwRoleWife, dwYanHui);
		-- fSys:OnYanHuiChange(dwRoleHusband, dwYanHui);
	-- end
end
--从数组中获取信息，同时返回下一个循环开始的下标
local function GetFromList( list, from, number )
	local count = #list;
	if count <= number then
		return list, 1;
	end
	local L = {};
	local index = from;
	for k=from-1,from+number-2 do
		index = k%count+1;
		table.insert( L, list[ index ] );
	end
	return L, index+1;
end

--从一个数组中获取信息，通过value值以及回调函数来判断
local function GetMeetList( list, from, number, cbMeet )
	local L = {};
	local length = #list;
	if length < number then --如果list总数小于number
		for k,v in pairs(list) do
            if cbMeet and cbMeet( v ) then
                table.insert( L, v );
            end
		end
		return L, 1;
    else --从index位置开始判断
        local index = from;
        local count = 0;
        for i=from-1,from+length-2 do
            index = i%length+1;
            if cbMeet( list[index] ) then
                table.insert( L, list[index] );
                count = count + 1;
            end
            if count >= number then
                break;
            end
        end
        return L, index+1;
	end
end

--某一个玩家获取征友信息，每一页三个玩家
function CFriendManager:GetWantFriend( mySys, dwIndex )
	--获取满足条件的所有玩家信息
	local dwMyID = mySys.dwRoleID;
	local cbMeet = function(v)
		if v.dwRoleID ~= dwMyID and not mySys:IsHaveInFriend(v.dwRoleID) then
			return true;
		end
		return false;
	end
	local L,index = GetMeetList( self.setFriendSys, dwIndex, 3, cbMeet );
	--获取玩家的信息
	local msgs = {};
	for k,fSys in pairs(L) do
		local sInfo = SPlatformMessage:new();
		sInfo.dwRoleID = fSys.dwRoleID;
		fSys:GetMyPlatformMsg(sInfo)
		table.insert( msgs, sInfo );
	end
	--最后返回下一个开始的下标
	return msgs, index;
end
--某一个玩家获取征婚信息，每一页三个玩家
function CFriendManager:GetWantMarry( mySys, dwIndex, dwSex )
	--1是男，2是女 --获取满足条件的所有玩家信息
	local cbMeet = function(v)
		if dwSex == v.objSys:GetSex() then
			return true;
		end
		return false;
	end
	local L,index = GetMeetList( self.setWantMarry, dwIndex, 3, cbMeet );
	--获取玩家的信息
	local msgs = {};
	for k,sMsg in pairs(L) do
		local sInfo = SPlatformMessage:new();
		sInfo.dwRoleID = sMsg.dwRoleID;
		sInfo.strMessage = sMsg.strMessage;
		sMsg.objSys:GetMyPlatformMsg(sInfo);
		table.insert( msgs, sInfo );
	end
	--最后返回下一个开始的下标
	return msgs, index;
end

--某一个玩家获取共同仇人信息，每一页三个玩家
function CFriendManager:GetSameEnemy( mySys, dwIndex )
	--获取满足条件的所有玩家信息
	--统计所有共同仇人
	local sameEnemyList = {};
    local needNum = 3;
	for k,id in pairs(mySys:GetEnemyID()) do
		for kid,vid in pairs(CFriendManager:GetEnemyReverse(id)) do
			if kid ~= mySys.dwRoleID and
                CGameLineManager:GetPlayer(vid) then
				sameEnemyList[kid] = vid;
                needNum = needNum - 1;
			end
            if needNum == 0 then
                break;
            end
		end
	end

	local L,index = GetMeetList( sameEnemyList, dwIndex, 3, nil );

	--获取玩家的信息
	local msgs = {};
	for k,id in pairs(L) do
		local player = CGameLineManager:GetPlayer( id );
		local fSys = player:GetSystem("CFriendSystem");
		local sInfo = SPlatformMessage:new();
		sInfo.dwRoleID = fSys.dwRoleID;
		sInfo.dwSameEnemy = mySys:GetSameEnemyCount( fSys );
		fSys:GetMyPlatformMsg(sInfo);
		table.insert( msgs, sInfo );
	end

	--最后返回下一个开始的下标
	return msgs, index;
end

--获取某一个玩家和自己的共同仇人ID列表
function CFriendManager:GetSameEnemyIDOf( dwRoleID, mySys )
	local msgs = {};
	local bFind = false;
	for k,fSys in pairs(self.setFriendSys) do
		if dwRoleID == fSys.dwRoleID then
			msgs = fSys:GetSameEnemyID( mySys );
			bFind = true;
			break;
		end
	end
	if not bFind then
		mySys:OnError( 4107, dwRoleID );
	end
	return msgs;
end
--检查玩家是否已经征过婚
function CFriendManager:IsHaveInWantMarry( dwRoleID )
	for k,sMsg in pairs(self.setWantMarry) do
		if sMsg.dwRoleID == dwRoleID then
			return true, sMsg;
		end
	end
	return false, nil;
end
--玩家申请征婚，添加征婚信息
function CFriendManager:AddWantMarry( mySys, strMessage )
	local bFind, findMsg = self:IsHaveInWantMarry( mySys.dwRoleID );
	if bFind then
		--修改征婚信息，提示玩家修改成功
		findMsg.strMessage = strMessage;
		findMsg.dwTime = _now();
		mySys:IncomeNotice( 6000120006 );
		self:UpdateWantMarryMsg( findMsg );
		mySys:SynchronizeWantMarryState( 1, strMessage );
		return;
	end
	local sMsg = SWantMarryMessage:new();
	sMsg.dwTime = _now();
	sMsg.dwRoleID = mySys.dwRoleID;
	sMsg.strMessage = strMessage;
	sMsg.objSys = mySys;
	table.insert( self.setWantMarry, sMsg );
	self:SaveWantMarryMsg( sMsg );
	--提示玩家增加征婚信息成功
	mySys:IncomeNotice( 6000120005 );
	mySys:SynchronizeWantMarryState( 1, strMessage );
end
--取消征婚信息
function CFriendManager:CancelWantMarry( dwRoleID )
	for k,sMsg in pairs(self.setWantMarry) do
		if sMsg.dwRoleID == dwRoleID then
			table.remove( self.setWantMarry, k );
			sMsg.objSys:SynchronizeWantMarryState( 0 );
		end
	end
	self:DeleteWantMarry( dwRoleID );
end
--保存一条征婚信息到数据库
function CFriendManager:SaveWantMarryMsg( sMsg )
	CPlayerDBQuery:GetDBQuery():execute_async('insert into "T_Role_WantMarry" values($1, $2, $3)',sMsg.dwRoleID,sMsg.strMessage,sMsg.dwTime);
end
--更新一条数据库的信息
function CFriendManager:UpdateWantMarryMsg( sMsg )
	CPlayerDBQuery:GetDBQuery():execute_async('update "T_Role_WantMarry" set "strMessage"=$1,"dwTime"=$2 where "dwRoleID"=$3', sMsg.strMessage,sMsg.dwTime,sMsg.dwRoleID);
end
--从数据库读取一条征婚信息表：返回 SWantMarryMessage ，如果没有则返回nil
function CFriendManager:ReadWantMarryMsg( dwRoleID )
	local res = CPlayerDBQuery:GetDBQuery():execute('select * from "T_Role_WantMarry" where "dwRoleID" = $1',dwRoleID);
	if res then
		local sMsg = SWantMarryMessage:new();
		for k, v in pairs(res) do
			sMsg.dwRoleID = v.dwRoleID;
			sMsg.strMessage = v.strMessage;
			sMsg.dwTime = v.dwTime;
		end
		return sMsg;
	end
end
--从数据库删除一条征婚信息
function CFriendManager:DeleteWantMarry( dwRoleID )
	CPlayerDBQuery:GetDBQuery():execute_async('delete from "T_Role_WantMarry" where "dwRoleID" = $1',dwRoleID);
end













