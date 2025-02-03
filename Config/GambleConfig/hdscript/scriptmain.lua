_G.HDScript = {}

--掉落每分钟执行脚本
local fDropPerMin = function(mgrScript,dwYear,dwMonth,dwDay,dwWeek,dwHour,dwMin)
	DropFunctionConfig:DoPerOneMin(mgrScript,dwYear,dwMonth,dwDay,dwWeek,dwHour,dwMin)
end

--元宵灯会
local fLantern = function(mgrScript,dwYear,dwMonth,dwDay,dwWeek,dwHour,dwMin)
	LanternConfig:DoPerOneMin(mgrScript,dwYear,dwMonth,dwDay,dwWeek,dwHour,dwMin)
end






--每分钟执行一次
function HDScript:DoPerOneMin(mgrScript,dwNowTime)
	local dwNowTime = math.modf(dwNowTime/1000)
	local dwYear,dwMonth,dwDay,dwHour,dwMin,dwSec = CTimeFormat:todate(dwNowTime, true, quick)
	local dwWeek = CTimeFormat:toweekEx(dwNowTime) + 1
	
	--掉落每分钟执行脚本
	local _res,_log = pcall(fDropPerMin,mgrScript,dwYear,dwMonth,dwDay,dwWeek,dwHour,dwMin)
	if not _res then
		_err("do DropFunctionConfig:DoPerOneMin err:",_log)
	end
	
	--元宵灯会
	local _res,_log = pcall(fLantern,mgrScript,dwYear,dwMonth,dwDay,dwWeek,dwHour,dwMin)
	if not _res then
		_err("do LanternConfig:DoPerOneMin err:",_log)
	end
	
	
end





-------------------------------------------------------------------------------------------
-------------------------------------
--字符串切割，参数： 源字符串，切割符
--返回：切割后的表
function HDScript:Split(szFullString, szSeparator)
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



















