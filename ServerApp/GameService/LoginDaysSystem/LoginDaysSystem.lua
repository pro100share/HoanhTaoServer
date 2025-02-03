
--[[
记录一年内的登录天数
]]



--[[
给定一个日期，返回一年中的第几天
]]
local function getDay(szDate)
	local _,_,year,month,day=string.find(szDate,"(%d+)-(%d+)-(%d+)")
	year=tonumber(year);
	month=tonumber(month);
	day=tonumber(day);
	local time=CTimeFormat:GetThisTimeMsec(year, month, day, 0, 0, 0)
	local time2=CTimeFormat:GetThisTimeMsec(year, 1, 1, 0, 0, 0)
	return math.floor((time-time2) / ONE_DAY_MSEC)+1
end

-------------------------

_G.CLoginDaysSystem={};


function CLoginDaysSystem:new()
	local obj = CSystem:new("CLoginDaysSystem");
	
	obj.tbLoginDays={};
	
	for i,v in pairs(CLoginDaysSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj
end


function CLoginDaysSystem:Create()
	local objPlayer=self:GetPlayer();
	local szLoginDays = objPlayer:GetLineData("CLoginDaysSystem")[1].szLoginDays
	
	for i=1,string.len(szLoginDays) do
		self.tbLoginDays[i]=string.sub(szLoginDays,i,i);
	end
	local szNow= CTimeFormat:mtodate(_now(),"%s-%s-%s",false);
	local _,_,y,flag,m,d=string.find(szNow,"(%d%d%d(%d))-(%d+)-(%d+)");
	local days=getDay(szNow);	
	
	if self.tbLoginDays[days]~=flag then
		self.tbLoginDays[days]=flag;
		self:Save();
	end
end


--处理换线发送数据
function CLoginDaysSystem:OnChangeLineBegin()
	local objPlayer = self:GetPlayer();
	objPlayer:SetLineData("CLoginDaysSystem",{szLoginDays=table.concat(self.tbLoginDays)})
end

--[[
param: 
szStartDate  格式 "2013-5-8"
szEndDate	 格式 "2013-5-8"
return: 一个数值，是玩家在开始日期和结束日期的登陆的天数
]]
function CLoginDaysSystem:GetLoginDays(szStartDate,szEndDate)
	local totalDays=0;
	local _,_,startYear,startMonth,startDay=string.find(szStartDate,"(%d+)-(%d+)-(%d+)")
	local _,_,endYear,endMonth,endDay=string.find(szEndDate,"(%d+)-(%d+)-(%d+)")
	local startDay=getDay(szStartDate)
	local endDay=getDay(szEndDate);
	if startYear==endYear then
		--处理开始日期和结束日期同年的情况
		local szFlag=string.char(string.byte(startYear,4));
		for i=startDay,endDay do
			if self.tbLoginDays[i]==szFlag then
				totalDays=totalDays+1;
			end
		end		
		return totalDays
	else
		--处理开始日期和结束日期跨年的情况
		local szFlag=string.char(string.byte(startYear,4));
		for i=startDay,#self.tbLoginDays do
			if tbLoginDays[i]==szFlag then
				totalDays=totalDays+1;
			end
		end
		
		local szFlag=string.char(string.byte(endYear,4));
		for i=1,endDay do
			if tbLoginDays[i]==szFlag then
				totalDays=totalDays+1;
			end
		end
	end
	return totalDays;
end



function CLoginDaysSystem:Save()
	local objPlayer=self:GetPlayer();
	local dwRoleID=objPlayer:GetRoleID();
	local SqlCmd = objPlayer:GetDBQuery():CreateUpdateCmd('T_Role_LoginDays');
	SqlCmd.Fields.dwRoleID				= dwRoleID;		
	SqlCmd.Fields.szLoginDays			= table.concat(self.tbLoginDays);
	SqlCmd.Wheres.dwRoleID				= dwRoleID;
	SqlCmd:execute();
end











