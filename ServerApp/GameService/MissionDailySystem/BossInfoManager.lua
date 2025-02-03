--------------------------------
--[[
 服务器 每日活动BOSS信息管理器
 段磊磊
 2012-4-14
--]]
--------------------------------
_G.CBossInfoManager = CSingle:new();
--插入单体管理器
CSingleManager:AddSingle(CBossInfoManager);
CSingleManager:RegistCSSingle(CBossInfoManager);
--------------------------------
--------------------------------
--初始化
function CBossInfoManager:Create() 
	self.setBossList = {};		--BOSS列表
	for k,v in ipairs (MissionDailyConfig.BossInfoConfig) do
	--	local index = v.dwMonsterID
	--	print('index =',index)
		self.setBossList[k] = {}
		self.setBossList[k].dwMonsterID = v.dwMonsterID
		self.setBossList[k].dwRoleID = 0 --0为怪物没被杀，-1为杀手不在线
		self.setBossList[k].szRoleName = '无'
		self.setBossList[k].szFlushTime = CMonsterFun:GetNextBornTime(v.dwMonsterID)
	end
	self.setBossKiller = {}
	self.setPlayerList = {}
	
	return true;
end
--更新 
function CBossInfoManager:Update()
	return true
end
--销毁
function CBossInfoManager:Destroy()
	return true
end
function CBossInfoManager:AddPlayer(dwRoleID,objSys,dwLineNum)
	self.setPlayerList[dwRoleID] = objSys
	local f = false
	for k,v in pairs (self.setBossKiller) do
		if dwRoleID == v then
			f = true
			self.setBossList[k].dwRoleID = dwRoleID
		end
	end
	if f == true then 
		self:UpdateBossInfoToLineClient(self.setPlayerList)
	end
end
function CBossInfoManager:DelPlayer(dwRoleID,objSys,dwLineNum)
	if dwLineNum == 0 then
		return
	end
--	print('dwLineNum =',dwLineNum)
	self.setPlayerList[dwRoleID] = nil
	local f = false
	for k,v in pairs (self.setBossKiller) do
		if dwRoleID == v then
			f = true
			self.setBossList[k].dwRoleID = -1
		end
	end
	if f == true then
		self:UpdateBossInfoToLineClient(self.setPlayerList)
	end
end
function CBossInfoManager:ChangeLine(dwRoleID,objSys,dwOldLine,dwNewLine)
	CBossInfoManager:DelPlayer(dwRoleID,objSys,dwOldLine)
	CBossInfoManager:AddPlayer(dwRoleID,objSys,dwNewLine)
end
function CBossInfoManager:BossDead(dwBossID,dwRoleID,objPlayer)
	local dwIndexBossID = -1
	for k,v in ipairs (MissionDailyConfig.BossInfoConfig) do
		if v.dwMonsterID == dwBossID then
			dwIndexBossID = k
			break
		end
	end
	local objPlayer = objPlayer--CGameLineManager:GetPlayer(dwRoleID)
	local szRoleName = objPlayer:GetInfo().szRoleName
	if not self.setBossList[dwIndexBossID] then
		return
	end
	self.setBossList[dwIndexBossID].dwRoleID = dwRoleID
	self.setBossList[dwIndexBossID].szRoleName = szRoleName
	self.setBossList[dwIndexBossID].szFlushTime = CMonsterFun:GetNextBornTime(dwBossID)
	if szRoleName == nil then
		self.setBossList[dwIndexBossID].szRoleName = '无名氏'
	end
	self:UpdateBossInfoToLineClient(self.setPlayerList)
	self.setBossKiller[dwIndexBossID] = dwRoleID
end
function CBossInfoManager:BossFlush(dwBossID)
	local dwIndexBossID = -1
	for k,v in ipairs (MissionDailyConfig.BossInfoConfig) do
		if v.dwMonsterID == dwBossID then
			dwIndexBossID = k
			break
		end
	end
	if not self.setBossList[dwIndexBossID] then
		return
	end
	self.setBossList[dwIndexBossID].szFlushTime = CMonsterFun:GetNextBornTime(dwBossID)
	self.setBossList[dwIndexBossID].szRoleName = '无'
	self.setBossList[dwIndexBossID].dwRoleID = 0
	self:UpdateBossInfoToLineClient(self.setPlayerList)
end
function CBossInfoManager:UpdateBossInfoToLineClient(setPlayerList)
	for k,v in pairs (setPlayerList) do
		local objPlayer = setPlayerList[k]:GetPlayer();
		if not objPlayer then
			return false;
		end;
		setPlayerList[k]:UpdateBossInfoToClient(objPlayer)
	end
end








