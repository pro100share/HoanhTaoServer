--[[
	节日脚本
	周长沙
	2013-5-23
--]]
---------------------------------------------------------------------------
--------坐骑
--等级
function CScriptSystem:CheckMountLevel(dwLevel)
	local objPlayer = self:GetPlayer()
	local sysMount = objPlayer:GetSystem("CMountSystem")
	local dwMaxLevel = 0
	
	for _,Mount in pairs(sysMount.t_Mount) do
		local n_Level = Mount.n_Level
		if n_Level > dwMaxLevel then--等级
			dwMaxLevel = n_Level
		end
	end
	return dwLevel <= dwMaxLevel
end
--等阶
function CScriptSystem:CheckMountGrade(dwLevel)
	local objPlayer = self:GetPlayer()
	local sysMount = objPlayer:GetSystem("CMountSystem")
	local dwMaxGrade = 0
	
	for _,Mount in pairs(sysMount.t_Mount) do
		local n_Grade = Mount:GetGrade()--等阶
		if n_Grade > dwMaxGrade then
			dwMaxGrade = n_Grade
		end
	end
	return dwLevel <= dwMaxGrade
end

------名剑
--等阶
function CScriptSystem:CheckSwordLevel(dwLevel)
	local objPlayer = self:GetPlayer()
	local sysSword = objPlayer:GetSystem("CSwordSystem")
	return sysSword:GetSwordLadder() >= dwLevel
end
--等阶

------宝甲
--等阶
function CScriptSystem:CheckAmuletLevel(dwLevel)
	local objPlayer = self:GetPlayer()
	local sysAmulet = objPlayer:GetSystem("CAmuletSystem")
	return sysAmulet:GetLevel() >= dwLevel
end
--等阶

------实战
--等级
function CScriptSystem:CheckBournLevel(dwLevel)
	local objPlayer = self:GetPlayer()
	local sysBourn = objPlayer:GetSystem("CBournSystem")
	return sysBourn:GetBournLv() >= dwLevel
end

-----修行--等级
function CScriptSystem:CheckPracticeLevel(dwLevel)
	local objPlayer = self:GetPlayer()
	local sysObj = objPlayer:GetSystem("CPracticeSystem")
	return sysObj:GetPracticeLevel() >= dwLevel
end


---易筋经--等级
function CScriptSystem:CheckKungFuLevel(dwLevel)
	local objPlayer = self:GetPlayer()
	local sysObj = objPlayer:GetSystem("CKungFuSystem")
	return sysObj:GetKungfuLevel(1) >= dwLevel
end


-----血魔功--等级
function CScriptSystem:CheckMegaKillLevel(dwLevel)
	local objPlayer = self:GetPlayer()
	local sysObj = objPlayer:GetSystem("CMegaKillSystem")
	return sysObj:GetLevelVal() >= dwLevel
end

function CScriptSystem:GetLoginDays(szStartDate,szEndDate)
	local objPlayer = self:GetPlayer()
	local sysObj = objPlayer:GetSystem("CLoginDaysSystem")
	-- print("^^^^^^^^^^^^^^^^^^^^^^",sysObj:GetLoginDays(szStartDate,szEndDate))
	return sysObj:GetLoginDays(szStartDate,szEndDate)
end



-------------------------------------------------------------------------
--充值记录
function CScriptSystem:GetDateCharge(y,m,d)
	local dwIndex = y*10000+m*100+d
	return self.ChargeList[dwIndex] or 0
end

--20140713
function CScriptSystem:GetNumCharge(dwIndex)
	local dwIndex = dwIndex
	return self.ChargeList[dwIndex] or 0
end

--消费记录
function CScriptSystem:GetDateCost(y,m,d)
	local dwIndex = y*10000+m*100+d
	return self.CostList[dwIndex] or 0
end

--20140706
function CScriptSystem:GetNumCost(dwIndex)
	local dwIndex = dwIndex
	return self.CostList[dwIndex] or 0
end

--某段时间内的充值记录(20130712-20130712)
function CScriptSystem:GetRegionCharge(dwStart,dwEnd)
	local dwCharge = 0
	for dwIndex=dwStart,dwEnd do
		dwCharge = dwCharge + (self.ChargeList[dwIndex] or 0)
	end
	return dwCharge
end

--某段时间内的消费记录(20130712-20130712)
function CScriptSystem:GetRegionCost(dwStart,dwEnd)
	local dwCost = 0
	for dwIndex=dwStart,dwEnd do
		dwCost = dwCost + (self.CostList[dwIndex] or 0)
	end
	return dwCost
end

--开服后几天到几天间的充值记录
function CScriptSystem:GetRelCharge(dwStart,dwEnd)
	local dwServerStart = CTimeRewardManager:GetServerStartTime()
	local dwStartTime = dwServerStart + 1000*60*60*24*(dwStart - 1)
	local dwEndTime = dwServerStart + 1000*60*60*24*(dwEnd - 1)
	local sy,sm,sd = CTimeFormat:mtodate(dwStartTime, true,true)
	local ey,em,ed = CTimeFormat:mtodate(dwEndTime, true,true)
	local dwRealS = sy*10000+sm*100+sd
	local dwRealE = ey*10000+em*100+ed

	local dwCharge = 0
	for dwIndex=dwRealS,dwRealE do
		dwCharge = dwCharge + (self.ChargeList[dwIndex] or 0)
	end
	return dwCharge
end

--开服后几天到几天间的消费记录
function CScriptSystem:GetRelCost(dwStart,dwEnd)
	local dwServerStart = CTimeRewardManager:GetServerStartTime()
	local dwStartTime = dwServerStart + 1000*60*60*24*(dwStart - 1)
	local dwEndTime = dwServerStart + 1000*60*60*24*(dwEnd - 1)
	local sy,sm,sd = CTimeFormat:mtodate(dwStartTime, true,true)
	local ey,em,ed = CTimeFormat:mtodate(dwEndTime, true,true)
	local dwRealS = sy*10000+sm*100+sd
	local dwRealE = ey*10000+em*100+ed
	
	local dwCost = 0
	for dwIndex=dwRealS,dwRealE do
		dwCost = dwCost + (self.CostList[dwIndex] or 0)
	end
	return dwCost
end

--获取今天一小时充值数
function CScriptSystem:GetTodayOneHourChargeNum()
	return self.Charge.TodayNum;
end;

--获取指定时间段内充值大于指定数额的天数
function CScriptSystem:GetDayNumGreaterThanMoney(money, timeA, timeB)
	local num = 0;
	for n=timeA, timeB do
		if self.ChargeList[n] and self.ChargeList[n] >= money then
			num = num + 1;
		end;
	end;
	return num;
end



