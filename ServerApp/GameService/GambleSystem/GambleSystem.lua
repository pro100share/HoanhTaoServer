--[[
功能：摇骰子系统（服务器）
作者：周长沙
时间：2013-1-17
]]
-------------------------------------
_G.CGambleSystem = {}
-------------------------------------
--数值 to 表
local function itot(i)
	local t = {}
	i = i or 0
	while i > 0 do
		local f = math.mod(i,10)
		table.insert(t,math.floor(f))
		i = math.floor(i/10)
	end
	return t
end
--表 to 数值
local function ttoi(t)
	local n = 0
	for i=6,1,-1 do
		n = n*10+(t[i] or 0)
	end
	return n
end

-------------------------------------
function CGambleSystem:new()
	local obj = CSystem:new("CGambleSystem");
	---------------------------------------------
	for i,v in pairs(CGambleSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end

function CGambleSystem:Create()
	return true;
end
function CGambleSystem:Update(dwInterval)
	return true
end

function CGambleSystem:Destroy()
	return true
end
--客户端进入游戏登入所有场景之后
function CGambleSystem:OnEnterScene()
	self:SendInfo(0)
end;
------------------------------------------------------------------
--获得可以摇骰子的次数
function CGambleSystem:GetGambleTime()
	local dwGambleTime = self:GetPlayer():GetSystem("CRefreshSystem"):GetData(0801)
	return dwGambleTime
end
--获得踢桌子的次数
function CGambleSystem:GetFreeTime()
	local dwFreeTime = self:GetPlayer():GetSystem("CRefreshSystem"):GetData(0802)
	local sysVip = self:GetPlayer():GetSystem("CVipSystem")
	if sysVip:isVip() then
		dwFreeTime = dwFreeTime + 2
	end
	return dwFreeTime
end

function CGambleSystem:GetResult()
	local Result = self:GetPlayer():GetSystem("CRefreshSystem"):GetData(0803)
	return itot(Result)
end
function CGambleSystem:SetResult(Result)
	self:GetPlayer():GetSystem("CRefreshSystem"):SetData(0803,ttoi(Result))
	if Result[6]==6 then
		local objPlayer = self:GetPlayer()
		if not objPlayer then return end;
		local szName = objPlayer:GetName()
		CScriptManager:ChatNoticeAll(GambleConfig.StrIndex.ntcAll,7,bSystem,{{szFunStr=szName,dwFunId=27,param={objPlayer:GetRoleID(),objPlayer:GetName()}};{szFunStr=GambleConfig.StrIndex.lblTry,dwFunId=26}})
	end
end
function CGambleSystem:GetAll()
	local Info = {}
	Info.dwGambleTime = self:GetGambleTime()
	Info.dwFreeTime = self:GetFreeTime()
	Info.Result = self:GetResult()
	return Info
end
function CGambleSystem:GetGold()
	local objPlayer = self:GetPlayer()
	local sysItem = objPlayer:GetSystem("CItemSystem")
	return sysItem:GetGoldNum()
end
function CGambleSystem:GetBGold()
	local objPlayer = self:GetPlayer()
	local sysItem = objPlayer:GetSystem("CItemSystem")
	return sysItem:GetBindGoldNum()
end

function CGambleSystem:CostGold(dwValue,dwValueB)
	local objPlayer = self:GetPlayer()
	local sysItem = objPlayer:GetSystem("CItemSystem")
	if dwValue>0 then
		return sysItem:CostGold(dwValue, _G.ItemSysOperType.Gamble)
	else
		return sysItem:CostBindGold(dwValueB, _G.ItemSysOperType.Gamble)
	end
end
------------------------------------------------------------------
function CGambleSystem:Start()
	local Info = {}
	local Per = nil
	if self:GetGold() > 0 then
		Per = GambleConfig.Per.yper
	else
		Per = GambleConfig.Per.nper
	end
	local dwMaxPer = 0
	for k,v in pairs(Per) do
		dwMaxPer = dwMaxPer + v
	end
	
	for i=1,GambleConfig.dwNum do
		local dwRandom = math.random(1,dwMaxPer-1)
		local bMatch = false
		for k,v in pairs(Per) do
			if not bMatch then
				if dwRandom<v then
					Info[k] = (Info[k] or 0) + 1
					bMatch = true
				else
					dwRandom = dwRandom - v
				end
			end
		end
	end
	for i=1,6 do
		if not Info[i] then
			 Info[i] = 0
		end
	end
	self:SetResult(Info)
	self:SendInfo(1)
	self:GetPlayer():GetSystem('CPlayerEventCenterSystem'):DoEvent(enumPlayerEventType.EventGamble,1)
	return true
end
function CGambleSystem:Reward()
	local objPlayer = self:GetPlayer()
	local sysFive = objPlayer:GetSystem("CFiveElemSystem")
	local Result = self:GetResult()
	local All 	= Result[6] or 0
	local Metal = (Result[1] or 0)*GambleConfig.Reward[1] + All*GambleConfig.Reward[6]*GambleConfig.Multiple[All]
	local Wood 	= (Result[2] or 0)*GambleConfig.Reward[2] + All*GambleConfig.Reward[6]*GambleConfig.Multiple[All]
	local Water = (Result[3] or 0)*GambleConfig.Reward[3] + All*GambleConfig.Reward[6]*GambleConfig.Multiple[All]
	local Fire 	= (Result[4] or 0)*GambleConfig.Reward[4] + All*GambleConfig.Reward[6]*GambleConfig.Multiple[All]
	local Earth = (Result[5] or 0)*GambleConfig.Reward[5] + All*GambleConfig.Reward[6]*GambleConfig.Multiple[All]
	
	if Result[6] and Result[6] == 6 then
		_info("----Gamble Get FiveElement Reward---", objPlayer:GetRoleID(), Metal, Wood, Water, Fire, Earth);
	end;
	
	local uItemGold, uItemWood, uItemWater, uItemFire, uItemEarth  = sysFive:GetElemValue()	
	--消耗真气
	sysFive:ChangeAttr('dwMetalValue', Metal )
	sysFive:ChangeAttr('dwWoodValue', Wood )
	sysFive:ChangeAttr('dwWaterValue', Water )
	sysFive:ChangeAttr('dwFireValue', Fire )
	sysFive:ChangeAttr('dwEarthValue', Earth )
	
	local setData = {
		[1] = {dwCurrent = uItemGold, dwChange = Metal};
		[2] = {dwCurrent = uItemWood, dwChange = Wood};
		[3] = {dwCurrent = uItemWater, dwChange = Water};
		[4] = {dwCurrent = uItemFire, dwChange = Fire};
		[5] = {dwCurrent = uItemEarth, dwChange = Earth};
	}
	CLogSystemManager:zhenqi(objPlayer, setData, _G.FiveElemSysOperType.GambleSystem)	

	self:GetPlayer():GetSystem("CRefreshSystem"):SetData(0803,0)
	self:SendRes(1)--领取完成
	return true
end
function CGambleSystem:Change()
	local objPlayer = self:GetPlayer()
	local sysFive = objPlayer:GetSystem("CFiveElemSystem")
	local Result = self:GetResult()
	local All = Result[6] or 0
	local dwRemain = GambleConfig.dwNum - All
	local Per = nil
	if self:GetGold() > 0 then
		Per = GambleConfig.Per.yper
	else
		Per = GambleConfig.Per.nper
	end
	local dwMaxPer = 0
	for k,v in pairs(Per) do
		dwMaxPer = dwMaxPer + v
	end
	for i=1,5 do
		Result[i] = 0
	end
	for i=1,dwRemain do
		local dwRandom = math.random(1,dwMaxPer-1)
		local bMatch = false
		for k,v in pairs(Per) do
			if not bMatch then
				if dwRandom<v then
					Result[k] = (Result[k] or 0) + 1
					bMatch = true
				else
					dwRandom = dwRandom - v
				end
			end
		end
	end
	for i=1,6 do
		if not Result[i] then
			 Result[i] = 0
		end
	end
	-- print(ttoi(Result))
	self:SetResult(Result)
	self:SendInfo(2)
	return true
end
------------------------------------------------------------------
function CGambleSystem:OnRcevGetInfoMsg()
	self:SendInfo(0)
	return true
end
function CGambleSystem:OnRcevStartMsg()
	local dwGambleTime = self:GetGambleTime()
	if dwGambleTime > 0 then
		self:GetPlayer():GetSystem("CRefreshSystem"):SetData(0801,dwGambleTime-1)
		return self:Start()
	end
	return false
end
function CGambleSystem:OnRcevRewardMsg()
	local Result = self:GetResult()
	if self:GetPlayer():GetSystem("CRefreshSystem"):GetData(0803) > 0 then
		self:Reward()
	end
	return false
end
function CGambleSystem:OnRcevFreeChangeMsg()
	local dwFreeTime = self:GetFreeTime()
	if dwFreeTime > 0 then
		local objSys = self:GetPlayer():GetSystem("CRefreshSystem")
		objSys:SetData(0802,objSys:GetData(0802) - 1)
		return self:Change()
	end
	return false
end
function CGambleSystem:OnRcevChangeMsg()
	local dwCost = GambleConfig.dwCost
	local dwBCost = GambleConfig.dwBCost
	if self:GetGold() >= dwCost then
		if self:GetBGold() >= dwBCost then
			self:CostGold(dwCost,dwBCost)
			self:Change()
		else
			local objPlayer = self:GetPlayer()
			local sysScript = objPlayer:GetSystem("CScriptSystem")
			sysScript:Notice(13001350015)
		end
	else
		local objPlayer = self:GetPlayer()
		local sysScript = objPlayer:GetSystem("CScriptSystem")
		sysScript:Notice(13001310012)
	end
	return false
end
--接收到特殊操作消息
local dwLastChange = 0
function CGambleSystem:OnEventCenter(szEventName,dwDataID,dwValue)
	self.dwEventTime = self.dwEventTime or 0
	if "EventRefreshData" == szEventName then
		if (dwDataID == 0801) or (dwDataID == 0802) or (dwDataID == 0803) then
			self.dwEventTime = self.dwEventTime + 1
			if self.dwEventTime == 3 then
				self.dwEventTime = 0
				self:SendInfo(0)
			end
		end
	end
	if "EventVipLastTime" == szEventName then
		self:SendInfo(0)
	end
end
----------------------------------------
function CGambleSystem:SendInfo(dwType)
	local objPlayer = self:GetPlayer()
	objPlayer.GambleGetInfoMsg{
		Type = dwType;
		Info = self:GetAll();
	}
end
function CGambleSystem:SendRes(dwRes)
	local objPlayer = self:GetPlayer()
	objPlayer.GambleGetResMsg{
		Res = dwRes
	}
end
----------------------------------------

















