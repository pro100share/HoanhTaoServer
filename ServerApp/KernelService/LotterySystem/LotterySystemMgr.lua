--[[
功能：全局抽奖管理器
类型：继承于CSingle类，用来管理玩家抽奖定时开奖
版本：
	v1.0	2013-9-10 create by lzc
]]

--开奖信息的存储类型
local DrawStorageType = {last = 1, current = 2}

--产生n个不相同的随机数
local function CreateSomeRandomNum(dwCount, minNum, maxNum)
	local retTab = {}	
	
	while #retTab < dwCount do
		local tempNum = 0
		local isExist = true
	
		while isExist do
			tempNum = math.random(minNum, maxNum)
			isExist = false
			for i = 1, #retTab do
				if tempNum == retTab[i] then
					isExist = true
					break
				end
			end
		end
		table.insert(retTab, tempNum)
	end
	
	return retTab
end

_G.CLotterySystemMgr = CSingle:new();
CSingleManager:AddSingle(CLotterySystemMgr);

--存储所有标签的信息
CLotterySystemMgr.setTikcetList = {};
--标签锁
CLotterySystemMgr.setTicketLock = {};

--剩余的标签数
CLotterySystemMgr.remainTickets =  LotteryConfig.TicketAllCount;

--存储上次开奖的信息
CLotterySystemMgr.setLastDrawInfo = {};
--存储本次开奖的信息
CLotterySystemMgr.setCurDrawInfo = {};
--create
function CLotterySystemMgr:Create()
	local isHeFu = self:ReadTicketsInfoDB();
	self:ReadLastDrawInfoDB();
	self:ReadCurDrawInfoDB();
	
	--如果是合服 就立即开奖一次
	if isHeFu then
		self:Draw();
	end
	
	for k,szTime in pairs(LotteryConfig.DrawingTime) do
		CAlarmClock:AddTask({dwTime = szTime}, CAlarmTaskCycleType.eDay, 1, 0,
		function()
			self:CheckDrawTime(szTime)
		end,{})
	end
	
	return true;
end;

--update
function CLotterySystemMgr:Update(dwInterval)
	return true
end

function CLotterySystemMgr:Destroy()
end

--定点开奖 检查
function CLotterySystemMgr:CheckDrawTime(dwCheckTime)
	--如果没有上次开奖的信息 就直接开奖
	if  self.setLastDrawInfo[1].dwDrawTime == 0 then
		self:Draw();
	else
		local lastDrawTime = self.setLastDrawInfo[1].dwDrawTime
		local _, _, s_Hour, s_Minute = string.find(dwCheckTime, "(%d*):(%d*)");
		local hour = tonumber(s_Hour);
		local minute = tonumber(s_Minute);
		
		local checkTime = CTimeFormat:GetTodayThisTimeMsec(hour, minute)
		local intervalTime = checkTime - lastDrawTime
		
		if intervalTime < 0 then
			return
		end
		
		-- 如果开奖时间小于最小间隔 本次不开奖
		if intervalTime < LotteryConfig.MinDrawInterval then 
			-- print("KS LotterySystem --------- the interval is too close ,not Draw")
			return
		end
		self:Draw()
	end
end


--从数据库读取所有标签的信息 （返回是否合服）
function CLotterySystemMgr:ReadTicketsInfoDB()
	local dbres = CPlayerDBQuery:GetDBQuery():execute_sync('select * from "T_Role_LotteryTicket_Info"');
	
	--如果是第一次开服 需要插入数据库
	if not dbres then
		-- print("CLotterySystemMgr ---------- The first time run KS ,so insert the DB of tickets!")
		local szSql = [[insert into "T_Role_LotteryTicket_Info" values($1,$2,$3,$4,$5);]];
		for dwTicketIndex = 1, LotteryConfig.TicketAllCount do
			local initTicketTab = {dwIndex = dwTicketIndex, dwRoleID = {0,}, dwSelectedCount = 0, dwDrawCount = 0, dwServerHostID = _G.dwServerHostID};
			self.setTikcetList[dwTicketIndex] = initTicketTab;
			self.setTicketLock[dwTicketIndex] = 0;
			CPlayerDBQuery:GetDBQuery():execute(szSql, dwTicketIndex, 0, 0, 0, _G.dwServerHostID);
		end
		return false
	end
	
	--是否进行了合服操作
	local isHeFu = false
	
	for k,tb in pairs(dbres) do
		if not self.setTikcetList[tb.dwIndex] then
			local tbInfo = {};
			tbInfo.dwIndex = tb.dwIndex;
			tbInfo.dwRoleID = {};
			table.insert(tbInfo.dwRoleID,tb.dwRoleID);
			tbInfo.dwSelectedCount = tb.dwSelectedCount;
			tbInfo.dwDrawCount = tb.dwDrawCount;
			
			self.setTikcetList[tbInfo.dwIndex] = tbInfo;
			self.setTicketLock[tbInfo.dwIndex] = 0;
		else
			isHeFu = true
			table.insert(self.setTikcetList[tb.dwIndex].dwRoleID,tb.dwRoleID);
			self.setTikcetList[tb.dwIndex].dwSelectedCount = self.setTikcetList[tb.dwIndex].dwSelectedCount + tb.dwSelectedCount;
			self.setTikcetList[tb.dwIndex].dwDrawCount = self.setTikcetList[tb.dwIndex].dwDrawCount + tb.dwDrawCount;
			CPlayerDBQuery:GetDBQuery():execute('delete from "T_Role_LotteryTicket_Info" where "dwIndex" = $1 and "dwServerHostID" <> $2', tb.dwIndex, _G.dwServerHostID);
		end
	end
	
	for ticketIndex, ticketTab in pairs(self.setTikcetList) do
		for k, roleId in pairs(self.setTikcetList[ticketIndex].dwRoleID) do
			if roleId ~= 0 then
				self.remainTickets = self.remainTickets - 1
				break
			end
		end
	end
	
	return isHeFu;
end

function CLotterySystemMgr:ReadLastDrawInfoDB()
	--local objDB = CPlayerDBQuery:GetDBQuery();
	local dbres = CPlayerDBQuery:GetDBQuery():execute_sync('select * from "T_Lottery_Info" where "dwStorageType" = $1', 1);
	
	--如果是第一次开服 需要插入数据库
	if not dbres then
		-- print("CLotterySystemMgr ---------- The first time run KS ,so insert the DB of LastDraw!")
		local szSql = [[insert into "T_Lottery_Info" values($1,$2,$3,$4,$5,$6,$7,$8,$9);]];
		for dwRewardType = 1, LotteryConfig.TicketDrawCount do
			local initDrawTab = {dwStorageType = 1, dwDrawCount = 0, dwRewardType = dwRewardType, dwRewardIndex = 0, dwDrawTicket = 0,  dwDrawTime = 0,  szRoleName = {"",}, dwRoleID = {0,}, dwServerHostID = _G.dwServerHostID,};				 
			self.setLastDrawInfo[dwRewardType] = initDrawTab;
			CPlayerDBQuery:GetDBQuery():execute(szSql, 1, 0, dwRewardType, 0, 0, 0, "", 0, _G.dwServerHostID);
		end
		return
	end
	
	for k,tb in pairs(dbres)do
		if not self.setLastDrawInfo[tb.dwRewardType] then
			local tbInfo = {};
			tbInfo.dwStorageType = tb.dwStorageType;
			tbInfo.dwDrawCount = tb.dwDrawCount;
			tbInfo.dwRewardType = tb.dwRewardType;
			tbInfo.dwRewardIndex = tb.dwRewardIndex;
			tbInfo.dwDrawTicket = tb.dwDrawTicket;
			tbInfo.dwDrawTime = tb.dwDrawTime;
			tbInfo.szRoleName = {};
			table.insert(tbInfo.szRoleName, tb.szRoleName)
			
			tbInfo.dwRoleID = {};
			table.insert(tbInfo.dwRoleID, tb.dwRoleID)
			
			self.setLastDrawInfo[tbInfo.dwRewardType] = tbInfo;
		else
			table.insert(self.setLastDrawInfo[tb.dwRewardType].szRoleName, tb.szRoleName)
			table.insert(self.setLastDrawInfo[tb.dwRewardType].dwRoleID, tb.dwRoleID)
			self.setLastDrawInfo[tb.dwRewardType].dwDrawCount = self.setLastDrawInfo[tb.dwRewardType].dwDrawCount + tb.dwDrawCount;
			CPlayerDBQuery:GetDBQuery():execute('delete from "T_Lottery_Info" where "dwStorageType" = $1 and "dwRewardType" = $2 and "dwServerHostID" <> $3', 1, tb.dwRewardType, _G.dwServerHostID);
		end
	end
end

function CLotterySystemMgr:ReadCurDrawInfoDB()
	--local objDB = CPlayerDBQuery:GetDBQuery();
	local dbres = CPlayerDBQuery:GetDBQuery():execute_sync('select * from "T_Lottery_Info" where "dwStorageType" = $1', 2);
	
	--如果是第一次开服 需要插入数据库
	if not dbres then
		-- print("CLotterySystemMgr ---------- The first time run KS ,so insert the DB of currentDraw!")
		local szSql = [[insert into "T_Lottery_Info" values($1,$2,$3,$4,$5,$6,$7,$8,$9);]];
		for dwRewardType = 1, LotteryConfig.TicketDrawCount do
			local initDrawTab = {dwStorageType = 2, 
								 dwDrawCount = 0,
								 dwRewardType = dwRewardType,
								 dwRewardIndex = 0,
								 dwDrawTicket = 0,
								 dwDrawTime = 0,
								 szRoleName = {"",},
								 dwRoleID = {0,},};
								 
			self.setCurDrawInfo[dwRewardType] = initDrawTab;
			CPlayerDBQuery:GetDBQuery():execute(szSql, 2, 0, dwRewardType, 0, 0, 0, "", 0, _G.dwServerHostID);
		end
		
		--创建本次开奖的奖品
		self:CreateCurReward();
		self:UpdateCurDrawInfoDB();
		return
	end
	
	for k,tb in pairs(dbres)do
		if not self.setCurDrawInfo[tb.dwRewardType] then
			local tbInfo = {};
			tbInfo.dwStorageType = tb.dwStorageType;
			tbInfo.dwDrawCount = tb.dwDrawCount;
			tbInfo.dwRewardType = tb.dwRewardType;
			tbInfo.dwRewardIndex = tb.dwRewardIndex;
			tbInfo.dwDrawTicket = tb.dwDrawTicket;
			tbInfo.dwDrawTime = tb.dwDrawTime;
			tbInfo.szRoleName = {};
			table.insert(tbInfo.szRoleName, tb.szRoleName)
			
			tbInfo.dwRoleID = {};
			table.insert(tbInfo.dwRoleID, tb.dwRoleID)
			
			self.setCurDrawInfo[tbInfo.dwRewardType] = tbInfo;
		else
			table.insert(self.setCurDrawInfo[tb.dwRewardType].szRoleName, tb.szRoleName)
			table.insert(self.setCurDrawInfo[tb.dwRewardType].dwRoleID, tb.dwRoleID)
			self.setCurDrawInfo[tb.dwRewardType].dwDrawCount = self.setCurDrawInfo[tb.dwRewardType].dwDrawCount + tb.dwDrawCount;
			CPlayerDBQuery:GetDBQuery():execute('delete from "T_Lottery_Info" where "dwStorageType" = $1 and "dwRewardType" = $2 and "dwServerHostID" <> $3', 2, tb.dwRewardType, _G.dwServerHostID);
		end
	end
end

--创建本次开奖的奖品
function CLotterySystemMgr:CreateCurReward()
	for dwRewardType = 1, LotteryConfig.TicketDrawCount do
		--local dwRewardIndex = math.random(1, #LotteryRewardConfig[dwRewardType])
		local rewardCfg = LotteryRewardConfig[dwRewardType]
		if not rewardCfg then
			err("Cant find rewardCfg ===========LotterySystemMgr")
			return
		end
		
		local maxRandomNum = 0
		for i = 1, #rewardCfg do
			maxRandomNum = maxRandomNum + rewardCfg[i].weight
		end
		
		local rewardRandom = math.random(maxRandomNum)
		local rewardIndex = 1
		
		for i = 1, #rewardCfg do
			local calWeight = LotteryRewardConfig.GetCalWeight(dwRewardType, i)
			if i == 1 then
				if rewardRandom <= calWeight then
					rewardIndex = i
					break
				end
			else
				local preCalWeight = LotteryRewardConfig.GetCalWeight(dwRewardType, i - 1)
				if rewardRandom > preCalWeight and rewardRandom <= calWeight then
					rewardIndex = i
					break
				end
			end
		end
		self.setCurDrawInfo[dwRewardType].dwRewardIndex = rewardIndex;
	end
end

--重置所有标签
function CLotterySystemMgr:ResetAllTickets()
	for dwTicketIndex = 1, LotteryConfig.TicketAllCount do
		self.setTikcetList[dwTicketIndex].dwRoleID = {0,}
	end
end

------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------对外接口------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------
function CLotterySystemMgr:SendInfoToGS(dwLineID)
	local objLine = CGameLineManager:GetLine(dwLineID);
	if objLine then
		objLine.OnKSInitLotteryInfoMsg{SetTikcetList = self.setTikcetList, SetLastDrawInfo = self.setLastDrawInfo, SetCurDrawInfo = self.setCurDrawInfo};
	end 
end


function CLotterySystemMgr:TryBuyTicket(dwRoleID, dwTicketIndex)
	local objPlayer = CPlayerManager:GetPlayerByRoleID(dwRoleID);
	if not objPlayer then
		return;
	end
	
	local buyTicketRoleId = self.setTikcetList[dwTicketIndex].dwRoleID
	local ticketLockPlayer = self.setTicketLock[dwTicketIndex]
	
	local ticketAlreadySell = false
	for k, roleID in pairs(buyTicketRoleId) do
		if roleID ~= 0 then
			ticketAlreadySell = true
			break
		end
	end
	
	local code = 0
	if not ticketAlreadySell and ticketLockPlayer == 0 then
		self.setTicketLock[dwTicketIndex] = dwRoleID
	else
		-- print("KS---------Ticket "..dwTicketIndex.." alreard buy!")
		code = 2
		
		local ticketBuyByMyself = false
		for k, roleID in pairs(buyTicketRoleId) do
			if roleID == dwRoleID then
				ticketBuyByMyself = true
				break
			end
		end
		if ticketBuyByMyself then
			code = 1
		end
		
		if ticketLockPlayer ~= 0 then
			code = 6
		end
	end
	
	objPlayer.objLine.OnKSBuyTicketResultMsg
	{
		RoleID = dwRoleID;
		TicketIndex = dwTicketIndex;
		Code = code; --  Code = 0购买成功, 1被自己买，2被别人买，3背包空格不够,  4消耗材料不足, 5 银币不足, 6服务器繁忙
	}
end


function CLotterySystemMgr:RealBuyTicket(dwRoleID, dwTicketIndex, dwBuySucess)
	local objPlayer = CPlayerManager:GetPlayerByRoleID(dwRoleID);
	if not objPlayer then
		return;
	end
	
	local buyTicketRoleId = self.setTikcetList[dwTicketIndex].dwRoleID
	local ticketLockPlayer = self.setTicketLock[dwTicketIndex]
	
	local ticketAlreadySell = false
	for k, roleID in pairs(buyTicketRoleId) do
		if roleID ~= 0 then
			ticketAlreadySell = true
			break
		end
	end
	
	if not ticketAlreadySell and ticketLockPlayer == dwRoleID then
	
		--标签解锁
		self.setTicketLock[dwTicketIndex] = 0
		
		if dwBuySucess == 1 then
			self.setTikcetList[dwTicketIndex].dwRoleID = {};
			table.insert(self.setTikcetList[dwTicketIndex].dwRoleID, dwRoleID)
			self.setTikcetList[dwTicketIndex].dwSelectedCount = self.setTikcetList[dwTicketIndex].dwSelectedCount + 1;
			
			--save
			local szSql = 
			[[
				update "T_Role_LotteryTicket_Info" set "dwRoleID" = $1, "dwSelectedCount" = $2, "dwDrawCount" = $3 where "dwIndex" = $4 and "dwServerHostID" = $5;
			]]
			CPlayerDBQuery:GetDBQuery():execute(szSql,dwRoleID, self.setTikcetList[dwTicketIndex].dwSelectedCount, self.setTikcetList[dwTicketIndex].dwDrawCount, dwTicketIndex, _G.dwServerHostID);
			
			local tbLine = CGameLineManager:GetAllLine();
			for _,objLine in pairs(tbLine)do
				objLine.OnKSUpdateTicketMsg
				{
					TicketIndex = dwTicketIndex;
					RoleID = self.setTikcetList[dwTicketIndex].dwRoleID;
					SelectedCount = self.setTikcetList[dwTicketIndex].dwSelectedCount;
					DrawCount = self.setTikcetList[dwTicketIndex].dwDrawCount;
				};
			end
			
			self.remainTickets = self.remainTickets - 1;
			--如果到达发送广播的数量 就发广播
			if self.remainTickets == LotteryConfig.TicketBroadcastCount then
				--给所有GS发送广播消息
				local tbLine = CGameLineManager:GetAllLine();
				for _,objLine in pairs(tbLine)do
					objLine.OnKSRemainTicketMsg{};
				end
			elseif self.remainTickets == 0 then
				--开奖 
				self:Draw();
			end
		end
	end
end

--开奖函数
function CLotterySystemMgr:Draw()
	--产生三个不相同的随机数 有种想吐血的感觉
	local rewardList = CreateSomeRandomNum(LotteryConfig.TicketDrawCount, 1, LotteryConfig.TicketAllCount)
	
	--记录开奖时间
	local drawTime = _now()
	
	--记录中奖玩家 （用上次开奖的表 来记录）
	for dwRewardType = 1, #self.setLastDrawInfo do
		local drawTicketIndex = rewardList[dwRewardType]
		local ticketTab = self.setTikcetList[drawTicketIndex]
		local drawTab = self.setLastDrawInfo[dwRewardType]
		
		local roleName = {}
		
		local isSomebodyDraw = false
		for k, roleID in pairs(ticketTab.dwRoleID) do
			if roleID ~= 0 then
				isSomebodyDraw = true
				local roleInfo = COfflineInfoManager:GetRoleInfo(roleID)
				
				if roleInfo then
					table.insert(roleName, roleInfo.szName);
				else
					table.insert(roleName, "")
				end	
			end
		end
		if #roleName == 0 then
			roleName = {"",}
		end
		
		if isSomebodyDraw then
			self.setTikcetList[drawTicketIndex].dwDrawCount = self.setTikcetList[drawTicketIndex].dwDrawCount + 1
		end
		
		self.setLastDrawInfo[dwRewardType] = {
												 dwStorageType = 1, 
												 dwDrawCount = drawTab.dwDrawCount + 1,
												 dwRewardType = dwRewardType,
												 dwRewardIndex = self.setCurDrawInfo[dwRewardType].dwRewardIndex,
												 dwDrawTicket = drawTicketIndex,
												 dwDrawTime = drawTime,
												 szRoleName = roleName,
												 dwRoleID = ticketTab.dwRoleID,
											 };											 										
	end
	
	--下面发邮件
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	
	--统计所有未中奖玩家的票  {roleId = {2, 5,6..购买的票}}
	
	--未中奖玩家列表
	local setPlayerBuyTicket = {}
	--中奖玩家列表
	local setDrawrPlayer = {}
	for k, v in pairs(self.setTikcetList) do
		for rewardType, ticketIndex in pairs(rewardList) do
			if k == ticketIndex then
				for k, drawRoleId in pairs(v.dwRoleID) do
					if drawRoleId ~= 0 and not setDrawrPlayer[drawRoleId] then
						setDrawrPlayer[drawRoleId] = {1}
					end
				end
				break
			end
		end
		
		for _, drawRoleId in pairs(v.dwRoleID) do
			if drawRoleId ~= 0 then
				if not setPlayerBuyTicket[drawRoleId] then
					setPlayerBuyTicket[drawRoleId] = {}
				end
				table.insert(setPlayerBuyTicket[drawRoleId], k)
			end
		end
	end
	
	--移除中奖玩家
	for drawRoleId, v in pairs(setDrawrPlayer) do
		table.remove(setPlayerBuyTicket, drawRoleId)
	end
	
	--循环所有中奖玩家
	for k, v in pairs(rewardList) do
		
		local drawRoleId = self.setTikcetList[v].dwRoleID
		local rewardIndex = self.setLastDrawInfo[k].dwRewardIndex
		local rewardCfg = LotteryRewardConfig[k][rewardIndex]
		
		local setItem = {}
		for itemEnumId, itemCount in pairs(rewardCfg) do
			if type(itemEnumId) == "number" then
				local objItem = SItemMessage:new();
				objItem.dwItemEnum = itemEnumId
				objItem.dwItemNumber = itemCount
				local itemCfg = _G.OtherBaseData[itemEnumId]
				if itemCfg then
					objItem.dwBindType = itemCfg.dwBindType;
				else 
					objItem.dwBindType = _G.enItemBindType.eYes;
				end
				
				table.insert(setItem, objItem)
			end
		end
		
		for _, dwRoleId in pairs(drawRoleId) do
			if dwRoleId == 0 then
				break
			end
			local objMail = CMail:new()
			objMail:SetSender( 10086, "系统" )
			objMail:SetReceiver( dwRoleId, "" )
			objMail:SetContent( LotteryMail.DrawRole.topic, LotteryMail.GetDrawRoleContent(k, rewardIndex) )
			objMail:SetLifeTime( SMailInfo.life*24*60*60*1000 )
			objMail:SetAccessory( 0, 0, rewardCfg.silver, setItem )
			CMailManager:SendMail( objMail )
		end
	end
	
	--循环所有未中奖玩家
	for roleId, tickets in pairs(setPlayerBuyTicket) do
		local objMail = CMail:new()
		objMail:SetSender( 10086, "系统" )
		objMail:SetReceiver( roleId, "" )
		objMail:SetContent( LotteryMail.OtherRole.topic, LotteryMail.GetOtherRoleContent(tickets, rewardList) )
		objMail:SetLifeTime( SMailInfo.life*24*60*60*1000 )
		CMailManager:SendMail( objMail )
	end

	
	--日志系统记录
	CLogSystemManager:lottery(self.setLastDrawInfo[1].dwRoleID[1], self.setLastDrawInfo[2].dwRoleID[1], self.setLastDrawInfo[3].dwRoleID[1]);
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	self:UpdateLastDrawInfoDB()
	--创建本次开奖的奖品
	self:CreateCurReward();
	self:UpdateCurDrawInfoDB();
	--重置所有票
	self:ResetAllTickets();
	self:UpdateTicketInfoDB();
	
	--给所有GS发送开奖消息
	local tbLine = CGameLineManager:GetAllLine();
	for _,objLine in pairs(tbLine) do
		self:SendInfoToGS(objLine:GetID())
		objLine.OnKSLotteryDrawMsg
		{
		};
	end
	
	self.remainTickets =  LotteryConfig.TicketAllCount;
end
-----------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------数据库接口------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------
--本次开奖信息存数据库
function CLotterySystemMgr:UpdateCurDrawInfoDB()
	local objDB = CPlayerDBQuery:GetDBQuery();
	
	for dwRewardType = 1, #self.setCurDrawInfo do
		local DBInfo = self.setCurDrawInfo[dwRewardType];
		CPlayerDBQuery:GetDBQuery():execute('update "T_Lottery_Info" set "dwDrawCount" = $1, "dwRewardIndex" = $2, "dwDrawTicket" = $3, "dwDrawTime" = $4, "szRoleName" = $5, "dwRoleID" = $6 where "dwStorageType" = $7 and "dwRewardType" = $8 and "dwServerHostID" = $9', DBInfo.dwDrawCount, DBInfo.dwRewardIndex, DBInfo.dwDrawTicket, DBInfo.dwDrawTime, DBInfo.szRoleName[1], DBInfo.dwRoleID[1], 2, dwRewardType, _G.dwServerHostID);
	end
end


--上次开奖信息存数据库
function CLotterySystemMgr:UpdateLastDrawInfoDB()
	local objDB = CPlayerDBQuery:GetDBQuery();
	
	for dwRewardType = 1, #self.setLastDrawInfo do
		local DBInfo = self.setLastDrawInfo[dwRewardType];
		CPlayerDBQuery:GetDBQuery():execute('update "T_Lottery_Info" set "dwDrawCount" = $1, "dwRewardIndex" = $2, "dwDrawTicket" = $3, "dwDrawTime" = $4, "szRoleName" = $5, "dwRoleID" = $6 where "dwStorageType" = $7 and "dwRewardType" = $8 and "dwServerHostID" = $9', DBInfo.dwDrawCount, DBInfo.dwRewardIndex, DBInfo.dwDrawTicket, DBInfo.dwDrawTime, DBInfo.szRoleName[1], DBInfo.dwRoleID[1], 1, dwRewardType, _G.dwServerHostID);
	end
end

--抽签信息存数据库
function CLotterySystemMgr:UpdateTicketInfoDB()
	local objDB = CPlayerDBQuery:GetDBQuery();
	
	for dwTicketIndex = 1, #self.setTikcetList do
		local DBInfo = self.setTikcetList[dwTicketIndex];
		CPlayerDBQuery:GetDBQuery():execute('update "T_Role_LotteryTicket_Info" set "dwRoleID" = $1, "dwSelectedCount" = $2, "dwDrawCount" = $3 where "dwIndex" = $4 and "dwServerHostID" = $5', DBInfo.dwRoleID[1], DBInfo.dwSelectedCount, DBInfo.dwDrawCount, dwTicketIndex, _G.dwServerHostID);
	end
end

