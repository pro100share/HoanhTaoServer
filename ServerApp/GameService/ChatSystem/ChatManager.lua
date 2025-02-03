--[[
功能：聊天系统全局管理器
作者：周兴团
时间：2012-3-12
]]

_G.CChatManager = CSingle:new();
CSingleManager:AddSingle(CChatManager);
CSingleManager:RegistCSSingle(CChatManager);
--local count = 0;
CChatManager.setChatSystem = {};--key是dwRoleID,value是CChatSystem对象
function CChatManager:Create()
	self.setSearchPlayerInfoByName = {} ----搜寻玩家信息表
end
function CChatManager:Update(dwInterval)
	-- count = count + dwInterval;
	-- if count > 20*1000 then
		-- count = 0;
		-- self:SendGongGao( "公告来了。。。。。。。。。。。。" );
	-- end
	-- return true;
end;
function CChatManager:Destroy()
end;
-----------------------------------------------------------------------------------------------------------------------------------------------
--玩家发送一条消息，包括队伍、帮派、世界（同一条线）、私聊、附近。参数是SChatMessage结构
function CChatManager:SendMsg(sChatMsg)
	--喇叭消息，全服发送
	if sChatMsg.dwChannel == enChatChannel.eTrumpet then
		return self:SendTrumpetMsg( sChatMsg );
	end
	if sChatMsg.dwChannel == enChatChannel.eTeam then
		return self:SendTeamMsg(sChatMsg);
	elseif sChatMsg.dwChannel == enChatChannel.eFaction then
		return self:SendFactionMsg(sChatMsg);
	elseif sChatMsg.dwChannel == enChatChannel.eLine then
		return self:SendLineMsg(sChatMsg);
	elseif sChatMsg.dwChannel == enChatChannel.eNearby then
		return self:SendNearbyMsg(sChatMsg);
	elseif sChatMsg.dwChannel == enChatChannel.ePrivate then
		return self:SendPrivateMsg(sChatMsg);
	end
end
--发送一个消息给同一个团队的玩家
function CChatManager:SendTeamMsg(sChatMsg)
	local dwRoleID = sChatMsg.dwRoleID;
	local objChatSys = self:GetChatSystem(dwRoleID);
	if objChatSys then
		local IDs = objChatSys:GetTeams();
		for k,dwID in pairs(IDs) do
			local objSys = self:GetChatSystem(dwID);
			if objSys then
				objSys:ReceiveMessage(sChatMsg);
			end
			
		end
	end
end
--发送一条消息给同一个帮派的玩家
function CChatManager:SendFactionMsg(sChatMsg)
	local dwRoleID = sChatMsg.dwRoleID;
	local objChatSys = self:GetChatSystem(dwRoleID);
	if objChatSys then
		local objGuildSys = objChatSys:GetPlayer():GetSystem("CGuildSystem");
		
		if objGuildSys:GetGuildID() and objGuildSys:GetGuildID() ~= 0 then
			CKernelApp.OnGSGuildChatRequestMsg{ GuildID = objGuildSys:GetGuildID(),ChatMsg = sChatMsg, LineID=CKernelApp.dwLineID };
		else
			objChatSys:Error(6000310004);
		end
	end
end
--发送一条消息给同一条线的玩家
function CChatManager:SendLineMsg(sChatMsg)
	CKernelApp.OnGSChatLineMsg{ ChatMsg = sChatMsg, LineID=CKernelApp.dwLineID };
	--当前线不会再收到消息了，直接发送
	for k,v in pairs(CPlayerManager.setAllPlayer) do
		local objSystem = v:GetSystem('CChatSystem');
		objSystem:ReceiveMessage(sChatMsg);
	end
end
--发送一条消息给附近的玩家
function CChatManager:SendNearbyMsg(sChatMsg)
	local dwRoleID = sChatMsg.dwRoleID;
	local objChatSys = self:GetChatSystem(dwRoleID);
	if objChatSys then
		local IDs = objChatSys:GetNearbys();
		for k,dwID in pairs(IDs) do
			self:SendChatMsgToPlayer(objChatSys,dwID,sChatMsg);
		end
	end
end
--发送一条消息给某一个玩家---已经移动到System里面
function CChatManager:SendPrivateMsg(sChatMsg)
	local objChatSys = self:GetChatSystem(sChatMsg.dwRoleID);
	objChatSys:SendPrivateChat( sChatMsg );
end
--全服发送一个喇叭消息，自己也需要收到
function CChatManager:SendTrumpetMsg( sChatMsg )
	CKernelApp.OnGSTrumpetMsg{ ChatMsg = sChatMsg, LineID=CKernelApp.dwLineID };
	--当前线不会再收到消息了，直接发送
	--[[
	for k,v in pairs(CPlayerManager.setAllPlayer) do
		local objSystem = v:GetSystem('CChatSystem');
		objSystem:ReceiveMessage(sChatMsg);
	end
	--]]
	for dwRoleID,objChatSys in pairs(CChatManager.setChatSystem) do
		objChatSys:ReceiveMessage(sChatMsg);
	end
end
--发送一条公告消息，所有人都会接收到
function CChatManager:SendGongGao( strText )
	local dwTime = GetCurTime();
	for dwRoleID,objChatSys in pairs(CChatManager.setChatSystem) do
		objChatSys:ReceiveGongGao( dwTime, strText );
	end
end
--获取某一个玩家的聊天系统对象
function CChatManager:GetChatSystem(dwRoleID)
	return CChatManager.setChatSystem[dwRoleID];
end
--玩家上线的时候，将自己的CChatSystem注册进来
function CChatManager:RegChatSystem( objChatSys )
	CChatManager.setChatSystem[objChatSys:GetPlayer():GetRoleID()] = objChatSys;
end
--玩家下线的时候，将自己的CChatSystem注销
function CChatManager:UnRegChatSystem( dwRoleID )
	CChatManager.setChatSystem[dwRoleID] = nil;
end

function CChatManager:SendChatMsgToPlayer(mysys,dwRoleID,sChatMsg,isNeedNotice)
	local funcBack = nil;
	
	if isNeedNotice then
		funcBack = function(dwRoleID,dwCode)
			if dwCode == -1 then
				mysys:Error(6000310002, 0, 0, sChatMsg.strSendTo);
			end
		end
	end
	
	GSRemoteCall(dwRoleID,"CChatSystem","ReceiveMessage",{sChatMsg},funcBack);
end;


---私聊中 根据玩家名字查询玩家
function CChatManager:GKSearchPrivatePlayerByName(name,dwRoleID)
	CKernelApp.GKSearchPrivatePlayerByNameMsg{Name = name,RoleID = dwRoleID,LineID=CKernelApp.dwLineID} 
end
-----获取搜寻玩家列表中的某一页
function CChatManager:GetSearchPlayerByNameInPage(pagenum)
	if(pagenum < 1 or pagenum > #self.setSearchPlayerInfoByName ) then
		_info("GetSearchPlayerByNameInPage(pagenum) pagenum is error",pagenum)
		return;
	end
	local beginNum = (pagenum-1)*5+1
	local endNum = beginNum+4
	local t = {}
	for i = beginNum,endNum do
		if(self.setSearchPlayerInfoByName[i]) then
			t[i] = self.setSearchPlayerInfoByName[i]
		end
	end
	
	return t
end








