_G.HDScript = {}

--����ÿ����ִ�нű�
local fDropPerMin = function(mgrScript,dwYear,dwMonth,dwDay,dwWeek,dwHour,dwMin)
	DropFunctionConfig:DoPerOneMin(mgrScript,dwYear,dwMonth,dwDay,dwWeek,dwHour,dwMin)
end

--Ԫ���ƻ�
local fLantern = function(mgrScript,dwYear,dwMonth,dwDay,dwWeek,dwHour,dwMin)
	LanternConfig:DoPerOneMin(mgrScript,dwYear,dwMonth,dwDay,dwWeek,dwHour,dwMin)
end






--ÿ����ִ��һ��
function HDScript:DoPerOneMin(mgrScript,dwNowTime)
	local dwNowTime = math.modf(dwNowTime/1000)
	local dwYear,dwMonth,dwDay,dwHour,dwMin,dwSec = CTimeFormat:todate(dwNowTime, true, quick)
	local dwWeek = CTimeFormat:toweekEx(dwNowTime) + 1
	
	--����ÿ����ִ�нű�
	local _res,_log = pcall(fDropPerMin,mgrScript,dwYear,dwMonth,dwDay,dwWeek,dwHour,dwMin)
	if not _res then
		_err("do DropFunctionConfig:DoPerOneMin err:",_log)
	end
	
	--Ԫ���ƻ�
	local _res,_log = pcall(fLantern,mgrScript,dwYear,dwMonth,dwDay,dwWeek,dwHour,dwMin)
	if not _res then
		_err("do LanternConfig:DoPerOneMin err:",_log)
	end
	
	
end





-------------------------------------------------------------------------------------------
-------------------------------------
--�ַ����и������ Դ�ַ������и��
--���أ��и��ı�
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



















