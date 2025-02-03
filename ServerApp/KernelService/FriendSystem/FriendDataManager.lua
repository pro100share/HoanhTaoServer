--[[
功能：好友系统全局管理器
作者：周兴团
时间：2012-7-4
]]

local TableCount = function( tab )
	local count = 0;
	for k,v in pairs(tab) do
		count = count + 1;
	end
	return count;
end

_G.SFriendDataSynch = {};
function SFriendDataSynch:new( t )
	local obj = t or {};
	--玩家固定的数据
	obj.dwRoleID = 0;		--记录对方的ID
	obj.dwProf = 0;			--职业
	obj.dwHead = 0;			--头像的ID
	obj.strName = "";		--记录玩家的姓名
	--玩家在游戏过程中实时更改的数据
	obj.dwYanHui = 0;		--0没有宴会，1有宴会
	obj.dwTanWei = 0;		--0没有摊位，1有摊位
	obj.dwOnLine = 0;		--0是不在线，1是在线
	obj.dwVip = 0;			--0不是VIP，1是VIP
	obj.dwLevel = 0;		--记录玩家的等级
	obj.strBangPai = "";	--帮派名称
	obj.dwBangPaiID = 0;	--帮派的ID
	
	obj.dwMood1 = 0;		--心情1
	obj.dwMood2 = 0;		--心情2
	obj.dwMood3 = 0;		--心情3
	obj.dwMood4 = 0;		--心情4
	obj.szSign = "";		--签名
	--当信息更改时，需要当前玩家通知的玩家
	obj.setNotifyTo = {};	--记录需要通知的玩家ID，key是 dwRoleID , value 是Player引用，在玩家上线下线的时候维护这个关系表，方便进行快速的广播
	return obj;
end

_G.CFriendDataManager = CSingle:new();
CSingleManager:AddSingle(CFriendDataManager);

--需要更新的列名称
CFriendDataManager.UpdateColumnName = {
	"dwYanHui", "dwTanWei", "dwOnLine", "dwVip", "dwLevel", "strBangPai", "dwBangPaiID",
	"dwMood1", "dwMood2", "dwMood3", "dwMood4", "szSign",
};
CFriendDataManager.setPlayerData = {};

function CFriendDataManager:Create()
end
function CFriendDataManager:Update(dwInterval)
	return true;
end;
function CFriendDataManager:Destroy()
end;
-----------------------------------------------------------------------------------------------------------------------------------------------
--检查玩家是否需要上传登录信息
function CFriendDataManager:CheckForLogin( dwRoleID )
	local myMsg = self.setPlayerData[dwRoleID];
	local playerMe = CGameLineManager:GetPlayer( dwRoleID );
	if not myMsg or myMsg.dwOnLine == 0 then
		--向该玩家的GS发送命令，回传玩家的数据和好友数据
		if playerMe then
			playerMe.objLine.KSAskForPlayerDataMsg{ Param = dwRoleID };
		end
	end
	--[[
	if playerMe then
		local fSys = playerMe:GetSystem("CFriendSystem");
		if fSys then
			fSys:CheckToSendContact();
			--玩家换线，传回玩家当前的好友数据
			fSys:CheckToSendFriend();
		end
	end
	--]]
end
--玩家在GS登录，接收到回传数据命令，发送消息到KS，必须要有dwRoleID
function CFriendDataManager:PlayerLogin( Param )
	local dwRoleID, setMyMsg = Param[1].dwRoleID, Param[1]
	local myMsg = self.setPlayerData[dwRoleID];
	setMyMsg = setMyMsg or {};
	--有些管理器移动到了KS上面，在玩家的消息到达KS的时候，获取玩家的信息
	if CMarriageBanquetMgr:IsHeldBanquet( dwRoleID ) then
		setMyMsg.dwYanHui = 1;
	end
	
	if not myMsg then
		myMsg = self:AddNewPlayer( setMyMsg );
	else
		--更新信息
		local updateColumn = self:UpdatePlayerMsg( myMsg, setMyMsg );
        
		--通知应该通知的人 setNotifyTo ，自己的消息更改
		self:SyncDataToGSPlayer( dwRoleID, updateColumn );
	end
	--寻找别的玩家，自己需要对方来通知我
	local playerMe = CGameLineManager:GetPlayerForNil( dwRoleID );
	local setFriendList = nil;
	if playerMe then
		setFriendList = playerMe:GetSystem("CFriendSystem"):GetAndDelFriendCash();
	else
		setFriendList = {};
	end
	local changeList = {};
	for k,sMsg in pairs(setFriendList) do
		local otherMsg = self.setPlayerData[sMsg.dwRoleID];
		if not otherMsg then
			otherMsg = self:AddNewPlayer( sMsg );
		end
		--记录别人需要通知的对象
		otherMsg.setNotifyTo[dwRoleID] = playerMe;
		--如果别人已经在线，那么获取对方的更新信息
		if otherMsg.dwOnLine == 1 then
			local otherChange = { dwRoleID = sMsg.dwRoleID };
			for i,name in pairs(self.UpdateColumnName) do
				if not sMsg[name] or sMsg[name] ~= otherMsg[name] then
					otherChange[name] = otherMsg[name];
				end
			end
			table.insert( changeList, otherChange );
		end
		--判断该玩家信息是否是Me的仇人，建立仇人反查表
		if sMsg.dwFlag == enFriendFlag.eEnemy or 
			sMsg.dwFlag == enFriendFlag.eFriendAndEnemy or
			sMsg.dwFlag == enFriendFlag.eBlackAndEnemy then
			CFriendManager:AddEnemyReverse( sMsg.dwRoleID, dwRoleID );
		end
	end
	if playerMe then
		--初始化好友列表
		playerMe:GetSystem("CFriendSystem"):InitializeFromGS( setFriendList );
		--更新当前在线玩家的信息到自己所在的GS上面
		if #changeList > 0 then
			playerMe.objLine.KSSyncFriendDataOnInitMsg{ Param={ dwRoleID, changeList }; };
		end
	end
end
function CFriendDataManager:UpdatePlayerMsg( myMsg, updateMsg )
	local updateColumn = {};
	for k,column in pairs(self.UpdateColumnName) do
		if updateMsg[column] and updateMsg[column] ~= myMsg[column] then
			myMsg[column] = updateMsg[column];
			table.insert( updateColumn, column );
		end
	end
	if #updateColumn == 0 then
		return {};
	else
		return updateColumn;
	end
end
function CFriendDataManager:AddNewPlayer( setMsg )
	local myMsg = SFriendDataSynch:new();
	self.setPlayerData[setMsg.dwRoleID] = myMsg;
	for k,v in pairs(setMsg) do
		if myMsg[k] then
			myMsg[k] = v;
		end
	end
	return myMsg;
end
--玩家下线，退出游戏
function CFriendDataManager:PlayerLogout( dwRoleID )
	--寻找所有人的 setNotifyTo ,删除自己的信息
	for id, playerData in pairs(self.setPlayerData) do
		playerData.setNotifyTo[dwRoleID] = nil;
		--如果该玩家不在线，并且表中已经没有玩家需要通知
		if playerData.dwOnLine == 0 and TableCount(playerData.setNotifyTo) == 0 then
			self.setPlayerData[id] = nil;
		end
	end
	--设置下线标记
	local myMsg = self.setPlayerData[dwRoleID];
	if myMsg then
		myMsg.dwOnLine = 0;
		--如果自己已经没有需要通知的玩家，删除掉自己的记录
		if TableCount(myMsg.setNotifyTo) == 0 then
			self.setPlayerData[dwRoleID] = nil;
		else
			--通知别人自己下线 setNotifyTo 
			self:SyncDataToGSPlayer( dwRoleID, { "dwOnLine" } );
		end
	end
end
function CFriendDataManager:SyncDataToGSPlayer(dwRoleID, setUpdateColumn)
	if setUpdateColumn and #setUpdateColumn == 0 then
		return;--没有需要更新的列
	end
	local playerData = self.setPlayerData[dwRoleID];
	if not playerData or TableCount(playerData.setNotifyTo) == 0 then
		return;
	end
	local updateData = {
		dwRoleID = dwRoleID;
	};
	if not setUpdateColumn then
		--更新全部
		for k,column in pairs(CFriendDataManager.UpdateColumnName) do
			if playerData[column] then
				updateData[column] = playerData[column];
			end
		end
	else
		--更新部分信息
		for k,column in pairs(setUpdateColumn) do
			if playerData[column] then
				updateData[column] = playerData[column];
			end
		end
	end
	--统计玩家所在服务器，给相关的服务器发送一条更新消息；更新消息包含需要通知的玩家ID
	local linePlayers = {};
	for dwRoleID,objPlayer in pairs(playerData.setNotifyTo) do
		if not linePlayers[objPlayer.objLine] then
			linePlayers[objPlayer.objLine] = {};
		end
		table.insert( linePlayers[objPlayer.objLine], dwRoleID );
	end
	for objLine, IDs in pairs(linePlayers) do
		local param = {};
		table.insert( param, IDs );
		table.insert( param, updateData );
		objLine.KSSyncPlayerDataMsg{ Param = param };
	end
end
--玩家信息更改，必须要有dwRoleID
function CFriendDataManager:PlayerDataChange(updateMsg)
	local myMsg = self.setPlayerData[updateMsg.dwRoleID];
	if not myMsg then
		-- print("Player DataChange Not Found RoleID ".. tostring(updateMsg.dwRoleID));
		return;
	end
	--更新信息
	local updateColumn = self:UpdatePlayerMsg( myMsg, updateMsg );
	--通知应该通知的人 setNotifyTo ，自己的消息更改
	self:SyncDataToGSPlayer( updateMsg.dwRoleID, updateColumn );
end
--获取一个玩家的信息，获取的是拷贝，用于发送网络消息
function CFriendDataManager:RequestAddPlayer( Param )
	local dwRoleID, dwFromID, dwType = Param[1], Param[2], Param[3];
	local playerFrom =  CGameLineManager:GetPlayer( dwFromID );
	if not playerFrom then
		return;
	end
	local playerMsg = self.setPlayerData[dwRoleID];
	if not CGameLineManager:GetPlayer( dwRoleID ) then
		--发送玩家已经离线的错误消息
		local param = {};
		table.insert( param, dwFromID );
		table.insert( param, 6000110006 );
		playerFrom.objLine.KSOnAddPlayerErrorMsg{ Param = param };
		return;
	end;
	if playerMsg then
		local fsysFrom = playerFrom:GetSystem("CFriendSystem");
		--执行添加好友等操作，1是好友，2是黑名单，3是仇人，4是最近联系人
		local dwFlag = enFriendFlag.eNone;
		if dwType == 1 then
			dwFlag = fsysFrom:AddFriend( playerMsg );
		elseif dwType == 2 then
			dwFlag = fsysFrom:AddBlackList( playerMsg );
		elseif dwType == 3 then
			dwFlag = fsysFrom:AddEnemy( playerMsg );
		elseif dwType == 4 then
			dwFlag = fsysFrom:UpdateContact( playerMsg );
		end
		if not dwFlag then
			return;--如果没有增加成功，那么直接返回
		end
		--记录需要通知的对象
		playerMsg.setNotifyTo[dwFromID] = playerFrom;
		local msg = { dwFlag = dwFlag };
		for k,v in pairs(playerMsg) do
			if type(v) ~= "table" then
				msg[k] = v;
			end
		end
		local param = {};
		table.insert( param, dwFromID );
		table.insert( param, dwType );
		table.insert( param, msg );
		playerFrom.objLine.KSOnAddPlayerMsg{ Param = param };
	else
		--发送玩家已经离线的错误消息
		local param = {};
		table.insert( param, dwFromID );
		table.insert( param, 6000110006 );
		playerFrom.objLine.KSOnAddPlayerErrorMsg{ Param = param };
	end
end
--删除一个玩家的关系
function CFriendDataManager:RequestDeletePlayer( Param )
	local dwRoleID, dwFromID, dwType = Param[1], Param[2], Param[3];
	local playerFrom =  CGameLineManager:GetPlayer( dwFromID );
	if not playerFrom then
		return;
	end
	local fsysFrom = playerFrom:GetSystem("CFriendSystem");
	--执行添加好友等操作，1是好友，2是黑名单，3是仇人，4是最近联系人
	local dwFlag = enFriendFlag.eNone;
	if dwType == 1 then
		dwFlag = fsysFrom:DeleteFriend( dwRoleID );
	elseif dwType == 2 then
		dwFlag = fsysFrom:DeleteBlackList( dwRoleID );
	elseif dwType == 3 then
		dwFlag = fsysFrom:DeleteEnemy( dwRoleID );
	elseif dwType == 4 then
		dwFlag = fsysFrom:DeleteContact( dwRoleID );
	end
end
--获取某一个角色的数据引用
function CFriendDataManager:GetRoleData( dwRoleID )
	return self.setPlayerData[dwRoleID];
end






