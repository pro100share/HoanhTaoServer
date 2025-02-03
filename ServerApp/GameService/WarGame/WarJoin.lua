--世家战参与管理器
--

_G.CWarJoin = CSingle:new();

CSingleManager:AddSingle(CWarJoin);

CWarJoin.setAllWar = {};

local function IsInDays(dwDay,tbDay)
	for n,v in pairs(tbDay)do
		if v == dwDay then
			return true;
		end
	end
	return false;
end;

function CWarJoin:Create()
	
	return true;
end;

function CWarJoin:Update()
	
	return true;
end;

function CWarJoin:Destroy()
	
end;

---------------------------------------------------------------------------------------------------
--添加一个已有的战争
function CWarJoin:AddWar(dwID)
	self.setAllWar[dwID] = dwID;
	-- print("================add war",dwID)
	
	local tbNet = {};
	local tbPlayer = CMapManager:GetPlayer();
	if tbPlayer then
		for n,objRole in pairs(tbPlayer)do
			if objRole then
				table.insert(tbNet,objRole.objNet);
			end
		end
	end
	
	_groupcallout(tbNet,"OnWarStartFlagMsg",
	{
		WarID = dwID;
		Flag = 1;
	});
end;

--移除一个过期的战争
function CWarJoin:RmvWar(dwID)
	self.setAllWar[dwID] = nil;
	-- print("================rmv war",dwID)
	
	local tbNet = {};
	local tbPlayer = CMapManager:GetPlayer();
	if tbPlayer then
		for n,objRole in pairs(tbPlayer)do
			if objRole then
				table.insert(tbNet,objRole.objNet);
			end
		end
	end
	
	_groupcallout(tbNet,"OnWarStartFlagMsg",
	{
		WarID = dwID;
		Flag = 0;
	});
end;

function CWarJoin:InitWar(tbList)
	for n,v in pairs(tbList)do
		self.setAllWar[v] = v;
	end
end

--
function CWarJoin:IsOpen(dwID)
	return self.setAllWar[dwID];
end;

--检测这个战争是否允许进入
function CWarJoin:CheckJoinTime(dwID)
	local tbEnterCon = WarEnterConfig[dwID];
	if not tbEnterCon then
		return false;
	end
	
	local _, _, startHour, startMin = string.find(tbEnterCon.EnterTime, "(%d*).(%d*)");
	local _, _, endHour, endMin = string.find(tbEnterCon.ExitTime, "(%d*).(%d*)");
	local startTime = CTimeFormat:GetTodayThisTimeMsec(tonumber(startHour), tonumber(startMin));
	local endTime = CTimeFormat:GetTodayThisTimeMsec(tonumber(endHour), tonumber(endMin));
	
	if not IsInDays(CTimeFormat:toweekEx(GetCurTime(1)), tbEnterCon.WeeklyOpenDay) then	
		return false;
	end;
	if GetCurTime() < startTime or GetCurTime() > endTime then
		return false;
	end;
	
	return true;
end;

--
function CWarJoin:CheckJoinCondition(dwID,objPlayer)
	local cfgWar = WarConfig[dwID];
	if not cfgWar then
		return false;
	end
	
	return cfgWar:CheckEnterConditionForServer(objPlayer);
end;

--
function CWarJoin:BroadcastWarNotice(dwNoticeType,dwStringID,tbParam)
	local tbNet = {};
	for n,ply in pairs(CMapManager:GetPlayer())do
		-- ply.OnWarNoticeMsg
		-- {
			-- NoticeType = dwNoticeType;
			-- StringID = dwStringID;
			-- Param = tbParam;
		-- }
		table.insert(tbNet,ply.objNet)
	end
	
	_groupcallout(tbNet,"OnWarNoticeMsg",
	{
		NoticeType = dwNoticeType;
		StringID = dwStringID;
		Param = tbParam;
	});
end;

--一周的分钟数
local dwNumberPerWeek = 7*24*60;
--一天的分钟数
local dwNumberPerDay = 24*60;

local function GetFrontPoint(dwCur)
	if dwCur <= 0 then
		return dwNumberPerWeek-1;
	end
	
	return dwCur-1;
end

--返回战场开启的剩余时间，单位：秒
function CWarJoin:GetLastBeginTime(dwWarID)
	local tbEnterCon = WarEnterConfig[dwWarID];
	if not tbEnterCon then
		return nil;
	end
	
	--时间数组，只有一个星期的长度
	local tbTimeList = {};
	
	--开始时间段
	local tbWeek = tbEnterCon.WeeklyOpenDay;
	local szBeginTime = tbEnterCon.EnterTime;
	local _, _, dwBeginHour, dwBeginMinute = string.find(szBeginTime, "(%d*):(%d*)");
	local szEndTime = tbEnterCon.ExitTime;
	local _, _, dwEndHour, dwEndMinute = string.find(szEndTime, "(%d*):(%d*)");
	--计算开启的时间段，写到数组中
	for n,v in pairs(tbWeek)do
		local dwBegin = v * dwNumberPerDay + dwBeginHour*60 + dwBeginMinute;
		local dwEnd = v * dwNumberPerDay + dwEndHour*60 + dwEndMinute;
		
		for i = dwBegin,dwEnd-1 do
			tbTimeList[i] = 1;
		end
	end
	
	
	--当前时间点
	local tmNow = GetCurTime();
	local dwYear,dwMonth,dwDay,dwHour,dwMin,dwSec = CTimeFormat:mtodate(tmNow,true)
	local dwWeek = CTimeFormat:toweekEx(tmNow/1000)
	
	local dwCurPoint = dwWeek*dwNumberPerDay + dwHour*60 + dwMin;
	
	--判断当前点是否在开启时间中
	if tbTimeList[dwCurPoint] then
		return 0;
	end
	
	--不在时间段中，则遍历往后寻找第一个开启时间点，并计算数量
	local dwCount = 1;
	while true do
		dwCurPoint = dwCurPoint + 1;
		
		if dwCurPoint > dwNumberPerWeek then
			dwCurPoint = 0;
		end
		
		dwCount = dwCount + 1;
		
		if tbTimeList[dwCurPoint] then
			--dwCurPoint是否是开启点
			local dwFront = GetFrontPoint(dwCurPoint);
			if not tbTimeList[dwFront] then
				if tbEnterCon.tmServerOpenDistance then
					--如果当前开启点的绝对时间不能开启，则取下一个
					local tmPoint = tmNow + dwCount*60*1000;
					local tmDis = tmPoint - CTimeRewardManager:GetServerStartTime();
					if tmDis >= tbEnterCon.tmServerOpenDistance then
						break;
					end
				else
					break;
				end
			end
		end
	end
	
	return dwCount;
end;
