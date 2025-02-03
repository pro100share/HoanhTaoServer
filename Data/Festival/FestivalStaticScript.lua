--[[
	活动配置 功能脚本
	周长沙
	2013-5-15
--]]
_G.FestivalStaticScript = {}
local GetPlayerByID = function(dwRoleID)
	return CPlayerManager:GetPlayerByRoleID(dwRoleID)
end
-----------------------------------------------------------------------
------------------------------------------------------------>冲榜类脚本

--获得排行榜dwType类从dwBegin到dwEnd之间的角色ID
FestivalStaticScript[1] = function(dwType,dwBegin,dwEnd)
	local Data = CChartManager:GetChartList(dwType,dwBegin,dwEnd)
	local Info = {}
	for k,v in pairs(Data) do
		table.insert(Info,v.dwRoleID)
	end
	return Info
end

FestivalStaticScript[1001] = function(dwType,dwBegin,dwEnd,dwType2,dwBegin2,dwEnd2,dwType3,dwBegin3,dwEnd3,dwType4,dwBegin4,dwEnd4,dwType5,dwBegin5,dwEnd5,dwType6,dwBegin6,dwEnd6,dwType7,dwBegin7,dwEnd7,dwType8,dwBegin8,dwEnd8,dwType9,dwBegin9,dwEnd9)
	local Data = CChartManager:GetChartList(dwType,dwBegin,dwEnd)
	local Info = {}
	for k,v in pairs(Data) do
		table.insert(Info,v.dwRoleID)
	end
	
	Data = CChartManager:GetChartList(dwType2,dwBegin2,dwEnd2)

	for k,v in pairs(Data) do
		table.insert(Info,v.dwRoleID)
	end
	
	Data = CChartManager:GetChartList(dwType3,dwBegin3,dwEnd3)

	for k,v in pairs(Data) do
		table.insert(Info,v.dwRoleID)
	end
	Data = CChartManager:GetChartList(dwType4,dwBegin4,dwEnd4)

	for k,v in pairs(Data) do
		table.insert(Info,v.dwRoleID)
	end
	Data = CChartManager:GetChartList(dwType5,dwBegin5,dwEnd5)

	for k,v in pairs(Data) do
		table.insert(Info,v.dwRoleID)
	end
	Data = CChartManager:GetChartList(dwType6,dwBegin6,dwEnd6)

	for k,v in pairs(Data) do
		table.insert(Info,v.dwRoleID)
	end
	Data = CChartManager:GetChartList(dwType7,dwBegin7,dwEnd7)

	for k,v in pairs(Data) do
		table.insert(Info,v.dwRoleID)
	end
	Data = CChartManager:GetChartList(dwType8,dwBegin8,dwEnd8)

	for k,v in pairs(Data) do
		table.insert(Info,v.dwRoleID)
	end
	Data = CChartManager:GetChartList(dwType9,dwBegin9,dwEnd9)

	for k,v in pairs(Data) do
		table.insert(Info,v.dwRoleID)
	end
	return Info
end

FestivalStaticScript[1002] = function(dwType,dwBegin,dwEnd)
	--local Data = CChartManager:GetChartList(dwType,dwBegin,dwEnd)
	local Info = {20000002}
	return Info
end

--龙鼎 家主
FestivalStaticScript[1003] = function(dwTrophyID)
	local Info = {}
	local dwGuildID = CGuildManager:GetGuildIDByTrophyID(dwTrophyID)
	if dwGuildID then
		local objGuild = CGuildInfoMgr:Get(dwGuildID)
		if objGuild then
			table.insert(Info,objGuild.dwLeaderID)
		end
	end
	return Info
end
--龙鼎 成员
FestivalStaticScript[1004] = function(dwTrophyID)
	local Info = {}
	local dwGuildID = CGuildManager:GetGuildIDByTrophyID(dwTrophyID)
	if dwGuildID then
		local tabList = CGuildManager:GetGuildMemberList(dwGuildID)
		local objGuild = CGuildInfoMgr:Get(dwGuildID)
		for k,v in pairs(tabList) do 
			if v.dwRoleID ~= objGuild.dwLeaderID then
				table.insert(Info,v.dwRoleID)
			end
		end
	end
	return Info
end
------------------------------------------------------------------------
------------------------------------------------------------->反馈类脚本
--坐骑--阶数
FestivalStaticScript[2] = function(dwRoleID,dwLevel)
	local objPlayer = GetPlayerByID(dwRoleID)
	if not objPlayer then return false end;
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	return sysScript:CheckMountGrade(dwLevel)
end
--名剑--等级
FestivalStaticScript[3] = function(dwRoleID,dwLevel)
	local objPlayer = GetPlayerByID(dwRoleID)
	if not objPlayer then return false end;
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	return sysScript:CheckSwordLevel(dwLevel)
end
--宝甲--等级
FestivalStaticScript[4] = function(dwRoleID,dwLevel)
	local objPlayer = GetPlayerByID(dwRoleID)
	if not objPlayer then return false end;
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	return sysScript:CheckAmuletLevel(dwLevel)
end
--实战--等级
FestivalStaticScript[5] = function(dwRoleID,dwLevel)
	local objPlayer = GetPlayerByID(dwRoleID)
	if not objPlayer then return false end;
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	return sysScript:CheckBournLevel(dwLevel)
end

--修行--等级
FestivalStaticScript[6] = function(dwRoleID,dwLevel)
	local objPlayer = GetPlayerByID(dwRoleID)
	if not objPlayer then return false end;
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	return sysScript:CheckPracticeLevel(dwLevel)
end
--易筋经--等级
FestivalStaticScript[7] = function(dwRoleID,dwLevel)
	local objPlayer = GetPlayerByID(dwRoleID)
	if not objPlayer then return false end;
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	return sysScript:CheckKungFuLevel(dwLevel)
end
--血魔功--等级
FestivalStaticScript[8] = function(dwRoleID,dwLevel)
	local objPlayer = GetPlayerByID(dwRoleID)
	if not objPlayer then return false end;
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	return sysScript:CheckMegaKillLevel(dwLevel)
end



-------------------------------------------------------------------------
-------------------------------------------------------------->其他类脚本
--无需求
FestivalStaticScript[0] = function(dwRoleID,dwTimes)
	return true;
end

--充值检查(全部)
FestivalStaticScript[3001] = function(dwRoleID,dwTimes,dwGold)
	local objPlayer = GetPlayerByID(dwRoleID)
	if not objPlayer then return false end;
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	local Gold = sysScript:GetCharge()
	return Gold.All >= dwGold 
end

--充值检查(单笔最大)
FestivalStaticScript[3002] = function(dwRoleID,dwTimes,dwGold)
	local objPlayer = GetPlayerByID(dwRoleID)
	if not objPlayer then return false end;
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	local Gold = sysScript:GetCharge()
	return Gold.Sig >= dwGold
end

--充值检查(本日)
FestivalStaticScript[3003] = function(dwRoleID,dwTimes,dwGold)
	local objPlayer = GetPlayerByID(dwRoleID)
	if not objPlayer then return false end;
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	local Gold = sysScript:GetCharge()
	return Gold.Day >= dwGold * (dwTimes+1)
end

--充值检查(本周)
FestivalStaticScript[3004] = function(dwRoleID,dwTimes,dwGold)
	local objPlayer = GetPlayerByID(dwRoleID)
	if not objPlayer then return false end;
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	local Gold = sysScript:GetCharge()
	return Gold.Week >= dwGold
end

--vip 检查
FestivalStaticScript[3005] = function(dwRoleID,dwTimes)
	local objPlayer = GetPlayerByID(dwRoleID)
	if not objPlayer then return false end;
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	return sysScript:IsVip()
end

--元宝消费检查(全部)
FestivalStaticScript[3006] = function(dwRoleID,dwTimes,dwGold)
	local objPlayer = GetPlayerByID(dwRoleID)
	if not objPlayer then return false end;
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	local Gold = sysScript:GetCharge()
	return Gold.CAll >= dwGold 
end

--元宝消费检查(单笔最大)
FestivalStaticScript[3007] = function(dwRoleID,dwTimes,dwGold)
	local objPlayer = GetPlayerByID(dwRoleID)
	if not objPlayer then return false end;
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	local Gold = sysScript:GetCharge()
	return Gold.CSig >= dwGold
end

--元宝消费检查(本日)
FestivalStaticScript[3008] = function(dwRoleID,dwTimes,dwGold)
	local objPlayer = GetPlayerByID(dwRoleID)
	if not objPlayer then return false end;
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	local Gold = sysScript:GetCharge()
	return Gold.CDay >= dwGold * (dwTimes+1)
end

--元宝消费检查(本周)
FestivalStaticScript[3009] = function(dwRoleID,dwTimes,dwGold)
	local objPlayer = GetPlayerByID(dwRoleID)
	if not objPlayer then return false end;
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	local Gold = sysScript:GetCharge()
	return Gold.CWeek >= dwGold
end

--充值检查 日期-日期 (20130706 - 20130716)
FestivalStaticScript[3010] = function(dwRoleID,dwTimes,dwStart,dwEnd,dwGold)
	local objPlayer = GetPlayerByID(dwRoleID)
	if not objPlayer then return false end;
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	local dwCharge = sysScript:GetRegionCharge(dwStart,dwEnd)
	return dwCharge >= dwGold * (dwTimes+1)
end

--消费检查 日期-日期 (20130706 - 20130716)
FestivalStaticScript[3011] = function(dwRoleID,dwTimes,dwStart,dwEnd,dwGold)
	local objPlayer = GetPlayerByID(dwRoleID)
	if not objPlayer then return false end;
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	local dwCost = sysScript:GetRegionCost(dwStart,dwEnd)
	return dwCost >= dwGold * (dwTimes+1)
end

--充值检查 服务器开启后几天到几天 （1-5）
FestivalStaticScript[3012] = function(dwRoleID,dwTimes,dwStart,dwEnd,dwGold)
	local objPlayer = GetPlayerByID(dwRoleID)
	if not objPlayer then return false end;
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	local dwCharge = sysScript:GetRelCharge(dwStart,dwEnd)
	return dwCharge >= dwGold * (dwTimes+1)
end

--消费检查 服务器开启后几天到几天 （1-15）
FestivalStaticScript[3013] = function(dwRoleID,dwTimes,dwStart,dwEnd,dwGold)
	local objPlayer = GetPlayerByID(dwRoleID)
	if not objPlayer then return false end;
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	local dwCost = sysScript:GetRelCost(dwStart,dwEnd)
	return dwCost >= dwGold * (dwTimes+1)
end



--充值检查 服务器开启后几天到几天 （1-5）
FestivalStaticScript[3014] = function(dwRoleID,dwTimes,dwStart,dwEnd,dwGold,Current)
	if dwTimes > 0 then return false end;
	local objPlayer = GetPlayerByID(dwRoleID)
	if not objPlayer then return false end;
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	--计算出可领取奖励的天数
	local Tally = 0;
	for i = dwStart,dwEnd do
		local dwCharge = sysScript:GetRelCharge(i,i)
		if dwCharge >= dwGold then
			Tally = Tally + 1;
		end
	end
	if (Tally < Current) then
		return false
	else
		return true
	end
end


--充值检查 绝对值时间 日期-日期 (20130706 - 20130716)
FestivalStaticScript[3015] = function(dwRoleID,dwTimes,dwStart,dwEnd,dwGold,Current)
	if dwTimes > 0 then return false end;
	local objPlayer = GetPlayerByID(dwRoleID)
	if not objPlayer then return false end;
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	--计算出可领取奖励的天数
	local Tally = 0;
	
	for i = dwStart,dwEnd do
		local dwCharge = sysScript:GetRegionCharge(i,i)
		if dwCharge >= dwGold then
			Tally = Tally + 1;
		end
	end
	if (Tally < Current) then
		return false
	else
		return true
	end
end

--检测登录天数
FestivalStaticScript[3016]=function(dwRoleID,dwTimes,startDate,endDate,dwDays)
	if dwTimes > 0 then return false end;
	local szStartDate=startDate;
	local szEndDate=endDate;
	
	if type(startDate)=="number" then
		local date=startDate
		local day=math.fmod(date,100);
		local month=(math.fmod(date,10000)-day)/100
		local year=(date-month*100-day)/10000
		szStartDate=year .."-".. month .."-"..day
	end
	if type(endDate) =="number" then
		local date=endDate
		local day=math.fmod(date,100);
		local month=(math.fmod(date,10000)-day)/100
		local year=(date-month*100-day)/10000
		szEndDate=year .."-".. month .."-"..day
	end
	
	local objPlayer = GetPlayerByID(dwRoleID)
	if not objPlayer then return false end;
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	return sysScript:GetLoginDays(szStartDate,szEndDate)>=dwDays
end
