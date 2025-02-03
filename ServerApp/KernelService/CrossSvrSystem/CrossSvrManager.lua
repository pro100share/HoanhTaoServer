--[[
   [ \breif ���ս������������
   ]]

-- ϵͳ����
_G.CCrossSvrMgr = CSingle:new();
CSingleManager:AddSingle(CCrossSvrMgr, true);
CSingleManager:RegistCSSingle(CCrossSvrMgr, true);

-- ��Ϸ�������б�
-- {
--      ������ = ���������;
--      k = v;
-- }
CCrossSvrMgr.setClients = {};
-- ��Ϸ�������б�
-- {
--      ��������� = ������;
--      k = v;
-- }
CCrossSvrMgr.setServers = {};
-- �㲥��
CCrossSvrMgr.setBoradcastPackage = {};
-- ״̬��־λ
CCrossSvrMgr.dwState = 0;

--create
function CCrossSvrMgr:Create()	
    self.setClients = {};
    self.setServers = {};

    self.setBoradcastPackage = {};
    
	self.crossInfo = {};
	--��¼��������ս����roleId
	self.RecordEnterCrossInfo = {};
	self.MemberInfo = {};
	self.ThisServerHoldInfo = {};
	self.HoldInfoStr = {};
    self.dwState = 0;
	self:GetHoldInfo();
    
	return true;
end;

-- �����¼�
function CCrossSvrMgr:Update(dwInterval)
    local dwPackageIdx, setPackage = next(self.setBoradcastPackage);
    if not dwPackageIdx then
        return;
    end

    local dwIdx = 0;
    for k, v in pairs(setPackage.setClients) do
       _callouttoline(setPackage.strMsgName, setPackage.setParam, 0, k);
       setPackage.setClients[k] = nil;
       if dwIdx == 10 then
           break;
        else
            dwIdx = dwIdx + 1;
       end
    end

    if not next(setPackage.setClients) then
        self.setBoradcastPackage[dwPackageIdx] = nil;
    end
end

-- ���������������ӳ��
function CCrossSvrMgr:Mapping(nServerID, nNetID)
   self.setClients[nNetID] = nServerID;
   self.setServers[nServerID] = nNetID;
end

-- ������Ϸ��������Ϣ
function CCrossSvrMgr:SendGameServiceServerInfo()
    _callouttoline("OnGameServiceServerInfoMsg", {
            ServerID = CConfig.Network.dwServerHostID;
        }, 0, -1);
end

-- ���Ϳ��ս��������Ϣ
function CCrossSvrMgr:SendCrossServiceServerInfo(nNetID)
    _callouttoline("OnCrossServiceServerInfoMsg", {
            UserPort = CConfig.ProxyServiceNetwork.dwProxyServicePortG;
        }, 0, nNetID);
end

-- ���յ����ս��������Ϣ
function CCrossSvrMgr:OnCrossServiceServerInfoMsg(dwUserPort)
   CConfig.CrossServiceNetwork.dwUserPort = dwUserPort;

	for _, objLine in pairs(CGameLineManager:GetAllLine()) do
        self:SyncCrossServiceServerInfo(objLine);
	end
end

-- ͬ�����ս��������Ϣ
function CCrossSvrMgr:SyncCrossServiceServerInfo(objLine)
    objLine.ResponseCSInfoMsg{UserPort = CConfig.CrossServiceNetwork.dwUserPort};
end

-- ������Ϣ��ȫ����Ϸ������
function CCrossSvrMgr:Broadcast(strMsgName, setParam)
    local setClients = {};
    for k, v in pairs(self.setClients) do
        setClients[k] = v;
    end
    table.insert(self.setBoradcastPackage, {
        strMsgName = strMsgName;
        setParam = setParam;
        setClients = setClients;
    });
end

-- ��ȡ���ս״̬ 0 - �ر�
function CCrossSvrMgr:GetState()
    return self.dwState;
end

--����ɱ����Ϣ
local function ParseStrToTbl(str)
	local lastIndex = 0;
	local t = {};
	while true do
		local nextIndex = lastIndex + 1;
		lastIndex = string.find(str, ";", nextIndex)
		if not lastIndex then break end;
		local str1 = string.sub(str, nextIndex, lastIndex - 1);
		local index, index1 = string.find(str1, ",");
		local str2 = string.sub(str1, 0, index -1);
		local str3 = string.sub(str1, index1 + 1, lastIndex - 1);
		local key = tonumber(str2);
		local value = str3;
		t[key] = value;	
	end;
	return t;
end;

function CCrossSvrMgr:GetHoldInfo()
	if not CConfig.bIsCrossSvr then
		local res = CPlayerDBQuery:GetDBQuery():execute('select * from "T_Cross_Hold_Info"');
		if not res then
			self.ThisServerHoldInfo = {};
			self.HoldInfoStr = {};
			self.bOver = false;
		else
			for _, info in pairs(res) do
				local dwCrossId = info.dwCrossId;
				local szHoldInfo = info.szHoldInfo;
				local bOver = true;
				if not self.HoldInfoStr[dwCrossId] then
					self.HoldInfoStr[dwCrossId] = {};
				end;
				self.HoldInfoStr[dwCrossId] = szHoldInfo; 
				if not self.ThisServerHoldInfo[dwCrossId] then
					self.ThisServerHoldInfo[dwCrossId] = {};
				end;
				self.ThisServerHoldInfo[dwCrossId] = ParseStrToTbl(szHoldInfo);
				self.bOver = bOver;
			end;
		end;
	end;
end;

function CCrossSvrMgr:GetHoldInfoStr()
	return self.HoldInfoStr, self.bOver; 
end;

--��Ӽ�¼
function CCrossSvrMgr:AddEnterCrossRec(dwRoleId, dwAccoutId, toLineId, crossId, fromLineID, serverId, platId)
	self.RecordEnterCrossInfo[dwAccoutId] = {};
	self.RecordEnterCrossInfo[dwAccoutId][dwRoleId] = {
		toLineId = toLineId;
		fromPlayId = fromPlayId,
		fromServerId = serverId,
		fromPlatId = platId,
		crossId = crossId,
		fromLineId = fromLineID,
	}
end;

--���ؽ����¼
function CCrossSvrMgr:GetEnterCrossRec(dwAccoutId, dwRoleId)
	local info = self.RecordEnterCrossInfo[dwAccoutId]
	if info then
		info = info[dwRoleId];
	end;
	return info;
end;
--���

function CCrossSvrMgr:ReceiveData(dwAccountID, dwRoleId, szSystemName, arrParam)
	local info = CCrossSvrMgr:GetEnterCrossRec(dwAccountID, dwRoleId);
	local toLineId = info.toLineId;
	local fromServerId = info.fromServerId;
	local objLine = CGameLineManager:GetLine(toLineId);
	if objLine then
		objLine.ReceiveCrossDataMsg{AccountID = dwAccountID, SystemName = szSystemName, Param = arrParam, NetId = CCrossSvrMgr:GetCrossServer(fromServerId)};
	end;
end;

--bEnter:true ���������ս��
function CCrossSvrMgr:AddCross(toLineId, dwCrossId, bEnter, msgId)
	if msgId == 13009300001 then
		self:Broadcast("SendCrossStartMsg", {CrossId = dwCrossId, MsgId = msgId})
		return
	end
	
	if not self.crossInfo[dwCrossId] then
		self.crossInfo[dwCrossId] = {};
	end;
	if not self.crossInfo[dwCrossId][toLineId] then
		self.crossInfo[dwCrossId][toLineId] = {};
	end;
	self:Broadcast("SendCrossStartMsg", {CrossId = dwCrossId, MsgId = msgId})
	self.crossInfo[dwCrossId][toLineId].bEnter = bEnter;  
	self.crossInfo[dwCrossId][toLineId].bNum = 0;
    self.dwState = 1;
    _info("CCrossSvrMgr:AddCross", toLineId, dwCrossId, bEnter);
end;

function CCrossSvrMgr:DelCross(toLineId, dwCrossId)
    self.dwState = 0;
    -- Ϊ���޸�����޷��˳������޸�
	-- self.crossInfo = {};
	-- self.RecordEnterCrossInfo = {};
	-- self.MemberInfo = {};
end;

function CCrossSvrMgr:SetCrossPersonNum(toLineId, dwCrossId, dwNum)
	if not self.crossInfo[dwCrossId] then
		return;
	end;
	if not self.crossInfo[dwCrossId][toLineId] then
		return;
	end;
	if self.crossInfo[dwCrossId][toLineId].bEnter then
		self.crossInfo[dwCrossId][toLineId].bNum = dwNum;  
	end;
end;

function CCrossSvrMgr:GetCrossPersonNum()
	return self.crossInfo;
end;

function CCrossSvrMgr:GetCrossInfo(toLineId, dwCrossId)
	if not self.crossInfo[dwCrossId] then
		return nil;
	end;
	
	if not self.crossInfo[dwCrossId][toLineId] then
		return nil;
	end;
	
	return self.crossInfo[dwCrossId][toLineId];
end;

function CCrossSvrMgr:GetCrossServer(dwServerId)
	return self.setServers[dwServerId];
end;

--��¼��Ϸ���������ս����Ϣ
function CCrossSvrMgr:PlayerInfoRec(dwRoleId, dwAccoutId, bEnter)
	_info("===PlayerInfoRec1===", bEnter, dwRoleId, dwAccoutId);
	if not self.MemberInfo[dwAccoutId] then
		self.MemberInfo[dwAccoutId] = {};
	end;
	_info("===PlayerInfoRec2===", bEnter, dwRoleId, dwAccoutId);
	if not self.MemberInfo[dwAccoutId][dwRoleId] then
		self.MemberInfo[dwAccoutId][dwRoleId] = bEnter;
		return;
	end;
	_info("===PlayerInfoRec===", bEnter, dwRoleId, dwAccoutId);
	self.MemberInfo[dwAccoutId][dwRoleId] = bEnter;
end;

function CCrossSvrMgr:GetPlayerInfoRec(dwRoleId, dwAccoutId)
	_info("===GetPlayerInfoRec1===", dwRoleId, dwAccoutId);
	if not self.MemberInfo[dwAccoutId] then
		return false;
	end;
	_info("===GetPlayerInfoRec2===", dwRoleId, dwAccoutId);
	if not self.MemberInfo[dwAccoutId][dwRoleId] then
		return false;
	end;
	_info("===GetPlayerInfoRec3===", dwRoleId, dwAccoutId);
	return self.MemberInfo[dwAccoutId][dwRoleId];
end;

function CCrossSvrMgr:UpdateCrossData(info, dwRoleId, dwAccountID)
	local dwGold = info.dwGold;
	local dwBindGold = info.dwBindGold;
	local dwMoney = info.dwMoney;
	local selStr = 'update "T_Role_ItemSystem" set "dwBindGold" = $1 , "dwPacketMoney" = $2 where "dwRoleID" = $3';
	CPlayerDBQuery:GetDBQuery():execute(selStr, dwBindGold, dwMoney, dwRoleId);
	local strSaveGoldToDBSql = 'UPDATE "T_Account" SET "dwGlod" = $1 WHERE "dwAccountID" = $2';
	local res = CAccountDBQuery.objDBQuery:execute(strSaveGoldToDBSql, dwGold, dwAccountID);
end;

function CCrossSvrMgr:UpdateCrossAward(dwHonor, dwExp, dwRoleId)
	local selStr = 'update "T_Role_Cross_Info" set "dwHonor" = "dwHonor" + $1 where "dwRoleId" = $2';
	CPlayerDBQuery:GetDBQuery():execute(selStr, dwHonor, dwRoleId);
	selStr = 'update "T_Role_Info" set "dwTotalExp" = "dwTotalExp" + $1 where "dwRoleID" = $2';
	CPlayerDBQuery:GetDBQuery():execute(selStr, dwExp, dwRoleId);
    _info("[CrossService] Offline UpdateCrossAward", 
        dwRoleId, 
        dwHonor, 
        dwExp);
end;

local function ParseString(info)
	local str = "";
	if info then
		for dwRoleId, szRoleName in pairs(info) do
			if dwRoleId ~= -1 then
				str = str..dwRoleId..","..szRoleName..";";
			end
		end;
	end;
	return str;
end;

function CCrossSvrMgr:SetHoldInfo(dwCrossId, dwHoldId, szHoldName, bOver)
	if not self.ThisServerHoldInfo[dwCrossId] then
		self.ThisServerHoldInfo[dwCrossId] = {};
	end;
	bOver = true
	--if not self.ThisServerHoldInfo[dwCrossId][dwHoldId] then
		self.ThisServerHoldInfo[dwCrossId] = {};
		self.ThisServerHoldInfo[dwCrossId][dwHoldId] = szHoldName;
	--end;
	local str = ParseString(self.ThisServerHoldInfo[dwCrossId]);
	if not self.HoldInfoStr[dwCrossId] then
		self.HoldInfoStr[dwCrossId] = {};
	end;
	self.HoldInfoStr[dwCrossId] = str;
	local str1 = 'select * from "T_Cross_Hold_Info" where "dwCrossId" = $1';
	local res = CPlayerDBQuery:GetDBQuery():execute(str1, dwCrossId);
	if not res then
		local selStr = 'insert into "T_Cross_Hold_Info" ("dwCrossId", "szHoldInfo", "bOver") values ($1, $2, $3)';
		CPlayerDBQuery:GetDBQuery():execute(selStr, dwCrossId, str, bOver);
	else
		local selStr = 'update "T_Cross_Hold_Info" set "szHoldInfo" = $1, "bOver" = $2 where "dwCrossId" = $3';
		CPlayerDBQuery:GetDBQuery():execute(selStr,str, bOver, dwCrossId);
	end;
	for k,objLine in pairs(CGameLineManager:GetAllLine()) do
		objLine.SendHoldInfoToGsMsg{CrossId = dwCrossId, SzHoldInfo = str, OverFlag = bOver}
	end
end;

function CCrossSvrMgr:ClearHoldInfo(dwCrossId)
	if self.ThisServerHoldInfo[dwCrossId] then
		self.ThisServerHoldInfo[dwCrossId] = nil;
	end;
	local str = ParseString(self.ThisServerHoldInfo[dwCrossId]);
	self.HoldInfoStr[dwCrossId] = str;
	local str1 = 'select * from "T_Cross_Hold_Info" where "dwCrossId" = $1';
	local res = CPlayerDBQuery:GetDBQuery():execute(str1, dwCrossId);
	if res then
		local selStr = 'update "T_Cross_Hold_Info" set "szHoldInfo" = $1, "bOver" = $2 where "dwCrossId" = $3';
		-- print("=-=======================================2===========================", str);
		CPlayerDBQuery:GetDBQuery():execute(selStr,str, true, dwCrossId);
	end;
	for k,objLine in pairs(CGameLineManager:GetAllLine()) do
		objLine.SendHoldInfoToGsMsg{CrossId = dwCrossId, SzHoldInfo = str, OverFlag = true}
	end
end;

