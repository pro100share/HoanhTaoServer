--[[
功能：排行榜系统类（服务器）
版本：v1.0
作者：郭肇义
时间：2012-04-05
]]
_G.CChartSystem = {};

function CChartSystem:new()
	local obj = CSystem:new("CChartSystem");
	
	for index, value in pairs(CChartSystem) do
		if type(value) == "function" then
			obj[index] = value;
		end;
	end;
	return obj;
end;
-----------------------------------------------------------------------------------------
function CChartSystem:Create()
	return true
end;
function CChartSystem:Update(dwInterval)
	self.bBoradCast = nil
	self:NotifyChartData()
	return true
end;
function CChartSystem:Destroy()
end;
function CChartSystem:OnEnterScene()
	self:UpdateChartData()
end;
-----------------------------------------------------------------------------------------
--接口
-----------------------------------------------------------------------------------------
--发送排行榜列表
function CChartSystem:SentChartList(eType,dwBegin,dwEnd)
	local tabSub = CChartManager:GetChartInfo(eType)
	local dwLength = #tabSub
	if dwBegin == 0 then dwBegin = 1 end
	if dwEnd == 0 then dwEnd = dwLength end
	local tabChart = {}
	for i = dwBegin,dwEnd do
		local tabData = tabSub[i]
		if tabData then table.insert(tabChart,tabData) end
	end
	tabChart = ChartParseList(tabChart,ChartListMsgStN)
	self:GetPlayer().OnGetChartListMsg {
		Type = eType,Length = dwLength,Chart = tabChart
	}
end
--发送排行榜人物
function CChartSystem:SentChartRole(dwRoleID)
	local tabChart = CChartManager:GetChartRole(dwRoleID)
	tabChart = ChartParseList(tabChart,ChartRoleMsgStN)
	self:GetPlayer().OnGetChartRoleMsg {
		RoleID = dwRoleID, Chart = tabChart
	}
end
--发送排行榜头像
function CChartSystem:SentChartHead(eType)
	local tabChart = CChartManager:GetChartHead(eType)
	tabChart = ChartParseList(tabChart,ChartHeadMsgStN)
	self:GetPlayer().OnGetChartHeadMsg {
		Type = eType, Chart = tabChart
	}
end
--发送名人堂排行榜头像
function CChartSystem:SentStarRankingHead(Page)
	local dwMax = Page * 6
	local dwMin = (Page-1) * 6 +1
	local tabStar = {}
	for eType = dwMin, dwMax do
		local dwType = enStarRankingType[eType]
		local tabChart = CChartManager:GetChartHead(dwType)
		if tabChart and tabChart[1] then
			tabChart[1].dwType = eType
			table.insert(tabStar,tabChart[1]);
		end
	end
	tabStar = ChartParseList(tabStar,ChartStarMsgStN)
	self:GetPlayer().OnGetStarRankingMsg {
		Page = Page, Chart = tabStar
	}
end

--发送装备信息
function CChartSystem:SentEquipInfo(dwResID)
	local sysItem = self:GetPlayer():GetSystem("CItemSystem")
	local tabEquipMsg = sysItem:GetEquipsNetData()
	local tabStoneMsg = sysItem:GetStoneNetData()
	local tabAvatarMsg = SPlayerAvatarViewMsg:new()
	tabAvatarMsg.dwLevel = 0
	tabAvatarMsg.szRoleName = ''
	tabAvatarMsg.setModelList = {};
	local tabPlayerInfo = self:GetPlayer():GetInfo()
	tabPlayerInfo.setModelList = self:GetPlayer().setModelList;
	for k,v in pairs(tabAvatarMsg) do
		tabAvatarMsg[k] = tabPlayerInfo[k]
	end
	tabAvatarMsg.dwHorseID = 0
	tabAvatarMsg.setSuitPfx = self:GetPlayer():GetInfo().setActSuitList
	local sysSkill = self:GetPlayer():GetSystem('CSkillSystem')
	tabAvatarMsg.dwPower = G_GetScoreInfoAll(sysSkill:CountBattleScoreInfo())
	local dwRoleID = self:GetPlayer():GetRoleID()
	GSRemoteCall(
		dwResID,"CChartSystem","OnSentEquipInfo",
		{ dwRoleID,tabEquipMsg,tabAvatarMsg,tabStoneMsg }
	)
end
function CChartSystem:OnSentEquipInfo(dwTarID,tabEquipMsg,tabAvatarMsg,tabStoneMsg)
	local objPlayer = self:GetPlayer();
	--print("===OnGetChartEquipInfoMsg 1===")
	objPlayer.OnGetChartEquipInfoMsg{
		RoleID = dwTarID,
		EquipInfoMsg = tabEquipMsg,
		AvatarInfoMsg = tabAvatarMsg,
	}
	--print("===OnGetChartEquipInfoMsg 2===")
	objPlayer.OnGetChartStoneInfoMsg
	{
		RoleID = dwTarID,
		StoneInfoMsg = tabStoneMsg,
	}
end
--发送坐骑信息
function CChartSystem:SentMountInfo(dwResID)
	local objPlayer = self:GetPlayer()
	local sysMount = objPlayer:GetSystem('CMountSystem')
	local objMount = sysMount:GetMountInst(1)
	local tabMountMsg = nil
	if objMount then
		tabMountMsg = objMount:GetNetData()
		tabMountMsg[10] = {};
		local sysItem = objPlayer:GetSystem('CItemSystem')
		for dwSlot, dwEquipID in pairs(objMount.t_Equip) do
			local objItem = sysItem:GetItem(dwEquipID)
			if objItem then
				local tabItemMsg = objItem:GetNetData();
				tabMountMsg[10][dwSlot] = tabItemMsg
			end
		end
	end
	local dwRoleID = self:GetPlayer():GetRoleID()
	GSRemoteCall(
		dwResID,"CChartSystem","OnSentMountInfo",
		{ dwRoleID,tabMountMsg }
	)
end
function CChartSystem:OnSentMountInfo(dwTarID,tabMountMsg)
	self:GetPlayer().OnGetChartMountInfoMsg{
		RoleID = dwTarID,MountInfoMsg = tabMountMsg
	}
end
--更新排行榜数据
function CChartSystem:UpdateChartData()
	local dwRoleID = self:GetPlayer():GetRoleID()
	local tabRole = CChartManager:GetChartRole(dwRoleID)
	local sysTitle = self:GetPlayer():GetSystem('CTitleSystem')
	local sysEvent = self:GetPlayer():GetSystem('CPlayerEventCenterSystem')
	for _,eType in pairs(ChartSwitch) do
		local tabChart = tabRole[eType]
		local tabConfig = ChartTitleCfg[eType]
		if not tabChart then
			sysTitle:DelTitle(tabConfig.dwTitleID)
		else
			if tabChart.dwNumber <= tabConfig.dwNumber then
				sysTitle:AddTitle(tabConfig.dwTitleID)
			else
				sysTitle:DelTitle(tabConfig.dwTitleID)
			end
			sysEvent:DoEvent("EventChartUpdate",eType,tabChart.dwNumber)
		end
	end
	self:GetPlayer():GetSystem("CChartAwardSystem"):SendReceivedsMsg();
end
--发送排行榜数据
function CChartSystem:NotifyChartData()
	local BattleScore =self:GetPlayer():GetSystem('CBattleScoreUpSystem') 
	local tabTemp = {}
	tabTemp[enChartType.eLevel] = self:GetPlayer():GetInfo().dwExp
	local sysItem = self:GetPlayer():GetSystem('CItemSystem')
	tabTemp[enChartType.eWeath] = sysItem:GetAllMoney()
	local sysPulse = self:GetPlayer():GetSystem('CPulseSystem')
	tabTemp[enChartType.ePulse] = sysPulse:GetPulseTotalNum()
	local sysPulse = self:GetPlayer():GetSystem('CFiveElemSystem')
	tabTemp[enChartType.eElement] = sysPulse:ForTaskNeedGetLv()
	-- local sysAmulet = self:GetPlayer():GetSystem('CAmuletSystem')
	--战斗力调整 改变宝甲战斗力计算方式
	tabTemp[enChartType.eAmulet] = BattleScore.tScoreMap[7] 
	-- local sysSword = self:GetPlayer():GetSystem('CSwordSystem')
	-- local sysSwordFoundry = self:GetPlayer():GetSystem('CSwordFoundrySystem')
	tabTemp[enChartType.eSword] = BattleScore.tScoreMap[8]
	-- local sysBourn = self:GetPlayer():GetSystem('CBournSystem')
	--战斗力调整 改变实战战斗力计算方式
	tabTemp[enChartType.eBourn] = BattleScore.tScoreMap[12]
	-- local sysMount = self:GetPlayer():GetSystem('CMountSystem')
	--战斗力调整 改变坐骑战斗力计算方式
	tabTemp[enChartType.eMount] = BattleScore.tScoreMap[6]
	local sysAchievement = self:GetPlayer():GetSystem('CAchievementSystem')
	tabTemp[enChartType.eAchievement] = sysAchievement:GetAchievementAllPoint()
	local sysSkill = self:GetPlayer():GetSystem('CSkillSystem')
	tabTemp[enChartType.eCombo] = sysSkill:GetInfo().dwCaromCount
	tabTemp[enChartType.ePower] = G_GetScoreInfoAll(sysSkill:CountBattleScoreInfo())
	local sysData = self:GetPlayer():GetSystem('CDataCenterSystem')
	tabTemp[enChartType.eBoss] = sysData:GetData('dwKillBoss')
	tabTemp[enChartType.eKiller] = sysData:GetData('dwKillPlayer')
	
	local tabRole = {}
    tabRole.dwAccountID = self:GetPlayer():GetInfo().dwAccountID
	tabRole.dwRoleID = self:GetPlayer():GetInfo().dwRoleID
	tabRole.szRoleName = self:GetPlayer():GetInfo().szRoleName
	local tabData = {}
	for _,eType in pairs(ChartSwitch) do
		tabData[eType] = math.floor(tabTemp[eType])
	end
	CKernelApp.KSUpdateChartDataMsg{ Role = tabRole, Data = tabData }
end
-----------------------------------------------------------------------------------------
--回调
-----------------------------------------------------------------------------------------
function CChartSystem:EventBeKilled(dwTimes,dwEnemyID,dwType)
	if self.bBoradCast then return end
	if dwType ~= 1 then return end
	local tabInfo = {}
	local tabResInfo = self:GetPlayer():GetInfo()
	tabInfo.szResName = tabResInfo.szRoleName
	local tabTarInfo = self:GetPlayer():GetOtherPlayer(dwEnemyID,3):GetInfo()
	tabInfo.szTarName = tabTarInfo.szRoleName
	local nMapID, _, _, dwMapID = self:GetPlayer():GetSystem("CMapSystem"):GetPlayerMapPos();
	dwMapID = dwMapID or nMapID;
    if not MapInfoConfig[dwMapID] then
		tabInfo.szMapName = "";
	else
		tabInfo.szMapName = MapInfoConfig[dwMapID].szName
	end
	local dwRoleID = tabResInfo.dwRoleID
	local tabSub = CChartManager:GetChartRole(dwRoleID)
	for eType,tabData in pairs(tabSub or {}) do
		if tabData.dwNumber < 10 then
			local szText = self:ParseDeadNotice(tabInfo,eType)
			CChartManager:BoradCast(szText)
		end
	end
	self.bBoradCast = true
end
-----------------------------------------------------------------------------------------
--私有
-----------------------------------------------------------------------------------------
--解析击杀信息
function CChartSystem:ParseDeadNotice(tabInfo,eType)
	local szText = ChartKillNoticeCfg[eType].szInfo
	if not szText then return end
	local tabFlag = {
		A = 'szResName',
		B = 'szTarName',
		C = 'szMapName',
	}
	while(string.find(szText,'@')) do
		local dwIndex = string.find(szText,'@')
		local szFlag = string.sub(szText,dwIndex+1,dwIndex+1)
		local szReplace = tabInfo[tabFlag[szFlag]] or ''
		szText = string.gsub(szText,'@'..szFlag,szReplace)
	end
	return szText
end
