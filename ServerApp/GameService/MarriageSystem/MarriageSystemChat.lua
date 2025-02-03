----------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------夫妻聊天----------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
--发送聊天
function CMarriageSystem:SendChat(text)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_info("error can not get player by CMarriageSystem:SendChat");
		return;
	end;
	if not self.Married then return end;
	--记录数据库
	local sendTime = _now();
    CKernelApp.MarMgr_SendChatMsg{
        RoleID  = self.MateRoleID,
        Msg     = text,
        Time    = sendTime
    };
	objPlayer.MarSys_SendChatResMsg{Text = text, SendTime = sendTime};
	--配偶不在线则不发送，等上线时会从数据库读取
	_G.GSRemoteCall(self.MateRoleID, "CMarriageSystem", "RecvChat", {text, sendTime}, nil);
end;
--收到聊天
function CMarriageSystem:RecvChat(text, sendTime)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_info("error can not get player by CMarriageSystem:RecvChat");
		return;
	end;
	objPlayer.MarSys_RecvChatMsg{Text = text, SendTime = sendTime};
end;
--删除指定ID聊天
function CMarriageSystem:DeleteChat(sendTime)
    if not self.Married then return end;
    CKernelApp.MarMgr_DelChatMsg{
        RoleID  = self:GetPlayer():GetRoleID(),
        Time    = sendTime
    };
end;
--删除所有夫妻聊天
function CMarriageSystem:DeleteAllChat()
    if not self.Married then return end;
    CKernelApp.MarMgr_DelChatMsg{
        RoleID  = self:GetPlayer():GetRoleID()
    };
end;
