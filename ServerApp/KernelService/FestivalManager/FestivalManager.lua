--[[
	ks 活动管理（开启 结束）
	周长沙
	2013-5-20
--]]
-------------------------------------------------------
_G.CFestivalManager = CSingle:new();
CSingleManager:AddSingle(CFestivalManager,true);
-------------------------------------------------------
CFestivalManager.AllFestival = {}
CFestivalManager.MsgList = {}
CFestivalManager.bChecking = false
local dwLastCheck = 0		--上次检查时间
local dwDelay = 10*1000		--检查频率（毫秒）
local bSixUpdate = false
-------------------------------------------------------

function CFestivalManager:Create()
	FestivalJson:Init()
	self.objDB = CPlayerDBQuery:GetDBQuery()
	self.CFG = FestivalMainConfig
	self.AllFestival = {}
	self:InitFestival()
	self:CheckFestivalDBData()
	self:CheckFestivalData()
	self:SaveAll()
	dwLastCheck = _now()
end

function CFestivalManager:Update()
	if self.MsgList[1] then
		local f = self.MsgList[1]
		table.remove(self.MsgList,1)
		f()
	end
	
	if _now() - dwLastCheck > dwDelay  then
		--CScriptManager:ReLoad(1)
		local dwTempTime = dwLastCheck
		dwLastCheck = _now()
		
		self:OnTimeClick(dwLastCheck)
		
		if not CTimeFormat:isToday(dwTempTime or _now()) then
			-- local res = CScriptManager:ReLoad(1)
			-- _info("FestivalJson:Reload() At 00:00->"..tostring(res))
			bSixUpdate = false;
			return;
		end
	
		if not bSixUpdate then
			local y,m,d,h = CTimeFormat:mtodate(_now(), true,true)
			if tonumber(h) == 18 then
				-- local res = CScriptManager:ReLoad(1)
				-- _info("FestivalJson:Reload() At 18:00->"..tostring(res))
				bSixUpdate = true;
				return;
			end
		end
	end
	return true;
end;

function CFestivalManager:Destroy()

end;
--------------------------------------------------------
--初始化 节日
function CFestivalManager:InitFestival()
	for dwIndex,Info in pairs(self.CFG) do
		if Info.szName then
			local Festival = CFestival:new(dwIndex)
			self.AllFestival[dwIndex] = Festival
		end
	end
end

--获取节日
function CFestivalManager:GetFestival(dwIndex)
	return self.AllFestival[dwIndex]
end

-- 时间检查
function CFestivalManager:OnTimeClick()
	local dwNowTime = _now()
	for dwIndex,Festival in pairs(self.AllFestival) do
		if Festival:IsProcess() then
			Festival:OnEndTimeCheck(dwNowTime)
		else
			Festival:OnStartTimeCheck(dwNowTime)
		end
	end
end
--------------------------------------------------------
--DB 时间检查
function CFestivalManager:CheckFestivalDBData()
	local Data = self:ReadFestivalStartInfo()
	for k,v in pairs(Data) do
		local Festival = self:GetFestival(v.dwFestival)
		if Festival then
			Festival:CheckStartTime(v.dwStartTime)
		else
			self:DelFestivalStartInfo(v.dwFestival)
		end
	end
end
--非DB 时间检查
function CFestivalManager:CheckFestivalData()
	for dwFestival,Festiva in pairs(self.AllFestival) do
		if not Festiva:IsChecked() then
			Festiva:CheckStartTime(-1)
		end
	end
end
----------------------------------------------------------------------------------
---------------------------------------获取发送信息
--ALL
function CFestivalManager:GetSendInfo()
	local Info = {}
	for k,v in pairs(self.AllFestival) do
		Info[k] = v:GetSendInfo()
	end
	return Info
end
--Festival
function CFestivalManager:GetFestivalSendInfo(dwFestival)
	return self:GetFestival(dwFestival):GetSendInfo()
end
--Line
function CFestivalManager:GetLineSendInfo(dwFestival,dwLine)
	return self:GetFestival(dwFestival):GetLineSendInfo(dwLine)
end


--广播
function CFestivalManager:SendFestivalModi()
	local f = function()
		for dwLineID,objLine in pairs(CGameLineManager:GetAllLine()) do
			objLine.KSFestivalModiMsg{}
		end
	end
	self:AddMsg(f)
end

--添加消息队列
function CFestivalManager:AddMsg(f)
	table.insert(self.MsgList,f)
end

