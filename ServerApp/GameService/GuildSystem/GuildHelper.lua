--获取帮派ID
function CGuildSystem:GetGuildID()
	if not self.tabGuild then return end
	return self.tabGuild.dwGuildID
end
--获取帮派名
function CGuildSystem:GetGuildName()
	if not self.tabGuild then return end
	return self.tabGuild.szGuildName
end
--获取帮派成员
function CGuildSystem:GetGuildMember()
	if not self.tabGuild then return end
	return self.tabMemberList
end
--判断同帮派
function CGuildSystem:IsInMyGuild(dwRoleID)
	if not self.tabMemberList then return end
	return self.tabMemberList[dwRoleID]
end
--更新成员信息
function CGuildSystem:UpdatePlayer(tabData)
	CGuildServerMsg:NotifyKernel('UpdatePlayer',tabData)
end
--更新奖杯信息
function CGuildSystem:UpdateTrophy(tabData)
	CGuildServerMsg:NotifyKernel('UpdateTrophy',tabData)
end
