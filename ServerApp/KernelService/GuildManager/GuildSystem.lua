_G.CGuildSystem = {}
function CGuildSystem:new()
	local obj = CSystem:new("CGuildSystem");
	for i,v in pairs(CGuildSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end

function CGuildSystem:Create()
	local objPlayer = self:GetPlayer()
	local dwRoleID = objPlayer:GetRoleID()
	local objMember = CGuildMemberMgr:Get(dwRoleID)
	if objMember then
		objMember.bOnline = true;
		--如果是家主
		if objMember.dwRank == 1 then
			local objGuild = CGuildInfoMgr:Get(objMember.dwGuildID);
			if objGuild then
				objGuild.tmLeaderOffTime = -1;
				
				CGuildPlayerMsg:NotifyGuild(objMember.dwGuildID,'OnUpdateLeaderOffTime',objGuild.tmLeaderOffTime)
			end
		end
	end
	return true;
end
function CGuildSystem:Update(dwInterval)
	return true
end
function CGuildSystem:Destroy()
	local dwRoleID = self:GetPlayer():GetRoleID()
	local objMember = CGuildMemberMgr:Get(dwRoleID)
	if objMember then
		objMember.bOnline = false;
		--如果是家主
		if objMember.dwRank == 1 then
			local objGuild = CGuildInfoMgr:Get(objMember.dwGuildID);
			if objGuild then
				objGuild.tmLeaderOffTime = _now();
				
				CGuildPlayerMsg:NotifyGuild(objMember.dwGuildID,'OnUpdateLeaderOffTime',0)
			end
		end
	end
	return true
end
