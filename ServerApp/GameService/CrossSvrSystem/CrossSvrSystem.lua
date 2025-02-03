--[[
���ܣ����ϵͳ��
���ߣ�quying
ʱ�䣺2014-02-07 
]]

_G.CCrossSvrSystem = {};
function CCrossSvrSystem:new()
	local obj = CSystem:new("CCrossSvrSystem");
	obj.dwCurCrossID = 0;
	for i,v in pairs(CCrossSvrSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end; 
	return obj;
end;

function CCrossSvrSystem:Create(bIsChangeLine)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	self.dwHonor = 0;
	self.dwState = 0;
	if bIsChangeLine == 2 then
		local Data = objPlayer:GetLineData("CCrossSvrSystem")[1]
		self.toCrossId = Data.toCrossId;
	else
		local objDB = objPlayer:GetDBQuery();
		if not objDB then
			return false;
		end;
		self.objDBQuery = CCrossSvrSystemDB:new(objDB, self);
		local Data = objPlayer:GetLineData("CCrossSvrSystem")[1];
		self.dwHonor = Data.dwHonor;	
	end;
	return true;
end;

function CCrossSvrSystem:Destroy()
	if not self.bExitCross then
		self:TransportDataByDestroy()
	else
		self.bExitCross = false;
	end;
end;

function CCrossSvrSystem:TransportDataByDestroy()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end
	local objCross = self:GetCrossObj();
	if not objCross then
		return;
	end;
	local itemSystem = objPlayer:GetSystem("CItemSystem");

	local dwRoleID = objPlayer:GetRoleID();
	
	local itemList = itemSystem:GetAllItemInPacket()
	
	local revertGold = _G.Function.Gold(itemList) or 0;
	local revertBindGold = _G.Function.BindGold(itemList) or 0;
	local revertMoney = _G.Function.Money(itemList) or 0;
	local info = {};
	info.dwGold = itemSystem:GetGoldNum() + revertGold;
	info.dwBindGold = itemSystem:GetBindGoldNum() + revertBindGold;
	info.dwMoney = itemSystem:GetAllPacketMoney() + revertMoney;
	local dwAccountId = objPlayer:GetAccountID();
	objCross:ExitPlayer(objPlayer)
	local netId = CCrossSvrManager.NetTbl[dwAccountId];
	_callouttoline("SendDataCrossOutLineMsg", {Info = info, RoleId = objPlayer:GetRoleID(), AccID = objPlayer:GetAccountID()}, 0, netId);
	CKernelApp.SendExitCrossMsg{Info = info, RoleId = objPlayer:GetRoleID(), AccID = objPlayer:GetAccountID(), Flag = false};
end;

function CCrossSvrSystem:OnEnterScene()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if not CConfig.bIsCrossSvr then
		local buffSystem = objPlayer:GetSystem("CBuffSystem");
		local holdInfo, bOver = CCrossSvrHoldManager:GetCrossHoldInfoOnEnterScene();
		local flag = false;
		if bOver then
			for dwCrossId, info in pairs(holdInfo) do
				if info then
					for dwRoleId, szRoleName in pairs(info) do
						if dwRoleId == objPlayer:GetRoleID() then
							local corssSvrCfg = _G.CrossSvrConfig[dwCrossId];
							buffSystem:AddBuff(corssSvrCfg.BuffId, 1);
							objPlayer:AddViewModel(corssSvrCfg.ItemModelId);
							objPlayer:AddViewPfx(corssSvrCfg.ItemPfxId)
							self:OnEnterMap(1);
							flag = true;
							break;
						end;
					end;
				end;
				if not flag then
					local corssSvrCfg = _G.CrossSvrConfig[dwCrossId];
					buffSystem:DeleteBuffByID(corssSvrCfg.BuffId);
				end;
			end;
		end;
		objPlayer.SendPlayerCrossHonorMsg{HonorValue = self.dwHonor};
		objPlayer.SendHoldInfoToClientMsg{HoldInfo = holdInfo or {}, OverFlag = bOver, BroadFlag = false};	
	else
		local objCross = self:GetCrossObj();
		if objCross then
			local dwRoleId = objPlayer:GetRoleID();
			objCross:GetHonorById(dwRoleId)
			
			local delayTime = _now() - objCross.dwBeginTime;
			local totalTime = self:GetCrossHLTime();
			
			if _G.TestVersion then
				totalTime = _G.TestTime * HOUR
			end
			local killTotal, killCombo, OwnerHonor = 0,0,0;
			if objCross.setRoleFightInfo[dwRoleId] then
				killTotal = objCross.setRoleFightInfo[dwRoleId].dwKillTotal ;
				killCombo = objCross.setRoleFightInfo[dwRoleId].dwKillComboMax;
			end;
			OwnerHonor = objCross.dwHonor[dwRoleId];
			objPlayer.OnCrossMyKillNumMsg
				{
					KillAll = killTotal or 0;
					KillCon = killCombo or 0;
					OwnerHonor = OwnerHonor or 0;
				}
				
			objPlayer.OnCSSvrTimeMsg{DelayTime = delayTime, TotalTime = totalTime};
		end;
	end;
end;

function CCrossSvrSystem:OnChangeSceneEnd()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if not CConfig.bIsCrossSvr then
		local holdInfo, bOver = CCrossSvrHoldManager:GetCrossHoldInfoOnEnterScene();
		if bOver then
			for dwCrossId, info in pairs(holdInfo) do
				if info then
					for dwRoleId, szRoleName in pairs(info) do
						if dwRoleId == objPlayer:GetRoleID() then
							self:OnEnterMap(2)
							break;
						end;
					end;
				end;
			end;
		end;
	end;
end;

function CCrossSvrSystem:OnEnterMap(dwType)
	local objPlayer = self:GetPlayer();
	local szName = objPlayer:GetName()
	local sysMap = objPlayer:GetSystem("CMapSystem")
	local map = sysMap:GetCurMap();
	map.CrossLeaderEnterMap = map.CrossLeaderEnterMap or {}
	if GetCurTime() - (map.CrossLeaderEnterMap[szName] or 0) > _G.ChangeMapDalay then
		map.CrossLeaderEnterMap[szName] = GetCurTime()
		for k,v in pairs(map:GetAllPlayer()) do
			v.OnCrossHolderEnterMapMsg{Name=szName,Type=dwType}
		end
	end
end;

function CCrossSvrSystem:GetCrossHLTime()
	local Sevcfg = CrossSvrHotUpdateConfig[self.toCrossId];
	local Enter = Split(Sevcfg.EnterTime,":")
	local Exit = Split(Sevcfg.ExitTime,":")
	local dwHour = tonumber(Exit[1] or 0) - tonumber(Enter[1] or 0)
	local dwMin  = tonumber(Exit[2] or 0) - tonumber(Enter[2] or 0)
	local dwTime = (dwHour*60 + dwMin)*60
	return dwTime
end	

function CCrossSvrSystem:SetCrossHonor(dwValue)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	self.dwHonor = dwValue;
	self:UpdateDB();
	objPlayer.SendPlayerCrossHonorMsg{HonorValue = dwValue};
	return true
end;
function CCrossSvrSystem:GetCrossHonor()
	return self.dwHonor;
end;
function CCrossSvrSystem:AddCrossHonor(dwValue)
	self.dwHonor = self.dwHonor + dwValue;
	self:UpdateDB();
end;
function CCrossSvrSystem:DecCrossHonor(dwValue)
	self.dwHonor = self.dwHonor - dwValue;
	if self.dwHonor < 0 then
		self.dwHonor = 0;
	end;
	self:UpdateDB();
end;

function CCrossSvrSystem:UpdateDB()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if not CConfig.bIsCrossSvr then
		self.objDBQuery:UpdateHonor(objPlayer:GetRoleID(), self.dwHonor)
	end;
end;


function CCrossSvrSystem:OnChangeLineBegin()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local Data = {};
	Data.dwHonor = self.dwHonor;
	objPlayer:SetLineData("CCrossSvrSystem",Data);
end;

function CCrossSvrSystem:OnChangeLineEnd()
	self:OnEnterScene();
end

function CCrossSvrSystem:ReqCorssLineSvr()	
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return ;
	end;
	local dwAccID = objPlayer:GetAccountID(); 
	_G.CallOutToWarKs("OnKsReqCrossLineInfoMsg", {
		RoleID = objPlayer:GetRoleID(),
		AccID = dwAccID,
		FromLineID = CKernelApp.dwLineID,
	});
end;

function CCrossSvrSystem:ReqEnterCorssSvr(dwNewLineID, dwCrossId)
	if self.dwCurCrossID ~= 0 then
		return;
	end;
	_info("--------ReqEnterCorssSvr---------", dwNewLineID, dwCrossId);
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return ;
	end;
	self.toLineId = dwNewLineID;
	self.toCrossId = dwCrossId;
	CKernelApp.GetCrossMemberInfoMsg{RoleId = objPlayer:GetRoleID(), AccID = objPlayer:GetAccountID(), LineId = CKernelApp.dwLineID};
end;

function CCrossSvrSystem:ReCheckEnterCross(bEnterFlag)
	_info("--------ReCheckEnterCross---------", bEnterFlag);
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return ;
	end;
	-- if bEnterFlag then
		-- objPlayer.ReSendEnterCrossMsg{EnterFlag = bEnterFlag};
		-- return;
	-- end;
	_info("--------ReCheckEnterCross-6--------", bEnterFlag, objPlayer:GetRoleID());
	if self.dwCurCrossID ~= 0 then
		return;
	end;
	_info("--------ReCheckEnterCross5---------", bEnterFlag);
	--�����ɫ�����򷵻�
	local stateSystem = objPlayer:GetSystem("CStateSystem");
	local state = stateSystem:GetState();
	if state == enPlayerState.ePS_Dead then
		return;
	end;
	if not CConfig.bIsCrossSvr then
		local duplSystem = objPlayer:GetSystem("CDuplSystem");
		--�ڸ����з���
		if duplSystem:GetDuplId() and duplSystem:GetDuplId() ~= 0 then
			return;
		end;
		
		local warSystem = objPlayer:GetSystem("CWarSystem");
		if warSystem:IsInWar() then
			return;
		end;
	end;
	_info("--------ReCheckEnterCross3---------", self.toCrossId);
	--���ս����
	local skillSystem = objPlayer:GetSystem("CSkillSystem");
	_info("--------ReCheckEnterCross3--1-------", self.toCrossId);
	local dwScore = skillSystem:CountBattleScoreInfo().dwAllScore or 0;
	_info("--------ReCheckEnterCross3--2-------", dwScore, _G.CrossSvrConfig[self.toCrossId].BattleScore);
	if dwScore < _G.CrossSvrConfig[self.toCrossId].BattleScore then
		objPlayer.ResponseReqCrossFailMsg{ResCode = -5};
		return;
	end;
	_info("--------ReCheckEnterCross2---------", bEnterFlag);
	local dwAccID = objPlayer:GetAccountID(); 
	--_entercorsssvr(dwAccID);
	--����ϢӦ����ս��ks��������
	_G.CallOutToWarKs("OnKsRequestCrossMsg", {
		RoleID = objPlayer:GetRoleID(),
		AccID = dwAccID,
		ToLineId = self.toLineId,
		FromLineID = CKernelApp.dwLineID,
		CrossId = self.toCrossId,	
		ServerId = CConfig.Network.dwServerHostID, --������id
		PlatId = 0, --ƽ̨id
	});
end;

--Ŀ����������ؿ��Խ�����ս��
function CCrossSvrSystem:AllowEnterCrossSvr(nResCode)
	_info("--------AllowEnterCrossSvr---------", nResCode);
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if nResCode ~= 0 then
		objPlayer.ResponseReqCrossFailMsg{ResCode = nResCode};
		return;
	end;
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		_err("");
		return;
	end
	--������ս������
	objPlayer:ClientEnterCrossReq(self.toLineId);
end;

--���ؿ��ս��������Ϣ
function CCrossSvrSystem:ReturnCrossLineInfo(lineInfo, dwLineId)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if next(lineInfo) == nil then
		objPlayer.ResponseReqCrossFailMsg{ResCode = -1};
	else
		objPlayer.SendCrossLineInfoMsg{Info = lineInfo, LineId = dwLineId};
	end
end;

function CCrossSvrSystem:EnterCross(dwCfgId)
	self.dwCurCrossID = dwCfgId;
end;

function CCrossSvrSystem:ExitCross()
	self.dwCurCrossID = 0;
end;

function CCrossSvrSystem:GetEnterCrossId()
	return self.dwCurCrossID;
end;

function CCrossSvrSystem:OnDead(dwEnemyType,dwEnemyID)
	if self.dwCurCrossID == 0 then
		return;
	end
	
	local objSelf = self:GetPlayer();
	if not objSelf then
		return;
	end

	
	if dwEnemyType == enEntType.eEntType_Player then
		--��ɱ����
		local objKiller = CMapManager:GetPlayer(dwEnemyID);
		if objKiller then
			local objCrossObj = CCrossSvrManager:GetCrossObj(self.dwCurCrossID)
			if objCrossObj then
				objCrossObj:EventKillPlayer(objKiller,objSelf);
			end
		end
	elseif dwEnemyType == enEntType.eEntType_Monster then
		--����ɱ����
		local objKiller = nil;
		local objMapSystem = objSelf:GetSystem("CMapSystem");
		if objMapSystem then
			local objMap = objMapSystem:GetCurMap();
			if objMap then
				objKiller = objMap:GetMonsterByObjID(dwEnemyID);
			end
		end
		
		if objKiller then
			local objCrossObj = CCrossSvrManager:GetCrossObj(self.dwCurCrossID)
			if objCrossObj then
				objCrossObj:EventKillPlayer(objKiller,objSelf);
			end
		end
	elseif dwEnemyType == enEntType.eEntType_Pet then
		--������������˵�
		local objKiller = CMapManager:GetPlayer(dwEnemyID);
		if objKiller then
			local objCrossObj = CCrossSvrManager:GetCrossObj(self.dwCurCrossID)
			if objCrossObj then
				objCrossObj:EventKillPlayer(objKiller,objSelf);
			end
		end
	elseif dwEnemyType == -1 then
		--��ɱ
		local objCrossObj = CCrossSvrManager:GetCrossObj(self.dwCurCrossID)
		if objCrossObj then
			objCrossObj:EventKillPlayer(objSelf,objSelf);
		end
	end
	
end;

function CCrossSvrSystem:DoneWithOffLine()
	if self.dwCurCrossID == 0 then
		return;
	end
	if not self.tbOldMapInfo then
		return;
	end
	local tbInfo = {};
	tbInfo.dwCurMapID = self.tbOldMapInfo.dwCurMapID;
	tbInfo.fXPos = self.tbOldMapInfo.fMyPosX;
	tbInfo.fYPos = self.tbOldMapInfo.fMyPosY;
	tbInfo.fDirValue = math.random(0,6);
	return tbInfo;
end;

function CCrossSvrSystem:OnEnterCrossBegin()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end
	self.ConnectFlag = false;
	self.Info = nil;
	local Data = {};
	Data.toCrossId = self.toCrossId;
	--Data.dwHonor = self.dwHonor;
	objPlayer:SetCrossSvrData("CCrossSvrSystem",Data);
end;

---------------------------------------------------------------------------------------------------
-------------------------------------------���ս�����߼�------------------------------------------
---------------------------------------------------------------------------------------------------
--���ս��
function CCrossSvrSystem:GetCrossObj()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if self.dwCurCrossID == 0 then
		--�ڿ���������п������idΪ0
		if CConfig.bIsCrossSvr then
			_info("CCrossSvrSystem:GetCrossObj self.dwCurCrossID == 0")
		end
		return;
	end;
	local objCross = CCrossSvrManager:GetCrossObj(self.dwCurCrossID);
	return objCross;
end;
--�������ֵ
function CCrossSvrSystem:GetHonorById(dwRoleId)
	local objCross = self:GetCrossObj();
	if objCross then
		return objCross:GetHonorById(dwRoleId);
	else
		_err();
	end;
end;
--����ڳ�ʱ��õ�����
function CCrossSvrSystem:GetExpById(dwRoleId)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local objCross = self:GetCrossObj();
	local dwExp = 0;
	local dwLength = 0;
	if objCross then
		dwLength = objCross:GetRoleLength(dwRoleId)
		dwExp = _G.Function.Exp(objPlayer, dwLength);	
	end;
	return dwExp;
end;

function CCrossSvrSystem:SendMyKillNum(dwAllNum, dwComNum,OwnerHonor)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end

	if not dwAllNum then
		dwAllNum = 0;
	end
	if not dwComNum then
		dwComNum = 0;
	end
	if(not OwnerHonor) then
		OwnerHonor = 0;
	end
	--ͬ���ͻ���ɱ�������仯
	objPlayer.OnCrossMyKillNumMsg
	{
		KillAll = dwAllNum;
		KillCon = dwComNum;
		OwnerHonor = OwnerHonor;
	}
end;

--����������Ʒ��״̬  dwState 1:��ʼ���� 2:���б���� 3:�����Ʒ
function CCrossSvrSystem:SendItemHoldState(dwState)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end
	
	self:OnCrossItemPosChg(dwState)
	--ͬ��������Ʒ��״̬
	objPlayer.OnCrossItemStateChgMsg
	{
		State = dwState;
	}
end
--�㲥������ӵ���ߵ�λ��
function CCrossSvrSystem:OnCrossItemPosChg(dwState)
	self.dwState = dwState or self.dwState
	if self.dwState == 0  then return end
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end
	local tInfo = {}
	if self.dwState ~= 1 then 
		self.dwState = 0
	end	
	local MapSystem = objPlayer:GetSystem("CMapSystem");
	local mapId, posx, posy, mapCfgId = MapSystem:GetPlayerMapPos();
	local RoleID = objPlayer:GetRoleID()
	tInfo = {RoleID,posx, posy, objPlayer:GetInfo().szRoleName, mapId}
	tInfo[6] = self.dwState	
	local setNet = {};
	for i,objPlayer in pairs(CPlayerManager.setAllPlayer) do
		table.insert(setNet, objPlayer.objNet);
	end;
	_groupcallout(setNet, "OnCrossItemPosChgMsg", {tInfo = tInfo});	
end
function CCrossSvrSystem:Update()
	self:OnCrossItemPosChg()
	
	self:TuLongDaoUpdate();
end

--��������������(��δ���)  �������
function CCrossSvrSystem:TuLongDaoUpdate()
	if not CConfig.bIsCrossSvr then
		return;
	end
	
	--��������������ߵ�λ��
	local objPlayer = self:GetPlayer();
	if not objPlayer then return end;
	
	local objCross = self:GetCrossObj();
	if not objCross then return end;
		
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then return end;
		
	if objCross.itemHoldRoleId == objPlayer:GetRoleID() then
		local tbScript = CScriptManager:GetScript(5,objMapSys.dwCurMapID);
		if tbScript and tbScript.UpdateForPlayer then
			--������������ڳ��У���û����ȫ��ã����Ҳ��������� ���Ǿ�����������
			if not tbScript:UpdateForPlayer(self,objPlayer) then
				objCross:ItemHoldBreak(objPlayer);
			end
		end
	end
end

-----------------------------------------------------------------------------------
function CCrossSvrSystem:ReqExitCross(bOver)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local objCross = self:GetCrossObj();
	if not objCross then
		_err("[CrossService] not objCross");
		return;
	end;
	self.bExitCross = true;
	local itemSystem = objPlayer:GetSystem("CItemSystem");
	objPlayer.SendClearBuffMsg{ClearFlag = true};
    
	local dwRoleID = objPlayer:GetRoleID();
	
	local itemList = itemSystem:GetAllItemInPacket()
	
	local revertGold = _G.Function.Gold(itemList) or 0;
	local revertBindGold = _G.Function.BindGold(itemList) or 0;
	local revertMoney = _G.Function.Money(itemList) or 0;
	local revertHonor = _G.Function.Honor(itemList) or 0;
	local corssSvrCfg = CrossSvrConfig[self.toCrossId];
	if revertHonor > corssSvrCfg.ItemMaxHonor then
		revertHonor = corssSvrCfg.ItemMaxHonor;
	end

	local info = {};
	info.dwCrossId = objCross.dwCfgID;
    local dwHonorValue = objCross:GetHonorById(dwRoleID) + revertHonor;
    dwHonorValue = dwHonorValue + corssSvrCfg.BaseHonor;
    if dwHonorValue > corssSvrCfg.MaxHonor then
        dwHonorValue = corssSvrCfg.MaxHonor;
    end
	info.dwHonorValue = dwHonorValue;
	_info("CCrossSvrSystem:ReqExitCross=======", dwHonorValue, objPlayer:GetAccountID());
	local holdId, holdAccId, holdName = objCross:GetItemRoleID();
	info.dwHoldId = holdId
	info.dwHoldAccountId = holdAccId;
	info.dwHoldName = holdName
	info.dwKillerNum = objCross:GetPlayerKillNum(dwRoleID);
	info.dwRank = objCross:GetPlayerKillIndex(dwRoleID);
	local dwLength = objCross:GetRoleLength(dwRoleID);
	local revertExp = _G.Function.Exp(objPlayer, dwLength) or 0;	
	info.dwGold = itemSystem:GetGoldNum() + revertGold;
	info.dwBindGold = itemSystem:GetBindGoldNum() + revertBindGold;
	info.dwMoney = itemSystem:GetAllPacketMoney() + revertMoney;
	info.dwExp = revertExp;
	info.bOver = bOver;
	local sysMount = objPlayer:GetSystem("CMountSystem");
	--info.b_MountState = sysMount:GetState();
	--�˳�ս��ͳһ����Ϊ����
	info.b_MountState = false;
	
	--���߼�������ս����ʱ��ս���е����û�л������ֵ���ͻ���û���յ�SwitchNetMsg��Ϣ��
	--����ǿ��ս����, �˴��ȷ���Ϣ��������Ϸ����KS����ǰ�������ݿ⣬��ֹ�����Ϣû����ȥ����������ֵ�����飬��Ǯû����ȥ
	if bOver then
		local dwAccountId = objPlayer:GetAccountID();
		local netId = CCrossSvrManager.NetTbl[dwAccountId];
		_callouttoline("SendDataCrossOutLineMsg", {Info = info, RoleId = dwRoleID, AccID = dwAccountId}, 0, netId);
		
		_callouttoline("SendCrossOverMsg", {AccId = dwAccountId, RoleId = dwRoleID, Honor = dwHonorValue, Exp = revertExp}, 0, netId);
	end
	
	CKernelApp.SendExitCrossMsg{Info = info, RoleId = objPlayer:GetRoleID(), AccID = objPlayer:GetAccountID(), Flag = true};
	objCross:ExitPlayer(objPlayer)
	objPlayer.SwitchNetMsg{
        SzSign = "";
        IPAddr  = "";
        ToLineId = 0;
	};
    _info("[CrossService] Exit Cross", 
        objPlayer:GetAccountID(), 
        objPlayer:GetRoleID(), 
        info.dwHonorValue, 
        info.dwExp);
end;

--�뿪���ս�������ݲ���
function CCrossSvrSystem:UpdateDateLeaveCross(dataInfo)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	self.Info = dataInfo;
	self:ChangeGameServer()
end;

function CCrossSvrSystem:DealChgGameServer()
	self.ConnectFlag = true;
	_info("-----------DealChgGameServer----------------");
	self:ChangeGameServer()
end;
function CCrossSvrSystem:ChangeGameServer()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if (not self.Info) or (not self.ConnectFlag) then
		return;
	end;
	local dataInfo = self.Info;
	local objMapSystem = objPlayer:GetSystem("CMapSystem");
	if objMapSystem and self.Info.bFlag then
		objMapSystem.dwCurMapID = _G.LeaveCrossPos.dwMapId;
		objMapSystem.fXPos = _G.LeaveCrossPos.dwFxPos;
		objMapSystem.fYPos = _G.LeaveCrossPos.dwFyPos;
		objMapSystem.fDirValue = math.random(0,6);
		objMapSystem.isMustReload = true;
		objMapSystem.bExitCross = true;
		objMapSystem:ExecChangeMap({bIsChangeLine=1});
	end;
	
	--�������ϵͳ
	CKernelApp.GSPlayerLogoutMsg{RoleId = objPlayer:GetRoleID(), OnLine = 1};
	objPlayer:GetSystem("CFriendSystem"):RegPlayerDataToKS()
	--����̯λ
	if CPlayerShopManager:GetShop(objPlayer:GetRoleID()) then
		CPlayerShopManager:AddShop(objPlayer:GetRoleID(),objPlayer,0)
	end;
	if objPlayer:GetSystem("CMarriageSystem"):IsMarried() then
		local marryId =  objPlayer:GetSystem("CMarriageSystem"):GetMateRoleID()
		_G.GSRemoteCall(objPlayer:GetRoleID(), "CMarriageSystem", "CheckMateIsOnline", nil, nil);
	end;
	local itemSystem = objPlayer:GetSystem("CItemSystem");
	local dwGold = dataInfo.dwGold or 0;
	local dwBindGold = dataInfo.dwBindGold or 0;
	local dwMoney = dataInfo.dwMoney or 0;
	local dwExp = dataInfo.dwExp or 0;
	local dwHonorValue = dataInfo.dwHonorValue or 0;
	local bOver = dataInfo.bOver or false;
	local curMoney = itemSystem:GetAllPacketMoney();
	local curBindGold = itemSystem:GetBindGoldNum();
	local curGold = itemSystem:GetGoldNum();
	local killNum = dataInfo.dwKillerNum or 0;
	local dwRank = dataInfo.dwRank or 0;
	local dwHoldId = dataInfo.dwHoldId or 0;
	local b_MountState = dataInfo.b_MountState;
	--����Ѿ�����ս���ڲ��账��Ԫ���������������
	if not dataInfo.bIsOfflinePlayer then
		if curMoney - dwMoney > 0 then
			itemSystem:CostPacketMoney(curMoney - dwMoney, _G.ItemSysOperType.Cross)
		end;
		if curGold - dwGold >= 0 then
			itemSystem:CostGold(curGold - dwGold, _G.ItemSysOperType.Cross);
		end;
		if curBindGold - dwBindGold > 0 then
			itemSystem:CostBindGold(curBindGold - dwBindGold,  _G.ItemSysOperType.Cross)
		end;
	end
	if bOver then
		--���Ӿ���
		objPlayer:AddExp(dwExp)
		_info("CCrossSvrSystem:ChangeGameServer===honor", dwHonorValue, self:GetCrossHonor(), objPlayer:GetAccountID(), objPlayer:GetRoleID())
		self:SetCrossHonor(dwHonorValue + self:GetCrossHonor());
		objPlayer.SendCrossOverAwardMsg{Exp = dwExp, Honor = dwHonorValue, KillNum = killNum, Rank = dwRank, HoldId = dwHoldId};
	end
	
	local sysMount = objPlayer:GetSystem("CMountSystem");
	sysMount.b_State = b_MountState;
	sysMount:CrossSrvSpeedChange();
	
	--������ս������ͬ�����ͻ���
	local sysNeedSync = objPlayer:GetSystem("CSkillSystem");
	sysNeedSync:OnEnterScene();
	--ͬ������������
	sysNeedSync = objPlayer:GetSystem("CMatrixMethodSystem");
	sysNeedSync:OnEnterScene();
	
	--�ӿ��ս����֪ͨ�ͻ���ˢ��ս����
	objPlayer.FlushBattleScoreMsg{}
	if dataInfo.dwHoldServerId and dataInfo.dwHoldServerId ~= CConfig.Network.dwServerHostID then
		objPlayer.SendHoldInfoToClientMsg{HoldInfo = {}, OverFlag = bOver, BroadFlag = false};	
	end;
    _info("[CrossService] ChangeGameServer", 
        objPlayer:GetAccountID(), 
        objPlayer:GetRoleID());
end;

function CCrossSvrSystem:ReqExpData()
	if self.dwCurCrossID == 0 then
		return;
	end;
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return ;
	end;
	local objCross = self:GetCrossObj();
	if not objCross then
		_err("ReqExpData objCross not exist");
		return;
	end;
	local dwLength = objCross:GetRoleLength(objPlayer:GetRoleID());
	local revertExp = _G.Function.Exp(objPlayer, dwLength) or 0;	
	local honor = objCross:GetHonorById(objPlayer:GetRoleID()) 
	_info("-----ReqExpDat4-----------", dwLength, revertExp, honor);
	objPlayer.ReSendExpDataMsg{Exp = revertExp, Honor = honor};
end;
