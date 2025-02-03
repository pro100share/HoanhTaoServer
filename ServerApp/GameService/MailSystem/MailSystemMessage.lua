--[[
功能：物品系统消息处理
作者：周兴团
时间：2012-4-23
]]
_define()
--请求玩家所有的物品信息
define.RequestMailMsg
{
	user = NONE,
	Page = 0;
	ShowType = 0;--0是全部，1是已读，2是未读
}
when{ user = NONE }
RequestMailMsg = checkUser
when{}
function RequestMailMsg(user, Page, ShowType)
	local objSys = user:GetSystem("CMailSystem");
	if not objSys then
		-- print("RoleID: ", user:GetRoleID(), "RequestMailMsg", Page, ShowType);
		return;
	end;
	--print("RoleID: " .. user:GetRoleID(), "RequestMailMsg " .. "Page "..Page .. " ShowType "..ShowType);
	--print("Mail Total Number ", objSys:GetMailNum());
	objSys:RequestMailMsg( Page, ShowType );
end
--修改邮件读得标记
define.RequestReadMailMsg
{
	user = NONE,
	MailID = 0;
}
when{ user = NONE }
RequestReadMailMsg = checkUser
when{}
function RequestReadMailMsg(user, MailID)
	local objSys = user:GetSystem("CMailSystem");
	if not objSys then
		-- print("RoleID: ", user:GetRoleID(), "RequestReadMail", MailID);
		return;
	end;
	--print("RoleID: ", user:GetRoleID(), "RequestReadMail");
	--print("Mail Total Number ", objSys:GetMailNum());
	objSys:RequestReadMail( MailID );
end
--领取某一个邮件的物品
define.RequestGetItemMsg
{
	user = NONE,
	MailID = 0;
}
when{ user = NONE }
RequestGetItemMsg = checkUser
when{}
function RequestGetItemMsg(user, MailID)
	local objSys = user:GetSystem("CMailSystem");
	if not objSys then
		-- print("RoleID: ", user:GetRoleID(), "RequestGetItem", MailID);
		return;
	end;
	--print("RoleID: ", user:GetRoleID(), "RequestGetItem");
	--print("Mail Total Number ", objSys:GetMailNum());
	objSys:RequestGetItem( MailID );
end
--删除邮件
define.RequestDeleteMailsMsg
{
	user = NONE,
	MailIDs = {};
}
when{ user = NONE }
RequestDeleteMailsMsg = checkUser
when{}
function RequestDeleteMailsMsg(user, MailIDs)
	local objSys = user:GetSystem("CMailSystem");
	if not objSys then
		-- print("RoleID: ", user:GetRoleID(), "RequestDeleteMails", #MailIDs);
		return;
	end;
	--print("RoleID: ", user:GetRoleID(), "RequestDeleteMails");
	--print("Mail Total Number ", objSys:GetMailNum());
	objSys:RequestDeleteMails( MailIDs );
end


----------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
--KS回传邮件和物品的ID信息
define.KSOnSendBackMailIDMsg
{ 
	user = NONE;
	Param = {};
} 
when{}
function KSOnSendBackMailIDMsg(user,Param)
	--print("KSOnSendBackMailIDMsg=========" );
	CMailManager:DoSendMail( Param );
end

--KS发送一封邮件
define.KSOnSendMailRequestMsg
{ 
	user = NONE;
	MailMsg = {};
} 
when{}
function KSOnSendMailRequestMsg(user,MailMsg)
	--print("KSOnSendMailRequestMsg=========" );
	CMailManager:ParseAndSendMail( MailMsg );
end

--KS上的系统发送一封邮件
define.KSSystemSendMailRequestMsg
{ 
	user = NONE;
	MailMsg = {};
} 
when{}
function KSSystemSendMailRequestMsg(user,MailMsg)
	local objMail = CMail:new();
	objMail.sInfo = MailMsg;
	CMailManager:SendMail( objMail );
end

--KS上的系统发送一封配置邮件
define.KSSystemCfgMailRequestMsg
{ 
	user = NONE;
	CfgID = 0;
	RoleID = 0;
	Name = "";
} 
when{}
function KSSystemCfgMailRequestMsg(user,CfgID,RoleID,Name)
	CMailManager:SendConfigMail( CfgID, RoleID, Name );
end

--KS通知玩家收到邮件
define.KSNoticeMailMsg
{
	user = NONE;
	MailMsg = {};
}
when{}
function KSNoticeMailMsg(user,MailMsg)
	local objMail = CMail:new();
	objMail.sInfo = MailMsg;
	local player = CMapManager:GetPlayer(MailMsg.dwReceiver);
	if player then
		local mailSys = player:GetSystem("CMailSystem"); --CFriendManager:GetSystem( sInfo.dwReceiver, "CMailSystem" );
		if mailSys then
			mailSys:ReceiveMail( objMail );
		end
	end
end




