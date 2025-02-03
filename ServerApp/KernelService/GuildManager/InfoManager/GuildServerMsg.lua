----------------------------------------------------------------------------------
--公会更新
function CGuildServerMsg:UpdateGuild(tabData)
	if not tabData.dwGuildID then return end
	local objGuild = CGuildInfoMgr:Get(tabData.dwGuildID)
	if not objGuild then return end
	for k,v in pairs(tabData) do
		objGuild[k] = v
	end
	objGuild:Update()
end
----------------------------------------------------------------------------------
--活跃更新
function CGuildServerMsg:UpdateActive(tabData)
	if not tabData.dwGuildID then return end
	local objGuild = CGuildInfoMgr:Get(tabData.dwGuildID)
	if not objGuild then return end
	objGuild.dwActive = objGuild.dwActive + tabData.dwActive
	objGuild:Update()
	
	local tabRefresh = {}
	tabRefresh.dwActive = objGuild.dwActive;
	CGuildPlayerMsg:NotifyGuild(tabData.dwGuildID,'OnRefreshGuild',tabRefresh)
end
----------------------------------------------------------------------------------