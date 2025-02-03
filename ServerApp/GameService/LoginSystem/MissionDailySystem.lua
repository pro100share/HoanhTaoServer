

--将类似“1#23#345#”的字符串转换为value为1,23,345的table
local function GetFormat(szStr)
	local t = {};
	if szStr == 0 or szStr == '0' then
		return t
	end
	if szStr == nil or szStr == '' then
		return t;
	end
	local h,e;
	local tempStr = szStr;
	local paramStr;
	while true do
		h,e = string.find(tempStr,'&');
		if not h then
			break;
		end
		paramStr = string.sub(tempStr,1,h-1);
		table.insert(t,tonumber(paramStr));
		tempStr = string.sub(tempStr,h+1,-1);
	end
	return t;
end

--将类似value为1,23,345的table转换为“1#23#345#”的字符串
local function SetFormat(T)
	local t = Table:DeepCopy(T)
	if t == 0  then
		return ''
	end
	local str = '';
	local tempParam = '';
	while true do
		tempParam = table.remove(t);
		if tempParam == nil then
			break;
		end
		str = tempParam..'&'..str
	end
	return str;
end

local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
	
	local tabData = {};
    local dbres = tbInfoList[1]--objPlayer:GetDBQuery():execute('select * from "T_Role_MissionDaily" where "dwRoleID" = $1 LIMIT 1',dwRoleID);
    if #(dbres) > 0 then
		local Row = dbres[1];
		--日活跃度
		tabData[1] = Row.dwActivePoint;
		--周活跃度
		tabData[2] = Row.dwActivePointTotal;
		--日礼包领取记录
		tabData[3] = GetFormat(Row.setDailyGift);
		--周礼包领取记录
		tabData[4] = GetFormat(Row.setWeeklyGift);
		--活跃度事件记录
		tabData[5] = GetFormat(Row.setEventInfo);
		--在线时间
		tabData[6] = Row.dwOnLineTime;
		--签到天数
		tabData[7] = Row.dwOnLineDay;	
		--兑换物品领取记录
		tabData[8] = GetFormat(Row.setExchangeGift);
		--上一次签到时间
		tabData[9] = Row.dwSignTime;
		--其他礼包领取记录	
		tabData[10] = GetFormat(Row.setOtherGift);
		--威望等级
		tabData[11] = Row.dwWeiWangLevel;
		--威望领取记录	
		tabData[12] = GetFormat(Row.setWeiWangGift);
    else--if isNewRole then
        local SqlCmd = objPlayer:GetDBQuery():CreateInsertCmd('T_Role_MissionDaily');
        SqlCmd.Fields.dwRoleID	    = dwRoleID;	
        --日活跃度
        SqlCmd.Fields.dwActivePoint = 0
        --周活跃度
        SqlCmd.Fields.dwActivePointTotal = 0
        --日礼包领取记录
        SqlCmd.Fields.setDailyGift  = ''
        --周礼包领取记录
        SqlCmd.Fields.setWeeklyGift = ''
        --活跃度事件记录
        SqlCmd.Fields.setEventInfo  = {}
        for k,v in ipairs(MissionDailyConfig.EventConfig) do
            SqlCmd.Fields.setEventInfo[k] = 0
        end
        SqlCmd.Fields.setEventInfo  = SetFormat(SqlCmd.Fields.setEventInfo)
        --签到天数
        SqlCmd.Fields.dwOnLineDay   = 0
        --在线时间
        SqlCmd.Fields.dwOnLineTime  = 0
        --兑换物品领取记录
        SqlCmd.Fields.setExchangeGift = ''	
        --今天的签到标志
        SqlCmd.Fields.dwSignTime    = 0
        --其他礼包领取记录	
        SqlCmd.Fields.setOtherGift  = ''		
        --威望等级
        SqlCmd.Fields.dwWeiWangLevel = 1			
        --威望领取记录	
        SqlCmd.Fields.setWeiWangGift = ''	
        SqlCmd:execute();
    end;
	
	CTransitManager:RecvData(dwAccountID,"CMissionDailySystem",tabData);
	return true;
end;


CLoginCall:AddCall("CMissionDailySystem",func);



