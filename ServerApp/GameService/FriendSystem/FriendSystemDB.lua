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
function CFriendSystemDB:UpdateFriend( sFInfo, setUpdateColumn )
	--保存数据，使用Update命令更新一条数据库的记录
	local SqlCmd = self.objDB:CreateUpdateCmd('T_Role_Friend');
	SqlCmd.Wheres.dwRoleID = self.dwRoleID;
	SqlCmd.Wheres.dwFriendID = sFInfo.dwRoleID;
	--设置Fields的值
	--SqlCmd.Fields.dwRoleID 	= self.dwRoleID;
	--SqlCmd.Fields.dwFriendID = sFInfo.dwRoleID;
	if not setUpdateColumn then
		SqlCmd.Fields.dwFlag 	= sFInfo.dwFlag;
		SqlCmd.Fields.dwMeetTime = sFInfo.dwMeetTime;
		SqlCmd.Fields.dwLastTime = sFInfo.dwLastTime;
		SqlCmd.Fields.dwVip 		= sFInfo.dwVip;
		SqlCmd.Fields.dwLevel 	= sFInfo.dwLevel;
		SqlCmd.Fields.strName 	= sFInfo.strName;
		SqlCmd.Fields.dwHead 	= sFInfo.dwHead;
		SqlCmd.Fields.dwProf 	= sFInfo.dwProf;
		SqlCmd.Fields.dwEnemy 	= sFInfo.dwEnemy;
		SqlCmd.Fields.dwInjectFlag 	= sFInfo.dwInjectFlag;
	else
		for k,name in pairs(setUpdateColumn) do
			if sFInfo[name] then
				SqlCmd.Fields[name] = sFInfo[name];
			end
		end
	end
	--执行命令
	SqlCmd:execute()
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
	SqlCmd.Fields.dwInjectFlag 	= sFInfo.dwInjectFlag;
	--执行命令
	SqlCmd:execute()
	return true;
end
--删除单条好友信息
function CFriendSystemDB:DeleteFriend( sFInfo )
	local SqlCmd = self.objDB:CreateDeleteCmd('T_Role_Friend');
	SqlCmd.Wheres.dwRoleID = self:GetRoleID();
	SqlCmd.Wheres.dwFriendID = sFInfo.dwRoleID;
	SqlCmd:execute()
	return true;
end
--保存自己的心情和签名
function CFriendSystemDB:UpdateMoodMsg( setMoodMsg )
	--保存数据，使用Update命令更新一条数据库的记录
	local SqlCmd = self.objDB:CreateUpdateCmd('T_Role_Mood');
	--设置Fields的值
	SqlCmd.Fields.dwMood1 	= setMoodMsg.dwMood1 or 0;
	SqlCmd.Fields.dwMood2 	= setMoodMsg.dwMood2 or 0;
	SqlCmd.Fields.dwMood3 	= setMoodMsg.dwMood3 or 0;
	SqlCmd.Fields.dwMood4 	= setMoodMsg.dwMood4 or 0;
	SqlCmd.Fields.szSign 	= setMoodMsg.szSign or "";
	--设置Wheres的值
	SqlCmd.Wheres.dwRoleID	= self.dwRoleID;
	--执行命令
	SqlCmd:execute()
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
	SqlCmd:execute()
	return true;
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
	SqlCmd.Wheres.dwRoleID = self.dwRoleID;
	SqlCmd.Wheres.dwContactID = sCInfo.dwRoleID;
	--设置Fields的值
	SqlCmd.Fields.dwLastTime = sCInfo.dwLastTime;
	SqlCmd.Fields.dwVip 		= sCInfo.dwVip;
	SqlCmd.Fields.dwLevel 	= sCInfo.dwLevel;
	SqlCmd.Fields.strName 	= sCInfo.strName;
	--执行命令
	SqlCmd:execute()
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
	SqlCmd:execute()
	return true;
end
--删除单条最近联系人信息
function CFriendSystemDB:DeleteContact( sCInfo )
	local SqlCmd = self.objDB:CreateDeleteCmd('T_Role_Contact');
	SqlCmd.Wheres.dwRoleID = self.dwRoleID;
	SqlCmd.Wheres.dwContactID = sCInfo.dwRoleID;
	SqlCmd:execute()
	return true;
end
--获取角色ID
function CFriendSystemDB:GetRoleID()
	return self.dwRoleID;
end




