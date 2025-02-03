--[[
	����Ѻ��
	2013-09-06
]]
_G.CEscortSystem = {};
function CEscortSystem:new()
	local obj = CSystem:new("CEscortSystem");
	obj.objDBQuery = nil;    --��Ӧ�����ݿ����ģ
	for i,v in pairs(CEscortSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end; 
	return obj;
end;

function CEscortSystem:Create(bIsChangeLine)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local objDB = objPlayer:GetDBQuery();
	if not objDB then
		return false;
	end;
	self.objDBQuery = CEscortSystemDB:new(objDB, self);
	self.dwEscortNum = 0; --���ڴ���
	self.dwShellEscortNum = 0; --���ڴ���
	self.dwRefQuality = 0;
	self.dwGetType = 0;
	self.dwEscortID = 0;
	self.dwType = 0;
	self.dwQuality = 0;
	self.dwMapId = 0;
	local info = objPlayer:GetLineData("CEscortSystem")[1];
	if info then
		self.dwEscortNum = info[1].dwEscortNum;  --���ڴ���
		self.dwRefQuality = info[1].dwRefQuality; --ˢ��Ʒ�ʴ���
		self.dwEscortID = info[1].dwEscortID;   --���ڵ�id
		self.dwGetType = info[1].dwGetType;    --�ڳ���Դ  (1:��,2:��)
		self.dwType = info[1].dwType;          --�ڳ��ȼ�
		self.dwQuality = info[1].dwQuality;    --�ڳ�Ʒ��
		self.dwMapId = info[1].dwMapId;        --�ڳ���ͼ
		self.dwShellEscortNum = info[1].dwShellEscortNum;  --���ڴ���
	end;
	return true;
end;

function CEscortSystem:OnEnterScene()
	self:SendEscortState();
end;

function CEscortSystem:SendEscortState()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local dwRunFlag = CEscortManager:GetRunEscort(objPlayer:GetRoleID())
	objPlayer.SendRunEscortMsg{RunFlag = dwRunFlag};
end;

function CEscortSystem:OnDead(dwEnemyType,dwEnemyID)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local objWarSystem = objPlayer:GetSystem("CWarSystem");
	if objWarSystem.dwCurWarID == 0 then
		return;
	end
	local mapSystem = objPlayer:GetSystem("CMapSystem");
	if dwEnemyType == enEntType.eEntType_Monster then
		return;
	end;
	local objEnemy = CPlayerManager:GetPlayerByRoleID(dwEnemyID);
	if not objEnemy then
		return;
	end;
	local escortSystem = objEnemy:GetSystem("CEscortSystem");
	--���ڴ����Ѿ����ڿ��Խ�������
	if escortSystem:GetShellEscortNum() >= _G.EscortOtherInfo.ShellEscortNum then 
		return;
	end;
	--������δѺ����,���ܽ���
	if escortSystem:GetEscortID() ~= 0 then
		return;
	end;
	--��������Ѻ��,���ܽ���
	if CEscortManager:GetRunEscort(dwEnemyID) ~= 0 then
		return;
	end;
	if CEscortManager:GetRunEscort(objPlayer:GetRoleID()) ~= 0 then
		local monsterEntityId = CEscortManager:GetRunEscort(objPlayer:GetRoleID())	
		local map = mapSystem:GetCurMap();
		if not map then
			return;
		end;		
		local monster = map.objMonMgr:GetMonsterInfo(monsterEntityId);
		local ownPlayerId = 0;
		local ownPlayerName = "";
		local monsterBornInfo = nil;
		if monster then
			monsterBornInfo = monster:GetEscortInfo();
		end;
		if not monsterBornInfo then
			return;
		end;
		ownPlayerId = monsterBornInfo.dwBornRoleID;
		ownPlayerName = monsterBornInfo.szBornName;
		
		if ownPlayerId == dwEnemyID then
			--���س�
			self:BroadCastMsg(81, {objEnemy:GetInfo().szRoleName, objPlayer:GetInfo().szRoleName});
		else
			self:BroadCastMsg(82, {objEnemy:GetInfo().szRoleName, objPlayer:GetInfo().szRoleName, ownPlayerName});
			--����
		end;
		CEscortManager:RecordRunEscort(dwEnemyID, monsterEntityId);
		CEscortManager:RecordRunEscort(objPlayer:GetRoleID(), nil);
		map.objMonMgr:DacoityRoleMonster(monsterEntityId,dwEnemyID,objEnemy:GetInfo().szRoleName)
		--ˢ�߾��ڳ�,ˢ�����ڳ�	
		local dwMapID,fPosX,fPosY = monster:GetPos()
		local dwHp = monster:GetHP()
		local dwMaxHp = monster:GetMaxHP()
		escortSystem:SynEscortPos(dwHp, dwMaxHp, dwMapID, fPosX, fPosY, monsterBornInfo.dwBornTime, monsterBornInfo.dwLevel, monsterBornInfo.dwQuality)
		objPlayer.SendLostEscortMsg{};
		escortSystem:SendEscortState();
		self:SendEscortState();
	end;
end;

--��ʼ���߼�¼����
function CEscortSystem:OnChangeLineBegin(dwNewLineID)
	local objPlayer = self:GetPlayer()
	if not objPlayer then
		return;
	end;
	local info = {};
	info.dwEscortNum = self.dwEscortNum;
	info.dwRefQuality = self.dwRefQuality;
	info.dwEscortID = self.dwEscortID;
	info.dwGetType = self.dwGetType;
	info.dwType = self.dwType;
	info.dwQuality = self.dwQuality;
	info.dwMapId = self.dwMapId;
	info.dwShellEscortNum = self.dwShellEscortNum;  --���ڴ���
	local tbl = {};
	table.insert(tbl, info);
	objPlayer:SetLineData("CEscortSystem",tbl);
end;

function CEscortSystem:OnChangeLineEnd(dwNewLineID)
	self:SendEscortState();
end;

function CEscortSystem:SetEscortInfo()
	self.dwEscortNum = 0;
	self.dwRefQuality = 0;
	self.dwEscortID = 0;
	self.dwGetType = 0;
	self.dwType = 0;
	self.dwQuality = 0;
	self.dwMapId = 0;
	self.dwShellEscortNum = 0;
	self:NotifyClientEscortInfo();
end;

-- function CEscortSystem:SetBuyEscortInfo()
	-- self.dwGetType = 0;
	-- self.dwType = 0;
	-- self.dwQuality = 0;
	-- self.dwMapId = 0;
-- end;

--֪ͨ�ͻ��˸���Ѻ������
function CEscortSystem:NotifyClientEscortInfo()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local mapSystem = objPlayer:GetSystem("CMapSystem");
	local dwCurMapId = mapSystem:GetCurMapID();
	if not dwCurMapId then
		return;
	end;
	local escortInfo = CEscortManager:GetEscortInfo();
	local nextRefTime = CEscortManager:GetNextRefTime() - GetCurTime();
	if not escortInfo[dwCurMapId] then
		_info("------Escort-----NotifyClientEscortInfo----", dwCurMapId);
		objPlayer.NotifyEscortInfoMsg{Info = {}, EscortNum = self.dwEscortNum, RefQualityNum = self.dwRefQuality, EscortId = self.dwEscortID, Type = self.dwType, DwQuality = self.dwQuality, NextRefTime = nextRefTime, ShellEscortNum = self.dwShellEscortNum};
		return;
	end;
	objPlayer.NotifyEscortInfoMsg{Info = escortInfo[dwCurMapId], EscortNum = self.dwEscortNum, RefQualityNum = self.dwRefQuality, EscortId = self.dwEscortID, Type = self.dwType, DwQuality = self.dwQuality, NextRefTime = nextRefTime, ShellEscortNum = self.dwShellEscortNum};
end;
--ͬ���ڳ����꣬Ѫ����
function CEscortSystem:SynEscortPos(hp, maxHp, mapId, posx, posy, dwBornTime, dwType, dwQuality)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local restTime = _G.EscortConfig.dwFailTime - (GetCurTime() - dwBornTime);
	objPlayer.SynEscortPosMsg{Hp = hp, MaxHp = maxHp, MapId = mapId, Posx = posx, Posy = posy, RestTime = restTime, Type = dwType, Quality = dwQuality};
end;
--�����ڳ������Ϣ
function CEscortSystem:SendEscortMsg(stringId, infoTbl)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	objPlayer.SendEscortMsg{StringID = stringId, AttrTbl = infoTbl}
end;
--����
function CEscortSystem:ReqRubEscort(pos)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if not pos or (pos > 3 or pos < 1) then
		_info("----ReqRubEscort1---", objPlayer:GetRoleID());
		return;
	end;
	if self:GetShellEscortNum() >= _G.EscortOtherInfo.ShellEscortNum then
		_info("----ReqRubEscort2---", objPlayer:GetRoleID(), self:GetShellEscortNum());
		return;
	end;
	local mapSystem = objPlayer:GetSystem("CMapSystem");
	local dwCurMapId = mapSystem:GetCurMapID();
	if not dwCurMapId then
		_info("----ReqRubEscort3---", objPlayer:GetRoleID());
		return;
	end;
	--����Ƿ��и���Ѻ��ս���Ƿ���
	local dwCurWarId = _G.EscortOtherInfo.GetWarId(objPlayer);
	if not CWarHost:FindWar(dwCurWarId) then
		_info("----ReqRubEscort4---", objPlayer:GetRoleID());
		return;
	end;
	--����Ѻ�ڣ���������
	if CEscortManager:GetRunEscort(objPlayer:GetRoleID()) ~= 0 then
		_info("----ReqRubEscort5---", objPlayer:GetRoleID());
		return;
	end;
	--��������ڳ�����
	if self.dwEscortID > 0 then
		_info("----ReqRubEscort6---", objPlayer:GetRoleID());
		return;
	end;
	--����ڳ�����
	local refEscortInfo = CEscortManager:GetEscortInfo();
	if not refEscortInfo then
		_info("----ReqRubEscort7---", objPlayer:GetRoleID());
		return;
	end;
	local dwMonsterId = refEscortInfo[dwCurMapId][pos].dwMonsterId;
	local dwEscortNum = refEscortInfo[dwCurMapId][pos].dwNum;
	local dwQuality = refEscortInfo[dwCurMapId][pos].dwQuality;
	if dwEscortNum < 1 then  --���ڳ�����
		_info("----ReqRubEscort8---", objPlayer:GetRoleID());
		self:NotifyClientEscortInfo();
		return;
	end;
	self.dwEscortID = dwMonsterId;
	self.dwType = pos;
	self.dwQuality = dwQuality;
	self.dwGetType = 1;
	self.dwMapId = dwCurMapId;
	self.objDBQuery:SetRubEscortInfo(objPlayer:GetRoleID(), self.dwEscortID, self.dwType, self.dwQuality, self.dwGetType, self.dwMapId)
	CEscortManager:SetEscortInfo(dwCurMapId, pos)
	self:NotifyClientEscortInfo();
end;
--ˢ���ڳ�Ʒ��
function CEscortSystem:ReqRefreshEscort()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local mapSystem = objPlayer:GetSystem("CMapSystem");
	local itemSystem = objPlayer:GetSystem("CItemSystem");
	local dwCurMapId = mapSystem:GetCurMapID();
	if not dwCurMapId then
		return;
	end;
	--����Ƿ��и���Ѻ��ս���Ƿ���
	local dwCurWarId = _G.EscortOtherInfo.GetWarId(objPlayer);
	if not CWarHost:FindWar(dwCurWarId) then
		return;
	end;

	if self.dwEscortID <= 0 then
		return;
	end;
	if self.dwRefQuality >= _G.EscortOtherInfo.FreeRefreshQuality then
		local costGold = _G.PersonalEscortConfig.Refresh.Cost(objPlayer, self.dwRefQuality, self.dwType, self.dwQuality);
		if not itemSystem:IsGoldEnough(costGold) then
			return;
		end;
		itemSystem:CostGold(costGold, _G.ItemSysOperType.RefEscortQuality);
	end;
	local newQuality = _G.PersonalEscortConfig.Refresh.Result(objPlayer, self.dwRefQuality, self.dwType, self.dwQuality);
	self.dwQuality = newQuality;
	self.dwRefQuality = self.dwRefQuality + 1;
	self.dwEscortID = _G.PersonalEscortConfig.Car[self.dwType][self.dwQuality].Monster.dwMonsterId;
	self.objDBQuery:SetEscortQuality(objPlayer:GetRoleID(), self.dwEscortID, self.dwQuality, self.dwRefQuality);
	self:NotifyClientEscortInfo();
	if newQuality >= _G.EscortOtherInfo.RefreshQuality then
		self:EscortBroadCastMsg(newQuality);
	end;
end;

--�����ڳ�
function CEscortSystem:ReqBuyEscort(pos)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local mapSystem = objPlayer:GetSystem("CMapSystem");
	local itemSystem = objPlayer:GetSystem("CItemSystem");
	local dwCurMapId = mapSystem:GetCurMapID();
	if not dwCurMapId then
		return;
	end;
	if self:GetShellEscortNum() >= _G.EscortOtherInfo.ShellEscortNum then 
		return;
	end;
	--����Ѻ�ڣ���������
	if CEscortManager:GetRunEscort(objPlayer:GetRoleID()) ~= 0 then
		return;
	end;
	--��������ڳ���Ϊ�������ڳ�����
	-- if self.dwEscortID > 0 and self.dwGetType == 1 then
		-- return;
	-- end;
	--����Ƿ��и���Ѻ��ս���Ƿ���
	local dwCurWarId = _G.EscortOtherInfo.GetWarId(objPlayer);
	if not CWarHost:FindWar(dwCurWarId) then
		return;
	end;
	local costGold = _G.RefreshMonster[dwCurMapId][pos].dwGold;
	if not itemSystem:IsGoldEnough(costGold) then
		return;
	end;
	itemSystem:CostGold(costGold, _G.ItemSysOperType.BuyEscort);
	--����ڳ�
	local refEscortInfo = CEscortManager:GetEscortInfo();
	if not refEscortInfo then
		return;
	end;
	local dwMonsterId = refEscortInfo[dwCurMapId][pos].dwMonsterId;
	local dwQuality = refEscortInfo[dwCurMapId][pos].dwQuality;
	self.dwEscortID = dwMonsterId;
	self.dwType = pos;
	self.dwQuality = dwQuality;
	self.dwGetType = 2;
	self.dwMapId = dwCurMapId;
	self.objDBQuery:SetRubEscortInfo(objPlayer:GetRoleID(), self.dwEscortID, self.dwType, self.dwQuality, self.dwGetType, self.dwMapId)
	self:NotifyClientEscortInfo();
end;
--��ʼѺ��
function CEscortSystem:BeginRunEscort()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if self.dwEscortNum >= _G.EscortOtherInfo.RunEscortNum then
		return;
	end;
	local mapSystem = objPlayer:GetSystem("CMapSystem");
	local itemSystem = objPlayer:GetSystem("CItemSystem");
	local dwCurMapId = mapSystem:GetCurMapID();
	if not dwCurMapId then
		return;
	end;	
	--����Ƿ��и���Ѻ��ս���Ƿ���
	local dwCurWarId = _G.EscortOtherInfo.GetWarId(objPlayer);
	if not CWarHost:FindWar(dwCurWarId) then
		return;
	end;
	if CEscortManager:GetRunEscort(objPlayer:GetRoleID()) ~= 0 then
		return;
	end;
	local lineInfo = _G.PersonalEscortConfig.Node[dwCurMapId];
	local map = mapSystem:GetCurMap();
	if not map then
		return;
	end;
	local monster = map.objMonMgr:BournRoleMonster(objPlayer:GetRoleID(),objPlayer:GetInfo().szRoleName,self.dwType,self.dwQuality,lineInfo,GetCurTime())
	local monsterEntityId = monster:GetRoleID();
	self.dwEscortNum = self.dwEscortNum + 1;
	CEscortManager:RecordRunEscort(objPlayer:GetRoleID(), monsterEntityId);
	self.dwType = 0;
	self.dwGetType = 0;
	self.dwMapId = 0;
	self.dwQuality = 0;
	self.dwEscortID = 0;
	self.objDBQuery:SetRubEscortInfo(objPlayer:GetRoleID(), 0, 0, 0, 0, 0);
	self.objDBQuery:UpdateEscortNum(objPlayer:GetRoleID(), self.dwEscortNum);
	self:SendEscortState();
	objPlayer:GetSystem('CPlayerEventCenterSystem'):DoEvent(_G.enumPlayerEventType.EventBeginRunEscort);
end;

--������
function CEscortSystem:GetEscortAward(result, dwStartTime, dwType, dwQuality, dwBornPlayerId, dwRoleId)
	local objPlayer = self:GetPlayer();
	if self:GetShellEscortNum() >= _G.EscortOtherInfo.ShellEscortNum then 
		_info("-----GetEscortAward1--", dwRoleId);
		return;
	end;
	if CEscortManager:GetRunEscort(dwRoleId) == 0 then
		_info("-----GetEscortAward2--", dwRoleId);
		return;
	end;
	CEscortManager:RecordRunEscort(dwRoleId, nil);
	self:SendEscortState();
	if not objPlayer then
		_info("-----GetEscortAward3--", dwRoleId);
		return;
	end;
	if result > 0 then
		objPlayer.SendEscortResMsg{Res = result, DwType = dwType, DwQuality = dwQuality, ShellEscort = self.dwShellEscortNum};
		return;
	end;
	self.dwShellEscortNum = self.dwShellEscortNum + 1;
	self.objDBQuery:UpdateShellEscortNum(objPlayer:GetRoleID(), self.dwShellEscortNum);
	local itemSystem = objPlayer:GetSystem("CItemSystem");
	local objElemSystem = objPlayer:GetSystem("CFiveElemSystem");
	if not itemSystem then
		return;
	end;
	if not objElemSystem then
		return;
	end;
	local lifeTime = GetCurTime() - dwStartTime;
	local param = _G.EscortOtherInfo.GetAwardParam(lifeTime);
	local awardList = {};
	if dwBornPlayerId ~= objPlayer:GetRoleID() then
		awardList = _G.PersonalEscortConfig.Car[dwType][dwQuality].Reward;
	else
		awardList = _G.PersonalEscortConfig.Car[dwType][dwQuality].OtherReward;
	end;
	local dwMoney = param * (awardList.dwMoney or 0);
	--����money
	if dwMoney > 0 then
		itemSystem:AddPacketMoney(dwMoney, _G.ItemSysOperType.EscortAward);
	end;
	local dwExp = param * (awardList.dwExp or 0);
	objPlayer:AddExp(dwExp);
	local dwPneuma = param * (awardList.dwPneuma or 0);
	local uItemGold, uItemWood, uItemWater, uItemFire, uItemEarth  = objElemSystem:GetElemValue()
	if dwPneuma and dwPneuma ~= 0 then
	--��������
		objElemSystem:ChangeAttr("dwMetalValue",dwPneuma);
		objElemSystem:ChangeAttr("dwWoodValue",dwPneuma);
		objElemSystem:ChangeAttr("dwWaterValue",dwPneuma);
		objElemSystem:ChangeAttr("dwFireValue",dwPneuma);
		objElemSystem:ChangeAttr("dwEarthValue",dwPneuma);
		local setData = {
			[1] = {dwCurrent = uItemGold, dwChange = dwPneuma};
			[2] = {dwCurrent = uItemWood, dwChange = dwPneuma};
			[3] = {dwCurrent = uItemWater, dwChange = dwPneuma};
			[4] = {dwCurrent = uItemFire, dwChange = dwPneuma};
			[5] = {dwCurrent = uItemEarth, dwChange = dwPneuma};
		}
		CLogSystemManager:zhenqi(objPlayer, setData, _G.FiveElemSysOperType.EscortAward)
	end;
	local dwBindGold = param * (awardList.dwBindGold or 0);
	if dwBindGold > 0 then
		itemSystem:AddBindGold(dwBindGold, _G.ItemSysOperType.EscortAward);
	end;
	local awardItem = {};
	if awardList.Item then
		for index, info in pairs(awardList.Item) do
			local tItem = {
				dwItemEnum	= info.dwItemId;
				dwItemNumber= param * (info.dwNum or 0);
				dwBindType	= info.dwBind;
			};
			table.insert(awardItem,tItem);
		end;
	end;
	local bFlag = itemSystem:AddEnumItemListToPacket(awardItem or {}, _G.ItemSysOperType.EscortAward);
	if not bFlag then
		self:SendEscortAward(awardItem or {}, objPlayer:GetInfo().szRoleName, objPlayer:GetRoleID())
	end;
	_info("-----GetEscortAward4--", dwRoleId);
	objPlayer.SendEscortResMsg{Res = result, DwType = dwType, DwQuality = dwQuality, ShellEscort = self.dwShellEscortNum};
	objPlayer:GetSystem('CPlayerEventCenterSystem'):DoEvent(_G.enumPlayerEventType.EventEscortAward);
end;

function CEscortSystem:GetEscortID()
	return self.dwEscortID;
end;

--��ý��ڴ���
function CEscortSystem:GetShellEscortNum()
	return self.dwShellEscortNum;
end;

function CEscortSystem:SendEscortAward(tabAddList, roleName, roleId)
	local Items = {};	
	for _, info in pairs(tabAddList) do
		local itemEnum = info["dwItemEnum"];
		local num = info["dwItemNumber"];
		local bindType = info["dwBindType"]
		local item = SItemMessage:new();
		item.dwItemEnum = itemEnum;
		item.dwItemNumber = num;
		item.dwLifeTime = -1;
		item.dwBindType = bindType; 
		table.insert( Items, item );
	end;
	
	local mail = CMail:new();
	mail:SetSender(-9999, _G.EscortMailMsg[1]);
	mail:SetReceiver(roleId, roleName);
	mail:SetContent(_G.EscortMailMsg[2], _G.EscortMailMsg[3]);
	mail:SetLifeTime(SMailInfo.life*24*3600*1000);
	mail:SetAccessory(0, 0, 0, Items);
	CMailManager:SendMail(mail);
end;

function CEscortSystem:BroadCastMsg(stringId, tbl)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("Cannot get player on CEscortSystem:BroadCastMsg");
		return;
	end;
	--�������
	local s_PlayerName = objPlayer:GetInfo().szRoleName;
	--���RoleID
	local n_PlayerRoleID = objPlayer:GetInfo().dwRoleID;
	--ȫ���㲥
	CGameApp.EscortSys_BroadCastMsg{
        StringId = stringId,
        AttrTbl = tbl,
	}
end;

function CEscortSystem:EscortBroadCastMsg(dwNewQuality)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("Cannot get player on CEscortSystem:EscortBroadCastMsg");
		return;
	end;
	--�������
	local s_PlayerName = objPlayer:GetInfo().szRoleName;
	--���RoleID
	local n_PlayerRoleID = objPlayer:GetInfo().dwRoleID;
	--ȫ���㲥
	CGameApp.EscortRefSys_BroadCastMsg{
        PlayerName = s_PlayerName,
        PlayerRoleID = n_PlayerRoleID,
		NewQuality = dwNewQuality
	}
end;