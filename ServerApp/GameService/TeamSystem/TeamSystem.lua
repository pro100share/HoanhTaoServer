--[[
	组队系统服务端
	曲莹
	2012-03-05
]]--
_G.CTeamSystem = {}
function CTeamSystem:new()
	local objSys = CSystem:new("CTeamSystem");
	for key, value in pairs(CTeamSystem) do
		if type(value) == "function" then
			objSys[key] = value;
		end;
	end;
	return objSys;
end;

function CTeamSystem:Create()
	--小队id
	self.m_teamId = 0;
	--队伍宣言
	self.m_teamEnounce = "";
	self.LockedPlayerTbl = {};
	self.AcceptInviteChange = true;
	self.AcceptApplyChange = true;
	--组队模式
	self.TeamMode = true;  --默认为普通模式
	return true;
end;

function CTeamSystem:SetApplyFlag(bFlag)
	self.AcceptApplyChange = bFlag;
end;
function CTeamSystem:SetInviteFlag(bFlag)
	self.AcceptInviteChange = bFlag;
end;

function CTeamSystem:GetApplyFlag()
	return self.AcceptApplyChange;
end;
function CTeamSystem:GetInviteFlag()
	return self.AcceptInviteChange;
end;

function CTeamSystem:Update()
	if self.m_teamId and self.m_teamId ~= 0 then
		self:GetTeamMatePos();
	end;
	return true;
end;

function CTeamSystem:Destroy()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("Can not get objPlayer by CTeamSystem:Destroy");
		return;
	end;
	self:UnRegSelf();
	self:ExitTeam();
end;

function CTeamSystem:OnChangeLineBegin()
	local objPlayer = self:GetPlayer()
	if not objPlayer then
		return;
	end;
	local tbl = {};
	table.insert(tbl, self.AcceptApplyChange);
	table.insert(tbl, self.AcceptInviteChange);
	objPlayer:SetLineData("CTeamSystem",tbl);
end;
function CTeamSystem:OnChangeLineEnd()
	local objPlayer = self:GetPlayer()
	if not objPlayer then
		return;
	end;
	local info = objPlayer:GetLineData("CTeamSystem")[1];
	self.AcceptApplyChange = info[1];
	self.AcceptInviteChange = info[2];
end;

function CTeamSystem:UnRegSelf()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if self.LockedPlayerTbl then
		for dwRoleId, _ in pairs(self.LockedPlayerTbl) do
			if dwRoleId then
				local player = objPlayer:GetOtherPlayer(dwRoleId,3);
				if player then
					player.DelLockedTblMsg{RoleId = objPlayer:GetRoleID()};
				end;
			end;
		end;
	end;
end;

function CTeamSystem:CheckPlayer()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
end;

--组队提示
function CTeamSystem:TeamBeClewInfo(roleId)  --被锁定的人roleId
	local objMe = self:GetPlayer();
	if not objMe then
		return false;
	end;
	local playerId = objMe:GetRoleID();
	--不在线
	local lockedPlayer = objMe:GetOtherPlayer(roleId, 3);	
	if lockedPlayer then
		local mapSystem = lockedPlayer:GetSystem("CMapSystem");
		local mapId = mapSystem:GetCurMapID();
		if _G.NoneTeamConfig[mapId] then
			self:OperSystemNotice(SysStringConfigInfo[13009000025]);
			return false;
		end;
		if CDuplManager:IsInFb(roleId) then
			self:OperSystemNotice(TeamMsgConfig["PlayerMsg"]..lockedPlayer:GetInfo().szRoleName..TeamMsgConfig["IsInFb"]);
			return false;
		end;
		if CDuplManager:IsInFb(playerId) then  --自己在副本中	
			self:OperSystemNotice(TeamMsgConfig["SelfInFb"]);
			return false;
		end;
		return true, lockedPlayer;
	else
		if CDuplManager:IsInFb(playerId) then  --自己在副本中	
			self:OperSystemNotice(TeamMsgConfig["SelfInFb"]);
			return false;
		end;
		self:OperSystemNotice(SysStringConfigInfo[6000210030]);  --不在线
		return false;
	end;
end;

function CTeamSystem:CheckCanAddTeam(roleId)
	if self.LockedPlayerTbl[roleId] then
		self:OperSystemNotice(TeamMsgConfig["WaitResponse"]);
		return;
	end;
	self.LockedPlayerTbl[roleId] = true;
end;
------------------------------------------------------------------------------------------------------------------
------------------------------------------------------申请/邀请入队----------------------------------------------
------------------------------------------------------------------------------------------------------------------
--请求面板判断(邀请/申请)
function CTeamSystem:RequestShowPanel(roleId)   --roleId为被锁定的人
	local objMe = self:GetPlayer();
	if not objMe then
		return;
	end;
	if roleId and roleId == objMe:GetRoleID() then
		return;
	end;
	local mapSystem = objMe:GetSystem("CMapSystem");
	local mapId = mapSystem:GetCurMapID();
	if _G.NoneTeamConfig[mapId] then
		self:OperSystemNotice(SysStringConfigInfo[13009000025]);
		return false;
	end;
	local msgFlag, lockedPlayer = self:TeamBeClewInfo(roleId);
	if not msgFlag then
		return;
	end;
	if not lockedPlayer then
		return;
	end;

	local duplSystem = lockedPlayer:GetSystem("CDuplSystem");
	if duplSystem.objCurDupl then
		self:OperSystemNotice(TeamMsgConfig["InSingleFb"]);
		return;
	end;

	if objMe:GetSystem("CDuplSystem").objCurDupl then
		self:OperSystemNotice(TeamMsgConfig["SelfInFb"]);
		return;
	end;
	
	--显示面板类型判断
	--以发送请求者为基准判断
	if self:GetTeamId() then
		if not lockedPlayer:GetSystem("CTeamSystem") then
			_info("Get TeamSystem Failed in function CTeamSystem:RequestShowPanel");
		end;
		--邀请者,被邀请者都有队伍
		if lockedPlayer:GetSystem("CTeamSystem"):GetTeamId() then
			--在同一队伍中
			if self:GetTeamId() == lockedPlayer:GetSystem("CTeamSystem"):GetTeamId() then
				--两者在同一队伍,邀请失败消息
				self:OperSystemNotice(_G.SysStringConfigInfo[600020014]);
				--self:OperSystemNotice(TeamMsgConfig["InviteFailed"]..TeamMsgConfig["PlayerMsg"]..lockedPlayer:GetInfo().szRoleName..TeamMsgConfig["InSameTeam"]);
				return;
			end;
			--两者不在同一队伍,邀请失败消息
			self:OperSystemNotice(SysStringConfigInfo[6000210046]);
			return;
		end;
		--邀请人不是队长,无权限
		if self:GetCaptainId() then
			if objMe:GetRoleID() ~= self:GetCaptainId() then
				--邀请人不是队长,无权限消息
				self:OperSystemNotice(TeamMsgConfig["NoPri"]);
				return;
			end;
		end;
		if not lockedPlayer:GetSystem("CSettingSystem"):CanReceiveTeamInvite() then
			self:OperSystemNotice(string.format(SysStringConfigInfo[13000410001], lockedPlayer:GetInfo().szRoleName));
			return;
		end;
		--teamId为邀请加入到的队伍,需记录
		self:CheckCanAddTeam(roleId)
		lockedPlayer:GetSystem("CTeamSystem"):ReturnPanelType("InviteMsg", objMe:GetRoleID(), self:GetTeamId());  
		return;
	end;
	if not lockedPlayer:GetSystem("CTeamSystem") then
		_info("Get TeamSystem Failed in function CTeamSystem:RequestShowPanel");
	end;
	--自己无队,被请求者有队
	if not lockedPlayer:GetSystem("CSettingSystem"):CanReceiveTeamInvite() then
		self:OperSystemNotice(string.format(SysStringConfigInfo[13000410001], lockedPlayer:GetInfo().szRoleName));
		return;
	end;
	if lockedPlayer:GetSystem("CTeamSystem"):GetTeamId() then
		--被请求者是队长
		if lockedPlayer:GetSystem("CTeamSystem"):GetCaptainId() then
			if lockedPlayer:GetRoleID() == lockedPlayer:GetSystem("CTeamSystem"):GetCaptainId() then
				self:CheckCanAddTeam(roleId);
				lockedPlayer:GetSystem("CTeamSystem"):ReturnPanelType("ApplyMsg", objMe:GetRoleID(), lockedPlayer:GetSystem("CTeamSystem"):GetTeamId());
				return;
			end;
		end;
		--通知队长有玩家申请入队
		lockedPlayer:GetSystem("CTeamSystem"):NoticeCaptainApplayMsg(objMe:GetRoleID());
		return;
	end;
	--自己无队,被请求者也无队--邀请入队
	self:CheckCanAddTeam(roleId);
	lockedPlayer:GetSystem("CTeamSystem"):ReturnPanelType("InviteMsg", objMe:GetRoleID(), 0);
end;
----通知队长有玩家申请入队
function CTeamSystem:NoticeCaptainApplayMsg(roleId)
	local objMe = self:GetPlayer();
	if not objMe then
		return;
	end;
	local captainId = self:GetCaptainId();
	if not captainId then
		return;
	end;
	local captain = objMe:GetOtherPlayer(captainId, 3);  --得到队长信息
	if not captain then
		_err("Can not get captain by CTeamSystem:NoticeCaptainApplayMsg");
	end;
	if captain then
		local captainSystem = captain:GetSystem("CTeamSystem");
		if not captainSystem then
			_info("Get TeamSystem Failed in function CTeamSystem:NoticeCaptainApplayMsg");
			return;
		end;
		if not objMe:GetSystem("CSettingSystem"):CanSendTeamInviteTo(captain:GetRoleID()) then
			return;
		end;
		captainSystem:ReturnPanelType("ApplyMsg", roleId, self:GetTeamId());  --向队长发出组队申请
	end;
end;
--返回显示面板的类型--申请/邀请
function CTeamSystem:ReturnPanelType(questType, roleId, joinTeamId)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end
	local player = objPlayer:GetOtherPlayer(roleId, 3);
	local name = "";
	if player then
		name = player:GetInfo().szRoleName;
	end;
	objPlayer.ShowRequestInfoMsg{RequestType = questType, RoleId = roleId, JoinTeamId = joinTeamId, Name = name};
end;
--邀请入队(同意)
--roleId为发送请求的玩家id, self为被请求的玩家   --邀请加入到的team
function CTeamSystem:TeamInviteMsg(roleId, joinTeamId) 
	local objMe = self:GetPlayer();
	if not objMe then
		return;
	end;
	local beRoleId = objMe:GetRoleID();
	if roleId and roleId == beRoleId then
		return;
	end;
	-----------------------------------邀请操作失败判断-----------------------------------------------------
	local msgFlag, senderPlayer = self:TeamBeClewInfo(roleId);
	if not msgFlag then
		return;
	end;
	senderPlayer:GetSystem("CTeamSystem").LockedPlayerTbl[beRoleId] = false;
	if not senderPlayer:GetSystem("CTeamSystem") then
		_info("Get CTeamSystem Failed by CTeamSystem:TeamInviteMsg");
		return;
	end;
	--(2)邀请者不是队长(邀请后变更了队长)
	if senderPlayer:GetSystem("CTeamSystem"):GetCaptainId() then
		if senderPlayer:GetSystem("CTeamSystem"):GetCaptainId() ~= roleId then   
			self:OperSystemNotice(TeamMsgConfig["AddTeamFail"]);
			senderPlayer:GetSystem("CTeamSystem"):OperSystemNotice(TeamMsgConfig["NoPri"]);
			return;
		end;
	end;
	--(3)邀请者邀请时有队伍且变更了队伍,邀请失败
	if joinTeamId ~= 0 and senderPlayer:GetSystem("CTeamSystem"):GetTeamId() ~= joinTeamId then
		self:OperSystemNotice(TeamMsgConfig["AddTeamFail"]);
		senderPlayer:GetSystem("CTeamSystem"):OperSystemNotice(TeamMsgConfig["AddTeamFail"]);
		return;
	end;
	--(4)被邀请者同意时,邀请者队伍人数已满
	local teamMemberNum = senderPlayer:GetSystem("CTeamSystem"):GetTeamPersonNum();
	if teamMemberNum and teamMemberNum >= 5 then
		self:OperSystemNotice(TeamMsgConfig["TeamFull"]);
		senderPlayer:GetSystem("CTeamSystem"):OperSystemNotice(TeamMsgConfig["MaxTeamMembers"]);
		return;
	end;
	
	local beteamId = self:GetTeamId();
	local senderteamId = senderPlayer:GetSystem("CTeamSystem"):GetTeamId();
	
	local friendSystem = objMe:GetSystem("CFriendSystem");
	local senderFriendSystem = senderPlayer:GetSystem("CFriendSystem");
	if not friendSystem then
		_err("Can not get friendSystem by TeamInviteMsg");
	end;
	if not senderFriendSystem then
		_err("Can not get friendSystem by TeamInviteMsg----------");
	end;
	--(5)被邀请者已经有队伍,提示您已经有队伍不能加入
	if beteamId then
		--玩家已经拥有队伍
		if senderteamId and senderteamId == beteamId then
			self:OperSystemNotice(TeamMsgConfig["InSameTeam"]);
			local msg = TeamMsgConfig["InviteFailed"]..TeamMsgConfig["PlayerMsg"]..objMe:GetInfo().szRoleName..TeamMsgConfig["InSameTeam"];
			senderPlayer:GetSystem("CTeamSystem"):OperSystemNotice(msg);
			return;
		end;
		self:OperSystemNotice(TeamMsgConfig["IsATeamMember"]);
		return;  
	end;
	----------------------------邀请成功---------------------------------------------------------
	if not senderteamId then  --发送者无team
		--创建team
		senderPlayer:GetSystem("CTeamSystem"):CreateTeam();  --以发送者为captain创建队伍
		senderPlayer:GetSystem("CTeamSystem"):AddTeamMember(beRoleId);  --将发送者加入小队
		--添加联系人
		friendSystem:UpdateContact(roleId, GetCurTime());
		senderFriendSystem:UpdateContact(beRoleId, GetCurTime());
	else   --发送者有team
		--邀请入队
		senderPlayer:GetSystem("CTeamSystem"):AddTeamMember(beRoleId);
		friendSystem:UpdateContact(roleId, GetCurTime());
		senderFriendSystem:UpdateContact(beRoleId, GetCurTime());
	end;
end;
--申请入队(同意)
function CTeamSystem:TeamApplyMsg(roleId, joinTeamId) --roleId为发送请求的玩家id, self为被请求的玩家
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if roleId and objPlayer:GetRoleID() == roleId then
		return;
	end;
	local msgFlag, senderPlayer = self:TeamBeClewInfo(roleId);
	if not msgFlag then
		return;
	end;	
	if not senderPlayer then
		return;
	end;
	senderPlayer:GetSystem("CTeamSystem").LockedPlayerTbl[objPlayer:GetRoleID()] = false;
	
	local myfriendSystem = objPlayer:GetSystem("CFriendSystem");
	local senderFriendSystem = senderPlayer:GetSystem("CFriendSystem");
	if not myfriendSystem then
		_err("Can not get friendSystem CTeamSystem:TeamApplyMsg");
		return;
	end;
	if not senderFriendSystem then
		_err("Can not get friendSystem CTeamSystem:TeamApplyMsg----------");
		return;
	end;
	if not senderPlayer:GetSystem("CTeamSystem") then
		_err("Can not get teamSystem by CTeamSystem:TeamApplyMsg");
	end;
	local senderTeamId = senderPlayer:GetSystem("CTeamSystem"):GetTeamId();
	if senderTeamId then
		--申请者已经有队伍,提示您已经有队伍不能加入
		self:OperSystemNotice(TeamMsgConfig["IsATeamMember"]);
		return;   
	end;
	--申请的队伍已不存在
	if self:GetTeamId() and joinTeamId ~= self:GetTeamId() then
		self:OperSystemNotice(TeamMsgConfig["AddTeamFail"]);
		senderPlayer:GetSystem("CTeamSystem"):OperSystemNotice(TeamMsgConfig["AddTeamFail"]);
		return;
	end;
	local teamPersonNum = self:GetTeamPersonNum();
	if teamPersonNum and teamPersonNum >= 5 then
		self:OperSystemNotice(TeamMsgConfig["MaxTeamMembers"]);
		senderPlayer:GetSystem("CTeamSystem"):OperSystemNotice(TeamMsgConfig["TeamFull"]);
		return;
	end;
	if self:GetCaptainId() and self:GetCaptainId() == objPlayer:GetRoleID() then  --如果被申请方为队长,则加入小队
		self:AddTeamMember(roleId);  --将发送者加入小队
		myfriendSystem:UpdateContact(roleId, GetCurTime());   --加最近联系人
		senderFriendSystem:UpdateContact(objPlayer:GetRoleID(), GetCurTime());   --加最近联系人
	else
		self:OperSystemNotice(TeamMsgConfig["NoPri"]);
		senderPlayer:GetSystem("CTeamSystem"):OperSystemNotice(TeamMsgConfig["AddTeamFail"]);
	end;
end;
--拒绝邀请
function CTeamSystem:RefuseRequestMsg(dwRole)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local playerName = "";
	local info = objPlayer:GetInfo();
	if info then
		playerName = info.szRoleName;
	end;
	local senderRole = objPlayer:GetOtherPlayer(dwRole, 3);
	if not senderRole then
		return;   --不是同线,请求失败
	end
	senderRole:GetSystem("CTeamSystem").LockedPlayerTbl[objPlayer:GetRoleID()] = false;
	local str = "";
	if requestType == "InviteMsg" then
		str = TeamMsgConfig["PlayerMsg"]..playerName..TeamMsgConfig["RefuseInviteMsg"];
	else
		str = TeamMsgConfig["PlayerMsg"]..playerName..TeamMsgConfig["RefuseApplyMsg"];
	end;
	if not senderRole:GetSystem("CTeamSystem") then
		_err("Can not get teamSystem by CTeamSystem:RefuseRequestMsg");
		return;
	end;
	senderRole:GetSystem("CTeamSystem"):OperSystemNotice(str);
end;

------------------------------------------------------------------------------------------------------------------
------------------------------------------******************-------------------------------------------------
------------------------------------------------------------------------------------------------------------------
--玩家切场景后同步信息
function CTeamSystem:OnChangeSceneEnd()
	self:SynPlayerPos();
end;

--设置系统信息
function CTeamSystem:SetSystemInfo(teamId, teamEnounce, bTeamMode)
	self.m_teamId = teamId;
	self.m_teamEnounce = teamEnounce;
	self.TeamMode = bTeamMode;
end;

--添加成员，队长方法
function CTeamSystem:AddTeamMember(roleId)
	--添加到队伍
	if not self.m_teamId then
		return;
	end;
	local flag = _G.CTeamManager.m_teamInfo[self.m_teamId]:AddTeamMember(roleId);
	local membersTbl = _G.CTeamManager.m_teamInfo[self.m_teamId]:GetTeamMembers();
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local role = objPlayer:GetOtherPlayer(roleId, 3);
	if not role then
		return;    --添加队员失败,不在同一个线
	end;
	local mapSystem = role:GetSystem("CMapSystem");
	local mapId = mapSystem:GetCurMapID();
	if _G.NoneTeamConfig[mapId] then
		role:GetSystem("CTeamSystem"):OperSystemNotice(SysStringConfigInfo[13009000025]);
		return false;
	end;
	if flag then
		local roleTeamSystem = role:GetSystem("CTeamSystem");
		if not roleTeamSystem then
			_err("Can not get teamSystem by CTeamSystem:AddTeamMember");	
		end;
		if roleTeamSystem then
			roleTeamSystem:SetSystemInfo(self.m_teamId, self.m_teamEnounce, self.TeamMode);
			roleTeamSystem:IsLeavingFb();
			--同步消息
			roleTeamSystem:OperSystemNotice(TeamMsgConfig["AddSomeOneTeam"]..objPlayer:GetInfo().szRoleName..TeamMsgConfig["TeamMsg"]);
			if self.TeamMode then
				roleTeamSystem:OperSystemNotice(SysStringConfigInfo[600020001], false, 999);
			else
				roleTeamSystem:OperSystemNotice(SysStringConfigInfo[600020002], false, 999);
			end;
			self:AddOneMember(roleId);
		end;
		if membersTbl then
			for _, memberId in pairs(membersTbl) do		
				local member = objPlayer:GetOtherPlayer(memberId, 3);
				if member then
					local teamSystem = member:GetSystem("CTeamSystem");
					if not teamSystem then
						return;
					end;
					if teamSystem then
						if memberId ~= roleId then
							teamSystem:AddOneMember(roleId);   --同步加入信息
						else
							--加入一个队伍
							roleTeamSystem:SynEnterTeamInfo();
						end;
					end;
				end
			end;
		end;
		--添加队员成功后,把队员原有的多人副本信息清除
		roleTeamSystem:AddTeamDealDupl()
	
		if role:GetSystem('CPlayerEventCenterSystem') then
			role:GetSystem('CPlayerEventCenterSystem'):DoEvent(_G.enumPlayerEventType.EventAddTeam,1);
		end;
	end;
	
	return flag;
end;

--入队后对副本信息的处理
function CTeamSystem:AddTeamDealDupl()
	local role = self:GetPlayer();
	if not role then
		return;
	end;
	local captainId = self:GetCaptainId();
	local duplSystem = role:GetSystem("CDuplSystem");
	if duplSystem then
		if duplSystem.objCurDupl then
			duplSystem.objCurDupl:DeleteDuplSystem(duplSystem);
			duplSystem.objCurDupl = nil;
			if duplSystem.ExitDuplId then
				duplSystem.ExitDuplId = 0;
				duplSystem.TeamMode = nil;
			end;
		end;
		
		if captainId then
			duplSystem:SynDelFbInfo(captainId);
			duplSystem:SynEnterTeamInfo(captainId);
		end;
	end;
end;
--加入队伍时判断是否正在离开副本
function CTeamSystem:IsLeavingFb()
	local player = self:GetPlayer();
	if not player then
		return;
	end;
	local duplSystem = player:GetSystem("CDuplSystem");
	if not duplSystem then
		return;
	end;
	if not duplSystem.objCurDupl then
		return;
	end;
	player.IsShowLeaveMsg{};
end;

--加队员信息
function CTeamSystem:AddOneMember(roleId)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	
	local role = objPlayer:GetOtherPlayer(roleId, 3);
	if not role then
		return;
	end;
	--提示加队员的消息
	self:OperSystemNotice(TeamMsgConfig["PlayerMsg"]..role:GetInfo().szRoleName..TeamMsgConfig["JoinTeam"]);
	local info = self:GetPlayerBasicInfo(roleId, self.m_teamEnounce);
	objPlayer.SynCreateTeamMsg{Info = info};
end;


--增加的玩家同步所有队友信息
function CTeamSystem:SynEnterTeamInfo()
	
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local roleId = objPlayer:GetRoleID();
	objPlayer.SynCreateTeamMsg{Info = self:GetPlayerBasicInfo(roleId, self.m_teamEnounce)}
	local captainId = self:GetCaptainId();
	if captainId then
		local info = self:GetPlayerBasicInfo(captainId, self.m_teamEnounce);
		objPlayer.SynCreateTeamMsg{Info = info};
	end;
	local teamMembers = self:GetTeamMembers();
	if teamMembers then
		for _, memberId in pairs(teamMembers) do
			if memberId ~= roleId then
				local info = self:GetPlayerBasicInfo(memberId, self.m_teamEnounce);
				objPlayer.SynCreateTeamMsg{Info = info};
			end;
		end;
	end;
	--进队，检测亲密度增加条件	add by lkj -12/25/2012
	objPlayer:GetSystem("CMarriageSystem"):CheckLoveAddCond();
end;

--修改玩家的队伍宣言
function CTeamSystem:ModifyTeamEnounce(teamEnounce)
	if not self.m_teamId then
		return;
	end;
	if not teamEnounce or teamEnounce == "" then
		self:OperSystemNotice(TeamMsgConfig["PleaseInputXuanYan"]);
	end;	
	local members = self:GetTeamMembers();
	local captainId = self:GetCaptainId();
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if captainId and captainId ~= objPlayer:GetRoleID() then
		return;   --不是队长,不能修改
	end;
	local captain = objPlayer:GetOtherPlayer(captainId, 3);
	if captain then
		captain:GetSystem("CTeamSystem"):SynTeamEnounce(teamEnounce);
	end;
	if members then
		for _, memberId in pairs(members) do
			local member = objPlayer:GetOtherPlayer(memberId, 3);
			if member then
				member:GetSystem("CTeamSystem"):SynTeamEnounce(teamEnounce);
			end;
		end;
	end;
end;

--同步队伍宣言
function CTeamSystem:SynTeamEnounce(teamEnounce)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	self.m_teamEnounce = teamEnounce;
	objPlayer.SynTeamEnounceMsg{TeamEnounce = teamEnounce};
end;

function CTeamSystem:GetPlayerBasicInfo(roleId, teamEnounce)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local position = 0;
	local playerId = objPlayer:GetRoleID();
	if not roleId then
		_err("role parameter error -----------");
		return;
	end;
	if roleId ~= playerId then
		objPlayer = objPlayer:GetOtherPlayer(roleId, 3);
	end;
	if not objPlayer then
		return;
	end;
	if self:GetCaptainId() and roleId == self:GetCaptainId() then
		position = 1;
	else
		local membersTbl = self:GetTeamMembers();	
		if membersTbl then
			for i, memberId in pairs(membersTbl) do
				if memberId == roleId then
					position = i + 1;
				end;
			end;
		end;
	end;
	
	local szRoleName = objPlayer:GetInfo().szRoleName;
	local dwLevel = objPlayer:GetInfo().dwLevel;
	local dwProf = objPlayer:GetInfo().dwProf;
	local dwIncoID = objPlayer:GetIncoID();
	local mapSystem = objPlayer:GetSystem("CMapSystem");
	local skillSystem = objPlayer:GetSystem("CSkillSystem");
	local guildSystem = objPlayer:GetSystem("CGuildSystem");
	local mapId, posx, posy, mapCfgId = mapSystem:GetPlayerMapPos();
	local dwHP, dwHpMax = skillSystem:GetInfo().dwHP, skillSystem:GetInfo().dwHPMax;   --当前血量/总血量
	local dwMP, dwMpMax = skillSystem:GetInfo().dwMP, skillSystem:GetInfo().dwMPMax;   --当前内功/总内功
	local tongName = guildSystem:GetGuildName();
	local info = {}
	-- info["position"] = position;
	-- info["roleId"] = roleId;
	-- info["captainId"] = self:GetCaptainId();
	-- info["szRoleName"] = szRoleName;
	-- info["dwLevel"] = dwLevel;
	-- info["dwProf"] = dwProf;
	-- info["mapId"] = mapId;
	-- info["posx"] = posx;
	-- info["posy"] = posy;
	-- info["dwHp"] = dwHP;
	-- info["dwHpMax"] = dwHpMax;
	-- info["dwMP"] = dwMP;
	-- info["dwMpMax"] = dwMpMax;
	-- info["teamEnounce"] = teamEnounce;
	-- info["teamId"] = self.m_teamId;
	-- info["dwIncoID"] = dwIncoID;
	-- info["szTongName"] = tongName;
	info[1] = position;
	info[2] = roleId;
	info[3] = self:GetCaptainId();
	info[4] = szRoleName;
	info[5] = dwLevel;
	info[6] = dwProf;
	info[7] = mapId;
	info[8] = posx;
	info[9] = posy;
	info[10] = dwHP;
	info[11] = dwHpMax;
	info[12] = dwMP;
	info[13] = dwMpMax;
	info[14] = teamEnounce;
	info[15] = self.m_teamId;
	info[16] = dwIncoID;
	info[17] = tongName;
	info[18] = mapCfgId or 0;
	info[19] = self.TeamMode
	return info;
end;

--创建队伍(队长)
function CTeamSystem:CreateTeam()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local mapSystem = objPlayer:GetSystem("CMapSystem");
	local mapId = mapSystem:GetCurMapID();
	if _G.NoneTeamConfig[mapId] then
		self:OperSystemNotice(SysStringConfigInfo[13009000025]);
		return;
	end;
	local duplSystem = objPlayer:GetSystem("CDuplSystem");
	if duplSystem.objCurDupl then
		self:OperSystemNotice(TeamMsgConfig["InSingleFb"]);
		return;
	end;
	local teamId = _G.CTeamManager:CreateTeam(objPlayer:GetRoleID());
	self.m_teamId = teamId;
	local playerInfo = objPlayer:GetInfo();
	local msg = TeamMsgConfig["TeamMsg"];
	if playerInfo then
		self.m_teamEnounce = playerInfo.szRoleName..msg;
	end;
	local info = self:GetPlayerBasicInfo(objPlayer:GetRoleID(), self.m_teamEnounce);
	objPlayer.SynCreateTeamMsg{Info = info};
	--创建队伍时,如果有副本信息删除
	
	if duplSystem then
		if duplSystem.objCurDupl then
			duplSystem.objCurDupl:DeleteDuplSystem(duplSystem);
			duplSystem.objCurDupl = nil;
			if duplSystem.ExitDuplId then
				duplSystem.ExitDuplId = 0;
				duplSystem.TeamMode = nil;
			end;
		end;
	end;
	if objPlayer:GetSystem('CPlayerEventCenterSystem') then
		objPlayer:GetSystem('CPlayerEventCenterSystem'):DoEvent(_G.enumPlayerEventType.EventAddTeam,1);
	end;
end;

--同步玩家的血条
function CTeamSystem:SynPlayerBlood(currentBlood, totalBlood)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if self.m_teamId and self.m_teamId == 0 then  --没有小队,不更新
		return;
	end;	
	local playerId = objPlayer:GetRoleID();
	local captainId = self:GetCaptainId();
	if captainId then
		if captainId ~= playerId then
			local captain = objPlayer:GetOtherPlayer(captainId,3);
			if not captain then
				return;
			end;
			local system = captain:GetSystem("CTeamSystem");
			if system then
				system:SynOnePlayerBlood(playerId, currentBlood, totalBlood);
			end;
		end;
	end;
	local membersTbl =	self:GetTeamMembers();
	if membersTbl then
		for _, memberId in pairs(membersTbl) do
			if playerId ~= memberId then
				local member = objPlayer:GetOtherPlayer(memberId, 3);
				if member then
					local teamSystem = member:GetSystem("CTeamSystem");
					if not teamSystem then
						_err("Can not get teamSystem by CTeamSystem:SynPlayerBlood");
					end;
					if teamSystem then
						teamSystem:SynOnePlayerBlood(playerId, currentBlood, totalBlood);
					end;
				end;
			end;
		end;
	end;
end;

--个人同步血量
function CTeamSystem:SynOnePlayerBlood(playerId, currentBlood, totalBlood)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	objPlayer.SynPlayerBloodToClientMsg{PlayerId = playerId, CurrentBlood = currentBlood, TotalBlood = totalBlood}
end;

--同步玩家的内功
function CTeamSystem:SynPlayerMp(currentMp, totalMp)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if self.m_teamId and self.m_teamId == 0 then  --没有小队,不更新
		return;
	end;
	local playerId = objPlayer:GetRoleID();
	local captainId = self:GetCaptainId();
	if captainId then
		if captainId ~= playerId then
			local captain = objPlayer:GetOtherPlayer(captainId,3);
			if captain then
				local system = captain:GetSystem("CTeamSystem");
				if system then
					system:SynOnePlayerMp(playerId, currentMp, totalMp);
				end;
			end;
		end;
	end;
	local membersTbl = _G.CTeamManager.m_teamInfo[self.m_teamId]:GetTeamMembers();
	if membersTbl then
		for _, memberId in pairs(membersTbl) do
			if playerId ~= memberId then
				local member = objPlayer:GetOtherPlayer(memberId, 3);
				if member then
					local teamSystem = member:GetSystem("CTeamSystem");
					if teamSystem then
						teamSystem:SynOnePlayerMp(playerId, currentMp, totalMp);
					end;
				end;
			end;
		end;
	end;
end;

--个人同步血量
function CTeamSystem:SynOnePlayerMp(playerId, currentMp, totalMp)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	objPlayer.SynPlayerMpToClientMsg{PlayerId = playerId, CurrentMp = currentMp, TotalMp = totalMp}
end;

--同步玩家位置信息(地图变换时调用)	
function CTeamSystem:SynPlayerPos()
	if self.m_teamId and self.m_teamId == 0 then
		return;   --没有队伍,不需要同步
	end;
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local playerId = objPlayer:GetRoleID();
	local captainId = self:GetCaptainId();
	local mapId, posx, posy, mapCfgId = objPlayer:GetSystem("CMapSystem"):GetPlayerMapPos();
	local allTeamMember =self:GetTeamLeaguer();
	if captainId then
		if playerId == captainId then
			self:SynOnePlayerPos(playerId, mapId, posx, posy, mapCfgId);
		else
			local captain = objPlayer:GetOtherPlayer(captainId,3);
			if captain then
				local system = captain:GetSystem("CTeamSystem");
				if system then
					system:SynOnePlayerPos(playerId, mapId, posx, posy, mapCfgId);
				else
					_err("--get captain teamsys by SynPlayerPos");
				end;
			end;			
		end;
	end;
	local membersTbl = _G.CTeamManager.m_teamInfo[self.m_teamId]:GetTeamMembers();
	if membersTbl then
		for _, memberId in pairs(membersTbl) do	
			local member = objPlayer:GetOtherPlayer(memberId, 3);
			if member then
				local teamSystem = member:GetSystem("CTeamSystem");
				if teamSystem then
					teamSystem:SynOnePlayerPos(playerId, mapId, posx, posy, mapCfgId);
				else
					_err("--get member teamsys by SynPlayerPos");
				end;
			end;	
		end;
	end;
end;

--个人同步玩家位置
function CTeamSystem:SynOnePlayerPos(playerId, mapId, posx, posy, mapCfgId)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	objPlayer.SynPlayerPosToClientMsg{PlayerId = playerId, MapId = mapId, Posx = posx, Posy = posy,MapCfgId = mapCfgId};
end;

--更新玩家等级
function CTeamSystem:SynPlayerLevel(level)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if self.m_teamId and self.m_teamId == 0 then  --没有小队,不更新
		return;
	end;
	
	local playerId = objPlayer:GetRoleID();
	local captainId = self:GetCaptainId();
	local selfSkillSystem = objPlayer:GetSystem("CSkillSystem");
	local dwHP, dwHpMax = selfSkillSystem:GetInfo().dwHP, selfSkillSystem:GetInfo().dwHPMax;   --当前血量/总血量
	local dwMp, dwMpMax = selfSkillSystem:GetInfo().dwMP, selfSkillSystem:GetInfo().dwMPMax;   --当前血量/总血量
	if captainId then
		if playerId == captainId then
			self:SynOnePlayerLevel(playerId, level, dwHpMax, dwMpMax);
		else
			local captain = objPlayer:GetOtherPlayer(captainId,3);
			if captain then
				local system = captain:GetSystem("CTeamSystem");
				if system then
					system:SynOnePlayerLevel(playerId, level, dwHpMax, dwMpMax);
				end;
			end;			
		end;
	end;
	local membersTbl = self:GetTeamMembers();
	if membersTbl then
		for _, memberId in pairs(membersTbl) do	
			local member = objPlayer:GetOtherPlayer(memberId, 3);
			if member then
				local teamSystem = member:GetSystem("CTeamSystem");
				if teamSystem then
					teamSystem:SynOnePlayerLevel(playerId, level, dwHpMax, dwMpMax);
				end;
			end;	
		end;
	end;
end;

--个人同步血量
function CTeamSystem:SynOnePlayerLevel(playerId, level, dwHpMax, dwMpMax)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	objPlayer.SynPlayerLevelToClientMsg{PlayerId = playerId, Level = level, HpMax = dwHpMax, MpMax = dwMpMax}
end;

--玩家buff的同步
function CTeamSystem:SynPlayerBuff(playerId, buffId)
	if self.m_teamId and self.m_teamId == 0 then
		return;   --没有队伍,不需要同步
	end;
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local playerId = objPlayer:GetRoleID();
	local captainId = self:GetCaptainId();
	local captain = objPlayer:GetOtherPlayer(captainId,3);
	if captainId then
		if captainId ~= playeId then
			if captain then
				local system = captain:GetSystem("CTeamSystem");
				if system then
					system:SynOnePlayerBuff(playerId, buffId);
				end;
			end;
		end;
	end;
	local membersTbl = _G.CTeamManager.m_teamInfo[self.m_teamId]:GetTeamMembers();
	if membersTbl then
		for _, memberId in pairs(membersTbl) do	
			local member = objPlayer:GetOtherPlayer(memberId, 3);
			if member then
				local teamSystem = member:GetSystem("CTeamSystem");
				if teamSystem then
					teamSystem:SynOnePlayerBuff(playerId, buffId);
				end;
			end;	
		end;
	end;
end;

--同步玩家的buff(各个操作)
function CTeamSystem:SynOnePlayerBuff(playerId, buffId)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	objPlayer.SynPlayerBuffToClientMsg{PlayerId = playerId, BuffId = buffId}
end;

function CTeamSystem:GetCaptainId()
	local team = self:GetTeam();
	if not team then return nil end;
	return team:GetCaptainId();
end;

--获得自身team对象
function CTeamSystem:GetTeam()
	local objPlayer = self:GetPlayer();
	if not _G.CTeamManager.m_teamInfo[self.m_teamId] then
		return;
	end;
	return _G.CTeamManager.m_teamInfo[self.m_teamId];
end;

--获得自身teamId
function CTeamSystem:GetTeamId()
	local objPlayer = self:GetPlayer()
	if self.m_teamId == 0 then return nil end;
	return self.m_teamId;
end;

--获得玩家列表
function CTeamSystem:GetTeamMembers()
	if not _G.CTeamManager.m_teamInfo[self.m_teamId] then
		return;
	end;
	local members = _G.CTeamManager.m_teamInfo[self.m_teamId]:GetTeamMembers();
	return members;
end;

--获得队伍人数
function CTeamSystem:GetTeamPersonNum()
	if not _G.CTeamManager.m_teamInfo[self.m_teamId] then
		return;
	end;
	local num = _G.CTeamManager.m_teamInfo[self.m_teamId]:GetTeamPersonNum();
	return num;
end;

--获得小队的 等级
function CTeamSystem:GetTeamLevel()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if not _G.CTeamManager.m_teamInfo[self.m_teamId] then
		return 0;
	end;
	local members = _G.CTeamManager.m_teamInfo[self.m_teamId]:GetTeamMembers();
	local level = 0;
	if members then
		for _, memberId in pairs(members) do
			local player = objPlayer:GetOtherPlayer(memberId, 3);  --获得当前先队友信息
			if player then
				level = player:GetLevel() + level;	
			end;	
		end;
	end;
	if not self:GetCaptainId() then
		return 0;
	end;
	local captain = objPlayer:GetOtherPlayer(self:GetCaptainId(), 3); 
	
	if captain then
		level = level + captain:GetLevel();
	end;
	local num = self:GetTeamPersonNum()
	if num then
		local perlevel = math.floor(level/num);
		return perlevel;
	end;
	return 0;
end;

--获得小队内所有玩家的等级
function CTeamSystem:GetTeamMembersLevel()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if not _G.CTeamManager.m_teamInfo[self.m_teamId] then
		return 0;
	end;
	local members = _G.CTeamManager.m_teamInfo[self.m_teamId]:GetTeamMembers();
	local level = 0;
	if members then
		for _, memberId in pairs(members) do
			local player = objPlayer:GetOtherPlayer(memberId, 3);  --获得当前先队友信息
			if player then
				level = player:GetLevel() + level;	
			end;	
		end;
	end;
	if not self:GetCaptainId() then
		return 0;
	end;
	local captain = objPlayer:GetOtherPlayer(self:GetCaptainId(), 3); 
	
	if captain then
		level = level + captain:GetLevel();
	end;
	return level;
end;

--H获得小队内最大的队员等级
function CTeamSystem:GetMaxMemberLevel()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if not _G.CTeamManager.m_teamInfo[self.m_teamId] then
		return objPlayer:GetLevel();
	end;
	local members = self:GetTeamLeaguer();
	local id = objPlayer:GetRoleID();
	local level = 0;
	if members then
		for _, memberId in pairs(members) do
			if id ~= memberId then
				local player = objPlayer:GetOtherPlayer(memberId, 3);  --获得当前先队友信息
				if player then
					if player:GetLevel() >= level then
						level = player:GetLevel();
					end;
				else
					_err("-------get player error system---by -GetMaxMemberLevel-");
				end;
			else
				if objPlayer:GetLevel() >= level then
					level = objPlayer:GetLevel();
				end;
			end;		
		end;
	end;
	return level;
end;

--查看别人的teamInfo
function CTeamSystem:GetOtherTeamInfo(roleId)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	
	local otherPlayer = objPlayer:GetOtherPlayer(roleId,3);  --获得当前地图
	local otherSystem = otherPlayer:GetSystem("CTeamSystem");
	local captainId = otherSystem:GetCaptainId();
	local members = otherSystem:GetTeamMembers();
	local teamLevel = otherSystem:GetTeamLevel();
	local teamMemberNum = otherSystem:GetTeamPersonNum();
	local info = {};
	info["captainId"] = captainId;
	info["members"] = members;
	info["teamLevel"] = teamLevel;
	info["teamMemberNum"] = teamMemberNum;
	return info;
end;

--获得当前地图玩家小队
function CTeamSystem:GetCurMapTeamInfo()
	local teamId = self.m_teamId;
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local infoTbl = {}
	local selfRoleId = objPlayer:GetRoleID();
	local selfCaptainId = self:GetCaptainId();
	--获取当前地图所有的玩家
	local playerTbl = objPlayer:GetOtherPlayer(0,2);
	local teamNum = 0;
	
		for roleId, player in pairs(playerTbl) do
			if player then
				local teamSystem = player:GetSystem("CTeamSystem");
				if teamSystem then
					local captainId = teamSystem:GetCaptainId();
					if captainId and roleId == captainId then
						if (selfCaptainId and selfCaptainId ~= captainId) or (not selfCaptainId) then
							local info = {}		
							teamNum = teamNum + 1;
							local playerInfo = player:GetInfo();
							if playerInfo then
								local num = teamSystem:GetTeamPersonNum();
								local name = playerInfo.szRoleName;
								local teamLevel = teamSystem:GetTeamLevel();
								local level = playerInfo.dwLevel;
								info[1] = num;
								info[2] = name;
								info[3] = teamLevel;
								info[4] = level;
								info[5] = teamSystem.m_teamEnounce;
								info[6] = roleId;
								table.insert(infoTbl, info);
							end;
						end;
					end;
				end;
			end;
		end;
	
	if teamNum > 0 then
		local sendNum = math.ceil(teamNum / 10);
		for j = 1, sendNum do 
			local res = {};
			for e = 1, 10 do
				table.insert(res, infoTbl[e+(j -1 )* 10])
			end;
			local endFlag = false;
			if j == sendNum then 
				endFlag = true;
			end;
			objPlayer.ReturnNearByTeamInfoMsg{TeamInfo = res ,EndFlag = endFlag};
		end;
	else
		objPlayer.ReturnNearByTeamInfoMsg{TeamInfo = {} ,EndFlag = true};
	end;
end;

--获得战场内玩家队伍
function CTeamSystem:GetTeamInfoInWar()
	local objPlayer = self:GetPlayer();
	if not objPlayer then	
		return;
	end;
	local dwTeamId = self.m_teamId;
	--有队伍return
	if dwTeamId and dwTeamId ~= 0 then
		return;
	end;
	local dwLevel = objPlayer:GetInfo().dwLevel;
	local warSystem = objPlayer:GetSystem("CWarSystem");
	local warObj = warSystem:GetWarObj();
	local flag = false;
	if warObj and warObj.setAllPlayer then
		for _,id in pairs(warObj.setAllPlayer)do
			local player = CMapManager:GetPlayer(id);
			if player then
				local teamSystem = player:GetSystem("CTeamSystem");
				if teamSystem then
					local captainId = teamSystem:GetCaptainId();
					local teamId = teamSystem:GetTeamId();
					local bApplyFlag = teamSystem:GetApplyFlag();
					if bApplyFlag then
						if teamId and captainId and id == captainId then
							local playerInfo = player:GetInfo();
							if playerInfo then
								local num = teamSystem:GetTeamPersonNum();
								local level = playerInfo.dwLevel;
								if num < 4 and math.abs(level - dwLevel) <= 10 then
									teamSystem:TeamApplyMsg(objPlayer:GetRoleID(), teamId) --roleId为发送请求的玩家id, self为被请求的玩家
									flag = true;
									break;
								end;
							end;	
						end;
					end;
				end;
			end
		end
		if not flag then
			objPlayer.SendAutoJoinFailMsg{};
		end;
	end;
end;

--获得NearBy玩家信息
function CTeamSystem:GetNearByPlayerInfo()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;--获取当前地图所有的玩家
	local infoTbl = {};
	local playerTbl = objPlayer:GetOtherPlayer(0,2);
	local mapSystem = objPlayer:GetSystem("CMapSystem");
	local curMap = mapSystem:GetCurMap();
	if not curMap then
		return;
	end;
	local perNum = 0;
	for roleId, player in pairs(playerTbl) do		
		if player then				
			local teamSystem = player:GetSystem("CTeamSystem");
			if teamSystem then
				local teamId = teamSystem.m_teamId;	
				if not teamId or teamId == 0 then
					if roleId ~= objPlayer:GetRoleID() then
						perNum = perNum + 1;
						local info = {};
						local marriageSystem = player:GetSystem("CMarriageSystem")
						local guildSystem = player:GetSystem("CGuildSystem");
						local marriageState = marriageSystem.Married    --true已婚
						local mateName = marriageSystem.MateName --配偶名称
						local tongName = guildSystem:GetGuildName();   --获得世家名字
						local playerInfo = player:GetInfo();
						if playerInfo then
							local name =  playerInfo.szRoleName;
							local level = playerInfo.dwLevel;
							local prof = playerInfo.dwProf;
							--暂无门派
							info[1] = name;
							info[2] = level;
							info[3] = prof;
							info[4] = roleId;
							info[5] = marriageState;
							info[6] = mateName;
							info[7] = tongName or "";
							table.insert(infoTbl, info);
						end;
					end;
				end;
			end;
		end;
	end;
	if perNum > 0 then
		local sendNum = math.ceil(perNum / 10);
		for j = 1, sendNum do 
			local res = {};
			for e = 1, 10 do
				table.insert(res, infoTbl[e+(j -1 )* 10])
			end;
			local endFlag = false;
			if j == sendNum then 
				endFlag = true;
			end;
			objPlayer.ReturnNearByPlayerInfoMsg{PlayerInfo = res ,EndFlag = endFlag};
		end;
	else
		objPlayer.ReturnNearByPlayerInfoMsg{PlayerInfo = {} ,EndFlag = true};
	end;
end;

--按条件筛选队员
function CTeamSystem:GetNearByPlayerByCond(condition)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;--获取当前地图所有的玩家
	local infoTbl = {};
	
	local playerTbl = objPlayer:GetOtherPlayer(0,2);
	local perNum = 0; 
	for roleId, player in pairs(playerTbl) do
		if player then
			local teamSystem = player:GetSystem("CTeamSystem");
			if teamSystem then
				local teamId = teamSystem.m_teamId;
				if teamId == 0 then
					if roleId ~= objPlayer:GetRoleID() then					
						local playerInfo = player:GetInfo();
						local name =  playerInfo.szRoleName;
						local convertName = string.lower(name);
						local convertCond = string.lower(condition);
						if string.find(convertName, convertCond) then
							perNum = perNum + 1;
							local info = {};
							local marriageSystem = player:GetSystem("CMarriageSystem")
							local marriageState = marriageSystem.Married    --true已婚
							local mateName = marriageSystem.MateName --配偶名称
							local guildSystem = player:GetSystem("CGuildSystem");
							local tongName = guildSystem:GetGuildName();   --获得世家名字
							if playerInfo then
								local level = playerInfo.dwLevel;
								local prof = playerInfo.dwProf;
								--暂无门派								
								info[1] = name;
								info[2] = level;
								info[3] = prof;
								info[4] = roleId;
								info[5] = marriageState;
								info[6] = mateName;
								info[7] = tongName or "";
								table.insert(infoTbl, info);
							end;
						end;
					end;
				end;
			end;
		end;
	end;
	if perNum > 0 then
		local sendNum = math.ceil(perNum / 10);
		for j = 1, sendNum do 
			local res = {};
			for e = 1, 10 do
				table.insert(res, infoTbl[e+(j -1 )* 10])
			end;
			local endFlag = false;
			if j == sendNum then 
				endFlag = true;
			end;
			objPlayer.ReturnNearByPlayerInfoMsg{PlayerInfo = res ,EndFlag = endFlag};
		end;
	else
		objPlayer.ReturnNearByPlayerInfoMsg{PlayerInfo = {} ,EndFlag = true};
	end;
end;
----------------------------------------------------------------------------------------
---------------------------------------离开队伍相关----------------------------------
----------------------------------------------------------------------------------------
--自己离开队伍
function CTeamSystem:ExitTeam(flag)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if self.m_teamId and self.m_teamId == 0 then return end;
	local selfRoleID = objPlayer:GetRoleID();
	local duplSystem = objPlayer:GetSystem("CDuplSystem");
	local selfName = "";
	if objPlayer:GetInfo() then
		selfName = objPlayer:GetInfo().szRoleName;	
	end;
	if not self:GetCaptainId() then
		return;
	end;
	if selfRoleID == self:GetCaptainId() then   --自己是队长
		local membersTbl = self:GetTeamMembers();
		--如果队友列表为空，则解散队伍。
		if membersTbl then
			if #membersTbl == 0 then
				objPlayer:GetSystem("CWarSystem"):ClearDismissInWar();
				self:DismissTeam();
				if duplSystem then
					--队伍解散：直接发失败奖励
					duplSystem:DuplOperByDismiss(selfRoleID);
				end;
				objPlayer:GetSystem("CWarSystem"):CheckExitTeamInWar();
				return;
			end;
		end;
		--指定队伍中第一人为队长
		self:LeaveSpecCaptainMsg(selfName, 2);
	end;
	local team = self:GetTeam();
	if not team then
		return;
	end;
	local oldTeamMember = self:GetTeamLeaguer();
	if flag then
		self:OperSystemNotice(TeamMsgConfig["KickOutMsg"]);
	end;
	--通知队友本人离队
	local captainId = team:GetCaptainId();
	if captainId then
		local captain = objPlayer:GetOtherPlayer(captainId, 3);
		if captain then
			local teamSystem = captain:GetSystem("CTeamSystem");
			if teamSystem then
				teamSystem:OneExitTeam(selfRoleID, selfName);	
			end;				
		end;
	end;
	local membersTbl = team:GetTeamMembers();
	if membersTbl then
		for _, memberId in pairs(membersTbl) do
			local member = objPlayer:GetOtherPlayer(memberId, 3);
			if member then
				local teamSystem = member:GetSystem("CTeamSystem");
				if teamSystem then
					teamSystem:OneExitTeam(selfRoleID, selfName);
				end;
			end;
		end;
	end;
	local pos = team:GetPosition(selfRoleID);
	table.remove(team.m_members, pos);
	self:SetSystemInfo(0, "", self.TeamMode);
	self:ClearMyTeamPanel(oldTeamMember);
	--不发送奖励，清除个人面板信息
	if duplSystem then
		duplSystem:DealDelFbByLeave(selfRoleID);
	end;
	
	--进队，检测亲密度增加条件	add by lkj -12/25/2012
	objPlayer:GetSystem("CMarriageSystem"):CheckLoveAddCond();
	--检测战场
	objPlayer:GetSystem("CWarSystem"):CheckExitTeamInWar();
end;

--离开副本
function CTeamSystem:LeavelFbScene(leaveFlag, duplId)   --离开的副本id
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local duplSystem = objPlayer:GetSystem("CDuplSystem");
	if duplSystem then
		if not leaveFlag then
			duplSystem:ExitDuplLifeOver(duplSystem.mapId,duplSystem.posx,duplSystem.posy,duplSystem.fDirValue,duplId)
		else
			duplSystem:ExecExitDuplXY(duplSystem.mapId,duplSystem.posx,duplSystem.posy,duplSystem.fDirValue);
			duplSystem:SynDelFbInfoByLeave();
		end;
	else
		_err("duplSystem is nil by CTeamSystem:LeavelFbScene");
	end;
end;
--通知客户端离开副本
function CTeamSystem:NoticeClientLeaveFb(leaveFlag, duplId)   --leaveFlag :false为删除副本时
	local objPlayer = self:GetPlayer(); 
	if not objPlayer then
		return;
	end;
	local duplSystem = objPlayer:GetSystem("CDuplSystem");
	if duplSystem then
		objPlayer.NoticeClientLeaveFbMsg{CountDownTime = duplSystem.countDownTime, LeaveFlag = leaveFlag, DuplId = duplId};
		-- print("CTeamSystem:NoticeClientLeaveFb  duplSystem.countDownTime, leaveFlag, duplId", duplSystem.countDownTime, leaveFlag, duplId)
	end;
end;

function CTeamSystem:LeaveSpecCaptainMsg(name,pos)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local membersTbl = self:GetTeamMembers();
	if membersTbl then
		self:SpecifyCaptain(pos);
	end;
end;
--有人离开队伍
function CTeamSystem:OneExitTeam(roleID, name)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if objPlayer:GetRoleID() == roleID then
		self:OperSystemNotice(TeamMsgConfig["LeaveTeam"]);
	else
		local msg = TeamMsgConfig["PlayerMsg"]..name..TeamMsgConfig["LeaveTeamMsg"];
		self:OperSystemNotice(msg);
	end;
	objPlayer.SynMemberDeleteInfoMsg{RoleId = roleID};
end;
--请离队伍
function CTeamSystem:KickOutTeam(roleId, flag)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if self:GetCaptainId() then
		if self:GetCaptainId() ~= objPlayer:GetRoleID() then
			return;
		end;
	end;
	if roleId == 0 or roleId == objPlayer:GetRoleID() then
		return;
	end;
	local member = objPlayer:GetOtherPlayer(roleId, 3);
	if member then
		local teamSystem = member:GetSystem("CTeamSystem");
		if teamSystem then
			teamSystem:ExitTeam(flag);
		end;
	end;
end;
--更换队长
function CTeamSystem:SpecifyCaptain(pos)  --self:为原队长 ，pos为现队长,
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if self:GetCaptainId() then
		if self:GetCaptainId() ~= objPlayer:GetRoleID() then
			return;
		end;
	end;
	local membersTbl = self:GetTeamMembers();
	if membersTbl then
		local newCaptainId = membersTbl[pos - 1]  --指定的新队长ID
		if not newCaptainId then
			return;
		end;
		local captain = objPlayer:GetOtherPlayer(newCaptainId, 3);
		if not captain then
			return;
		end;
		local playerId = objPlayer:GetRoleID();
		local team = self:GetTeam();
		if team then
			table.insert(membersTbl, 1, playerId);
			local pos = team:GetPosition(newCaptainId);
			table.remove(membersTbl, pos);
			team.m_captainId = newCaptainId;
			local system = captain:GetSystem("CTeamSystem")
			if system then
				system:OnSpecifyCaptain();
			end;
		end;
	end;
end;

--离开的玩家将自己的队伍面板重置
function CTeamSystem:ClearMyTeamPanel(oldTeamMember)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	objPlayer.ClearMyTeamPanelMsg{OldTeamMates = oldTeamMember};
end;
--被指定为队长
function CTeamSystem:OnSpecifyCaptain()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local playerId = objPlayer:GetRoleID();
	--通知自己客户端自己成为队长
	self:CaptainChange(playerId, true);
	local membersTbl = self:GetTeamMembers();
	if membersTbl then
		for _, memberId in pairs(membersTbl) do
			local member = objPlayer:GetOtherPlayer(memberId, 3);
			if member then
				local teamSystem = member:GetSystem("CTeamSystem");
				--更换队长时变更副本所属
				if teamSystem then
					teamSystem:CaptainChange(playerId, false);
				end;
			end;
		end;
	end;
end;
--同步客户端的队长更换
function CTeamSystem:CaptainChange(newCaptainId, flag)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local msg = "";
	if flag then   --newCaptain
		msg = TeamMsgConfig["SpecifyNewCaptain"];
	else
		local newCaptain = objPlayer:GetOtherPlayer(newCaptainId, 3);
		if newCaptain and newCaptain:GetInfo() then
			msg = newCaptain:GetInfo().szRoleName..TeamMsgConfig["NoticeOtherCaptainMsg"];
		end;
	end;  
	--更换副本所属
	local duplSystem = objPlayer:GetSystem("CDuplSystem");
	if duplSystem then
		duplSystem:ChangeBuilder(newCaptainId);
	end;
	self:OperSystemNotice(msg);
	local captainInfo = self:GetPlayerBasicInfo(newCaptainId, self.m_teamEnounce);
	objPlayer.SynChangeCaptainMsg{CaptainInfo = captainInfo};
end;

--队长操作,解散队伍
function CTeamSystem:DismissTeam()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local roleId = objPlayer:GetRoleID();
	local captainId = self:GetCaptainId();
	
	if captainId and captainId ~= roleId then   --不是队长,无权解散队伍
		return;
	end;
	local id = self.m_teamId;
	self:SynDeleteTeam(self.m_teamId);
	local membersTbl = self:GetTeamMembers();
	if membersTbl then
		for _, memberId in pairs(membersTbl) do
			local member = objPlayer:GetOtherPlayer(memberId, 3);
			if member then
				local teamSystem = member:GetSystem("CTeamSystem");
				if teamSystem then
					teamSystem:SynDeleteTeam(self.m_teamId);
				end;
			end;
		end;
	end;
	CTeamManager:DeleteTeam(id);
end;

function CTeamSystem:SynDeleteTeam(teamId)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	self.m_teamId = 0;
	local msg = TeamMsgConfig["DismissTeam"];
	self:OperSystemNotice(msg);
	objPlayer.SynDeleteTeamMsg{TeamId = teamId};
end;

-----------------------------------------------------------------------------------------------------------------
-------------------------------------处理系统消息----------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
function CTeamSystem:OperSystemNotice(msg, types, errorType)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if not types then
		types = false;
	end;
	objPlayer.ResponseSystemNoticeMsg{Msg = msg, Types = types, ErrorType = errorType or 3};
end;
--判断是否在同一个队伍中
function CTeamSystem:InSameTeam(dwRoleId)
	local flag = false;
	local captainId = self:GetCaptainId();
	if captainId and dwRoleId == captainId then
		flag = true;
	end;
	local teamMembers = self:GetTeamMembers();
	if teamMembers then
		for _, memberId in pairs(teamMembers) do
			if memberId == dwRoleId then
				flag = true;
				break;
			end;
		end;
	end;
	return flag;
end;
--创建副本后通知其他的队员
function CTeamSystem:NoticeMemberEnterFb(dwDuplID, enterMode)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local szName = "";
	if objPlayer:GetInfo() then
		szName = objPlayer:GetInfo().szRoleName;
	end;
	local teamMembers = self:GetTeamMembers();
	if teamMembers then
		for _, memberId in pairs(teamMembers) do
			local member = objPlayer:GetOtherPlayer(memberId, 3);
			if not CDuplManager:IsInFb(memberId) then  --自己在副本中	
				if member then
					local duplSystem = member:GetSystem("CDuplSystem");
					duplSystem:ResGetFbShowInfo(true);
					member:GetSystem("CTeamSystem"):SynCreateFbInfo(dwDuplID, szName, enterMode);
				end;
			end;
		end;
	end;
end;
--同步通知其他队友进入副本
function CTeamSystem:SynCreateFbInfo(dwDuplID, name, enterMode)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	objPlayer.NoticeClientShowWndMsg{DuplID = dwDuplID, Name = name, EnterMode = enterMode};
end;
--------------------------------------------------------------------------------------------------------------
------------------------------------------------获得队伍所有的成员-----------------------------------------
--------------------------------------------------------------------------------------------------------------
function CTeamSystem:GetTeamLeaguer()
	local leaguerTbl = {};
	local captainId = self:GetCaptainId();
	local members = self:GetTeamMembers();
	if captainId then
		table.insert(leaguerTbl, captainId);
	end;
	if members then
		for _, memberId in pairs(members) do
			table.insert(leaguerTbl, memberId);
		end;
	end;
	return leaguerTbl;
end;


-----------------------------------------------------------------------------------------------------------------
-------------------------------------同步组队中地图坐标--------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------

function CTeamSystem:GetTeamMatePos()
	local info = {}
	local posInfo = {}
	local tables = {};
	local captainId = self:GetCaptainId();
	local teamMembers = self:GetTeamMembers();
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if self.m_teamId and self.m_teamId == 0 then
		return;  --没有队伍
	end;
	local mapId, posx, posy, mapCfgId = 0,0,0,0;
	if captainId then
		local captain = objPlayer:GetOtherPlayer(captainId,2);
		if captain then
			local captainSystem = captain:GetSystem("CMapSystem");
			if captainSystem then
				mapId, posx, posy, mapCfgId = captainSystem:GetPlayerMapPos();
				table.insert(tables, {captainId,posx, posy, captain:GetInfo().szRoleName, mapId, mapCfgId});
			end;
		end;
	end;
	for _, memberId in pairs(teamMembers) do
		local member = objPlayer:GetOtherPlayer(memberId, 2);
		if member then
			local memberSystem = member:GetSystem("CMapSystem");
			if memberSystem then
				mapId, posx, posy, mapCfgId = memberSystem:GetPlayerMapPos();
				table.insert(tables, {memberId,posx, posy, member:GetInfo().szRoleName, mapId, mapCfgId});
			end;
		end;
	end;
	
	objPlayer.SendPosInfoToClientMsg{Info = tables};
end;

--打开中地图
function CTeamSystem:OpenMiddleMap()	
	self.OpenTime = GetCurTime();
	self.openMap = true;
	self:GetTeamMatePos();
end;

function CTeamSystem:CloseMiddleMap()
	self.openMap = false;
	self.OpenTime = 0;
end;

--判断配偶是否在同一个队伍同一张地图
function CTeamSystem:IsMateInTeam(mateId)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("Get Player wrong in IsMateInTeam");
		return;
	end;
	local members = self:GetTeamLeaguer();
	local flag = false;	
	if members then
		for _, memberId in pairs(members) do
			if mateId == memberId then
				flag = true;
			end;		
		end;
	end;
	if not flag then
		return flag;
	end;
	
	local matePlayer = objPlayer:GetOtherPlayer(mateId,2);
	if matePlayer then
		return true;
	else 
		return false;
	end;
end;
--设置组队模式
function CTeamSystem:SendTeamMode(bTeamMode)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if self:GetCaptainId() ~= objPlayer:GetRoleID() then
		return;
	end;
	self.TeamMode = bTeamMode;
	local teamMembers = self:GetTeamMembers();
	if teamMembers then
		for _, memberId in pairs(teamMembers) do		
			local member = objPlayer:GetOtherPlayer(memberId, 3);
			member:GetSystem("CTeamSystem").TeamMode = bTeamMode;
			member.SynTeamModeMsg{TeamMode = member:GetSystem("CTeamSystem").TeamMode};
		end;
	end;
end;

--获取组队模式
function CTeamSystem:GetTeamMode()
	return self.TeamMode;
end;
