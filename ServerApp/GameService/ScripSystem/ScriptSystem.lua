--[[
	脚本系统 （服务器）
	周长沙
	2012-6-21
--]]
_G.CScriptSystem = {}
---------------------------------------------------
local function TimeTrans(dwTime)--时间转换函数（ 平台->游戏 ）
	return dwTime
end
local function CopyTable(t)
	local t = t or {}
	local out = {}
	for k,v in pairs(t) do
		if type(v)=="table" then
			out[k] = CopyTable(v)
		else
			out[k] = v
		end
	end
	return out;
end
---------------------------------------------------
function CScriptSystem:new()
	local obj = CSystem:new("CScriptSystem");
	for i,v in pairs(CScriptSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	obj.Charge = {--充值
		Day = 0;	--本日充值
		Week = 0;	--本周充值
		All = 0;	--全部充值
		Sig = 0;	--单笔最大充值
		----add by lkj
		TodayTime = 0;--今天充值时间
		TodayNum = 0;--今天一小时内充值数量
		----add end
		
		dwLastTime = 0; -- 上次 充值/更新 时间
		
		CDay = 0;	--本日消费
		CWeek = 0;	--本周消费
		CAll = 0;	--全部消费
		CSig = 0;	--单笔最大消费

        -- 累计数据
		Accumulative = 
        {
            -- 充值
            -- k - line_id, v - value
            ["Charge"] = {};
            -- 消费
            -- k - line_id, v - value
            ["Cost"] = {};
        };
	}
	obj.ChargeList = {}
	obj.CostList = {}
	return obj;
end
function CScriptSystem:Create(bChangeLine)
	self.objPlayer = self:GetPlayer()
	self.sysItem = self.objPlayer:GetSystem("CItemSystem")
	if not CConfig.bIsCrossSvr then
		self.sysTask = self.objPlayer:GetSystem("CTaskSystem")
	end;
	self.sysMap = self.objPlayer:GetSystem("CMapSystem")
	self.funChangeLineMap = nil
	self.Charge.dwLastTime = _now()
	self.dwIsMic = 0;
	if bChangeLine == 0 then
	--if not bChangeLine then
		self:InitDBChargeInfo()
	end
end
function CScriptSystem:Update(dwDelay)
	if self.funChangeLineMap then
		local objPlayer = self:GetPlayer()
		local Data = objPlayer:GetLineData("CScriptSystem")
		if not Data then
			local f = self.funChangeLineMap
			self.funChangeLineMap = nil
			f()
			if self.Node then
				CDriverManager:DelDriver(self.Node)
			end
		end
	end
	local dwNow = _now()
	local bChange = false
	if not CTimeFormat:isToday(self.Charge.dwLastTime) then
		self.Charge.Day = 0
		self.Charge.CDay = 0
		----add by lkj
		self.Charge.TodayTime = 0;
		self.Charge.TodayNum = 0;
		local objPlayer = self:GetPlayer();
		if objPlayer then
			local commercialActSys = objPlayer:GetSystem("CCommercialActSystem");
			if commercialActSys then
				commercialActSys:OnOneDayOver();
			end;
		end;
		----add end
		bChange = true
	end
	if not CTimeFormat:isThisWeek(self.Charge.dwLastTime) then
		self.Charge.Week = 0
		self.Charge.CWeek = 0
		bChange = true
	end
	if bChange then
		self:SendCharge()
	end
	
	self.Charge.dwLastTime = dwNow
end
function CScriptSystem:Destroy()
	if self.Node then
		CDriverManager:DelDriver(self.Node)
	end
end
function CScriptSystem:OnChangeLineBegin(dwNewLineID)
	local objPlayer = self:GetPlayer()
	objPlayer:SetLineData("CScriptSystemCharge",self.Charge)
	objPlayer:SetLineData("CScriptSystemChargeList",self.ChargeList)
	objPlayer:SetLineData("CScriptSystemCostList",self.CostList)
	objPlayer:SetLineData("CScriptSystemIsMic",{self.dwIsMic})
	objPlayer:SetLineData("CScriptSystemGold",{self.sysItem:GetGoldNum()})
	_info("===ChangeLineBegin===",objPlayer.dwAccountID,self.sysItem:GetGoldNum())
	CLogSystemManager:change_line(objPlayer,1,self.sysItem:GetGoldNum())
end


function CScriptSystem:OnChangeLineEnd(dwNewLineID)
	local objPlayer = self:GetPlayer()
	local Data = objPlayer:GetLineData("CScriptSystem")
	if Data and Data[1] then
		local f = function() self:ChangeMapPos(Data[1].dwMapId,Data[1].fPosX,Data[1].fPosY,Data[1].fDir or 0) end
		self.funChangeLineMap = f
		self.Node = CDriverManager:AddDriver(eInterval._1sec,self,CScriptSystem.Update)
	end
	local Data = objPlayer:GetLineData("CScriptSystemCharge")
	if Data and Data[1] then
		self.Charge = Data[1]
	end
	local Data = objPlayer:GetLineData("CScriptSystemChargeList")
	if Data and Data[1] then
		self.ChargeList = Data[1]
	end
	local Data = objPlayer:GetLineData("CScriptSystemCostList")
	if Data and Data[1] then
		self.CostList = Data[1]
	end
	local Data = objPlayer:GetLineData("CScriptSystemIsMic")
	if Data and Data[1] then
		self.dwIsMic = Data[1][1]
	end
	local Data = objPlayer:GetLineData("CScriptSystemGold")
	if Data and Data[1] then
		self.dwOldGold = Data[1][1]
		if self.dwOldGold ~= self.sysItem:GetGoldNum() then
			_err("Gold error kill player",objPlayer.dwAccountID,self.dwOldGold,self.sysItem:GetGoldNum());
			objPlayer.CreateGameSessionRequestMsg{ResultCode = -25}
			_closenet(objPlayer.objNet);
		end
	end
	_info("==ChangeLineEnd===",objPlayer.dwAccountID,self.sysItem:GetGoldNum())
	CLogSystemManager:change_line(objPlayer,2,self.sysItem:GetGoldNum())
end
------------------------------------------------------------------------
--客户端进入游戏登入所有场景之后
function CScriptSystem:OnEnterScene()
	local objPlayer = self:GetPlayer()
	local sInfo = ServerVerSionReplaceConfig[SERVERVERSION] or {}
	local dwAccountID = math.floor(objPlayer:GetAccountID()/10000);
	
	local Info = CopyTable(sInfo)
	
	if Info.UrlConfig then
		for k,v in pairs(Info.UrlConfig) do
			if (type(v)=="string") and (string.find(v,"%%s") or (string.find(v,"%%d"))) then
				Info.UrlConfig[k] = string.format(v,tostring(dwAccountID),tostring(objPlayer:GetSid()))
			end
		end
	end
	--[[
	if sInfo.UrlConfig and sInfo.UrlConfig.Charge then
		sInfo.UrlConfig.Charge = string.format(szFormatCharge,tostring(dwAccountID),tostring(objPlayer:GetSid()));
	end; 
	if sInfo.UrlConfig and sInfo.UrlConfig.Addicted then
		sInfo.UrlConfig.Addicted = string.format(szFormatAddicted,tostring(dwAccountID),tostring(objPlayer:GetSid()));
	end;
	--]]
	objPlayer.ScriptServerVerSionReplaceMsg{Info=Info}
	self:SendCharge()
end

function CScriptSystem:OnCharge(dwGold,dwTime,bNoEvent)
	local dwGold = dwGold or 0
	local dwTime = TimeTrans(dwTime)
	if dwGold > 0 then
		self:OnAddGold(dwGold,dwTime,bNoEvent)
	else
		self:OnCostGold(dwGold,dwTime,bNoEvent)
	end
end

function CScriptSystem:OnAddGold(dwGold,dwTime,bNoEvent)
	if dwGold < 0 then
		return self:OnCostGold(dwGold,dwTime,bNoEvent)
	end

	self.Charge.All = self.Charge.All + dwGold

	if dwGold > self.Charge.Sig then
		self.Charge.Sig = dwGold
		self:GetPlayer():GetSystem("CPlayerEventCenterSystem"):DoEvent(enumPlayerEventType.EventChargeRecordSig,1,dwGold);
	end
	
	if CTimeFormat:isToday(dwTime) then
		self.Charge.Day = self.Charge.Day + dwGold
		----add by lkj
		if not bNoEvent then--游戏中充值
			if self.Charge.TodayTime > 0 then
				if dwTime <= (self.Charge.TodayTime + 3600000)  then
					self.Charge.TodayNum = self.Charge.TodayNum + dwGold;
				end;
			else
				self.Charge.TodayTime = dwTime;
				self.Charge.TodayNum = self.Charge.TodayNum + dwGold;
			end;
		end;
		----add end
	end
	if CTimeFormat:isThisWeek(dwTime) then
		self.Charge.Week = self.Charge.Week + dwGold
	end
	
	local y,m,d = CTimeFormat:mtodate(dwTime, true,true)
	local dwIndex = y*10000+m*100+d
	self.ChargeList[dwIndex] = (self.ChargeList[dwIndex] or 0) + dwGold
	
    self:UpdateAccumulative(1);
    
	if bNoEvent then return end;
	self:SendCharge()
	
	self:GetPlayer():GetSystem("CPlayerEventCenterSystem"):DoEvent(enumPlayerEventType.EventChargeRecord,1,dwGold);
end

function CScriptSystem:OnCostGold(dwGold,dwTime,bNoEvent,bGS)
	if dwGold > 0 then
		return self:OnAddGold(dwGold,dwTime,bNoEvent)
	end
	local dwGold = -1 * dwGold
	self.Charge.CAll = self.Charge.CAll + dwGold

	if dwGold > self.Charge.CSig then
		self.Charge.CSig = dwGold
		self:GetPlayer():GetSystem("CPlayerEventCenterSystem"):DoEvent(enumPlayerEventType.EventChargeRecordSig,1,dwGold);
	end
	
	if CTimeFormat:isToday(dwTime) then
		self.Charge.CDay = self.Charge.CDay + dwGold
	end
	if CTimeFormat:isThisWeek(dwTime) then
		self.Charge.CWeek = self.Charge.CWeek + dwGold
	end
	if bGS then
		self:WriteGoldCost(dwGold)
	end
	
	local y,m,d = CTimeFormat:mtodate(dwTime, true,true)
	local dwIndex = y*10000+m*100+d
	self.CostList[dwIndex] = (self.CostList[dwIndex] or 0) + dwGold
	
    self:UpdateAccumulative(2);

	if bNoEvent then return end;
	self:SendCharge()
	
	self:GetPlayer():GetSystem("CPlayerEventCenterSystem"):DoEvent(enumPlayerEventType.EventChargeRecord,1,dwGold);
end



function CScriptSystem:GetCharge()
	return CopyTable(self.Charge)
end

function CScriptSystem:InitDBChargeInfo()
	local dwNow = GetCurTime()
	
	local objPlayer = self:GetPlayer()
	local Data = objPlayer:GetLineData("CScriptSystemCharge")
	if Data and Data[1] then
		local Info = Data[1]
		local chargeList = {};
		local tempCharge = {};
		local tempCost = {};
		for k,v in pairs(Info) do
		
			self:OnCharge(v.dwGold,v.dwTime,true)
			
			if dwNow - v.dwTime > 1000*60*60*24*15 then --对15天以上的充值消费记录进行整合
				if v.dwGold > 0 then
					table.insert(tempCharge,v)
				else
					table.insert(tempCost,v)
				end
			end
			----add by lkj
			if (v.dwGold > 0) and (CTimeFormat:isToday(v.dwTime)) then
				if self.Charge.TodayTime > 0 then
					if self.Charge.TodayTime > v.dwTime then
						self.Charge.TodayTime = v.dwTime;
					end;
				else
					self.Charge.TodayTime = v.dwTime;
				end;
				chargeList[v.dwTime] = v.dwGold;
			end;
			----add end
		end
		---处理合并
		local dwCost = 0
		local dwCharge = 0
		for k,v in pairs(tempCharge) do
			local szOrderID = v.dwOrderID
			dwCharge = dwCharge + v.dwGold
			self:DeleteRecord(szOrderID)
		end
		for k,v in pairs(tempCost) do
			local szOrderID = v.dwOrderID
			dwCost = dwCost + v.dwGold
			self:DeleteRecord(szOrderID)
		end
		self:InsertOldCostRecord(dwCost)
		self:InsertOldChargeRecord(dwCharge)
		
		----add by lkj
		if self.Charge.TodayTime > 0 then
			for k, v in pairs(chargeList) do
				if k <= (self.Charge.TodayTime + 3600000) then
					self.Charge.TodayNum = self.Charge.TodayNum + v;
				end;
			end;
		end;
		----add end
	end
end

-- @brief 更新累计数据
-- @param number dwType
-- 1 - 充值
-- 2 - 消费
function CScriptSystem:UpdateAccumulative(dwType)
	if dwType == nil then
		return;
	end

    local setAccumulatives = CFestivalManager:GetAccumulative();
    for k, v in pairs(setAccumulatives[dwType]) do
		if dwType == 1 then
			self.Charge.Accumulative["Charge"][k] = self:GetRegionCharge(v[1], v[2]);
		elseif dwType == 2 then
			self.Charge.Accumulative["Cost"][k] = self:GetRegionCost(v[1], v[2]);
		end
    end
end

function CScriptSystem:SendCharge()
	local objPlayer = self:GetPlayer()
	objPlayer.ScriptOnChargeMsg{Info = self.Charge}
end

function CScriptSystem:WriteGoldCost(dwGold)
	local dwGold = -1 * dwGold
	local objPlayer = self:GetPlayer()
	local dwAccountID = objPlayer:GetAccountID()
	local DB = objPlayer:GetDBQuery()
	local SqlCmd = DB:CreateInsertCmd("T_Account_Charge_Record");
	SqlCmd.Fields = {};
	SqlCmd.Fields.dwOrderID = tostring(_now())
	SqlCmd.Fields.dwAccountID = dwAccountID
	SqlCmd.Fields.dwGold = dwGold
	SqlCmd.Fields.dwTime = _now()
	
	SqlCmd:execute()
end

function CScriptSystem:DeleteRecord(szOrderID)
	local objPlayer = self:GetPlayer()
	local dwAccountID = objPlayer:GetAccountID()
	local DB = objPlayer:GetDBQuery()
	local SqlCmd = DB:CreateDeleteCmd("T_Account_Charge_Record");
	
	SqlCmd.Wheres.dwOrderID = szOrderID
	SqlCmd.Wheres.dwAccountID = dwAccountID
	
	SqlCmd:execute()
end

function CScriptSystem:InsertOldCostRecord(dwCost)
	if dwCost==0 then return end;
	local objPlayer = self:GetPlayer()
	local dwAccountID = objPlayer:GetAccountID()
	local DB = objPlayer:GetDBQuery()
	local SqlCmd = DB:CreateInsertCmd("T_Account_Charge_Record");
	
	SqlCmd.Fields.dwGold = dwCost
	SqlCmd.Fields.dwTime = 1
	
	SqlCmd.Wheres.dwOrderID = "Cost1"
	SqlCmd.Wheres.dwAccountID = dwAccountID
	
	SqlCmd:execute()
	
end

function CScriptSystem:InsertOldChargeRecord(dwCharge)
	if dwCharge==0 then return end;
	local objPlayer = self:GetPlayer()
	local dwAccountID = objPlayer:GetAccountID()
	local DB = objPlayer:GetDBQuery()
	local SqlCmd = DB:CreateInsertCmd("T_Account_Charge_Record");
	
	SqlCmd.Fields.dwGold = dwCharge
	SqlCmd.Fields.dwTime = 2
	
	SqlCmd.Wheres.dwOrderID = "Charge1"
	SqlCmd.Wheres.dwAccountID = dwAccountID
	
	SqlCmd:execute()
end
----------------------------------------------------

function CScriptSystem:OnRecvMicInfo(dwIsMic)
	self.dwIsMic = dwIsMic
end

function CScriptSystem:IsMic()
	-- print(self.dwIsMic, type(self.dwIsMic))
	return self.dwIsMic == 1
end
----------------------------------------------------
--------------------------------------------物品相关
--飞图标
function CScriptSystem:FlyItem(Item)
	if type(Item)=="number" then
		self.sysItem:FlyItemIconToPacket( {Item} )
	elseif type(Item)=="table" then
		self.sysItem:FlyItemIconToPacket( Item )
	end
end
--获得物品所在背包
function CScriptSystem:GetItemPack(dwItemEnum)
	local cfg = OtherBaseData[dwItemEnum] or EquipBaseData[dwItemEnum]
	if cfg.dwParentType == enItemParentType.eSundryGoods then
		return enItemPosition.eTaskRoom
	else
		return enItemPosition.ePacket
	end
end
--添加物品
function CScriptSystem:AddItem(dwItemEnum,dwItemNumber,dwBindType,dwPosition,dwLifeTime,dwBornTime)
	local dwPosition = dwPosition
	local dwBindType = dwBindType or enItemBindType.eYes
	if type(dwItemEnum)=="number" then
		local tabAddList = {}
		tabAddList[1] = {dwItemEnum=dwItemEnum , dwItemNumber=dwItemNumber, dwBindType=dwBindType,dwLifeTime=dwLifeTime,dwBornTime=dwBornTime}
		if dwPosition == enItemPosition.ePacket then
			if self.sysItem:IsEnumItemListCanAddToPacket(tabAddList) then
				self.sysItem:AddEnumItemListToPacket(tabAddList, _G.ItemSysOperType.TaskReward);
				self:FlyItem(dwItemEnum)
				return true
			end;
		elseif dwPosition == enItemPosition.eTaskRoom then
			self.sysItem:AddEnumItemListToTaskRoom(tabAddList, _G.ItemSysOperType.TaskReward);
			self:FlyItem(dwItemEnum)
			return true
		else
			_err("holder error");
		end;
	elseif type(dwItemEnum)=="table" then
		if dwPosition == enItemPosition.ePacket then
			if self.sysItem:IsEnumItemListCanAddToPacket(dwItemEnum) then
				self.sysItem:AddEnumItemListToPacket(dwItemEnum, _G.ItemSysOperType.TaskReward);
				self:FlyItem(dwItemEnum)
				return true
			end;
		elseif dwPosition == enItemPosition.eTaskRoom then
			self.sysItem:AddEnumItemListToTaskRoom(dwItemEnum, _G.ItemSysOperType.TaskReward);
			self:FlyItem(dwItemEnum)
			return true
		else
			_err("holder error");
		end;
	end
	return false
end
--添加普通物品
function CScriptSystem:AddPackItem(dwItemEnum,dwItemNumber,dwBindType,dwLifeTime,dwBornTime)
	if FestivalMoneyEnum[dwItemEnum] then
		self:AddSpItem(FestivalMoneyEnum[dwItemEnum],dwItemNumber)
	end
	local dwPosition = enItemPosition.ePacket
	return self:AddItem(dwItemEnum,dwItemNumber,dwBindType,dwPosition,dwLifeTime,dwBornTime)
end
--添加任务物品
function CScriptSystem:AddTaskItem(dwItemEnum,dwItemNumber,dwBindType)
	local dwPosition = enItemPosition.eTaskRoom
	return self:AddItem(dwItemEnum,dwItemNumber,dwBindType,dwPosition)
end
--获得物品数量
function CScriptSystem:GetItemNum(dwItemEnum)
	local dwPosition = self:GetItemPack(dwItemEnum)
	if dwPosition == enItemPosition.ePacket then
		return self.sysItem:GetEnumItemNumInPacket(dwItemEnum);
	elseif dwPosition == enItemPosition.eTaskRoom then
		return self.sysItem:GetEnumItemNumInTaskRoom(dwItemEnum);
	end;
end

--获得物品数量（任务用）
function CScriptSystem:GetItemNumTask(dwItemEnum)
	return self.sysItem:GetEnumItemNumInPacket(dwItemEnum) + self.sysItem:GetEnumItemNumInTaskRoom(dwItemEnum);
end

function CScriptSystem:DelItemTask(dwItemEnum,dwNum)
	local dwPackNum = self.sysItem:GetEnumItemNumInPacket(dwItemEnum);
	local dwTaskNum = self.sysItem:GetEnumItemNumInTaskRoom(dwItemEnum);
	if dwTaskNum>= dwNum then
		return self.sysItem:DelEnumItemInTaskRoom(dwItemEnum, dwNum, false, _G.ItemSysOperType.TaskDel);
	end
	local dwNeed = dwNum - dwTaskNum
	local res = self.sysItem:DelEnumItemInTaskRoom(dwItemEnum, dwTaskNum, false, _G.ItemSysOperType.TaskDel);
	res = self.sysItem:DelEnumItemInPacket(dwItemEnum, dwNeed, false, _G.ItemSysOperType.TaskDel) and res;
	return res
end



--删除物品
function CScriptSystem:DelItem(dwItemEnum,dwItemNumber)
	if FestivalMoneyEnum[dwItemEnum] then
		return self:DelSpItem(FestivalMoneyEnum[dwItemEnum],dwItemNumber)
	end

	local dwPosition = self:GetItemPack(dwItemEnum)
	if self:GetItemNum(dwItemEnum) < dwItemNumber then
		return false
	end
	if dwPosition == enItemPosition.ePacket then
		self.sysItem:DelEnumItemInPacket(dwItemEnum, dwItemNumber, false, _G.ItemSysOperType.TaskDel);
	elseif dwPosition == enItemPosition.eTaskRoom then
		self.sysItem:DelEnumItemInTaskRoom(dwItemEnum, dwItemNumber, false, _G.ItemSysOperType.TaskDel);
	end;
	return true
end

--将道具移入背包中
function CScriptSystem:MoveItemToPacket(dwItemEnum)
	local setBindObjs, setUnBindObjs = self.sysItem:GetEnumItemInstInHolder(enItemPosition.eStorage, dwItemEnum);
	for k,objItem in ipairs(setBindObjs) do
		self.sysItem:MoveItemToPacket(objItem:GetInstID());
	end	
	for k,objItem in ipairs(setUnBindObjs) do
		self.sysItem:MoveItemToPacket(objItem:GetInstID());
	end
	return true
end

function CScriptSystem:AddSpItem(dwType,dwItemNumber)
	local objPlayer = self:GetPlayer()
	local sysFiveElem = objPlayer:GetSystem("CFiveElemSystem");
	if dwType == 1 then--真气
		sysFiveElem:ChangeAttrAll(dwItemNumber, _G.FiveElemSysOperType.AddSpItem)
	elseif dwType == 2 then--元宝
		self.sysItem:AddGold(dwItemNumber, _G.ItemSysOperType.SystemReward)
	elseif dwType == 3 then--银两
		self.sysItem:AddPacketMoney(dwItemNumber, _G.ItemSysOperType.SystemReward);
	elseif dwType == 4 then--礼金
		self.sysItem:AddBindGold(dwItemNumber, _G.ItemSysOperType.SystemReward)
	elseif dwType == 5 then--经验
		objPlayer:AddExp(dwItemNumber)
	end
end

function CScriptSystem:DelSpItem(dwType,dwItemNumber)
	local objPlayer = self:GetPlayer()
	local sysFiveElem = objPlayer:GetSystem("CFiveElemSystem");
	if dwType == 1 then--真气
		return sysFiveElem:ChangeAttrAll(-1 * dwItemNumber,  _G.FiveElemSysOperType.DelSpItem)
	elseif dwType == 2 then--元宝
		return self.sysItem:CostGold(dwItemNumber, _G.ItemSysOperType.TaskDel)
	elseif dwType == 3 then--银两
		return self.sysItem:CostPacketMoney(dwItemNumber, _G.ItemSysOperType.TaskDel)
	elseif dwType == 4 then--礼金
		return self.sysItem:CostBindGold(dwItemNumber, _G.ItemSysOperType.TaskDel)
	elseif dwType == 5 then--经验
		--objPlayer:AddExp(dwItemNumber)
	end
end
----------------------------------------------------
---------------------------------------------npc相关
--新加一个npc
function CScriptSystem:AddNpc(dwNpcId,fX,fY,fDir, szName, szTitle)
	local objMap = self.sysMap:GetCurMap()
	local mgrNpc = objMap:GetNpcMgr()
	return mgrNpc:Add(dwNpcId,fX,fY,fDir, szName, szTitle)
end
--通过配置id删除一个npc
function CScriptSystem:DelNpc(dwNpcId,bAll)
	-- local objMap = self.sysMap:GetCurMap()
	-- local mgrNpc = objMap:GetNpcMgr()
	-- local objPlayer = self.objPlayer
	-- if bAll then
		-- objPlayer = nil
	-- end
	-- local objNpc = mgrNpc:GetNpc(dwNpcId,objPlayer)
	-- if objNpc then
		-- mgrNpc:Remove(objNpc:GetObjId())
		-- return true
	-- end
	-- return false
end
--通过对象id删除一个npc
function CScriptSystem:DelNpcObj(dwInfo)
	local objMap = self.sysMap:GetCurMap()
	local mgrNpc = objMap:GetNpcMgr()
	mgrNpc:Remove(dwInfo)
end
--触发一个npc剧情
function CScriptSystem:NpcStory(dwStoryId,bAll)
	local objMap = self.sysMap:GetCurMap()
	local mgrNpc = objMap:GetNpcMgr()
	local objPlayer = self.objPlayer
	if bAll then
		objPlayer = nil
	end
	mgrNpc:Story(dwStoryId,objPlayer)
end
--修改npc对话
function CScriptSystem:NpcModiTalkLink(Talk,dwPageId,dwLinkId,Link)
	if not Talk[dwPageId] then
		Talk[dwPageId] = {}
	end
	Talk[dwPageId][dwLinkId] = Link
	return Talk
end
function CScriptSystem:NpcModiTalkPage(Talk,dwPageId,Page)
	Talk[dwPageId] = Page
	return Talk
end
----------------------------------------------------
--------------------------------------------怪物相关
--根据Monsterid获得所有活着的Monster
function CScriptSystem:GetMonsterById(dwMonsterId)
	local objMap = self.sysMap:GetCurMap()
	local mgrMon = objMap:GetMonsterMgr()
	return mgrMon:GetMonsterById(dwMonsterId)
end
--新加一个怪物
function CScriptSystem:AddMon(dwMonsterId,dwX,dwY,dwDelay)
	local dwFightId = dwMonsterId
	local dwAIId = dwMonsterId
	local dwDropId = dwMonsterId
	local dwLookId = dwMonsterId
	return self:AddMonSP(dwMonsterId,dwFightId,dwAIId,dwDropId,dwLookId,dwX,dwY,dwDelay)
end
--新加一个怪物
function CScriptSystem:AddMonSP(dwMonsterId,dwFightId,dwAIId,dwDropId,dwLookId,dwX,dwY,dwDelay)
	local objMap = self.sysMap:GetCurMap()
	local mgrMon = objMap:GetMonsterMgr()
	if dwDelay and dwDelay>0 then
		return mgrMon:DelayAdd(dwMonsterId,dwFightId,dwAIId,dwDropId,dwLookId,dwX,dwY,dwObjId,dwDelay,self:GetPlayer())
	end
	return mgrMon:Add(dwMonsterId,dwFightId,dwAIId,dwDropId,dwLookId,dwX,dwY,bNoShow,dwObjId,self:GetPlayer())
end
--新加几个怪物
function CScriptSystem:AddMonEx(dwMonsterId,dwFightId,dwAIId,dwDropId,dwLookId,dwX,dwY,dwRound,dwNum,dwDelay)
	local objMap = self.sysMap:GetCurMap()
	local mgrMon = objMap:GetMonsterMgr()

	return mgrMon:DelayAddEx(dwMonsterId,dwFightId,dwAIId,dwDropId,dwLookId,dwX,dwY,dwRound,dwNum,dwDelay,self:GetPlayer())
end
--通过配置id删除活着的怪物
function CScriptSystem:DelMon(dwMonsterId)
	local objMap = self.sysMap:GetCurMap()
	local mgrMon = objMap:GetMonsterMgr()
	local Mons = self:GetMonsterById(dwMonsterId)
	for k,v in pairs(Mons) do
		self:DelMonObj(v:GetRoleID())
	end
end
--通过对象id删除怪物
function CScriptSystem:DelMonObj(dwObjId)
	local objMap = self.sysMap:GetCurMap()
	local mgrMon = objMap:GetMonsterMgr()
	mgrMon:Remove(dwObjId)
end
--通过配置id对活着的怪物照成伤害
function CScriptSystem:HurtMon(dwMonsterId,dwHurtValue)
	local objMap = self.sysMap:GetCurMap()
	local mgrMon = objMap:GetMonsterMgr()
	local objEnemy = self.objPlayer
	local Mons = self:GetMonsterById(dwMonsterId)
	for k,v in pairs(Mons) do
		v:Hurt(dwHurtValue,isCrit,objEnemy,dwSkillID,dwExecTime,dwActCount)
	end
end
--通过对象id对怪物照成伤害
function CScriptSystem:HurtMonObj(dwObjId,dwHurtValue)
	local objMap = self.sysMap:GetCurMap()
	local mgrMon = objMap:GetMonsterMgr()
	local objEnemy = self.objPlayer
	local Mon = mgrMon:GetMonsterInfo(dwObjId)
	if Mon and (not Mon:IsDead()) then
		Mon:Hurt(dwHurtValue,isCrit,objEnemy,dwSkillID,dwExecTime,dwActCount)
	end
end
--设置怪物警戒距离
function CScriptSystem:SetAlertDis(dwMonsterId,dwValue)
	local objMap = self.sysMap:GetCurMap()
	local mgrMon = objMap:GetMonsterMgr()
	local Mons = mgrMon:GetMonsterById(dwMonsterId)
	for _,Mon in pairs(Mons) do
		Mon:SetAlertDis(dwValue)
	end
end
----------------------------------------------------
--------------------------------------------任务相关
--使用物品消息
function CScriptSystem:UseItem(dwItemId)
	if self.sysTask then
		self.sysTask:OnUseItem(dwItemId)
	end;
end
--杀怪消息
function CScriptSystem:KillMonster(dwMonsterId)
	if self.sysTask then
		self.sysTask:RcvKillMonster(dwMonsterId)
	end;
end
--返回任务状态
function CScriptSystem:GetTaskState(dwTaskId)
	if self.sysTask then 
		local Task = self.sysTask:GetTask(dwTaskId)
		if Task then
			return Task:GetTaskState()
		end
		return TaskStateConfig.UnAccept
	end;
end
--判断任务是不是处在某个状态
function CScriptSystem:CheckTaskState(dwTaskId,dwState)
	local dwTaskState = self:GetTaskState(dwTaskId)
	return dwTaskState == dwState
end
--判断任务杀怪需求
function CScriptSystem:CheckTaskMonster(dwTaskId,dwPos)
	local Task = self.sysTask:GetTask(dwTaskId)
	return Task.Counts.Monster[dwPos].dwNow == Task.Counts.Monster[dwPos].dwMax
end
--判断任务地点需求
function CScriptSystem:CheckTaskExplore(dwTaskId)
	local Task = self.sysTask:GetTask(dwTaskId)
	return Task.Counts.Explore[1].dwNow == Task.Counts.Explore[1].dwMax
end

--接受任务
function CScriptSystem:AcceptTask(dwTaskID)
	return self.sysTask:RcvAcceptTask(dwTaskID)
end
--完成任务
function CScriptSystem:CompleteTask(dwTaskID)
	return self.sysTask:RcvCompleteTask(dwTaskID)
end
--放弃任务
function CScriptSystem:DoffTask(dwTaskID)
	return self.sysTask:RcvDoffTask(dwTaskID)
end

----------------------------------------------------
--------------------------------------------BUFF 相关
--检查是否有某个id的buff
function CScriptSystem:CheckBUff(dwId)
	local objPlayer = self:GetPlayer()
	if not objPlayer then return end;
	local sysBuff = objPlayer:GetSystem("CBuffSystem")
	return (sysBuff:GetBuffObj(dwId) and true) or false
end
--加buff
function CScriptSystem:AddBuff(dwId, dwLevel, releaseObj)
	local objPlayer = self:GetPlayer()
	if not objPlayer then return end;
	local sysBuff = objPlayer:GetSystem("CBuffSystem")
	sysBuff:AddBuff(dwId, dwLevel, releaseObj)
end
--删buff
function CScriptSystem:DelBuff(dwId)
	local objPlayer = self:GetPlayer()
	if not objPlayer then return end;
	local sysBuff = objPlayer:GetSystem("CBuffSystem")
	sysBuff:DeleteBuffByID(dwId)
end
----------------------------------------------------
--------------------------------------------角色相关
--触发剧情
function CScriptSystem:Story(dwStoryId,bNoStop,funOnStyFinish)
	local sysStory = self.objPlayer:GetSystem("CStorySystem")
	sysStory:Start(dwStoryId,bNoStop,funOnStyFinish)
end
--触发场景展示
function CScriptSystem:ScnStory(dwStoryId,funOnFinish)
	local sysStory = self.objPlayer:GetSystem("CStorySystem")
	sysStory:ScnStart(dwStoryId,funOnFinish)
end
--发送提示信息
function CScriptSystem:Notice(dwId,dwType)
	local objPlayer = self:GetPlayer()
	if not objPlayer then return end;
	local sysNotice = objPlayer:GetSystem("CNoticeSystem")
	if type(dwId)=="number" then
		sysNotice:Notice(dwType or 1,dwId)
	else
		sysNotice:NoticeStr(dwType or 1,dwId)
	end
end
--返回玩家所在地图id和坐标（mapid，x，y）
function CScriptSystem:GetMapPos()
	local Map = self.sysMap:GetCurMap()
	local dwMapId = Map.MapID
	local _,fPosX,fPosY = self.sysMap:GetPlayerMapPos()
	return dwMapId,fPosX,fPosY
end
--获得玩家等级
function CScriptSystem:GetPlayerLevel()
	local objPlayer = self:GetPlayer()
	if not objPlayer then return end;
	return objPlayer:GetLevel()
end
--获得创建副本的玩家等级
function CScriptSystem:GetDuplLevel()
	local objPlayer = self:GetPlayer()
	if not objPlayer then return end;
	local sysCDupl = objPlayer:GetSystem("CDuplSystem")
	return sysCDupl:GetDuplLevel()
end
--给玩家所有队友发送提示信息
function CScriptSystem:TeamNotice(dwId,dwType)
	local objPlayer = self:GetPlayer() 
	if not objPlayer then return end;
	local sysTeam = objPlayer:GetSystem("CTeamSystem")
	if not sysTeam:GetTeamId() then
		self:Notice(dwId,dwType)
		return;
	end
	local Members = sysTeam:GetTeamLeaguer()
	for k,v in pairs(Members) do
		local objPlayer = CMapManager:GetPlayer(v)
		if objPlayer then
			local sysScript = objPlayer:GetSystem("CScriptSystem")
			sysScript:Notice(dwId,dwType)
		end
	end
end
--控制玩家移动
function CScriptSystem:MovePlayer(fPosX,fPosY,dwMapId)
	local dwMapId = dwMapId or self:GetMapPos()
	local cmd = "move,"..dwMapId..","..fPosX..","..fPosY
	local objPlayer = self:GetPlayer()
	if not objPlayer then return end;
	objPlayer.TaskDoCmdMsg{Cmd=cmd}
end
--检查玩家是否有组队
function CScriptSystem:IsTeam()
	local objPlayer = self:GetPlayer() 
	if not objPlayer then return end;
	local sysTeam = objPlayer:GetSystem("CTeamSystem")
	if not sysTeam:GetTeamId() then
		return false
	end
	return true
end
--玩家传送到坐标
function CScriptSystem:ChangeMapPos(dwNewMapID,fXPos,fYPos,fDirValue)
	local objPlayer = self:GetPlayer() 
	if not objPlayer then return end;
	local sysMap = objPlayer:GetSystem("CMapSystem")
	sysMap:ExecTransforMapXY(dwNewMapID,fXPos,fYPos,fDirValue)
end
--玩家传送到点
function CScriptSystem:ChangeMap(dwNewMapID,dwPointID)
	local objPlayer = self:GetPlayer() 
	if not objPlayer then return end;
	local sysMap = objPlayer:GetSystem("CMapSystem")
	sysMap:ExecTransforMap(dwNewMapID,dwPointID)
end
--播放场景光效
function CScriptSystem:PlayPfx(dwPfxId,fPosX,fPosY,dwLast,bAll)
	local objPlayer = self:GetPlayer() 
	if not objPlayer then return end;
	if bAll then
		local Players = {}
		for _,objPlayer in pairs(Players) do
			objPlayer.NpcPlayPfxMsg{PfxId=dwPfxId,PosX=fPosX,PosY=fPosY,Last=dwLast or 60000};
		end
	else
		objPlayer.NpcPlayPfxMsg{PfxId=dwPfxId,PosX=fPosX,PosY=fPosY,Last=dwLast or 60000};
	end
end
function CScriptSystem:StopPfx(dwPfxId)
	local objPlayer = self:GetPlayer() 
	if not objPlayer then return end;
	objPlayer.NpcStopPfxMsg{PfxId=dwPfxId};
end
--换线切地图
function CScriptSystem:JumpLineMap(dwLineID,dwMapId,fPosX,fPosY,fDir)
	if CKernelApp.dwLineID == dwLineID then
		self:ChangeMapPos(dwMapId,fPosX,fPosY,fDir)
		return;
	end
	local objPlayer = self:GetPlayer()
	if not objPlayer then return end;
	if dwMapId then
		objPlayer:SetLineData("CScriptSystem",{dwMapId=dwMapId,fPosX=fPosX,fPosY=fPosY,fDir=fDir})
		-- local sysMap = objPlayer:GetSystem("CMapSystem")
		-- sysMap.dwCurMapID = dwMapId
		-- sysMap.fXPos = fPosX
		-- sysMap.fYPos = fPosY
		-- sysMap.fDirValue = fDir or 0
	end
	objPlayer:ClientChangeLineReq(dwLineID)
end

--在世界频道说话
function CScriptSystem:SayInWorld(szText)
	local objPlayer = self:GetPlayer()
	if not objPlayer then return end;
	local sysChat = objPlayer:GetSystem("CChatSystem")
	if not sysChat then return end;
	sysChat:SendLineMsg( szText or "wu hua ke shuo" )
end

--获得排行榜信息
--[[
--排行榜类型枚举
_G.enChartType = {
	eLevel		= 1,	--等级排行榜
	eWeath		= 2,	--财富排行榜
	eCombo		= 3,	--连斩排行榜
	ePulse		= 4,	--经脉排行榜
	eElement	= 5,	--五行排行榜
	eKiller 	= 6,	--杀手排行榜
	eAchievement= 7,	--成就排行榜
	eBoss		= 8,	--Boss击杀榜
	eAmulet		= 9,	--保甲排行榜
	eBourn		= 10,	--境界排行榜
	eGuild		= 11,	--公会排行榜
	eMount		= 12,	--坐骑排行榜
}
--]]
function CScriptSystem:GetChartInfo(eType,dwNum)
	local Info = {}
	local dwNum = dwNum or 10
	local Temp = CChartManager:GetChartInfo(eType)
	if not Temp then return {} end;
	for i=1,dwNum do
		if Temp[i] then
			Info[i] = Temp[i].szRoleName
		end
	end
	return Info
end

--获得玩家职业
--[[
	1：镰
	2：刀
	3：剑
	4：枪
--]]
function CScriptSystem:GetProf()
	local objPlayer = self:GetPlayer()
	if not objPlayer then return end;
	return objPlayer:GetInfo().dwProf
end
--给玩家发邮件
function CScriptSystem:SendMail(objMail)
	local objPlayer = self:GetPlayer()
	if not objPlayer then return end;
	-- objMail:SetSender( -10086, "系统" )
	objMail:SetReceiver( objPlayer:GetRoleID(), objPlayer:GetName() );
	-- objMail:SetContent( "摇奖礼包奖品！", "大侠再见！" );
	objMail:SetLifeTime( SMailInfo.life*24*60*60*1000 );
	--[[
		local Item = {}
		local oitem = SItemMessage:new();
		oitem.dwItemEnum = dwItemId
		oitem.dwItemNumber =  1
		oitem.dwBindType = enItemBindType.eYes
		oitem.dwLifeTime = -1;
		table.insert( Item, oitem );
	--]]
	-- objMail:SetAccessory( 0, 0, 0, Item );
	CMailManager:SendMail( objMail )
end

--修改外形
function CScriptSystem:ChangeLook(dwLook)
	local objPlayer = self:GetPlayer()
	if not objPlayer then return end;
	objPlayer.ScriptChangeLookMsg{Look=dwLook or 0}
end


--是否是VIP
function CScriptSystem:IsVip()
	local objPlayer = self:GetPlayer()
	if not objPlayer then return end;
	local sysVip = objPlayer:GetSystem("CVipSystem")
	return sysVip:IsVip()
end


--执行客户端函数
function CScriptSystem:DoClientFun(dwFunID,...)
	local t = {...}
	local objPlayer = self:GetPlayer()
	if not objPlayer then return end;
	objPlayer.ScriptDoClientFunMsg{
		FunID = dwFunID,
		Param = t
	}
end


--是否选中玩家
function CScriptSystem:IsLockPlayer()
	local objPlayer = self:GetPlayer()
	if not objPlayer then return end;
	local sysSkill = objPlayer:GetSystem("CSkillSystem")
	if not sysSkill then return end;
	return (sysSkill.dwTargetType == enEntType.eEntType_Player),sysSkill.dwTargetID
end

--通过角色id获得角色的脚本系统
function CScriptSystem:GetScriptByRoleID(dwRoleID)
	local objOther  = CPlayerManager:GetPlayerByRoleID(dwRoleID)
	if not objOther then return end;
	local sysScript = objOther:GetSystem("CScriptSystem")
	if not sysScript then return end;
	return sysScript;
end


--是否选中怪物
function CScriptSystem:IsLockMonster()
	local objPlayer = self:GetPlayer()
	if not objPlayer then return end;
	local sysSkill = objPlayer:GetSystem("CSkillSystem")
	if not sysSkill then return end;
	return (sysSkill.dwTargetType == enEntType.eEntType_Monster),sysSkill.dwTargetID
end


--给选中的目标加buff
function CScriptSystem:AddTargetBuff(dwBuffID,dwLevel)
	local bPlayer,dwTargetID = self:IsLockPlayer()
	if bPlayer then
		local objTargetPlayer = CPlayerManager:GetPlayerByRoleID(dwTargetID)
		if not objTargetPlayer then return false end;
		local sysTargetScript = objTargetPlayer:GetSystem("CScriptSystem")
		if not sysTargetScript then return false end;
		sysTargetScript:AddBuff(dwBuffID, dwLevel)
		return true;
	end
	local bMonster,dwTargetID = self:IsLockMonster()
	if bMonster then
		local objMap = self.sysMap:GetCurMap()
		local mgrMon = objMap:GetMonsterMgr()
		local objMon = mgrMon:GetMonsterInfo(dwTargetID)
		if not objMon then return false end;
		objMon:AddBuff(dwBuffID, dwLevel)
		return true;
	end
	return false;
end



--获取技能等级
function CScriptSystem:GetSkillLevel(dwSkillID)
	local objPlayer = self:GetPlayer()
	if not objPlayer then return end;
	local sysSkill = objPlayer:GetSystem("CSkillSystem")
	local objSkill = sysSkill.setAllSkill[dwSkillID];
	if not objSkill then
		return 0;
	end
	return objSkill:GetInfo().dwSkillLevel
end

--获得总战斗力
function CScriptSystem:GetFightValue()
	local objPlayer = self:GetPlayer()
	if not objPlayer then return 0 end;
	local sysSkill = objPlayer:GetSystem("CSkillSystem") 
	local ScoreInfo = sysSkill:CountBattleScoreInfo()
	return ScoreInfo.dwAllScore
end












