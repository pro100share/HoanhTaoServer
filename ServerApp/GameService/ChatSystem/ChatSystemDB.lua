--[[
功能：聊天系统数据库操作
作者：周兴团
时间：2012-3-12
]]

_G.CChatSystemDB = {}
--构造函数
function CChatSystemDB:new(objDB, objChatSys)
	local obj = {};
	obj.objDB = objDB;				--对应的'数据库操作'对象
	obj.objChatSys = objChatSys;	--对应的玩家FriendSystem的对象
	obj.dwRoleID = objChatSys:GetPlayer():GetRoleID();--记录角色ID
	for i, v in pairs(CChatSystemDB) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end
--保存玩家的聊天信息到数据库
function CChatSystemDB:SaveSendMsg( setSendMsg )
	for k,sMsg in pairs(setSendMsg) do
		self:InsertMsg( sMsg );
	end
end
--增加单条聊天记录
function CChatSystemDB:InsertMsg( sMsg )
	--保存数据，使用Insert命令增加一条数据库的记录
	local SqlCmd = self.objDB:CreateInsertCmd('T_Role_Chat');
	if SqlCmd == nil then 
		_info("SqlCmd == nil by CChatSystemDB:InsertMsg");
		return false;
	end;
	--设置Fields的值
	SqlCmd.Fields.dwRoleID 	 = self.dwRoleID;
	SqlCmd.Fields.dwMessageID = sMsg.dwMessageID;
	SqlCmd.Fields.dwSendTo 	 = sMsg.dwSendTo;
	SqlCmd.Fields.dwTime  	 = sMsg.dwTime;
	SqlCmd.Fields.dwChannel   = sMsg.dwChannel;
	SqlCmd.Fields.strText 	 = string.gsub(sMsg.strText, "'", "’");
	
	SqlCmd:execute()
	return true;
end

--保存禁言时间
function CChatSystemDB:SaveChatBan(dwBanStart, dwBanTime)
	local SqlCmd = self.objDB:CreateInsertCmd('T_Role_Info');
	if SqlCmd == nil then 
		_info("SqlCmd == nil by CChatSystemDB:InsertMsg");
		return false;
	end;
	SqlCmd.Fields.dwRoleID 	 = self.dwRoleID;
	SqlCmd.Fields.dwBanStart 	 = dwBanStart or 0;
	SqlCmd.Fields.dwBanTime 	 = dwBanTime or 0;
end








