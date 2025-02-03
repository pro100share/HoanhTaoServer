
_G.CTitleSystem = {};
---------------------------------------------------------------------------------
function CTitleSystem:new()
	local obj = CSystem:new("CTitleSystem");
	for index, value in pairs(CTitleSystem) do
		if type(value) == "function" then
			obj[index] = value;
		end;
	end;
	return obj;
end;
---------------------------------------------------------------------------------
function CTitleSystem:Create()
	local objPlayer = self:GetPlayer();
	self.objQuery = CTitleSystemDB:new(objPlayer:GetDBQuery(),self);
	self.tabTitle = objPlayer:GetLineData("CTitleSystem")[1];
	self:RefreshAttribute();
	return true;
end;
function CTitleSystem:OnChangeLineBegin()
	local objPlayer = self:GetPlayer();
	objPlayer:SetLineData("CTitleSystem",self.tabTitle);
end;
---------------------------------------------------------------------------------
function CTitleSystem:InitTitle()
	local dwAvailable = self:GetAvailable();
	for dwTitleID,tabInfo in pairs(self.tabTitle) do
		if dwAvailable < 0 then
			if tabInfo.dwShow == 1 then
				tabInfo.dwShow = 0;
				dwAvailable = dwAvailable + 1;
				self.objQuery:SetTitle(dwTitleID,0);
			end
		else
			break;
		end
	end

	local objPlayer = self:GetPlayer();
	local objSystem = objPlayer:GetSystem("PlayerShowTextSystem");
	for dwTitleID,tabInfo in pairs(self.tabTitle) do
		if tabInfo.dwShow == 1 then
			self:ShowTitle(dwTitleID);
		end
	end
	self:RefreshAttribute();
	objPlayer.OnInitTitleMsg{ Info = self.tabTitle };
end
function CTitleSystem:GetTitle(dwTitleID)
	return self.tabTitle[dwTitleID]
end
function CTitleSystem:SetTitle(dwTitleID,dwShow)
	local tabInfo = self.tabTitle[dwTitleID];
	if tabInfo == nil then return end;
	if dwShow ~= 0 then dwShow = 1 end;
	if tabInfo.dwShow == dwShow then return end;
	local dwAvailable = self:GetAvailable();
	if dwShow == 1 and dwAvailable <= 0 then return end;

	if dwShow == 1 then
		self:ShowTitle(dwTitleID);
		self:GetPlayer().OnShowTitleMsg{ Title = dwTitleID };
	else
		self:HideTitle(dwTitleID);
		self:GetPlayer().OnHideTitleMsg{ Title = dwTitleID };
	end
	tabInfo.dwShow = dwShow;
	self.objQuery:SetTitle(dwTitleID,dwShow);
	self:RefreshAttribute();
end
function CTitleSystem:RefreshAttribute()
	local tabAttribute = {}
	local tabSkillAddLevel = {};
	
	for dwTitleID,tabInfo in pairs(self.tabTitle) do
		if tabInfo.dwShow == 1 then
			local tabConfig = TitleContentConfig[dwTitleID];
			for k,v in pairs(tabConfig.tabAttribute) do
				tabAttribute[k] = (tabAttribute[k] or 0) + v;
			end
			
			if tabConfig.tabSkillLevel then
				for dwID,dwLevel in pairs(tabConfig.tabSkillLevel)do
					if not tabSkillAddLevel[dwID] then
						tabSkillAddLevel[dwID] = 0;
					end
					
					tabSkillAddLevel[dwID] = tabSkillAddLevel[dwID] + dwLevel;
				end
			end
		end
	end
	local objSystem = self:GetPlayer():GetSystem("CSkillSystem");
	objSystem:NotifyTitleUpdate(tabAttribute,false);
	
	objSystem:ClearSkillAddLevel("CTitleSystem");
	objSystem:SetSkillLevel(tabSkillAddLevel,"CTitleSystem");
end
---------------------------------------------------------------------------------
function CTitleSystem:AddTitle(dwTitleID)
	if not TitleContentConfig[dwTitleID] then return end;
	if self.tabTitle[dwTitleID] ~= nil then return end;
	local tabTemp = { dwShow = 0, dwUpdate = GetCurTime() };
	self.tabTitle[dwTitleID] = tabTemp;
	self.objQuery:AddTitle(dwTitleID);
	self:GetPlayer().OnAddTitleMsg{ Title = dwTitleID };
	
	local szNotice = TitleContentConfig[dwTitleID].szNotice
	if szNotice then
		local szName = self:GetPlayer():GetInfo().szRoleName;
		local setNet = {};
		for i,objPlayer in pairs(CPlayerManager.setAllPlayer) do
			table.insert(setNet, objPlayer.objNet);
		end;
		_groupcallout(
			setNet,"OnTitleBroadcastMsg",
			{ Name = szName,Title = dwTitleID }
		);
	end
	self:RefreshAttribute();
end
function CTitleSystem:DelTitle(dwTitleID)
	if not TitleContentConfig[dwTitleID] then return end;
	if self.tabTitle[dwTitleID] == nil then return end;
	if self.tabTitle[dwTitleID] then
		self:HideTitle(dwTitleID);
	end
	self.tabTitle[dwTitleID] = nil;
	self.objQuery:DelTitle(dwTitleID);
	self:GetPlayer().OnDelTitleMsg{ Title = dwTitleID };
	self:RefreshAttribute();
end
---------------------------------------------------------------------------------
function CTitleSystem:ShowTitle(dwTitleID)
	local tabConfig = TitleContentConfig[dwTitleID];
	if not tabConfig then return end;
	local objPlayer = self:GetPlayer();
	local objSystem = objPlayer:GetSystem("PlayerShowTextSystem");
	objSystem:SetTitle(nil,tabConfig.szImage,tabConfig.dwPos);
end
function CTitleSystem:HideTitle(dwTitleID)
	local tabConfig = TitleContentConfig[dwTitleID];
	if not tabConfig then return end;
	local objPlayer = self:GetPlayer();
	local objSystem = objPlayer:GetSystem("PlayerShowTextSystem");
	objSystem:DelTitle(tabConfig.dwPos);
end
---------------------------------------------------------------------------------
function CTitleSystem:GetAvailable()
	local dwCurShowTitle = 0;
	for k,v in pairs(self.tabTitle) do
		if v.dwShow == 1 then
			dwCurShowTitle = dwCurShowTitle + 1;
		end
	end
	local dwMaxShowTitle = 0;
	local objSystem = self:GetPlayer():GetSystem("CVipSystem");
	if objSystem:IsVip() then
		dwMaxShowTitle = TitleGlobalConfig.dwVIPMaxShow;
	else
		dwMaxShowTitle = TitleGlobalConfig.dwMaxShow;
	end
	return dwMaxShowTitle - dwCurShowTitle;
end
---------------------------------------------------------------------------------