_G.CLogSystemManager = CSingle:new();
CLogSystemManager.setUidUf = {};
CSingleManager:AddSingle(CLogSystemManager);

local dwGameID = 48;
local TIME = _time(1, {year=1970, month=1, day=1, hour=0, min=0, sec=0}) + (TimeZone or 0);

function CLogSystemManager:Create()
	_ls:Connect(CConfig.Network.strLogService,
        CConfig.
            LogServiceNetwork.
                dwMaxMessageLengthFromServer % 100000);
	
	 CAlarmClock:AddTask({dwTime = "02:00"}, CAlarmTaskCycleType.eDay, 1, 0,
         function() self:total() end,
        {});

	return true;
end

function CLogSystemManager:Destroy()
    return true;
end

function CLogSystemManager:recharge(accountid,amount,money,balance,level,order,role_id)
	local param = self:GetBaseParamNoPlayer(tonumber(accountid), tonumber(role_id));
	table.insert(param, tostring(amount));
	table.insert(param, tostring(money));
	table.insert(param, tostring(balance));
	table.insert(param, tostring(level));
	table.insert(param, tostring(order));
	_SendLSMessage(LogMsgType._MSG_LOG_RECHARGE, param);
end

function CLogSystemManager:create_role(accountid,rolename,channel,poster,site,ip,roleid, sex, prof)
	local param = self:GetBaseParamNoPlayer(accountid, roleid);
	table.insert(param,rolename);
	table.insert(param,CLogSystemManager.setUidUf[accountid] or channel);
	table.insert(param,poster);
	table.insert(param,site);
	table.insert(param,ip);
    table.insert(param,sex);
    table.insert(param,prof);
	_SendLSMessage(LogMsgType._MSG_LOG_CREATE_ROLE,param)
end

function CLogSystemManager:online(rolecount,usercount)
	local param = self:GetBaseParamNoPlayer(0, 0);
	table.insert(param,rolecount);
	table.insert(param,usercount);
	_SendLSMessage(LogMsgType._MSG_LOG_ONLINE,param);
end

function CLogSystemManager:game_enter(accountid,channel,poster,site,ip)
	local param = self:GetBaseParamNoPlayer(accountid, 0);
	table.insert(param,channel);
	table.insert(param,poster);
	table.insert(param,site);
	table.insert(param,ip);
	_SendLSMessage(LogMsgType._MSG_LOG_GAME_ENTER,param)
end

local client_uf = {}
for i=0,20 do
	client_uf["media_"..i] = 1
end


--26��¼���
function CLogSystemManager:activex(sid,uid,state,webtype,uf)
	if client_uf[uf] then
		webtype = "client"
	end
	local dwAccountID = tonumber(toint(uid));
	local param = {}
	param[1] = 48; --gameid
	param[2] = toint(sid); --serverid
	local dwOSID, dwOAID = self:GetMergeInfo(dwAccountID);
	param[3] = dwOSID; --oldserverid
	param[4] = tostring(dwOAID); --accid
	param[5] = CConfig.Network.szDeptID; --deptid
	param[6] = tostring(0); --roleid
	param[7] = ''; --md5
	param[8] = tostring(os.utc(1) - TIME); --time
	
	CLogSystemManager.setUidUf[toint(sid)] = uf
	
	table.insert(param,toint(state));
	table.insert(param,webtype);
	table.insert(param,uf);
	_SendLSMessage(LogMsgType._MSG_LOG_USERINFO,param)
	return true;
end

-- @brief �ʼ���־  
-- @param number dwAccountID �˺�ID
-- @param number dwRoleID ��ɫID
-- @param number dwSender ������
-- @param string strTitle ����
-- @param string strContent ����
-- @param string strAccessory ����
-- @param number dwState �ʼ�״̬
--      1-�ʹ�
--      2-�Ѷ�
--      3-��ȡ
--      4-��ɾ
function CLogSystemManager:mail(dwAccountID,
        dwRoleID,
        dwSender,
        strTitle,
        strContent,
        strAccessory,
        dwState)
    local setParam = self:GetBaseParamNoPlayer(dwAccountID, dwRoleID);
    table.insert(setParam, tonumber(dwSender));
    table.insert(setParam, tostring(strTitle));
    table.insert(setParam, tostring(strContent));
    table.insert(setParam, tostring(strAccessory));
    table.insert(setParam, tonumber(dwState));
    _SendLSMessage(LogMsgType._MSG_LOG_MAIL, setParam);
end

-- @brief ��¼������Ԫ�����������������ͳ��
function CLogSystemManager:total()
    local dwGold = CAccountDBQuery:SumGold();
    local dwLiJin = CAccountDBQuery:SumLiJin();
    local dwYinLiang = CAccountDBQuery:SumYinLiang();
	
    local setParam = self:GetBaseParamNoPlayer(0, 0);
    table.insert(setParam, tostring(dwGold));
    table.insert(setParam, tostring(dwLiJin));
    table.insert(setParam, tostring(dwYinLiang));
    _SendLSMessage(LogMsgType._MSG_LOG_TOTAL, setParam);
end

-- @brief ���а���־
-- @param number dwNumber ����
-- @param number dwAccountID ��ɫ�ʺ�ID
-- @param number dwRoleID ��ɫID
-- @param string strRoleName ��ɫ��
-- @param number dwType ���а�����
function CLogSystemManager:chart(dwNumber,
        dwAccountID,
        dwRoleID,
        strRoleName,
        dwValue,
        dwType)
    local setParam = self:GetBaseParamNoPlayer(dwAccountID or 0, dwRoleID);
    table.insert(setParam, tonumber(dwNumber));
    table.insert(setParam, tostring(strRoleName));
    table.insert(setParam, tostring(dwValue));
    table.insert(setParam, tonumber(dwType));
    _SendLSMessage(LogMsgType._MSG_LOG_CHART, setParam);
end

-- @brief ��������־
-- @param object objPlayer ��ɫ����
-- @param string strCDKey ������
function CLogSystemManager:cdkey(objPlayer, strCDKey)
    if objPlayer == nil then
        return;
    end
    local setParam = self:GetBaseParam(objPlayer, nil);
    table.insert(setParam, tostring(objPlayer:GetInfo().szRoleName));
    table.insert(setParam, tostring(math.floor(objPlayer:GetInfo().tmCreateRoleTime / 1000) - TIME));
    table.insert(setParam, tostring(strCDKey));
    _SendLSMessage(LogMsgType._MSG_LOG_CDKEY, setParam);
end

-- @brief ��ǩ��־
-- @param number dwFirstRoleID ��һ����ɫ��ʶ��
-- @param number dwSecondRoleID �ڶ�����ɫ��ʶ��
-- @param number dwThirdRoleID ��������ɫ��ʶ��
function CLogSystemManager:lottery(dwFirstRoleID,
        dwSecondRoleID,
        dwThirdRoleID)
    local setParam = self:GetBaseParamNoPlayer(0, 0);
    table.insert(setParam, tostring(dwFirstRoleID));
    table.insert(setParam, tostring(dwSecondRoleID));
    table.insert(setParam, tostring(dwThirdRoleID));
    _SendLSMessage(LogMsgType._MSG_LOG_LOTTERY, setParam);
end

-- @brief ������־
-- @param number dwRoleID ��ɫ��ʶ��
-- @param number dwGuildID ���ұ�ʶ��
-- @param string strGuildName ��������
-- @param number dwType ��������
-- @param table setData ��������
function CLogSystemManager:guild(dwRoleID,
        dwGuildID,
        strGuildName,
        dwType,
        setData)
    local setParam = {};
    table.insert(setParam, tonumber(dwGameID));
    table.insert(setParam, tonumber(CConfig.Network.dwServerHostID));
    table.insert(setParam, tonumber(CConfig.Network.szDeptID));
    table.insert(setParam, tostring(dwRoleID));
    table.insert(setParam, tostring(os.utc(1) - TIME));
    table.insert(setParam, tostring(dwGuildID));
    table.insert(setParam, tostring(strGuildName));
    table.insert(setParam, tonumber(dwType));
    table.insert(setParam, tostring(json.encode(setData)));
    _SendLSMessage(LogMsgType._MSG_LOG_GUILD, setParam);
end

--Ԫ��������־
function CLogSystemManager:gold_change(objPlayer,dwChange,dwDB,dwMem)
	local setParam = {};
	  if objPlayer == nil then
        return;
    end
    local setParam = self:GetBaseParam(objPlayer);
	table.insert(setParam, tostring(dwChange));
	table.insert(setParam, tostring(dwDB));
	table.insert(setParam, tostring(dwMem));
	_SendLSMessage(LogMsgType._MSG_LOG_GOLD_CHANGE, setParam);
end

function CLogSystemManager:GetBaseParam(player,dwRoleID)
	local param = {}
	if not player then return; end
	local dwAccountID = tonumber(player:GetAccountID());
	param[1] = 48; --gameid
	param[2] = CConfig.Network.dwServerHostID; --serverid
	local dwOSID, dwOAID = self:GetMergeInfo(dwAccountID);
	param[3] = dwOSID; --oldserverid
	param[4] = tostring(dwOAID); --accid
	param[5] = CConfig.Network.szDeptID; --deptid
	param[6] = tostring(dwRoleID or player:GetRoleID()); --roleid
	param[7] = ''; --md5
	param[8] = tostring(os.utc(1) - TIME); --time
	return param;
end

function CLogSystemManager:GetBaseParamNoPlayer(AccountID, RoleID)
	local param = {}
	param[1] = 48; --gameid
	param[2] = CConfig.Network.dwServerHostID; --serverid
    local dwOSID = 0;
    local dwOAID = 0;
    if AccountID ~= 0 then
        dwOSID, dwOAID = self:GetMergeInfo(AccountID);
    end
	param[3] = dwOSID; --oldserverid
	param[4] = tostring(dwOAID) --accid
	param[5] = CConfig.Network.szDeptID; --deptid
	param[6] = tostring(RoleID); --roleid
	param[7] = ''; --md5
	param[8] = tostring(os.utc(1) - TIME); --time
	return param;
end

function CLogSystemManager:GetMergeInfo(dwAccountID)
	if CConfig.Network.bIsNotMerge then
		return 0, dwAccountID;
	else
		return dwAccountID % 10000, math.floor(tonumber(dwAccountID) / 10000);
	end
end
