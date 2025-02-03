--[[
功能：引入收集功能相关的LUA文件（服务器）
作者：周长沙
时间：2013-1-22
]]
_G.CCollect = {}
local Config = CollectConfig
---------------------------------------------------
--本地函数
--字符串切割，参数： 源字符串，切割符
--返回：切割后的表
local function Split(szFullString, szSeparator)
	local nFindStartIndex = 1
	local nSplitIndex = 1
	local nSplitArray = {}
	while true do
	   local nFindLastIndex = string.find(szFullString, szSeparator, nFindStartIndex)
	   if not nFindLastIndex then
			nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len(szFullString))
			break
	   end
	   nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, nFindLastIndex - 1)
	   nFindStartIndex = nFindLastIndex + string.len(szSeparator)
	   nSplitIndex = nSplitIndex + 1
	end
	return nSplitArray
end
---------------------------------------------------
function CCollect:new(dwPageID,dwSeriesID,bSp)
	if not Config[dwPageID] then
		return;
	end
	if not Config[dwPageID][dwSeriesID] then
		return;
	end
	local obj = {}
	for k,v in pairs(CCollect) do
		obj[k]=v
	end
	obj.dwPageID = dwPageID
	obj.dwSeriesID = dwSeriesID
	obj.dwState = 0
	obj.Config = Config[dwPageID][dwSeriesID]
	obj.bSp = bSp
	if bSp then
		obj.ConfigSp = CollectSubConfig[Config[dwPageID].dwSubConfig]
	end
	return obj
end

function CCollect:InitDB(dwState,szNum,dwRoleID)
	local obj = setmetatable({},{__index=self})
	obj.dwPageID = self.dwPageID
	obj.dwSeriesID = self.dwSeriesID
	obj.dwState = dwState or self.dwState
	obj.szNum = szNum or ""
	obj.Schedule = {}
	obj.dwSchedule = 0
	obj.dwRoleID = dwRoleID or 0
	if not obj.bSp then
		for k,v in pairs(obj.Config.Item) do
			obj.Schedule[k] = 0;
			obj.dwSchedule = obj.dwSchedule + 1
		end
	else
		for k,v in pairs(obj.ConfigSp.Items) do
			obj.Schedule[k] = 0;
			obj.dwSchedule = obj.dwSchedule + 1
		end
	end
	obj:UnPack()
	return obj
end
-----------------------------------------------------
function CCollect:Pack()
	local szNum = ""
	for i=1,#self.Schedule do
		if i <= self.dwSchedule then
			szNum = szNum..(tostring(self.Schedule[i]) or 0)..";"
		end
	end
	self.szNum = szNum
	local obj = {}
	obj.dwRoleID = self.dwRoleID
	obj.dwPageID = self.dwPageID
	obj.dwSeriesID = self.dwSeriesID
	obj.dwState = self.dwState
	obj.szNum = self.szNum
	return obj
end
function CCollect:UnPack()
	local Info = Split(self.szNum, ";")
	for i=1,#Info do
		if i <= self.dwSchedule then
			local dwNum = tonumber(Info[i]) or 0
			self.Schedule[i] = dwNum
		end
	end
	return self
end
------------------------------------------------------
function CCollect:GetPageID()
	return self.dwPageID
end
function CCollect:GetSeriesID()
	return self.dwSeriesID
end
function CCollect:GetState()
	return self.dwState
end
function CCollect:IsSp()
	return self.bSp
end
-------------------------------------------------------
function CCollect:GetItemNeedNum(dwItemID)
	if self.bSp then
		local cfg = self.ConfigSp.Items
		for i=1,#cfg do
			local Info = cfg[i]
			if Info.dwItemID==dwItemID then
				local dwNow = self.Schedule[i]
				return 1-dwNow,i
			end
		end
	end
	local cfg = self.Config.Item
	for i=1,#cfg do
		local Info = cfg[i]
		if Info.Id==dwItemID then
			local dwMax = Info.Num
			local dwNow = self.Schedule[i]
			return dwMax-dwNow,i
		end
	end
end

function CCollect:SetSchedule(dwIndex,dwValue)
	self.Schedule[dwIndex] = self.Schedule[dwIndex] + dwValue
	if self:CheckSchedule() then
		self:SetState(1)
		return true
	end
	return false
end

function CCollect:CheckSchedule()
	local cfg = nil
	if not self.bSp then
		cfg = self.Config.Item
	else
		cfg = self.ConfigSp.Items
	end
	for i=1,#cfg do
		local Info = cfg[i]
		local dwMax = Info.Num or 1
		local dwNow = self.Schedule[i]
		if dwMax > dwNow then
			return false;
		end
	end
	return true;
end

function CCollect:SetState(dwState)
	self.dwState = dwState
end

function CCollect:GetReward()
	if not self.bSp then
		return self.Config.Reward
	end
	local Reward = {}
	for i=1,6 do
		local add = math.floor(i/4)
		local pos = {
					i+add;
					i+add+1;
					i+add+4;
					i+add+5;
				}
		local bAll = true
		for k,v in pairs(pos) do
			if (not self.Schedule[v]) or (self.Schedule[v]<1) then
				bAll = false;
				break;
			end
		end
		if bAll then
			local szValue = self.ConfigSp.Values[i].szValueType
			local dwValue = self.ConfigSp.Values[i].dwValue
			Reward[szValue] = (Reward[szValue] or 0) + dwValue
		end
	end

	for k,v in pairs(self.ConfigSp.Values[0].Reward) do            --特殊属性奖励更改      create by 赵飞
		local dwValue = self.ConfigSp.Values[0].Reward[k]
		local dwNow = 0
		local dwMax = #self.ConfigSp.Items
		for k,v in pairs(self.Schedule) do
			if v>0 then
				dwNow = dwNow + 1
			end
		end
		dwValue = math.floor(dwValue*dwNow/dwMax)
		Reward[k] = (Reward[k] or 0) + dwValue
	end
	return Reward
end























































