

--�����ơ�1#23#345#�����ַ���ת��ΪvalueΪ1,23,345��table
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

--������valueΪ1,23,345��tableת��Ϊ��1#23#345#�����ַ���
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
		--�ջ�Ծ��
		tabData[1] = Row.dwActivePoint;
		--�ܻ�Ծ��
		tabData[2] = Row.dwActivePointTotal;
		--�������ȡ��¼
		tabData[3] = GetFormat(Row.setDailyGift);
		--�������ȡ��¼
		tabData[4] = GetFormat(Row.setWeeklyGift);
		--��Ծ���¼���¼
		tabData[5] = GetFormat(Row.setEventInfo);
		--����ʱ��
		tabData[6] = Row.dwOnLineTime;
		--ǩ������
		tabData[7] = Row.dwOnLineDay;	
		--�һ���Ʒ��ȡ��¼
		tabData[8] = GetFormat(Row.setExchangeGift);
		--��һ��ǩ��ʱ��
		tabData[9] = Row.dwSignTime;
		--���������ȡ��¼	
		tabData[10] = GetFormat(Row.setOtherGift);
		--�����ȼ�
		tabData[11] = Row.dwWeiWangLevel;
		--������ȡ��¼	
		tabData[12] = GetFormat(Row.setWeiWangGift);
    else--if isNewRole then
        local SqlCmd = objPlayer:GetDBQuery():CreateInsertCmd('T_Role_MissionDaily');
        SqlCmd.Fields.dwRoleID	    = dwRoleID;	
        --�ջ�Ծ��
        SqlCmd.Fields.dwActivePoint = 0
        --�ܻ�Ծ��
        SqlCmd.Fields.dwActivePointTotal = 0
        --�������ȡ��¼
        SqlCmd.Fields.setDailyGift  = ''
        --�������ȡ��¼
        SqlCmd.Fields.setWeeklyGift = ''
        --��Ծ���¼���¼
        SqlCmd.Fields.setEventInfo  = {}
        for k,v in ipairs(MissionDailyConfig.EventConfig) do
            SqlCmd.Fields.setEventInfo[k] = 0
        end
        SqlCmd.Fields.setEventInfo  = SetFormat(SqlCmd.Fields.setEventInfo)
        --ǩ������
        SqlCmd.Fields.dwOnLineDay   = 0
        --����ʱ��
        SqlCmd.Fields.dwOnLineTime  = 0
        --�һ���Ʒ��ȡ��¼
        SqlCmd.Fields.setExchangeGift = ''	
        --�����ǩ����־
        SqlCmd.Fields.dwSignTime    = 0
        --���������ȡ��¼	
        SqlCmd.Fields.setOtherGift  = ''		
        --�����ȼ�
        SqlCmd.Fields.dwWeiWangLevel = 1			
        --������ȡ��¼	
        SqlCmd.Fields.setWeiWangGift = ''	
        SqlCmd:execute();
    end;
	
	CTransitManager:RecvData(dwAccountID,"CMissionDailySystem",tabData);
	return true;
end;


CLoginCall:AddCall("CMissionDailySystem",func);



