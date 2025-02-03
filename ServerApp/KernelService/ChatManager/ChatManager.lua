--聊天，转发需要跨服的聊天信息

define.OnGSGuildChatRequestMsg
{
	GuildID = 0;
	ChatMsg = {};
}
when{}
function OnGSGuildChatRequestMsg(GuildID,ChatMsg)
	local tabMemberList = CGuildMemberMgr:GetMemberList(GuildID);
	local tabLineList = CGameLineManager:GetAllLine()
	for k,v in pairs(tabLineList) do
		v.OnKSGuildChatMsg { RoleList = tabMemberList, Msg = ChatMsg};
	end
end;

define.OnGSTrumpetMsg
{
	ChatMsg = {};
	LineID = 0;--记录消息从那条线发过来
}
when{}
function OnGSTrumpetMsg(ChatMsg,LineID)
	local tabLineList = CGameLineManager:GetAllLine()
	for k,v in pairs(tabLineList) do
		if v.dwLineID ~= LineID then
			v.OnKSTrumpetChatMsg { Msg = ChatMsg};
		end
	end
end;

define.OnGSChatLineMsg
{
	ChatMsg = {};
	LineID = 0;--记录消息从那条线发过来
}
when{}
function OnGSChatLineMsg(ChatMsg,LineID)
	local tabLineList = CGameLineManager:GetAllLine()
	for k,v in pairs(tabLineList) do
		if v.dwLineID ~= LineID then
			v.OnKSLineChatMsg { Msg = ChatMsg};
		end
	end
end;
--查找对应名字的RoleID
define.GSFindRoleIDMsg
{
	RoleName = "";--查询的玩家姓名
	FromRoleID = 0;--哪个玩家发起的查询
	CashID = 0;--私聊消息的ID
}
when{}
function GSFindRoleIDMsg(RoleName, FromRoleID, CashID)
	---FriendManager有对应的玩家姓名到ID的反查表
	local queryid = CFriendManager:QueryID( RoleName );
	if not queryid then
		queryid = 0;
		-- print("KS not find roleid",RoleName)
	end
	--返回查询的ID
	local player = CPlayerManager:GetPlayerByRoleID(FromRoleID);
	if player then
		-- local s = string.sub(player:GetName(), 8, #player:GetName())
		-- if(s == RoleName) then
			-- queryid = -1;
		-- end
		player.objLine.KSOnFindRoleIDMsg{ FromRoleID=FromRoleID, CashID=CashID, QueryID=queryid };
	end
end;


---私聊 查询玩家
define.GKSearchPrivatePlayerByNameMsg
{
	Name = "",      --查询的玩家姓名
	RoleID = 0,
	LineID = 0,
}
when{}
function GKSearchPrivatePlayerByNameMsg(Name,RoleID,LineID)
	local objPlayer = CPlayerManager:GetPlayerByRoleID(RoleID)
	if(not objPlayer) then
		_info("GKSearchPrivatePlayerByName is no player roleid:")
		return;
	end
	
	local paramInfo =  {}
	for k,v in pairs (CGameLineManager.setAllPlayer) do
		paramInfo[k] = {
		name = "",
		level = 0,
		proy = 0
		}
		paramInfo[k].name = v:GetInfo().szRoleName
		paramInfo[k].level = v:GetInfo().dwLevel
		paramInfo[k].prof = v:GetInfo().dwProf
	end
	local tabLineList = CGameLineManager:GetAllLine()
	for k,v in pairs(tabLineList) do
		if v.dwLineID == LineID then
			v.KGSeaPriPlayerByNameListMsg{RoleID = RoleID,Name = Name,ParamInfo = paramInfo};
			break
		end
	end
end;







