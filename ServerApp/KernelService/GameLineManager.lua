--[[
���ܣ���Ϸ��·������������
���ߣ��ܻ���
ʱ�䣺2012-03-05
]]
_G.CGameLineManager = {} 

--������·
function CGameLineManager:Create()
	self.setAllGameLine = {};
	self.setAllPlayer = {};
	self.dwLastUpdateTime = _now();
	self.SvrNet2GameLine = {};
	
	self.setTempAccount = {};
	
	self.dwWarLineIDLast = GameLineConfig.dwWarLineIDBegin;--��һ��wsӦ�÷����ID
	self.dwDuplLineIDLast = GameLineConfig.dwDuplLineIDBegin --��һ��dusӦ�÷����ID
	return true;
end;


--�ͷ���·
function CGameLineManager:Destroy()
	for i,GameLine in pairs(self.setAllGameLine) do
		GameLine:Destroy();
	end;
end;

--ע��һ����
function CGameLineManager:RegLine(svrNet,dwWarFlag) 
	local dwLineID = 0;
	if dwWarFlag == 0 then
		for i = 1 ,GameLineConfig.dwMaxGameLineCount do
			if not self.setAllGameLine[i] then
				dwLineID = i;
				break;
			end;
		end;
		if dwLineID == 0 then
			return -1;
		end;
	elseif dwWarFlag == 1 then
		dwLineID = self.dwWarLineIDLast
		self.dwWarLineIDLast = self.dwWarLineIDLast + 1
	elseif dwWarFlag == 2 then
		dwLineID = self.dwDuplLineIDLast
		self.dwDuplLineIDLast = self.dwDuplLineIDLast + 1
	elseif dwWarFlag == 3 then
		for i = 1 ,20 do
			if not self.setAllGameLine[i] then
				dwLineID = i;
				break;
			end;
		end;
		if dwLineID == 0 then
			return -1;
		end;
	end
	
	local dwLineID, objLine = self:AddLine(dwLineID,svrNet,dwWarFlag)
	if not objLine then
		return dwLineID;
	end
	
	CWarManager:SendAllWarInfo(objLine)
	
	return dwLineID, objLine;
end

--GS����
--���һ����·
function CGameLineManager:AddLine(dwLineID,svrNet,dwWarFlag) 
	local objLine = CGameLine:new(dwLineID,GameLineConfig.dwLinePlayerCount, svrNet,dwWarFlag);
	if not objLine then
		return -2;
	end;
	if not objLine:Create() then
		return -3;
	end; 

	if self.setAllGameLine[objLine:GetID()] then
		_info("Add objLine Error");
		return -4;
	end;
    self.SvrNet2GameLine[objLine.objNet] = objLine;
    
	self.setAllGameLine[objLine:GetID()] =objLine;
    self:UpdateGameLineInfo(2,objLine:GetID());--add
	
	CWarManager:SendAllWarInfo(objLine);
	return dwLineID,objLine;
end; 

function CGameLineManager:GetGameLineBySvrNet(svrNet)
    return self.SvrNet2GameLine[svrNet];
end;

--ɾ��һ����
function CGameLineManager:DelLine(objGameLine) 
	if not self.setAllGameLine[objGameLine:GetID()] then
		return false;
	end;  
	self.setAllGameLine[objGameLine:GetID()] = nil;
    self.SvrNet2GameLine[objGameLine.objNet] = nil;
	for i,v in pairs(objGameLine.setPlayer) do 
		objGameLine:PlayerExit(i); 
		self.setAllPlayer[i] = nil;
		CPlayerManager:DelPlayer(v:GetAccountID());
	end;
	
	CWarManager:ClearLineWar(objGameLine:GetID());
    self:UpdateGameLineInfo(3,objGameLine:GetID());
end;


--�õ�һ����Ϸ��·
function CGameLineManager:GetLine(dwLineID)
	if dwLineID then
		return self.setAllGameLine[dwLineID];
	end
end;

--��ȡ����е���
function CGameLineManager:GetIdleLine()
	local dwPlayerCount = 1000;
	local objResLine = nil;
	for i,objLine in pairs(self.setAllGameLine) do
		if dwPlayerCount > objLine.dwCurPlayerCount then
			dwPlayerCount = objLine.dwCurPlayerCount;
			objResLine = objLine;
		end;
	end;
	return objResLine;--zcs modi
end;

--�õ����е���·
function CGameLineManager:GetAllLine()
	return self.setAllGameLine;
end;

--��ҽ���ĳ����
function CGameLineManager:EnterLine(objPlayer)
	local objLine = self:GetLine(objPlayer.dwCurLine);
	if not objLine then
		return nil;
	end;
	objLine:PlayerEnter(objPlayer);
	self.setAllPlayer[objPlayer:GetRoleID()] = objPlayer;
    
    self:UpdateGameLineInfo(4,objPlayer.dwCurLine);
	return objLine;
end;

--����˳�ĳ����
function CGameLineManager:ExitLine(objPlayer) 
	local objLine = self.setAllGameLine[objPlayer.dwCurLine];
	if objLine then
		if objLine:PlayerExit(objPlayer:GetRoleID()) then
			self:UpdateGameLineInfo(4,objPlayer.dwCurLine);
		end;
	end;
    
	self.setAllPlayer[objPlayer:GetRoleID()] = nil;
end;

--��ȡ��Ϸ���
function CGameLineManager:GetPlayer(dwRoleID)
	if not dwRoleID or dwRoleID == 0 then
		return self.setAllPlayer;
	end;
	return self.setAllPlayer[dwRoleID];
end;

function CGameLineManager:GetPlayerForNil(dwRoleID)
	if not dwRoleID or dwRoleID == 0 then
		return nil;
	end;
	return self.setAllPlayer[dwRoleID];
end;

function CGameLineManager:UpdateGameLineInfo(nType,dwLineID)
	if nType == 1 then
		-- local sInfoset = {};
		-- for i,GameLine in pairs(self.setAllGameLine) do 
			-- if GameLine.dwWarFlag == 0 then
				-- local sInfo = {};
				-- sInfo[1]	= GameLine.dwMaxPlayerCount;
				-- sInfo[2]	= GameLine.dwCurPlayerCount;
				-- sInfo[3]    = GameLine.szName ;
				-- sInfoset[GameLine.dwLineID] = sInfo;
			-- end; 
		-- end;
		local sInfoSet = {};
		for	dwLineID,GameLine in pairs(self.setAllGameLine) do
			if GameLine.dwWarFlag == 0 then
				sInfoSet[dwLineID] = GameLine;
			end;
		end;
		_UpdateGameLineInfoMsg(nType,sInfoSet);
	elseif nType == 2 or nType == 4 then
			local GameLine = self.setAllGameLine[dwLineID];
			-- sInfo[1]	= GameLine.dwMaxPlayerCount;
			-- sInfo[2]	= GameLine.dwCurPlayerCount;
			-- sInfo[3]    = GameLine.szName ;
			-- sInfo[4]	= dwLineID;
		if dwLineID > 0 and dwLineID < 6 then
			_UpdateGameLineInfoMsg(nType,GameLine);
		end;
	else
		if dwLineID > 0 and dwLineID < 6 then
			_UpdateGameLineInfoMsg(nType,dwLineID);
		end;
	end;  
end; 

--����ѡ����·����Ϣ 
function CGameLineManager:SelectGameLine(objPlayer,dwGameLineID)  
    objPlayer.dwTempLine = dwGameLineID;
	local objLine = CGameLineManager:GetLine(dwGameLineID);
	if not objLine then
		self:SendKSSelectLineResult(objPlayer:GetAccountID(),0,-2,"");
		_info("===SelectGameLine !!! !!! !!! -1==")
		return false;
	end;
	if objLine:IsFull() then	
		self:SendKSSelectLineResult(objPlayer:GetAccountID(),0,-3,"");
		_info("===SelectGameLine !!! !!! !!! -2==")
		return false;
	end;
	self:AddTempPlayerToLine(objPlayer:GetAccountID(), dwGameLineID);
	--������Ϣ����Ϸ�������ϴ�����ʱ�Ự
	local sInfo = {};
	sInfo.dwAccountID = objPlayer:GetAccountID();
	
	--������еĽ�ɫ 
	sInfo.dwRoleCount = objPlayer.dwRoleCount;
	--������--5-4
	sInfo.dwGold = objPlayer.dwGold;			--��ҵ�Ԫ����Ϣ
	sInfo.dwAdultFlag = objPlayer.dwAdultFlag;--dwAdultFlag;	--0��δ�����ˣ�1�ǳ����ˣ�0���ᱻ���������ϵͳ
	sInfo.dwAddicted = objPlayer.dwAddicted;	--��������Ե��������
	sInfo.bIsGM = objPlayer.bIsGM ;    ---GM
	sInfo.dwIPAddr  = objPlayer.dwIPAddr;
	sInfo.dwTimeStamp = _now(); 
	sInfo.szSign = ("themgai1"..tostring(sInfo.dwTimeStamp)):md5();
	sInfo.IsChangeLine = 0;
	objPlayer.szCheckSign = sInfo.szSign;--����������֤����֤�� 
	objLine.GSAddPlayerMsg{PlayerInfo = sInfo};
	
	return true;
end; 


function CGameLineManager:SendKSSelectLineResult(dwAccount,dwLine,dwCode,szSing)
	-- CLoginApp.OnSelectLineRtMsg
	-- {
		-- AccountID = dwAccount;
		-- LineID = dwLine;
		-- ResultCode = dwCode;
		-- Sing = szSing;
	-- }
	_SelectLineRtMsg(dwAccount,dwLine,dwCode,szSing);
end;

--ѡ�߼�����ҽ��
function CGameLineManager:AddPlayerResultBySelect(nResultCode,dwLineID,dwAccountID)
	local objPlayer = CPlayerManager:GetPlayer(dwAccountID);
	if not objPlayer then
		_info("AddPlayerResultBySelect not player");
		self:SendKSSelectLineResult(dwAccountID,0,-1,"");
		return;
	end;
	if nResultCode ~= 0 then
		_err("Add Player Result Error",nResultCode); 
		self:SendKSSelectLineResult(dwAccountID,0,-1,"");
		CPlayerManager:DelPlayer(dwAccountID);
		return;
	end;
	
	self:SendKSSelectLineResult(dwAccountID,dwLineID,0,objPlayer.szCheckSign);
	objPlayer.dwStateInKS = PlayerStateInKS.PSK_GS_RETURN;
end;


--ѡ�ߴ������ϵͳ
function CGameLineManager:CreatePlayerSystemBySelect(dwAccountID)
	--����ϵͳ
	self:DelTempPlayer(dwAccountID);
	local objPlayer = CPlayerManager:GetPlayer(dwAccountID);
	if not objPlayer then
		_info ("CreatePlayerSystemBySelect objPlayer null");
		CTransitManager:ClearData(dwAccountID);
		return;
	end
	objPlayer.objSystemMgr:OnRegSystems();
	if not objPlayer.objSystemMgr:Create() then
		_info ("not objPlayer.objSystemMgr:Create()");
		return;
	end;
	CPlayerManager:AddPlayerToRoleList(objPlayer);
	--����·
	objPlayer.dwCurLine = objPlayer.dwTempLine;
	objPlayer.dwTempLine = nil;
	local objLine = self:EnterLine(objPlayer);
	if not objLine then
		_info ("EnterLine error");
		return; 
	end;
	objPlayer.objLine = objLine;
	objPlayer.objLineNet = objLine.objNet;
	_mycallout(objPlayer);
	--��������
	CTransitManager:AddPlayerData(dwAccountID,"Player",objPlayer.sRoleInfo)
	CTransitManager:SendPlayerData(objLine,dwAccountID);
	
	CLogSystemManager:activex(CConfig.Network.dwServerHostID,objPlayer:GetAccountID(),6,"0",objPlayer:GetInfo().szUF)
	CPlayerManager:PlayerInGaming(objPlayer);
	--�������
	objLine.CreatePlayerMsg{ AccountID = dwAccountID };
end;


------------------------------------------------------------------------------------
--���߲���
------------------------------------------------------------------------------------


--1 :    GS1-->KS......KS-->GS2
function CGameLineManager:ChangeGameLine(objPlayer,dwNewLineID) 
	local objLine = CGameLineManager:GetLine(dwNewLineID);
	if not objLine then
		self:SendKSChangeLineResMsg(objPlayer,-1);
		return;
	end;
	if objLine:IsFull() then	
		self:SendKSChangeLineResMsg(objPlayer,-2);
		return;
	end; 
	objPlayer.dwTempLine = dwNewLineID; 
	--������Ϣ����Ϸ�������ϴ�����ʱ�Ự
	local dwAccountID = objPlayer:GetAccountID();
	local sInfo = {};
	sInfo.dwAccountID = dwAccountID;
	sInfo.dwRoleCount =objPlayer.dwRoleCount;
	--������--5-4
	sInfo.dwGold = objPlayer.dwGold;			--��ҵ�Ԫ����Ϣ
	sInfo.dwAdultFlag = objPlayer.dwAdultFlag;--dwAdultFlag;	--0��δ�����ˣ�1�ǳ����ˣ�0���ᱻ���������ϵͳ
	sInfo.dwAddicted = objPlayer.dwAddicted;	--��������Ե��������
	sInfo.bIsGM = objPlayer.bIsGM ;    ---GM
	sInfo.dwIPAddr  = objPlayer.dwIPAddr;
	sInfo.dwTimeStamp = _now();
	sInfo.szSign = ("themgai1"..tostring(sInfo.dwTimeStamp)):md5();
	sInfo.IsChangeLine = 1;
	
	objPlayer.szCheckSign = sInfo.szSign;--����������֤����֤��
	
	objLine.GSAddPlayerMsg{PlayerInfo = sInfo};
	objPlayer.dwStateInKS = PlayerStateInKS.PSK_CHANGE_LINE;
end;

--���߼�����ҽ��
-- 2:	GS2-->KS
function CGameLineManager:AddPlayerResultByChange(nResultCode,dwLineID,dwAccountID)
	local objPlayer = CPlayerManager:GetPlayer(dwAccountID);
	if not objPlayer then
		return;
	end;
	if nResultCode ~= 0 then
		_err("Add Player Result Error",nResultCode); 
		self:SendKSChangeLineResMsg(objPlayer, -1);
		CPlayerManager:PlayerInGaming(objPlayer);
		return;
	end; 
	--��GS���ͻ��߽��
	local arrParam = {objPlayer.szCheckSign };
	self:SendKSChangeLineResMsg(objPlayer,0,arrParam);
	--������˳��Լ����ڵ���
	self:ExitLine(objPlayer);
	objPlayer.objLineNet = nil; 
	objPlayer.dwCurLine = 0;
end;

--3:		KS-->GS1 
function CGameLineManager:SendKSChangeLineResMsg(objPlayer,nResCode,arrParam)
	--�����߷��ͻ��߽����Ϣ
	if not objPlayer.dwCurLine then
		return;
	end;
	local oldLine = self:GetLine(objPlayer.dwCurLine);
	if not oldLine then
		return;
	end;
	
	oldLine.KSChangeLineResMsg{
		AccountID = objPlayer:GetAccountID(),
		ResCode = nResCode,
		Param = arrParam
	}; 
end;


--���ߴ������ϵͳ
function CGameLineManager:CreatePlayerSystemByChange(dwAccountID)
	--����·
	local objPlayer = CPlayerManager:GetPlayer(dwAccountID);
	if not objPlayer then
		-- print("objPlayer not exists by CreatePlayerSystemByChange",dwAccountID);
		return ;
	end;
	objPlayer.dwCurLine = objPlayer.dwTempLine;
	objPlayer.dwTempLine = nil;
	
	local objLine = self:EnterLine(objPlayer);
	if not objLine then
		-- print("objLine Enter Error by CreatePlayerSystemByChange",dwCurLine,dwAccountID);
		return; 
	end;
	objPlayer.objLine = objLine;
	objPlayer.objLineNet = objLine.objNet;
	--objPlayer.setRemoteMsgList = objLine.objNet.RemoteMsgList;
	--��������
	CTransitManager:AddPlayerData(dwAccountID,"Player",objPlayer.sRoleInfo)
	CTransitManager:SendPlayerData(objLine,dwAccountID);
	--�������
	objLine.CreatePlayerMsg{ AccountID = dwAccountID };
	
	CPlayerManager:PlayerInGaming(objPlayer);
end;

function CGameLineManager:AddTempPlayerToLine(AccountID, LineID)
	self.setTempAccount[AccountID] = LineID;
	self:GetLine(LineID):AddOneTempPlayer();
end;

function CGameLineManager:DelTempPlayer(AccountID)
	if self.setTempAccount[AccountID] then
		local line = self:GetLine(self.setTempAccount[AccountID]);
		if line then
			line:DelOneTempPlayer();
		end;
		self.setTempAccount[AccountID] = nil;
	end;
end;

_G.GSDelPlayerReason ={
    NetClose    = 1, --����
    GSKick      = 2, --GS�ߵ�
    OverConTime = 3, --��ʱδ����GS
}
--��Ϸ������ɾ��һ�����
function CGameLineManager:DelPlayer(dwAccountID,szCheckStr, Reason)
	_info("CGameLineManager:DelPlayer()",dwAccountID, Reason); 
	local objPlayer = CPlayerManager:GetPlayer(dwAccountID);
	if not objPlayer then
		_info("CGameLineManager:DelPlayer() objPlayer is nil",dwAccountID, Reason); 
		return;
	end;
	
	CPlayerManager:DelPlayer(dwAccountID);
end;
 
 --������Ϣ�����е���
function CGameLineManager:SendMsgToAllLine(name, arg)
	for i, objLine in pairs(self.setAllGameLine) do
		objLine[name](arg);
	end;
end;

--����������Ϣ��������
function CGameLineManager:DoBroadCastSourc(dwRoleID,szSource)
	if (not dwRoleID) or (dwRoleID==0) then
		for i,objLine in pairs(self.setAllGameLine) do
			objLine.KSBroadCastSourceMsg{Source=szSource};
		end
		return;
	end
	local objPlayer = self:GetPlayer(dwRoleID)
	if not objPlayer then return end;
	local objLine = self:GetLine(objPlayer.dwCurLine);
	if not objLine then return end;
	objLine.KSBroadCastSourceMsg{Source=szSource};
end

--KSת����Ϣ
define.ProcessTransMsg
{
    TaskID  = 0;
    RID     = 0;
    Name    = "";
    Arg     = {};
}
when{}
function ProcessTransMsg(TaskID, RID, Name, Arg)
	if RID > 0 then -- �����ָ��
		local objPlayer = CPlayerManager:GetPlayerByRoleID(RID);
		if objPlayer and (objPlayer.dwStateInKS == PlayerStateInKS.PSK_GS_GAMING) then 
			objPlayer[Name](Arg);--���͵�ָ����� 
        else--����
            if TaskID > 0 then --����0
                _fromcallout("GSRemoteCallBackMsg", {KeyID = TaskID,Result = -1});
			end;
			return;
		end; 
	else--��Ҫ���͵������� 
		CGameLineManager:SendMsgToAllLine(Name, Arg);
	end;
	--�ɹ����ûص�
	if TaskID > 0 then
        _fromcallout("GSRemoteCallBackMsg", {KeyID = TaskID,Result = 0});
	end;
end;  



