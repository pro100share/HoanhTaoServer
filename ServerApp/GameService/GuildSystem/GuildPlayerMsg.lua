--[[
功能：公会系统客户端命令处理（服务器）
版本：v1.0
作者：郭肇义
时间：2012-10-09
]]

----召唤令公告
define.CallMemberBroadCastMsg
{
	PlayerName	= "",
	PlayerRoleID= 0,
	GuildName  = "",
}
when{}
function CallMemberBroadCastMsg(PlayerName, PlayerRoleID, GuildName)
	local setNet = {};
	for i,objPlayer in pairs(CPlayerManager.setAllPlayer) do
		table.insert(setNet, objPlayer.objNet);
	end;
	_groupcallout(setNet, "CallMemberBroadCastMsg", {PlayerName = PlayerName, PlayerRoleID = PlayerRoleID, GuildName = GuildName});	
end;

_G.CGuildPlayerMsg = {}
----------------------------------------------------------------------------------
function CGuildPlayerMsg:new(objPlayer)
	local obj = {}
	obj.objPlayer = objPlayer
	setmetatable(obj,{ __index = CGuildPlayerMsg })
	return obj
end
--通知服务器
function CGuildPlayerMsg:NotifyKernel(szCmd,...)
	local tabInfo = {...}
	local dwSrcID = self.objPlayer:GetRoleID()
	CKernelApp.GuildPlayerMsg{ SrcID = dwSrcID,Cmd = szCmd,Info = tabInfo }
end
--通知客户端
function CGuildPlayerMsg:NotifyClient(szCmd,...)
	local tabInfo = {...}
	self.objPlayer.GuildPlayerMsg{ Cmd = szCmd,Info = tabInfo }
end
----------------------------------------------------------------------------------
--消息来源
CGuildPlayerMsg.Src = {}
----------------------------------------------------------------------------------
--建立公会
CGuildPlayerMsg.Src.BuildGuild = true
function CGuildPlayerMsg:BuildGuild(szGuildName,szAnnounce)
	local objSystem = self.objPlayer:GetSystem('CGuildSystem')
	local tabRole = objSystem:GetInfo()
	local tabGuild = {} 
	if SysStringConfigInfo[102] then
		tabGuild.szGuildName =  string.format(SysStringConfigInfo[102],self.objPlayer:GetSid(),szGuildName);
	end;
	tabGuild.szAnnounce = szAnnounce
	self:NotifyKernel('BuildGuild',tabRole,tabGuild)
end
----------------------------------------------------------------------------------
--申请公会
CGuildPlayerMsg.Src.ApplyGuild = true
function CGuildPlayerMsg:ApplyGuild(dwGuildID,dwTarID)
	--check
	local objSystem = self.objPlayer:GetSystem('CGuildSystem')
	local tabRole = objSystem:GetInfo()
	if tabRole.dwLevel < GuildMemberConfig.dwLevel then
		self:NotifyClient('Notice',1,6001010043)
		return
	end
	--execute
	self:NotifyKernel('ApplyGuild',tabRole,dwGuildID,dwTarID)
end
----------------------------------------------------------------------------------
--邀请玩家
CGuildPlayerMsg.Src.InvitePlayer = true
function CGuildPlayerMsg:InvitePlayer(dwTarID)
	--check
	local objSystem = self.objPlayer:GetSystem('CGuildSystem')
	if not objSystem:GetGuildInfo() then return end
	local dwResID = self.objPlayer:GetInfo().dwRoleID
	--execute
	local fn = function(dwTarID,dwResult)
		if dwResult == -1 then
			self:NotifyClient('Notice',1,6001010023)
		end
	end
	GSRemoteCall(dwTarID,'CGuildSystem','RemoteInvite',{ dwResID },fn)
end
----------------------------------------------------------------------------------
--接受邀请
CGuildPlayerMsg.Src.AcceptInvite = true
function CGuildPlayerMsg:AcceptInvite(dwRoleID)
	local objSystem = self.objPlayer:GetSystem('CGuildSystem')
	local tabRole = objSystem:GetInfo()
	self:NotifyKernel('AcceptInvite',dwRoleID,tabRole)
end
----------------------------------------------------------------------------------
--拒绝邀请
CGuildPlayerMsg.Src.RefuseInvite = true
function CGuildPlayerMsg:RefuseInvite(dwRoleID)
	local objSystem = self.objPlayer:GetSystem('CGuildSystem')
	local tabRole = objSystem:GetInfo()
	self:NotifyKernel('RefuseInvite',dwRoleID,tabRole)
end
----------------------------------------------------------------------------------
--捐献物品
CGuildPlayerMsg.Src.DonateMaterial = true
function CGuildPlayerMsg:DonateMaterial(eType,dwNumber)
	--check
	if dwNumber <= 0 then return end
	local objSystem = self.objPlayer:GetSystem('CItemSystem')
	local tabConfig = GuildDonateConfig[eType]
	if not tabConfig then return end
	if eType == enGuildDonate.eMoney then
		if not objSystem:IsPacketMoneyEnough(dwNumber) then return end
	else
		local dwItemEnum = tabConfig.dwItemEnum
		local dwCount = objSystem:GetEnumItemNumInPacket(dwItemEnum)
		if dwCount < dwNumber then return end;
	end
	--execute
	if eType == enGuildDonate.eMoney then
		local dwType = _G.ItemSysOperType.Donate
		objSystem:CostPacketMoney(dwNumber, dwType);
	else
		local dwType = _G.ItemSysOperType.Donate
		local dwItemEnum = tabConfig.dwItemEnum
		objSystem:DelEnumItemInPacket(dwItemEnum,dwNumber,false,dwType)
	end
	local dwCount = dwNumber/tabConfig.dwCost
	local dwContribute = math.floor(dwCount*tabConfig.dwContribute)
	local objSystem = self.objPlayer:GetSystem('CPlayerEventCenterSystem')
	objSystem:DoEvent(enumPlayerEventType.EventGuildDonate,dwContribute)
	self:NotifyKernel('DonateMaterial',eType,dwNumber)
end
----------------------------------------------------------------------------------
--搜索玩家
CGuildPlayerMsg.Src.SearchPlayer = true
function CGuildPlayerMsg:SearchPlayer(szName)
	--check
	if not szName then return end
	if szName == '' then return end
	--execute
	local tabPlayerList = CMapManager:GetPlayer();
	local tabList = {}
	for _,v in pairs(tabPlayerList) do
		local tabInfo = v:GetInfo()
		if string.find(tabInfo.szRoleName,szName) and
			v ~= self.objPlayer
		then
			local tabTemp = {}
			tabTemp.dwRoleID = tabInfo.dwRoleID
			tabTemp.szRoleName = tabInfo.szRoleName
			tabTemp.dwClass = tabInfo.dwProf
			tabTemp.dwLevel = tabInfo.dwLevel
			table.insert(tabList,tabTemp)
		end
	end
	self:NotifyClient('OnSearchPlayer',tabList)
end
----------------------------------------------------------------------------------
--发起押镖
CGuildPlayerMsg.Src.StartEscort = true
function CGuildPlayerMsg:StartEscort(dwEscortLevel)
	if _G.WarHostFlag == 1 then
		self:NotifyClient('Notice',1,6001010308)
		return
	end
	local dwPlayerLevel = self.objPlayer:GetLevel()
	self:NotifyKernel('StartEscort',dwEscortLevel,dwPlayerLevel)
end
----------------------------------------------------------------------------------
--参与押镖
CGuildPlayerMsg.Src.JoinEscort = true
function CGuildPlayerMsg:JoinEscort()
	local dwPlayerLevel = self.objPlayer:GetLevel()
	self:NotifyKernel('JoinEscort',dwPlayerLevel)
end
----------------------------------------------------------------------------------
--升级个人世家技能
CGuildPlayerMsg.Src.UpgradePlayerSkill = true
function CGuildPlayerMsg:UpgradePlayerSkill(skillID)
	if self.bUpgradeSkillIng then return end;
	local guildSystem = self.objPlayer:GetSystem('CGuildSystem');
	local guildSkillList = guildSystem:GetGuildSkillList();
	if not guildSkillList then print("--UpgradePlayerSkill--err-1--") return end;
	local skill = _G.GuildSkillConfig[skillID];
	if not skill then print("--UpgradePlayerSkill--err-2--") return end;
	local realSkillList = guildSystem:GetRealSkillList();
	if (realSkillList[skillID] + 1) > guildSkillList[skillID] then print("--UpgradePlayerSkill--err-3--") return end;
	local itemSys = self.objPlayer:GetSystem("CItemSystem");
	if not itemSys:IsPacketMoneyEnough(skill.GetUpGradeCond_Player(realSkillList[skillID] + 1).needMoney) then print("--UpgradePlayerSkill--err-4--") return end;
	self.bUpgradeSkillIng = true;
	self:NotifyKernel("UpgradePlayerSkill", skillID, realSkillList[skillID] + 1);
end;
----------------------------------------------------------------------------------
--消息目标
CGuildPlayerMsg.Des = {}
----------------------------------------------------------------------------------
--刷新公会
CGuildPlayerMsg.Des.OnRefreshGuild = true
function CGuildPlayerMsg:OnRefreshGuild(tabData)
	local objSystem = self.objPlayer:GetSystem('CGuildSystem')
	local tabGuild = objSystem:GetGuildInfo()
	if not tabGuild then return end
	tabData = tabData or {}
	for k,v in pairs(tabData) do
		tabGuild[k] = v
	end
	if tabData.dwLevel then
		objSystem:InitAttribute()
	end
	self:NotifyClient('OnRefreshGuild',tabData)
end
----------------------------------------------------------------------------------
--刷新玩家
CGuildPlayerMsg.Des.OnRefreshPlayer = true
function CGuildPlayerMsg:OnRefreshPlayer(tabData)
	local objSystem = self.objPlayer:GetSystem('CGuildSystem')
	local tabPlayer = objSystem:GetPlayerInfo()
	if not tabPlayer then return end
	tabData = tabData or {}
	for k,v in pairs(tabData) do
		tabPlayer[k] = v
	end
	if tabData.dwRank then
		objSystem:InitTitle()
	end
	self:NotifyClient('OnRefreshPlayer',tabData)
end
----------------------------------------------------------------------------------
--刷新成员
CGuildPlayerMsg.Des.OnRefreshMemberList = true
function CGuildPlayerMsg:OnRefreshMemberList(tabList)
	local objSystem = self.objPlayer:GetSystem('CGuildSystem')
	local tabMemberList = objSystem:GetMemberList()
	if not tabMemberList then return end
	tabList = tabList or {}
	for _,v in ipairs(tabList or {}) do
		tabMemberList[v[1]] = v[2]
	end
	self:NotifyClient('OnRefreshMemberList',tabList)
end
----------------------------------------------------------------------------------
--刷新龙鼎
CGuildPlayerMsg.Des.OnRefreshTrophyList = true
function CGuildPlayerMsg:OnRefreshTrophyList(tabList)
	local objSystem = self.objPlayer:GetSystem('CGuildSystem')
	local tabTrophyList = objSystem:GetTrophyList()
	if not tabTrophyList then return end
	tabList = tabList or {}
	for _,v in ipairs(tabList or {}) do
		tabTrophyList[v[1]] = v[2]
	end
	objSystem:InitAttribute()
	self:NotifyClient('OnRefreshTrophyList',tabList)
end
----------------------------------------------------------------------------------
--刷新榜单
CGuildPlayerMsg.Des.OnRefreshChartList = true
function CGuildPlayerMsg:OnRefreshChartList(tabList)
	local objSystem = self.objPlayer:GetSystem('CGuildSystem')
	local tabChartList = objSystem:GetChartList()
	if not tabChartList then return end
	tabList = tabList or {}
	for _,v in ipairs(tabList) do
		tabChartList[v[1]] = v[2]
	end
	objSystem:InitAttribute()
	self:NotifyClient('OnRefreshChartList',tabList)
end
----------------------------------------------------------------------------------
--初始化成员
CGuildPlayerMsg.Des.OnInitPlayer = true
function CGuildPlayerMsg:OnInitPlayer(
	tabGuild,tabPlayer,tabMemberList,tabTrophyList,tabChartList,tabSkillList
)
	local objSystem = self.objPlayer:GetSystem('CGuildSystem')
	objSystem:SetGuildInfo(tabGuild)
	objSystem:SetPlayerInfo(tabPlayer)
	objSystem:SetMemberList(tabMemberList)
	objSystem:SetTrophyList(tabTrophyList)
	objSystem:SetChartList(tabChartList)
	objSystem:SetGuildSkillList(tabSkillList)
	objSystem:InitPlayer()
	objSystem:UpdateLevel()
	objSystem:UpdatePower()
	self:NotifyClient(
		'OnInitPlayer',tabGuild,tabPlayer,
		tabMemberList,tabTrophyList,tabChartList
	)
end
----------------------------------------------------------------------------------
--加入公会
CGuildPlayerMsg.Des.OnJoinGuild = true
function CGuildPlayerMsg:OnJoinGuild()
	local objSystem = self.objPlayer:GetSystem("CPlayerEventCenterSystem")
	objSystem:DoEvent(enumPlayerEventType.EventJoinGuild)

    CLogSystemManager:guild(self.objPlayer:GetRoleID(),
            self.objPlayer:GetSystem('CGuildSystem'):GetGuildID(),
            self.objPlayer:GetSystem('CGuildSystem'):GetGuildName(),
            2,
            {});
end
----------------------------------------------------------------------------------
--退出公会
CGuildPlayerMsg.Des.OnQuitGuild = true
function CGuildPlayerMsg:OnQuitGuild()
	local objSystem = self.objPlayer:GetSystem("CPlayerEventCenterSystem")
	objSystem:DoEvent(enumPlayerEventType.EventQuitGuild)
end
----------------------------------------------------------------------------------
--建立公会
CGuildPlayerMsg.Des.OnBuildGuild = true
function CGuildPlayerMsg:OnBuildGuild(dwRecord)
	--check
	local dwLevel = self.objPlayer:GetInfo().dwLevel
	if dwLevel < GuildBuildConfig.dwLevel then
		self:NotifyClient('Notice',1,6001010013)
		self:NotifyKernel('CancelRecord',dwRecord)
		return
	end

	local itemSys = self.objPlayer:GetSystem('CItemSystem');
	
	if not itemSys:IsPacketMoneyEnough(GuildBuildConfig.dwMoney) then
		self:NotifyClient('Notice',1,6001010014)
		CGuildServerMsg:NotifyKernel('CancelRecord',dwRecord)
		return
	end
	--execute
	local dwType = _G.ItemSysOperType.CreateGuild
	itemSys:CostPacketMoney(GuildBuildConfig.dwMoney, dwType);
	
	self:NotifyClient('OnBuildGuild')
	CGuildServerMsg:NotifyKernel('ConfirmRecord',dwRecord)
	
	local objSystem = self.objPlayer:GetSystem('CGuildSystem')
	objSystem:UpdatePower()
end
----------------------------------------------------------------------------------
--布告公会
CGuildPlayerMsg.Des.OnDeclareGuild = true
function CGuildPlayerMsg:OnDeclareGuild(...)
	--check
	local objSystem = self.objPlayer:GetSystem('CGuildSystem')
	local dwLevel = self.objPlayer:GetInfo().dwLevel
	if dwLevel <= BroadCastConfig.Guild then return end
	--execute
	self:NotifyClient('OnDeclareGuild',...)
end
----------------------------------------------------------------------------------
--领取福利
CGuildPlayerMsg.Des.OnReceiveWelfare = true
function CGuildPlayerMsg:OnReceiveWelfare()
	--check
	local objSystem = self.objPlayer:GetSystem('CGuildSystem')
	local tabGuild = objSystem:GetGuildInfo()
	local tabPlayer = objSystem:GetPlayerInfo()
	if not tabGuild then return end
	if not tabPlayer then return end
	--execute
	local dwGuildLevel = tabGuild.dwLevel
	local dwPlayerLevel = self.objPlayer:GetInfo().dwLevel
	local dwPlayerRank = tabPlayer.dwRank
	local dwExp = GuildWelfareConfig.Experience(
		dwGuildLevel,dwPlayerLevel,dwPlayerRank
	)
	self.objPlayer:AddExp(math.floor(dwExp))
	local dwElement = GuildWelfareConfig.Element(
		dwGuildLevel,dwPlayerLevel,dwPlayerRank
	)
	local objSystem = self.objPlayer:GetSystem('CFiveElemSystem')
	objSystem:ChangeAttrAllIgnore(math.floor(dwElement), _G.FiveElemSysOperType.OnReceiveWelfare)
	
	local objSystem = self.objPlayer:GetSystem('CPlayerEventCenterSystem')
	objSystem:DoEvent(enumPlayerEventType.EventRequestGuildSign)
end
----------------------------------------------------------------------------------
--购买物品
CGuildPlayerMsg.Des.OnBuyItem = true
function CGuildPlayerMsg:OnBuyItem(dwItemEnum,dwRecord)
	--check
	local dwItemBind = false
	for k,v in pairs(GuildShopConfig) do
		if v.dwItemEnum == dwItemEnum then
			dwItemBind = v.dwItemBind
		end
	end
	local tabItem = {}
	tabItem.dwItemEnum = dwItemEnum
	tabItem.dwBindType = dwItemBind
	tabItem.dwItemNumber = 1
	local objSystem = self.objPlayer:GetSystem('CItemSystem')
	local dwType = _G.ItemSysOperType.BuyNpc
	if not objSystem:AddEnumItemListToPacket({ tabItem }, dwType) then
		CGuildServerMsg:NotifyKernel('CancelRecord',dwRecord)
		return
	end
	--execute
	CGuildServerMsg:NotifyKernel('ConfirmRecord',dwRecord)
	self:NotifyClient('OnBuyItem',dwItemEnum)
	
	local objSystem = self.objPlayer:GetSystem('CPlayerEventCenterSystem')
	objSystem:DoEvent(enumPlayerEventType.EventRequestGuildItem)
end
----------------------------------------------------------------------------------
--开始押镖
CGuildPlayerMsg.Des.OnStartEscort = true
function CGuildPlayerMsg:OnStartEscort(...)
	local objSystem = self.objPlayer:GetSystem('CPlayerEventCenterSystem')
	objSystem:DoEvent(enumPlayerEventType.EventGuildEscort)
	self:NotifyClient('OnStartEscort',...)
end
----------------------------------------------------------------------------------
--参与押镖
CGuildPlayerMsg.Des.OnJoinEscort = true
function CGuildPlayerMsg:OnJoinEscort(...)
	local objSystem = self.objPlayer:GetSystem('CPlayerEventCenterSystem')
	objSystem:DoEvent(enumPlayerEventType.EventGuildEscort)
	self:NotifyClient('OnJoinEscort',...)
end
----------------------------------------------------------------------------------
--押镖奖励
CGuildPlayerMsg.Des.OnEscortReward = true
function CGuildPlayerMsg:OnEscortReward(dwRecord,dwLevel)
	--check
	local sysGuild = self.objPlayer:GetSystem("CGuildSystem")
	local dwGuildID = sysGuild:GetGuildID()
	local tabCfg = GuildEscortConfig.Car[dwLevel].Reward
	local tabItemList = {}
	for k,v in pairs(tabCfg.Item) do
		local t = {}
		t.dwItemEnum = v.dwItemId
		t.dwItemNumber = v.dwNum
		t.dwBindType = v.dwBind
		table.insert(tabItemList,t)
	end
	local sysItem = self.objPlayer:GetSystem("CItemSystem")
	if not sysItem:IsEnumItemListCanAddToPacket(tabItemList) then
		CGuildServerMsg:NotifyKernel('CancelRecord',dwRecord)
		return
	end
	--exexute
	self.objPlayer:AddExp(tabCfg.dwExp)
	if tabCfg.dwMoney and tabCfg.dwMoney ~= 0 then
		local dwType = ItemSysOperType.EscortReward
		sysItem:AddPacketMoney(tabCfg.dwMoney, dwType)
	end;
	if tabCfg.dwBindGold and tabCfg.dwBindGold ~= 0 then
		sysItem:AddBindGold(tabCfg.dwBindGold, ItemSysOperType.EscortReward)
	end;
	local dwType = ItemSysOperType.EscortReward
	sysItem:AddEnumItemListToPacket(tabItemList, dwType)
	local sysElem = self.objPlayer:GetSystem("CFiveElemSystem")
	sysElem:ChangeAttrAll(tabCfg.dwPneuma, _G.FiveElemSysOperType.GuildPlayer)
	self:NotifyClient('OnEscortReward')
	if( tabCfg.dwContribute and tabCfg.dwContribute > 0) then
		local objSystem = self.objPlayer:GetSystem('CPlayerEventCenterSystem')
		objSystem:DoEvent(enumPlayerEventType.EventGuildDonate,tabCfg.dwContribute)
	end
	CGuildServerMsg:NotifyKernel('ConfirmRecord',dwRecord)
end
----------------------------------------------------------------------------------
CGuildPlayerMsg.Des.OnInitEmperor = true
function CGuildPlayerMsg:OnInitEmperor()
	local objSystem = self.objPlayer:GetSystem("CBuffSystem")
	objSystem:AddBuff(9634,1)
end
----------------------------------------------------------------------------------
CGuildPlayerMsg.Des.OnGainEmperor = true
function CGuildPlayerMsg:OnGainEmperor()
	local objSystem = self.objPlayer:GetSystem("CBuffSystem")
	objSystem:AddBuff(9634,1)
end
----------------------------------------------------------------------------------
CGuildPlayerMsg.Des.OnLostEmperor = true
function CGuildPlayerMsg:OnLostEmperor()
	local objSystem = self.objPlayer:GetSystem("CBuffSystem")
	objSystem:DeleteBuffByID(9634)
end
----------------------------------------------------------------------------------
--公会技能升级
CGuildPlayerMsg.Des.OnUpgradeGuildSkill = true
function CGuildPlayerMsg:OnUpgradeGuildSkill(guildSkillList)
	local objSystem = self.objPlayer:GetSystem('CGuildSystem')
	objSystem:SetGuildSkillList(guildSkillList)
end;
----------------------------------------------------------------------------------
CGuildPlayerMsg.Des.OnUpgradePlayerSkill = true
function CGuildPlayerMsg:OnUpgradePlayerSkill(skillID, bSuc)
	self.bUpgradeSkillIng = false;
	if not bSuc then return end;
	local skill = _G.GuildSkillConfig[skillID];
	if not skill then _info("--OnUpgradePlayerSkill--err-1--") return end;
	local guildSystem = self.objPlayer:GetSystem("CGuildSystem");
	local realSkillList = guildSystem:GetRealSkillList();
	--cost money
	local itemSys = self.objPlayer:GetSystem("CItemSystem");
	if not itemSys:CostPacketMoney(skill.GetUpGradeCond_Player(realSkillList[skillID] + 1).needMoney, _G.ItemSysOperType.GuildSkill) then _info("--OnUpgradePlayerSkill--err-2--") return end;
	--upgrade
	realSkillList[skillID] = realSkillList[skillID] + 1;
	guildSystem:SetRealSkillList(realSkillList);
	--db
	local str = "";
	for k, v in pairs(realSkillList) do
		if v > 0 then
			str = str .. k .. "," .. v ..";";
		end;
	end;
	local SqlCmd = self.objPlayer:GetDBQuery():CreateUpdateCmd("T_Role_GuildSkill");
    SqlCmd.Fields.dwRoleID  = self.objPlayer:GetRoleID();
    SqlCmd.Fields.szSkill	= str;
    SqlCmd:execute();
end
-- CGuildPlayerMsg.Des.OnUpdateLeaderOffTime = true
-- function CGuildPlayerMsg:OnUpdateLeaderOffTime(dwValue)
	-- self:NotifyClient('OnUpdateLeaderOffTime',dwValue)
-- end;

CGuildPlayerMsg.Src.TryKickGuildLeader = true
function CGuildPlayerMsg:TryKickGuildLeader()
	-- print("===TryKickGuildLeader===")
	local sysItem = self.objPlayer:GetSystem("CItemSystem");
	local sysGuild = self.objPlayer:GetSystem("CGuildSystem");
	
	local tabGuild = sysGuild:GetGuildInfo()
	if not tabGuild then
		-- print("===TryKickGuildLeader -1===")
		return;
	end
	
	--rank
	if sysGuild.tabPlayer.dwRank > GuildKickLeaderConfig.dwRankLimit then
		-- print("===TryKickGuildLeader -2===")
		return;
	end
	
	--item
	local dwCount = sysItem:GetEnumItemNumInPacket(GuildKickLeaderConfig.dwEnumCost);
	if dwCount < GuildKickLeaderConfig.dwNumber then
		-- print("===TryKickGuildLeader -3===")
		return;
	end
	
	--锁定
	
	--弹劾
	self:NotifyKernel("KickGuildLeader",tabGuild.dwGuildID,self.objPlayer:GetRoleID());
end;

CGuildPlayerMsg.Des.KickGuildLeaderResult = true
function CGuildPlayerMsg:KickGuildLeaderResult(isSucc)
	-- print("===KickGuildLeaderResult===")
	if not isSucc then
		return;
	end
	
	local sysItem = self.objPlayer:GetSystem("CItemSystem");
	
	sysItem:DelEnumItemInPacket(GuildKickLeaderConfig.dwEnumCost,GuildKickLeaderConfig.dwNumber,false,ItemSysOperType.GuildKickLeader);
end;