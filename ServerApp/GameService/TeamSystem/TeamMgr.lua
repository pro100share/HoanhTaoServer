--[[
功能：队伍父类管理器
类型：继承于CSingle
作者：曲莹
时间：2012-03-06
]]

_G.CTeamManager = CSingle:new();
CSingleManager:AddSingle(CTeamManager);

--创建team管理器
function CTeamManager:Create()
	self.m_teamId = 0;
	self.m_teamInfo = {};
	return true;
end;

function CTeamManager:Update(dwInterval)
	return true;
end;

function CTeamManager:Destroy()

end;

--增加一个team
function CTeamManager:CreateTeam(roleId)
	local teamId = self:GetNextTeamID();
	local team = CTeam:new(teamId, roleId);
	self.m_teamInfo[teamId] = team;
	return teamId;
end;

--删除一个team
function CTeamManager:DeleteTeam(teamId)  
	if self.m_teamInfo and self.m_teamInfo[teamId] then
		self.m_teamInfo[teamId].m_members = nil;
		self.m_teamInfo[teamId].m_captain = nil;
		self.m_teamInfo[teamId] = nil;
	end;
end;

--获得team
function CTeamManager:GetTeamObj(teamId)  
	return self.m_teamInfo[teamId];
end;

--分配team的id
function CTeamManager:GetNextTeamID()
	self.m_teamId = self.m_teamId + 1;	--序列号自增
	return self.m_teamId;
end;

--通过teamId获得teamInfo
function CTeamManager:GetTeamInfo(teamId)
	local info = {};
	local team = CTeamManager:GetTeamObj(teamId);
	if not team then return info end;
	local captainId = team:GetCaptainId();
	local captain = CPlayerManager:GetPlayerByRoleID(captainId);
	if not captain then
		return;
	end;
	local captainName = captain:GetInfo().szRoleName;
	local captainHeadId = captain:GetIncoID();
	local captainLevel = captain:GetInfo().dwLevel;
	table.insert(info, {captainId, captainName, captainHeadId, captainLevel});
	local members = team:GetTeamMembers();
	for _, roleId in pairs(members) do
		local member = CPlayerManager:GetPlayerByRoleID(roleId);
		if member then
			local memberName = member:GetInfo().szRoleName;
			local memberHeadId = member:GetIncoID();
			local memberLevel = member:GetInfo().dwLevel;
			table.insert(info, {roleId, memberName, memberHeadId, memberLevel});
		end;
	end;
	return info;
end;

