--[[
���ܣ�����ϵͳ�ࣨ��������
�汾��v1.0
���ߣ�������
ʱ�䣺2012-05-04
]]
----------------------------------------------------------------------------------
_G.CGuildSystem = {};

function CGuildSystem:new()
	local obj = CSystem:new("CGuildSystem");
	obj.LdInfo = {};   -----ҡ����Ϣ
	obj.LdInfo.dwCurLDTime = 0; -------��ǰ�齱����
	obj.LdInfo.dwRoleID = 0;
	obj.LdInfo.AwardItemID = 0;
	obj.LdInfo.AwardItemNum = 0;
	obj.LdInfo.AwardItemBindType = 0;
	obj.LdInfo.dwLevel = 0;  ----���ҵȼ�
	obj.LdInfo.dwContribute = 0; ----��ҹ��׶�
	obj.LdInfo.dwTitle = 0; ----��ҳ�ν�ȼ�
	obj.objDBQuery = nil;
	obj.bChangeLine = false;
	for index, value in pairs(CGuildSystem) do
		if type(value) == "function" then
			obj[index] = value;
		end;
	end;
	return obj;
end;
----------------------------------------------------------------------------------
function CGuildSystem:Create()
	local objPlayer = self:GetPlayer()
	self.objMsg = CGuildPlayerMsg:new(objPlayer)
	
	self:SetRealSkillList(objPlayer:GetLineData("CGuildSkill")[1], true);

	local objDB = objPlayer:GetDBQuery();
	-- �������ݿ����
	self.objDBQuery = CGuildSystemDBOper:new(objDB,self);
	---�����ݿ��ж�ȡ����
	local Data = objPlayer:GetLineData("CGuildSystem") or {};-----ҡ����Ϣ�б�
	if(#Data == 0) then
		return false;
	end
	if(Data[1].dwRoleID ~= nil ) then
		self.LdInfo.dwCurLDTime = Data[1].dwCurLDTime; -------��ǰ�齱����
		self.LdInfo.dwRoleID = Data[1].dwRoleID;
		if(Data[1].AwardItemID ~= nil) then
			self.LdInfo.AwardItemID = Data[1].AwardItemID;
			self.LdInfo.AwardItemNum = Data[1].AwardItemNum;
			self.LdInfo.AwardItemBindType = Data[1].AwardItemBindType;
			self.LdInfo.dwLevel = Data[1].dwLevel;  ----���ҵȼ�
			self.LdInfo.dwContribute = Data[1].dwContribute; ----��ҹ��׶�
			self.LdInfo.dwTitle = Data[1].dwTitle; ----��ҳ�ν�ȼ�
		end
	end
	return true;
end;
function CGuildSystem:Update(e)
	if not self.tabGuild then return end
	self:UpdatePower()
	return true;
end;

function CGuildSystem:OnEventCenter(szEvent,Param1,Param2)
	if not self.tabGuild then return end
	if szEvent == 'EventLevelUp' then
		local tabInfo = {}
		tabInfo.dwRoleID = self:GetPlayer():GetRoleID()
		tabInfo.dwLevel = Param2
		CGuildServerMsg:NotifyKernel('UpdatePlayer',tabInfo)
	end
	if szEvent == 'EventAddActivePoint' then
		local tabInfo = {}
		tabInfo.dwGuildID = self.tabGuild.dwGuildID
		tabInfo.dwActive = GuildActiveCount(Param1)
		CGuildServerMsg:NotifyKernel('UpdateActive',tabInfo)
	end
end
----------------------------------------------------------------------------------
function CGuildSystem:GetGuildInfo()
	return self.tabGuild
end
function CGuildSystem:SetGuildInfo(tabInfo)
	self.tabGuild = tabInfo
end
function CGuildSystem:GetPlayerInfo()
	return self.tabPlayer
end
function CGuildSystem:SetPlayerInfo(tabInfo)
	self.tabPlayer = tabInfo
end
function CGuildSystem:GetMemberList()
	return self.tabMemberList
end
function CGuildSystem:SetMemberList(tabList)
	self.tabMemberList = tabList
end
function CGuildSystem:GetTrophyList()
	return self.tabTrophyList
end
function CGuildSystem:SetTrophyList(tabList)
	self.tabTrophyList = tabList
end
function CGuildSystem:GetChartList()
	return self.tabChartList
end
function CGuildSystem:SetChartList(tabList)
	self.tabChartList = tabList
end
function CGuildSystem:SetGuildSkillList(tabGuildSkillList)
	self.tabGuildSkillList = tabGuildSkillList;
	self:CalculateSkill();
end;
function CGuildSystem:GetGuildSkillList()
	return self.tabGuildSkillList;
end;
function CGuildSystem:SetRealSkillList(tabRealSkillList, bForbidClient)
	self.tabRealSkillList = tabRealSkillList;
	if not bForbidClient then
		self:CalculateSkill();
	end;
end;
function CGuildSystem:GetRealSkillList()
	return self.tabRealSkillList;
end;
function CGuildSystem:CalculateSkill()
	local base = SSingleAttrChange:new();
	local per  = SSingleAttrChange:new();
	if self.tabRealSkillList and self.tabGuildSkillList then
		local skillList = {};
		for k, v in pairs(self.tabGuildSkillList) do
			if v > 0 and self.tabRealSkillList[k] > 0 then
				skillList[k] = (v > self.tabRealSkillList[k]) and self.tabRealSkillList[k] or v;
			end;
		end;
		for k, v in pairs(skillList) do
			local skill = _G.GuildSkillConfig[k];
			if skill then
				local tattr = skill.GetAddAttr(v);
				base.dwAttack		= base.dwAttack		+ tattr.dwAttack;		--����
				base.dwDefense		= base.dwDefense	+ tattr.dwDefense;		--����
				base.dwCrit			= base.dwCrit		+ tattr.dwCrit;			--����
				base.dwFlee			= base.dwFlee		+ tattr.dwFlee;			--��
				base.dwHPMax		= base.dwHPMax		+ tattr.dwHPMax;		--����max
				base.dwMPMax		= base.dwMPMax		+ tattr.dwMPMax;		--����max
				base.dwAttackSpeed	= base.dwAttackSpeed+ tattr.dwAttackSpeed;	--�����ٶ�
				base.dwMoveSpeed	= base.dwMoveSpeed	+ tattr.dwMoveSpeed;	--�ƶ��ٶ�
				base.dwRemitAttack	= base.dwRemitAttack+ tattr.dwRemitAttack;	--�˺�����
				--percentֵ
				per.dwAttack		= per.dwAttack		+ tattr.dwAttackPer;	--�����ٷֱ�
				per.dwDefense		= per.dwDefense		+ tattr.dwDefensePer;	--�����ٷֱ�
				per.dwCrit			= per.dwCrit		+ tattr.dwCritPer;		--�����ٷֱ�
				per.dwFlee			= per.dwFlee		+ tattr.dwFleePer;		--���ٷֱ�
				per.dwHPMax			= per.dwHPMax		+ tattr.dwHPMaxPer;		--����max�ٷֱ�
				per.dwMPMax			= per.dwMPMax		+ tattr.dwMPMaxPer;		--����max�ٷֱ�
				per.dwAttackSpeed	= per.dwAttackSpeed	+ tattr.dwAttackSpeedPer;--�����ٶȰٷֱ�
				per.dwMoveSpeed		= per.dwMoveSpeed	+ tattr.dwMoveSpeedPer;	--�ƶ��ٶȰٷֱ�
				per.dwRemitAttack	= per.dwRemitAttack	+ tattr.dwRemitAttackPer;--�˺�����ٷֱ�
			end;
		end;
	end;
	local skillSystem = self:GetPlayer():GetSystem("CSkillSystem");
	skillSystem:NotifyGuildUpdate(base,2,false)
	skillSystem:NotifyGuildUpdate(per,2,true)
	self:Msg():NotifyClient("OnGuildSkill", {[1] = self.tabRealSkillList, [2] = self.tabGuildSkillList});
end;

function CGuildSystem:GetInfo()
	local tabRole = {}
	local tabInfo = self:GetPlayer():GetInfo()
	tabRole.dwRoleID = tabInfo.dwRoleID
	tabRole.szRoleName = tabInfo.szRoleName
	tabRole.dwLevel = tabInfo.dwLevel
	tabRole.dwClass = tabInfo.dwProf
	local objSystem = self:GetPlayer():GetSystem('CSkillSystem')
	local tabInfo = objSystem:CountBattleScoreInfo()
	tabRole.dwPower = G_GetScoreInfoAll(tabInfo)
	return tabRole
end
function CGuildSystem:GetBattlePoint()
	local tabAttribute = {}
	--ͼ��
	local tabConfig = GuildTotemConfig[self.tabGuild.dwLevel]
--	for k,v in pairs(tabConfig.tabAttribute.tabPercent) do
--		tabPercent[k] = (tabPercent[k] or 0) + v
--	end
	for k,v in pairs(tabConfig.tabAttribute.tabAbsolute) do
		tabAttribute[k] = (tabAttribute[k] or 0) + v
	end
	--��
	local dwLevel = CPlayerSystem:GetPlayer():GetInfo().dwLevel
	if dwLevel >= GuildChartConfig.dwLevel then
		if self.tabPlayer.dwTitle >= GuildChartConfig.dwTitle then
			for e,n in pairs(self.tabChartList) do
				if n >= GuildChartConfig.dwCount then
					local tabConfig = GuildChartConfig.tabChart[e]
					if tabConfig then
						for k,v in pairs(tabConfig.tabAttribute) do
							tabAttribute[k] = (tabAttribute[k] or 0) + v
						end
					end
				end
			end
		end
	end
	--����
	local dwPoint = 0
	for k,v in pairs(tabAttribute) do
		dwPoint = dwPoint + EquipGradeConfig[k] * v
	end
	return dwPoint
end
function CGuildSystem:UpdateActive(dwActive)
	if not self.tabGuild then return end
	local tabInfo = {}
	tabInfo.dwGuildID = self.tabGuild.dwGuildID
	tabInfo.dwActive = dwActive
	CGuildServerMsg:NotifyKernel('UpdateActive',tabInfo)
end
----------------------------------------------------------------------------------
--��ȡ��Ϣʵ��
function CGuildSystem:Msg()
	return self.objMsg
end
----------------------------------------------------------------------------------
--��ʼ������
function CGuildSystem:InitPlayer()
	self:InitTitle()
	self:InitAttribute()
end
----------------------------------------------------------------------------------
--��ʼ���ƺ�
function CGuildSystem:InitTitle()
	local objPlayer = self:GetPlayer()
	local objSystem = objPlayer:GetSystem('PlayerShowTextSystem')
	if self.tabGuild and self.tabPlayer then
		local szGuildName = self.tabGuild.szGuildName
		local dwRank = self.tabPlayer.dwRank
		local szTitle = SysStringConfigInfo[6001070003]
		szTitle = string.format(szTitle,szGuildName)
		if dwRank == 1 or dwRank == 2 then
			local szRank = GuildRankConfig[dwRank].szName
			szTitle = szTitle..' '..szRank
		end
		objSystem:SetTitle(szTitle,nil,10)
	else
		objSystem:DelTitle(10)
	end
end
----------------------------------------------------------------------------------
--��ʼ������
function CGuildSystem:InitAttribute()
	local objPlayer = self:GetPlayer()
	local objSystem = objPlayer:GetSystem('CSkillSystem')
	if not self.tabGuild then
		objSystem:NotifyGuildUpdate({},1,true)
		objSystem:NotifyGuildUpdate({},1,false)
		return
	end
	local tabPercent = {}
	local tabAbsolute = {}
	--����
	local dwAddExp = 0
	for k in pairs(self.tabTrophyList) do
		local tabConfig = GuildTrophyConfig[k]
		local tabTrophy = GuildTrophyType[tabConfig.dwTrophyType]
		dwAddExp = dwAddExp + tabTrophy.dwAddExp
	end
	tabPercent.dwExpUp = dwAddExp/100
	--ͼ��
	local tabConfig = GuildTotemConfig[self.tabGuild.dwLevel]
	for k,v in pairs(tabConfig.tabAttribute.tabPercent) do
		tabPercent[k] = (tabPercent[k] or 0) + v
	end
	for k,v in pairs(tabConfig.tabAttribute.tabAbsolute) do
		tabAbsolute[k] = (tabAbsolute[k] or 0) + v
	end
	--��
	if objPlayer:GetInfo().dwLevel >= GuildChartConfig.dwLevel then
		if self.tabPlayer.dwTitle >= GuildChartConfig.dwTitle then
			for e,n in pairs(self.tabChartList) do
				if n >= GuildChartConfig.dwCount then
					local tabConfig = GuildChartConfig.tabChart[e]
					if tabConfig then
						for k,v in pairs(tabConfig.tabAttribute) do
							tabAbsolute[k] = (tabAbsolute[k] or 0) + v
						end
					end
				end
			end
		end
	end
	
	objSystem:NotifyGuildUpdate(tabPercent,1,true)
	objSystem:NotifyGuildUpdate(tabAbsolute,1,false)
end
----------------------------------------------------------------------------------
--�������
function CGuildSystem:RemoteInvite(dwSrcID)
	--check
	local dwRes = 0
	local tabRole = self:GetInfo()
	if tabRole.dwLevel < GuildMemberConfig.dwLevel then
		dwRes = 1
	end
	local objSystem = self:GetPlayer():GetSystem('CSettingSystem')
	if not objSystem:CanReceiveFactionInvite() then
		dwRes = 2
	end
	--execute
	local tabArg = { dwRes,tabRole.dwRoleID,tabRole.szRoleName }
	GSRemoteCall(dwSrcID,'CGuildSystem','OnRemoteInvite',tabArg)
end
function CGuildSystem:OnRemoteInvite(dwRes,dwTarID,szName)
	if dwRes == 0 then
		self:Msg():NotifyKernel('InvitePlayer',dwTarID)
	elseif dwRes == 1 then
		self:Msg():NotifyClient('Notice',1,6001010042,szName)
	elseif dwRes == 2 then
		self:Msg():NotifyClient('Notice',1,13000410002,szName)
	end
end
----------------------------------------------------------------------------------
--���µȼ�
function CGuildSystem:UpdateLevel()
	local dwRoleID = self:GetPlayer():GetRoleID()
	local dwLevel = self:GetPlayer():GetInfo().dwLevel
	local tabInfo = { dwRoleID = dwRoleID,dwLevel = dwLevel }
	CGuildServerMsg:NotifyKernel('UpdatePlayer',tabInfo)
end
--����ս����
function CGuildSystem:UpdatePower()
	local dwRoleID = self:GetPlayer():GetRoleID()
	local objSystem = self:GetPlayer():GetSystem('CSkillSystem')
	local tabInfo = objSystem:CountBattleScoreInfo()
	
	--ս��������ϵͳ��ʱ��д���Ӧ����create֮����ϵͳ�޸�ս��������ս��������ȷ
	local objBSUSys = self:GetPlayer():GetSystem("CBattleScoreUpSystem");
	if not objBSUSys then
		return false;
	end;
	objBSUSys:SendBattleScoreAll();
	
	local dwPower = G_GetScoreInfoAll(tabInfo)
	local tabInfo = { dwRoleID = dwRoleID,dwPower = dwPower }
	CGuildServerMsg:NotifyKernel('UpdatePlayer',tabInfo)
end
----------------------------------------------------------------------------------
--��ɱ�¼���Ӧ
function CGuildSystem:EventBeKilled(dwTimes,dwEnemyID,dwType)
	if dwType ~= 1 then return end
	if not self.tabGuild then return end
	if self.dwBoradCast then
		local dwTime = self.dwBoradCast + GuildNoticeConfig.dwTime
		if dwTime > GetCurTime() then return end
	end
	self.dwBoradCast = GetCurTime()
	local dwGuildID = self.tabGuild.dwGuildID
	local tabInfo = { dwGuildID = dwGuildID }
	tabInfo.szSrc = self:GetPlayer():GetInfo().szRoleName
	local objPlayer = self:GetPlayer():GetOtherPlayer(dwEnemyID,3)
	tabInfo.szDes = objPlayer:GetInfo().szRoleName
	local sysMap = self:GetPlayer():GetSystem("CMapSystem")
	tabInfo.dwMapID = sysMap:GetPlayerMapPos()
	local tabPos = sysMap:GetPlayerPos()
	tabInfo.dwPosX = math.floor(tabPos.x)
	tabInfo.dwPosY = math.floor(tabPos.y)
	CGuildServerMsg:NotifyKernel('GuildRevenge',tabInfo)
end
----------------------------------------------------------------------------------