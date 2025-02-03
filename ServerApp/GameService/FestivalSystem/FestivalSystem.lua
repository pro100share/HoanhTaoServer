--[[
功能：节日活动系统（服务器）
作者：周长沙
时间：2013-5-24

--]]
_G.CFestivalSystem = {}
local szType = ItemSysOperType.Festival
-----------------------------------------------------------------
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
-----------------------------------------------------------------
function CFestivalSystem:new()
	local obj = CSystem:new("CFestivalSystem");
	obj.Info = {}
	obj.NeedSend = {}
	obj.bInit = false
	obj.InitFun = {}
	obj.dwTempCount = 0
	--------------------------------
	for k,v in pairs(self) do
		if type(v)=="function" then
			obj[k] = v
		end
	end
	return obj;
end
-----------------------------------------------------------------
function CFestivalSystem:Create(bChangeLine)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local objDB = objPlayer:GetDBQuery();
	--读取任务信息
	local Data = (objPlayer:GetLineData("CFestivalSystem") or {})[1] or {}

	if bChangeLine == 0 then
		self:InitLsData(Data)
	else
		self:InitGsData(Data)
	end;
	
	if not CFestivalManager:IsLoaded() then
		_err("[CFestivalSystem] Data error kill player");
		local objPlayer = self:GetPlayer()
        _closenet(objPlayer.objNet);
		return
	end
	
	return true
end

function CFestivalSystem:Update()
	if self.NeedSend[1] then
		if (not self.bInit) or (self.dwTempCount>0) then
			self:SendSyncConfig(self.NeedSend[1])
			table.remove(self.NeedSend,1)
			self.dwTempCount = 0
		else
			self.dwTempCount = self.dwTempCount + 1
		end
		return
	end
	if self.bInit then
		local fun = self.InitFun[1]
		if fun then
			table.remove(self.InitFun,1)
			fun()
			return;
		end
	end
end

--启动换线时候的检查

function CFestivalSystem:OnChangeLineCheck(dwNewLineID)
	if not CFestivalManager:IsLoaded() then
		return false
	end
	return true
end;
------------------------------------------------------------------
--处理登陆数据
function CFestivalSystem:InitLsData(Data)
	for _,Info in pairs(Data) do
		local dwFestival = Info.dwFestival
		local dwLine = Info.dwLine
		local dwIndex = Info.dwIndex
		local dwGetTimes = Info.dwGetTimes
		local dwTime = Info.dwTime
		if CFestivalManager:IsLine(dwFestival,dwLine) then
			local Line = CFestivalManager:GetFestival(dwFestival):GetLine(dwLine)
			if dwTime == Line:GetStartTime() then
				self.Info = self.Info or {}
				self.Info[dwFestival] = self.Info[dwFestival] or {}
				self.Info[dwFestival][dwLine] = self.Info[dwFestival][dwLine] or {}
				self.Info[dwFestival][dwLine][dwIndex] = Info
			else
				--_info("Err Festival Time Not Match",dwFestival,dwLine)
			end
		else
			--_info("Err No This Festival",dwFestival,dwLine)
		end
	end
end
--处理换线接收数据
function CFestivalSystem:InitGsData(Data)
	self.Info = Data
end
--处理换线发送数据
function CFestivalSystem:OnChangeLineBegin()
	local objPlayer = self:GetPlayer();
	objPlayer:SetLineData("CFestivalSystem",self.Info)
end
--初始化奖励信息
function CFestivalSystem:InitReward()
	local objPlayer = self:GetPlayer()
	local dwRoleID = objPlayer:GetRoleID()
	local AllFestival = CFestivalManager.AllFestival
	for dwFestival,Festival in pairs(AllFestival) do
		for dwLine,Line in pairs(Festival.Line) do
			for dwIndex=1,Line:GetIndexNum() do
				local bReward,dwNow,dwMax = self:CheckIsHaveReward(dwFestival,dwLine,dwIndex)
				if bReward or dwNow then
					local Index = self:GetIndex(dwFestival,dwLine,dwIndex)
					if not Index then
						Index = self:NewIndex(dwFestival,dwLine,dwIndex)
						self:AddIndex(dwFestival,dwLine,dwIndex,Index)
					end
					self:SetIndex(Index,bReward)
				else
					--self:DelIndex(dwFestival,dwLine,dwIndex)
				end
			end
		end
	end
	self:SendNowInfo(self.Info)
end
--接收更新操作
function CFestivalSystem:OnEventCenter(szEventName,dwNum,...)
	if not FestivalCareEvent[szEventName] then return end;
	self:CheckReward()
end
--客户端登陆场景
function CFestivalSystem:OnEnterScene()
	if not CFestivalManager:IsLoaded() then
		_err("[CFestivalSystem] Data error kill player");
		local objPlayer = self:GetPlayer()
        _closenet(objPlayer.objNet);
		return
	end

	self:StartSync()
	
	local AllFestival = CFestivalManager:GetAllFestival()
	local Info = {}
	local Nodes = {}
	for dwFestival,Festival in pairs(AllFestival) do
		local Fest = {}
		Fest.fest = dwFestival
		Fest.start = Festival:GetStartTime()
		table.insert(Info,Fest)
		for dwLine,Line in pairs(Festival:GetAllLine()) do
			local temp = {}
			temp.fest = dwFestival
			temp.line = dwLine
			temp.start = Line:GetStartTime()
			temp.node = {}--Line.Node
			table.insert(Info,temp)
			local node = {
				dwIndex = dwFestival;
				dwLine = dwLine;
				Node = Line.Node;
			}
			table.insert(Nodes,node)
		end
	end
	--self:RecvAskForCFG(Info)
	local f1 = function()
		self:SendNowFestival(Info)
	end
	table.insert(self.InitFun,f1)
	
	local f2 = function()
		self:SendNowFestivalNode(Nodes)
	end
	table.insert(self.InitFun,f2)
	
	local f3 = function()
		self:InitReward()
	end
	table.insert(self.InitFun,f3)
	
	self.bInit = true
end

--节日结束
function CFestivalSystem:OnFestivalEnd(dwFestival)
	self.Info[dwFestival] = nil
end

--活动结束
function CFestivalSystem:OnLineEnd(dwFestival,dwLine)
	if self.Info and self.Info[dwFestival] then
		self.Info[dwFestival][dwLine] = nil
	end
end
--------------------------------------------------------------------------------------------
--获取领奖信息
function CFestivalSystem:GetIndex(dwFestival,dwLine,dwIndex)
	return self.Info and self.Info[dwFestival] and self.Info[dwFestival][dwLine] and self.Info[dwFestival][dwLine][dwIndex]
end
--是否可领奖
function CFestivalSystem:IsIndexReward(dwFestival,dwLine,dwIndex)
	local Index = self:GetIndex(dwFestival,dwLine,dwIndex)
	if not Index then return end;
	return Index.bReward
end
--新建领奖信息
function CFestivalSystem:NewIndex(dwFestival,dwLine,dwIndex)
	local objPlayer = self:GetPlayer()
	local Index = {}
	Index.dwRoleID = objPlayer:GetRoleID()
	Index.dwFestival = dwFestival
	Index.dwLine = dwLine
	Index.dwIndex = dwIndex
	Index.dwGetTimes = 0
	Index.dwTime = CFestivalManager:GetFestival(dwFestival):GetLine(dwLine):GetStartTime()
	Index.bReward = false;
	return Index
end
--添加领奖信息
function CFestivalSystem:AddIndex(dwFestival,dwLine,dwIndex,Index)
	local Line = self.Info and self.Info[dwFestival] and self.Info[dwFestival][dwLine]
	if Line then
		Line[dwIndex] = Index
	else
		self.Info = self.Info or {}
		self.Info[dwFestival] = self.Info[dwFestival] or {}
		self.Info[dwFestival][dwLine] = self.Info[dwFestival][dwLine] or {}
		self.Info[dwFestival][dwLine][dwIndex] = Index
	end
	local Line = CFestivalManager:GetFestival(dwFestival):GetLine(dwLine)
	if Line.dwType == FestivalListTypeEnum.Rush then return end;
	self:DBInsertIndex(Index)
end
--删除领奖信息
function CFestivalSystem:DelIndex(dwFestival,dwLine,dwIndex)
	local Line = self.Info and self.Info[dwFestival] and self.Info[dwFestival][dwLine]
	if Line then
		self:DBDelIndex(Line[dwIndex])
		Line[dwIndex] = nil
	end
end
--设置是否可领奖
function CFestivalSystem:SetIndex(Index,bReward)
	Index.bReward = bReward
end
--设置已领奖次数
function CFestivalSystem:SetIndexGet(Index,dwTimes)
	Index.dwGetTimes = dwTimes
	self:DBUpdateIndex(Index)
end
--------------------------------------------------------------------------------------------
--获得已领奖次数
function CFestivalSystem:GetRewardGetTimes(dwFestival,dwLine,dwIndex)
	local Index = self:GetIndex(dwFestival,dwLine,dwIndex)
	if Index then
		return Index.dwGetTimes or 0
	end
	return 0
end
--检查Index记录
function CFestivalSystem:CheckRewardIndex(dwFestival,dwLine,dwIndex)
	local Index = self:GetIndex(dwFestival,dwLine,dwIndex)
	if Index then
		return Index.bReward
	end
	return false
end


--检查是否可领奖
function CFestivalSystem:CheckIsHaveReward(dwFestival,dwLine,dwIndex,dwTimes)
	local dwTimes = dwTimes or 1
	local Festival = CFestivalManager:GetFestival(dwFestival)
	if not Festival then return false end;
	local Line = Festival:GetLine(dwLine)
	if not Line then return false end;
	local dwNowGetTimes = self:GetRewardGetTimes(dwFestival,dwLine,dwIndex)
	local objPlayer = self:GetPlayer();
	local dwRoleID = objPlayer:GetRoleID()
	local res = Line:IsHaveReward(dwIndex,dwRoleID,dwNowGetTimes)
	if not res then return false end;
	local dwCanGetTimes = Line:GetRewardTimes(dwIndex)
	return dwNowGetTimes+dwTimes <= dwCanGetTimes,dwNowGetTimes,dwCanGetTimes
end
--检查
function CFestivalSystem:CheckReward()
	local objPlayer = self:GetPlayer()
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	sysScript:Update()
	
	local AllFestival = CFestivalManager.AllFestival
	local AllIndex = {}
	for dwFestival,Festival in pairs(AllFestival) do
		for dwLine,Line in pairs(Festival.Line) do
			for dwIndex=1,Line:GetIndexNum() do
				if not self:IsIndexReward(dwFestival,dwLine,dwIndex) then
					local bReward,dwNow,dwMax = self:CheckIsHaveReward(dwFestival,dwLine,dwIndex)
					if bReward then
						local Index = self:GetIndex(dwFestival,dwLine,dwIndex)
						if not Index then
							Index = self:NewIndex(dwFestival,dwLine,dwIndex)
							self:AddIndex(dwFestival,dwLine,dwIndex,Index)
						end
						self:SetIndex(Index,true)
						table.insert(AllIndex,Index)
					end
				end
			end
		end
	end
	if #AllIndex > 0 then
		self:SendAddReward(AllIndex)
	end
end
---------------------------------------------------------------------------------------
--领奖检查
function CFestivalSystem:GetRewardCheck(dwFestival,dwLine,dwIndex,dwChoose,dwTimes)
	if not self:CheckIsHaveReward(dwFestival,dwLine,dwIndex,dwTimes) then
		return false;
	end
	if not self:CheckRewardIndex(dwFestival,dwLine,dwIndex) then return false end;
	local objPlayer = self:GetPlayer()
	local sysItem = objPlayer:GetSystem("CItemSystem")
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	local Festival = CFestivalManager:GetFestival(dwFestival)
	local Line = Festival:GetLine(dwLine)
	local Cost = Line:GetCost(dwIndex)
	local Reward = Line:GetReward(dwIndex)
	local bSingle = Line:IsSingle(dwIndex)
	if Cost then
		local dwMoney = (Cost.dwMoney or 0) * dwTimes
		local dwCash = (Cost.dwCash or 0) * dwTimes
		local dwGold = (Cost.dwGold or 0) * dwTimes
		if not sysItem:IsPacketMoneyEnough(dwMoney) then--游戏币不足
			sysScript:Notice(13101610001)
			return false;
		end
		if not sysItem:IsBindGoldEnough(dwCash) then--礼金不足
			sysScript:Notice(13101610002)
			return false;
		end
		if not sysItem:IsGoldEnough(dwGold) then--元宝不足
			sysScript:Notice(13101610003)
			return false;
		end
		
		for i=1,#Cost do
			local Info = Cost[i]
			local dwItemID = Info.dwItemID
			local dwNum = Info.dwNum * dwTimes
			if sysScript:GetItemNum(dwItemID)<dwNum then--物品数量不足
				sysScript:Notice(13101610004)
				return false;
			end
		end
	end
	local AddItem = {}
    if bSingle then
        Reward = Reward[dwChoose];
		if Reward == nil then
			return false;
		else
			Reward = Reward.value;
		end
    end
    for i=1,#Reward do
        local Item = {}
        Item.dwItemEnum = Reward[i].dwItemID
        Item.dwItemNumber = Reward[i].dwNum * dwTimes
        Item.dwBindType = Reward[i].dwBindType
        Item.dwLifeTime = Reward[i].dwLifeTime
        if not FestivalMoneyEnum[Item.dwItemEnum] then
            table.insert(AddItem,Item)
        end
    end
	if not sysItem:IsEnumItemListCanAddToPacket(AddItem) then--背包空间不足
		sysScript:Notice(13101610005)
		return false
	end
	return true
end
--给奖励
function CFestivalSystem:GiveReward(dwFestival,dwLine,dwIndex,dwChoose,dwTimes)
	local objPlayer = self:GetPlayer()
	local sysItem = objPlayer:GetSystem("CItemSystem")
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	local Festival = CFestivalManager:GetFestival(dwFestival)
	local Line = Festival:GetLine(dwLine)
	local Cost = Line:GetCost(dwIndex)
	local Reward = Line:GetReward(dwIndex)
	local bSingle = Line:IsSingle(dwIndex)
	if Cost then
		local dwMoney = (Cost.dwMoney or 0) * dwTimes
		local dwCash = (Cost.dwCash or 0) * dwTimes
		local dwGold = (Cost.dwGold or 0) * dwTimes
		if dwMoney > 0 then
			sysItem:CostPacketMoney(dwMoney, szType)
		end
		if dwCash > 0 then
			sysItem:CostBindGold(dwCash, szType)
		end
		if dwGold > 0 then
			sysItem:CostGold(dwGold, szType)
		end
		for i=1,#Cost do
			local Info = Cost[i]
			local dwItemID = Info.dwItemID
			local dwNum = Info.dwNum * dwTimes
			sysScript:DelItem(dwItemID,dwNum)
		end
	end
	local dwMoney = (Reward.dwMoney or 0) * dwTimes
	local dwCash = (Reward.dwCash or 0) * dwTimes
	local dwGold = (Reward.dwGold or 0) * dwTimes
	if dwMoney > 0 then
		sysItem:AddPacketMoney(dwMoney, szType)
	end
	if dwCash > 0 then
		sysItem:AddBindGold(dwCash, szType)
	end
	if dwGold > 0 then
		sysItem:AddGold(dwGold, szType)
	end
    if bSingle then
        Reward = Reward[dwChoose];
		if Reward == nil then
			return;
		else
			Reward = Reward.value;
		end
    end
    for i=1,#Reward do
        local Info = Reward[i]
        local dwItemID = Info.dwItemID
        local dwNum = Info.dwNum * dwTimes
        local dwBindType = Info.dwBindType or 0
        local dwLifeTime = Info.dwLifeTime
		local dwBornTime = Info.dwBornTime
        sysScript:AddPackItem(dwItemID,dwNum,dwBindType,dwLifeTime,dwBornTime)
    end
	local Index = self:GetIndex(dwFestival,dwLine,dwIndex)
	Index.dwGetTimes = Index.dwGetTimes + dwTimes
	Index.bReward = self:CheckIsHaveReward(dwFestival,dwLine,dwIndex)
	self:DBUpdateIndex(Index)
end
---------------------------------------------------------------------------------------
--Clt-->请求领奖
function CFestivalSystem:RecvGetReward(dwFestival,dwLine,dwIndex,dwChoose,dwTimes)
	local dwTimes = dwTimes or 1
	if self:GetRewardCheck(dwFestival,dwLine,dwIndex,dwChoose,dwTimes) then
		self:GiveReward(dwFestival,dwLine,dwIndex,dwChoose,dwTimes)
	end
	local Index = self:GetIndex(dwFestival,dwLine,dwIndex)
	self:SendAddReward({Index})
end
--Clt-->请求配置
function CFestivalSystem:RecvAskForCFG(Info)
	local Data = {}
	for k,v in pairs(Info) do
		if v.line and v.line~=0 then
			local temp = {}
			local Festival = CFestivalManager:GetFestival(v.fest)
			if Festival then
				local Line = Festival:GetLine(v.line)
				if Line then
					local cfg = CopyTable(Line:GetCFG())
					local nodes = {}
					for dwIndex,Node in pairs(cfg.Festival) do
						local node = {}
						node.fest = v.fest
						node.line = v.line
						node.index = dwIndex
						node.cfg = Node
						
						if Node.dwPos ~=0 then
							table.insert(nodes,node)
						end
					end
					cfg.Festival = nil
					temp.fest = v.fest
					temp.line = v.line
					temp.cfg = cfg
					table.insert(Data,temp)
					for i=1,#nodes do
						table.insert(Data,nodes[i])
					end
				end
			end
		else
			local temp = {}
			local Festival = CFestivalManager:GetFestival(v.fest)
			if Festival then
				local cfg = CopyTable(Festival:GetCFG())
				temp.fest = v.fest
				temp.cfg = cfg
				table.insert(Data,temp)
			end
		end
	end	
	self:SendCFG(Data)
end
---------------------------------------------------------------------------------------
-->Clt 当前活动
function CFestivalSystem:SendNowFestival(Info)
	local objPlayer = self:GetPlayer();
	for i=1,#Info do
		objPlayer.FestivalNowFestivalMsg{Info={Info[i]}}
	end
end
-->Clt 当前领奖
function CFestivalSystem:SendNowInfo(Info)
	--local objPlayer = self:GetPlayer();
	--objPlayer.FestivalMyRewardMsg{Type=0,Info=Info}
	for dwFestival,Festival in pairs(Info or {}) do
		for dwLine,Line in pairs(Festival or {}) do
			for dwIndex,Index in pairs(Line or {}) do
				local f = function()
					self:SendAddReward({Index})
				end
				table.insert(self.InitFun,f)
			end
		end
	end
end

-->Clt 配置
function CFestivalSystem:SendCFG(Info)
	local objPlayer = self:GetPlayer();
	for i=1,#Info do
		objPlayer.FestivalConfigMsg{Info={Info[i]}}
	end
end

--Clt 可领奖
function CFestivalSystem:SendAddReward(AllIndex)
	local objPlayer = self:GetPlayer();
	objPlayer.FestivalMyRewardMsg{Type=1,Info=AllIndex}
end

--Clt 领奖结果
function CFestivalSystem:SendGetRewardRes(dwRes)
	local objPlayer = self:GetPlayer();
	objPlayer.FestivalRewardResMsg{Info={dwRes}}
end

--Clt Node
function CFestivalSystem:SendNowFestivalNode(Nodes)
	local objPlayer = self:GetPlayer();
	for i=1,#Nodes do
		local Node = Nodes[i]
		for k,v in pairs(Node.Node) do
			local temp = {}
			temp.dwIndex = Node.dwIndex
			temp.dwLine = Node.dwLine
			temp.dwPos = k
			temp.Node = {}
			for j=1,#v do
				table.insert(temp.Node,v[j])
				if #temp.Node > 10 then
					objPlayer.FestivalRewardLineMsg{Info=temp}
					temp.Node = {}
				end
			end
			objPlayer.FestivalRewardLineMsg{Info=temp}
		end
	end
end













































