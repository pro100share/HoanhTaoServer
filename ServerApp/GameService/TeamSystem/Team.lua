--[[
功能：组队系统 单个team（服务器）
作者：曲莹
时间：2012-03-06
]]

_G.CTeam = {}

--team对象
function CTeam:new(teamId, roleId)
	local team = {}
	for i, v in pairs(CTeam) do
		if type(v) == "function" then
			team[i] = v;
		end;
	end;
	team.m_members = {}; --队员
	team.m_captainId = roleId; --队长
	team.m_teamid = teamId;  --队伍id
	team.m_allMembers = {}; --所有成员
	--team.m_assign = "average";   分配方式
	return team;
end;

--队伍增加成员
function CTeam:AddTeamMember(dwRoleID)
	if #self.m_members == 4 then
		return false;   --小队已满
	end;
	for _, playerId in pairs(self.m_members) do
		if playerId == dwRoleId then  --如果小队中已有该玩家,返回
			return false;
		end;
	end;
	table.insert(self.m_members, dwRoleID);
	return true;
end;

--获得小队id
function CTeam:GetTeamId()
	return self.m_teamid; 
end;

--获得队长id
function CTeam:GetCaptainId()
	return self.m_captainId;
end;

--设置队长id
function CTeam:SetCaptainId(captainId)
	self.m_captainId = captainId;
end;

--获得成员列表
function CTeam:GetTeamMembers()
	return self.m_members;
end;

--获得全体成员列表
function CTeam:GetAllTeamMember()
	return self.m_allMembers;
end;

--获得小队人数
function CTeam:GetTeamPersonNum()
	if self.m_members then
		return #self.m_members + 1;
	end;
	return 1;
end;

--删除队员
function CTeam:DeleteTeamMember(dwRoleID)
	for pos, memberId in pairs(self.m_members) do
		if memberId == dwRoleID then
			table.remove(self.m_members, pos);
			break;
		end;
	end;
end;

--卸任队长
function CTeam:RemoveCaptain(roleId, dwRoleID)  --roleId 为自己的对象,dwRoleId 为指定玩家
	local teamNum = table.getn(self.m_members);
	if teamNum == 0 then  --无其他队员
		return;   --不能转移队长
	end;
	self.m_captainId = dwRoleID;   --设置队长
	for pos, memberId in pairs(self.m_members) do
		if memberId == dwRoleID then
			table.remove(self.m_members, pos);   --将目标移除队员列表
			break;
		end;
	end;

	table.insert(self.m_members, roleId);     --将队长移入队员列表
end;

--得到自己的位置
function CTeam:GetPosition(roleId)
	for pos, memberId in pairs(self.m_members) do
		if memberId == roleId then
			return pos;
		end;
	end;
end;




