--[[
功能：好友系统数据库操作
作者：周兴团
时间：2012-3-5
]]

_G.CFriendSystemDB = {}
--构造函数
function CFriendSystemDB:new(objDB, objFriendSys)
	local obj = {};
	obj.objDB = objDB;				--对应的'数据库操作'对象
	obj.objFriendSys = objFriendSys;	--对应的玩家FriendSystem的对象
	obj.dwRoleID = objFriendSys:GetPlayer():GetRoleID();
	for i, v in pairs(CFriendSystemDB) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end
--从数据库加载玩家的好友数据
function CFriendSystemDB:LoadFriendInfo( setFriends )
	local dbres = self.objDB:execute('select * from "T_Role_Friend" where "dwRoleID" = $1 ', self.dwRoleID);
	dbres = dbres or {};
	for nIndex,Row in pairs(dbres) do
		local info = sFriendInfo:new();
		info.dwRoleID 	= Row.dwFriendID;
		info.dwFlag 	= Row.dwFlag;
		info.dwMeetTime = Row.dwMeetTime;
		info.dwLastTime = Row.dwLastTime;
		info.dwVip 		= Row.dwVip;
		info.dwLevel 	= Row.dwLevel;
		info.strName 	= Row.strName;
		info.dwHead 	= Row.dwHead;
		info.dwProf 	= Row.dwProf;
		info.dwEnemy 	= Row.dwEnemy;
		info.dwDBOper 	= enDBOperation.eUpdate;
		info.bExistInDB = true;
		--info.setMood = SPlayerMoodMsg:new();
		setFriends[info.dwRoleID] = info;
	end
end
--保存玩家的好友数据到数据库
function CFriendSystemDB:SaveFriendInfo( setFriends )
	--需要根据物品的状况完成update，insert，delete操作
	for dwRoleID, sFInfo in pairs(setFriends) do
		if sFInfo.dwDBOper == enDBOperation.eDelete then
			self:DeleteFriend( sFInfo );
		elseif sFInfo.dwDBOper == enDBOperation.eInsert then
			self:InsertFriend( sFInfo );
		elseif sFInfo.dwDBOper == enDBOperation.eUpdate then
			self:UpdateFriend( sFInfo );
		end
	end
end
--更新单条好友信息
function CFriendSystemDB:UpdateFriend( sFInfo )
	--保存数据，使用Update命令更新一条数据库的记录
	local SqlCmd = self.objDB:CreateUpdateCmd('T_Role_Friend');
	--设置Wheres的值
	SqlCmd.Wheres.dwRoleID	= self.dwRoleID;
	SqlCmd.Wheres.dwFriendID	= sFInfo.dwRoleID;
	--设置Fields的值
	--SqlCmd.Fields.dwRoleID 	= self.dwRoleID;
	--SqlCmd.Fields.dwFriendID	= sFInfo.dwRoleID;
	SqlCmd.Fields.dwFlag 	= sFInfo.dwFlag;
	SqlCmd.Fields.dwMeetTime = sFInfo.dwMeetTime;
	SqlCmd.Fields.dwLastTime = sFInfo.dwLastTime;
	SqlCmd.Fields.dwVip 		= sFInfo.dwVip;
	SqlCmd.Fields.dwLevel 	= sFInfo.dwLevel;
	SqlCmd.Fields.strName 	= sFInfo.strName;
	SqlCmd.Fields.dwHead 	= sFInfo.dwHead;
	SqlCmd.Fields.dwProf 	= sFInfo.dwProf;
	SqlCmd.Fields.dwEnemy 	= sFInfo.dwEnemy;
	--执行命令
	if not SqlCmd:execute() then
		_info("Update Friend msg To T_Role_Friend Error");
		return false;
	end
	return true;
end
--增加单条好友信息
function CFriendSystemDB:InsertFriend( sFInfo )
	--保存数据，使用Insert命令增加一条数据库的记录
	local SqlCmd = self.objDB:CreateInsertCmd('T_Role_Friend');
	--设置Fields的值
	SqlCmd.Fields.dwRoleID 	= self.dwRoleID;
	SqlCmd.Fields.dwFriendID = sFInfo.dwRoleID;
	SqlCmd.Fields.dwFlag 	= sFInfo.dwFlag;
	SqlCmd.Fields.dwMeetTime = sFInfo.dwMeetTime;
	SqlCmd.Fields.dwLastTime = sFInfo.dwLastTime;
	SqlCmd.Fields.dwVip 		= sFInfo.dwVip;
	SqlCmd.Fields.dwLevel 	= sFInfo.dwLevel;
	SqlCmd.Fields.strName 	= sFInfo.strName;
	SqlCmd.Fields.dwHead 	= sFInfo.dwHead;
	SqlCmd.Fields.dwProf 	= sFInfo.dwProf;
	SqlCmd.Fields.dwEnemy 	= sFInfo.dwEnemy;
	--执行命令
	if not SqlCmd:execute() then
		_info("Insert Friend msg To T_Role_Friend Error");
		return false;
	end
	return true;
end
--删除单条好友信息
function CFriendSystemDB:DeleteFriend( sFInfo )
	--local result = self.objDB:execute('delete from "T_Role_Friend" where "dwRoleID" = $1 and "dwFriendID" = $2', self.dwRoleID, sFInfo.dwRoleID);
	
	local SqlCmd = self.objDB:CreateDeleteCmd('T_Role_Friend');
	--设置Wheres的值
	SqlCmd.Wheres.dwRoleID = self:GetRoleID();
	SqlCmd.Wheres.dwFriendID = sFInfo.dwRoleID;
	--执行命令
	if not SqlCmd:execute() then
		_info("DeleteFriend Error");
		return false;
	end
	return true;
end
--加载自己的心情和签名
function CFriendSystemDB:SelectMoodMsg( setMoodMsg )
	local dbres = self.objDB:execute('select * from "T_Role_Mood" where "dwRoleID" = $1 ', self.dwRoleID);
	if not dbres then
		setMoodMsg.dwRoleID = self.dwRoleID;
		return self:InsertMoodMsg( setMoodMsg );
	end
	for k,Row in pairs(dbres) do
		for c,v in pairs(Row) do
			setMoodMsg[c] = v;
		end
	end
end
--保存自己的心情和签名
function CFriendSystemDB:UpdateMoodMsg( setMoodMsg )
	--保存数据，使用Update命令更新一条数据库的记录
	local SqlCmd = self.objDB:CreateUpdateCmd('T_Role_Mood');
	--设置Wheres的值
	SqlCmd.dwRoleID			= self.dwRoleID;
	--设置Fields的值
	SqlCmd.Fields.dwMood1 	= setMoodMsg.dwMood1 or 0;
	SqlCmd.Fields.dwMood2 	= setMoodMsg.dwMood2 or 0;
	SqlCmd.Fields.dwMood3 	= setMoodMsg.dwMood3 or 0;
	SqlCmd.Fields.dwMood4 	= setMoodMsg.dwMood4 or 0;
	SqlCmd.Fields.szSign 	= setMoodMsg.szSign or "";
	--执行命令
	if not SqlCmd:execute() then
		-- print("SQL UpdateMoodMsg Error.......");
		return false;
	end
	return true;
end
--增加心情和签名记录
function CFriendSystemDB:InsertMoodMsg( setMoodMsg )
	--保存数据，使用Insert命令增加一条数据库的记录
	local SqlCmd = self.objDB:CreateInsertCmd('T_Role_Mood');
	--设置Fields的值
	SqlCmd.Fields.dwRoleID 	= self.dwRoleID;
	SqlCmd.Fields.dwMood1 	= setMoodMsg.dwMood1;
	SqlCmd.Fields.dwMood2 	= setMoodMsg.dwMood2;
	SqlCmd.Fields.dwMood3 	= setMoodMsg.dwMood3;
	SqlCmd.Fields.dwMood4 	= setMoodMsg.dwMood4;
	SqlCmd.Fields.szSign 	= setMoodMsg.szSign;
	--执行命令
	if not SqlCmd:execute() then
		return false;
	end
	return true;
end

--从数据库加载玩家的最近联系人数据
function CFriendSystemDB:LoadContactInfo( setContacts )
	local dbres = self.objDB:execute('select * from "T_Role_Contact" where "dwRoleID" = $1 ', self.dwRoleID);
	dbres = dbres or {};
	for nIndex,Row in pairs(dbres) do
		local info = sContactInfoServer:new();
		info.dwRoleID 	 = Row.dwContactID;
		info.dwLastTime  = Row.dwLastTime;
		info.dwVip 		 = Row.dwVip;
		info.dwLevel 	 = Row.dwLevel;
		info.strName 	 = Row.strName;
		info.dwDBOper 	 = enDBOperation.eUpdate;
		info.bExistInDB	 = true;
		setContacts[info.dwRoleID] = info;
	end
end
--保存玩家的最近联系人信息到数据库
function CFriendSystemDB:SaveContactInfo( setContacts )
	--需要根据物品的状况完成update，insert，delete操作
	for dwRoleID, sCInfo in pairs(setContacts) do
		if sCInfo.dwDBOper == enDBOperation.eDelete then
			self:DeleteContact( sCInfo );
		elseif sCInfo.dwDBOper == enDBOperation.eInsert then
			self:InsertContact( sCInfo );
		elseif sCInfo.dwDBOper == enDBOperation.eUpdate then
			self:UpdateContact( sCInfo );
		end
	end
end
--更新单条最近联系人信息
function CFriendSystemDB:UpdateContact( sCInfo )
	--保存数据，使用Update命令更新一条数据库的记录
	local SqlCmd = self.objDB:CreateUpdateCmd('T_Role_Contact');
	--设置Wheres的值
	SqlCmd.Wheres.dwRoleID		= self.dwRoleID;
	SqlCmd.Wheres.dwContactID	= sCInfo.dwRoleID;
	--设置Fields的值
	SqlCmd.Fields.dwLastTime 	= sCInfo.dwLastTime;
	SqlCmd.Fields.dwVip 			= sCInfo.dwVip;
	SqlCmd.Fields.dwLevel 		= sCInfo.dwLevel;
	SqlCmd.Fields.strName 		= sCInfo.strName;
	--执行命令
	if not SqlCmd:execute() then
		_info("Update Contact msg To T_Role_Contact Error");
		return false;
	end
	return true;
end
--增加单条最近联系人信息
function CFriendSystemDB:InsertContact( sCInfo )
	--保存数据，使用Insert命令增加一条数据库的记录
	local SqlCmd = self.objDB:CreateInsertCmd('T_Role_Contact');
	--设置Fields的值
	SqlCmd.Fields.dwRoleID 		= self.dwRoleID;
	SqlCmd.Fields.dwContactID 	= sCInfo.dwRoleID;
	SqlCmd.Fields.dwLastTime 	= sCInfo.dwLastTime;
	SqlCmd.Fields.dwVip 			= sCInfo.dwVip;
	SqlCmd.Fields.dwLevel 		= sCInfo.dwLevel;
	SqlCmd.Fields.strName 		= sCInfo.strName;
	--执行命令
	if not SqlCmd:execute() then
		_info("Insert InsertContact msg To T_Role_Contact Error");
		return false;
	end
	return true;
end
--删除单条最近联系人信息
function CFriendSystemDB:DeleteContact( sCInfo )
	local result = self.objDB:execute('delete from "T_Role_Contact" where "dwRoleID" = $1 and "dwContactID" = $2', self.dwRoleID, sCInfo.dwRoleID);
	return true;
end
--获取角色ID
function CFriendSystemDB:GetRoleID()
	return self.dwRoleID;
end




