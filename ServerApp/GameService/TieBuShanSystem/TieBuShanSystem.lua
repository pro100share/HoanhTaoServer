--[[
	������������
	��Ө
]]
_G.CTieBuShanSystem = {}

function CTieBuShanSystem:new()
	local obj = CSystem:new("CTieBuShanSystem");
	obj.objDBQuery = nil;    --��Ӧ�����ݿ����ģ
	for i,v in pairs(CTieBuShanSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end; 
	return obj;
end;

function CTieBuShanSystem:Create(bIsChangeLine)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local objDB = objPlayer:GetDBQuery();
	if not objDB then
		return false;
	end;
	self.objDBQuery = CTieBuShanSystemDB:new(objDB, self);
	self.dwClothLevel = 1;  --�������ȼ�
	self.dwClothExp = 0;    --����������
	self.dwForbidValue = 0;     --����ֵ
	self.dwSuitLevel = 0; --��װ�ȼ�
	self.dwForbidLimitParam = 0;   --��װ���Ӱ���ֵ����
	self.dwBasicCurtHurtRate = 0;  --�������˱���
	self.dwCutHurtRate = 0;        --��װ���Ӽ��˱���
	local info = objPlayer:GetLineData("CTieBuShanSystem")[1];
	
	if bIsChangeLine == 2 then 
		info = objPlayer:GetLineData("CTieBuShanSystem")[1];
		--info = objPlayer:GetCrossSvrData("CTieBuShanSystem")[1];
	end
	
	if info then
		self:SetTieBuShanBasicInfo(info[1]);
	end;
	return true;
end;

function CTieBuShanSystem:Update()
end;

function CTieBuShanSystem:Destroy()
end;

--����������������Ϣ
function CTieBuShanSystem:SetTieBuShanBasicInfo(info)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	self.dwClothLevel = info.dwClothLevel;  --�������ȼ�
	self.dwClothExp = info.dwClothExp;    --����������
	self.dwForbidValue = info.dwForbidValue;     --����ֵ
	self.dwSuitLevel = info.dwSuitLevel; --��װ�ȼ�
	if not self:HasAuthority("LronCloth") then
		return;
	end;
	self.dwBasicCurtHurtRate = LronClothConfig:BasicCurtHurtRate(objPlayer, self.dwClothLevel, self.dwClothExp, self.dwForbidValue);  --�������˱���
	self:AddPropertyBySuit();
end;
--������Ϸͬ����Ϣ
function CTieBuShanSystem:OnEnterScene()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if not self:HasAuthority("LronCloth") then
		return;
	end;
	objPlayer.SendTieBuShanInfoMsg{TieBuShanLevel = self.dwClothLevel, TieBuShanExp = self.dwClothExp, ForbidValue = self.dwForbidValue, SuitLevel = self.dwSuitLevel};
end;

function CTieBuShanSystem:OnChangeLineBegin()
	local objPlayer = self:GetPlayer()
	if not objPlayer then
		return;
	end;
	local info = {};
	info.dwClothLevel = self.dwClothLevel;  --�������ȼ�
	info.dwClothExp = self.dwClothExp;    --����������
	info.dwForbidValue = self.dwForbidValue;     --����ֵ
	info.dwSuitLevel = self.dwSuitLevel; --��װ�ȼ�
	local tbl = {};
	table.insert(tbl, info);
	objPlayer:SetLineData("CTieBuShanSystem",tbl);
end;

function CTieBuShanSystem:OnEnterCrossBegin()
	local objPlayer = self:GetPlayer()
	if not objPlayer then
		return;
	end;
	local info = {};
	info.dwClothLevel = self.dwClothLevel;  --�������ȼ�
	info.dwClothExp = self.dwClothExp;    --����������
	info.dwForbidValue = self.dwForbidValue;     --����ֵ
	info.dwSuitLevel = self.dwSuitLevel; --��װ�ȼ�
	local tbl = {};
	table.insert(tbl, info);
	objPlayer:SetCrossSvrData("CTieBuShanSystem",tbl);
end;

--���Ȩ��
function CTieBuShanSystem:EventGetAuthority(szAuthName)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if szAuthName == "LronCloth" then
		self.dwBasicCurtHurtRate = LronClothConfig:BasicCurtHurtRate(objPlayer, self.dwClothLevel, self.dwClothExp, self.dwForbidValue);  --�������˱���
		self:AddPropertyBySuit();
		objPlayer.SendTieBuShanInfoMsg{TieBuShanLevel = self.dwClothLevel, TieBuShanExp = self.dwClothExp, ForbidValue = self.dwForbidValue, SuitLevel = self.dwSuitLevel};
	end
end;
--����ʹ����Ʒ��������ֵ
function CTieBuShanSystem:AddProcessByBatch(dwItemId, dwNum)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if not dwItemId then
		return;
	end;
	if not dwNum or dwNum <= 0 then
		return;
	end;
	if not self:HasAuthority("LronCloth") then
		return;
	end;
	if _G.LronClothConfig.LronClothExpID ~= dwItemId then
		return;
	end;
	local itemSystem = objPlayer:GetSystem("CItemSystem");
	if not itemSystem then
		return;
	end;
	local needExp = self:NeedExp();
	local addPerExp = LronClothConfig:GetExpByItemID(dwItemId)
	local num = math.ceil(needExp / addPerExp);
	if num < dwNum then
		dwNum = num;
	end;
	local b_IsEnough_1, n_Minus_1 = itemSystem:CheckDelEnumItemInPacketCond(dwItemId, dwNum);
	if not b_IsEnough_1 then
		return;
	end;
	itemSystem:DelEnumItemInPacket(dwItemId, dwNum, false, _G.ItemSysOperType.TieBuShan);
	local addProgressValue = dwNum * addPerExp;
	--��������ֵ,����
	self:AddProgressValue(addProgressValue)
end;

function CTieBuShanSystem:NeedExp()
	local curLevel = self.dwClothLevel;
	local curExp = self.dwClothExp;
	local info = _G.LronClothConfig.BasicInfo[curLevel];
	local needExp = info.Exp - curExp;
	local maxLevel = table.maxn(_G.LronClothConfig.BasicInfo);
	if curLevel < maxLevel then
		for i = curLevel + 1,  maxLevel do
			needExp = needExp + _G.LronClothConfig.BasicInfo[i].Exp;
		end;
	end;
	return needExp;
end;

--��������ֵ�ӿ�
function CTieBuShanSystem:AddProgressValue(dwValue)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if not self:HasAuthority("LronCloth") then
		return;
	end;
	--����
	local exps = 0;
	local upFlag = false;
	exps = self.dwClothExp + dwValue;
	while(exps > 0) do
		if exps >= _G.LronClothConfig.BasicInfo[self.dwClothLevel].Exp then
			if self.dwClothLevel < table.maxn(_G.LronClothConfig.BasicInfo) then
				exps = exps - _G.LronClothConfig.BasicInfo[self.dwClothLevel].Exp;
				self.dwClothLevel = self.dwClothLevel + 1;	
				upFlag = true;
			else
				exps = _G.LronClothConfig.BasicInfo[self.dwClothLevel].Exp;
				break;
			end;
		else
			break;
		end;
	end;
	self:BroadCastInfo(upFlag);
	self.dwClothExp = exps;
	self.dwBasicCurtHurtRate = LronClothConfig:BasicCurtHurtRate(objPlayer, self.dwClothLevel, self.dwClothExp, self.dwForbidValue);  --�������˱���
	self.objDBQuery:UpdateData(objPlayer:GetRoleID(), self.dwClothLevel, self.dwClothExp)
	objPlayer.SendTieBuShanUpMsg{TieBuShanLevel = self.dwClothLevel, TieBuShanExp = self.dwClothExp};
end;

--���Ӱ���ֵ
function CTieBuShanSystem:AddForbidValue(dwValue)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if not self:HasAuthority("LronCloth") then
		return;
	end;
	self.dwForbidValue = self.dwForbidValue + dwValue;
	if self.dwForbidValue > _G.LronClothConfig.BasicInfo[self.dwClothLevel].ForbidLimit + self.dwForbidLimitParam then
		self.dwForbidValue = _G.LronClothConfig.BasicInfo[self.dwClothLevel].ForbidLimit + self.dwForbidLimitParam;
	end;
	self.objDBQuery:UpdateForbidValue(objPlayer:GetRoleID(), self.dwForbidValue)
	objPlayer.SendForbidInfoMsg{ForbidValue = self.dwForbidValue};
	
	objPlayer:BattleChange();
	
	self:BroadcastMyMsg(false,"OnRoleBattleInfoMsg",
	{
		RoleID = objPlayer:GetRoleID(),
		ChangeTable = {[41]=self.dwForbidValue},
	})
end;
--���ٰ���ֵ
function CTieBuShanSystem:DecForbidValue(dwValue)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if not self:HasAuthority("LronCloth") then
		return;
	end;
	self.dwForbidValue = self.dwForbidValue - dwValue;
	if self.dwForbidValue < 0 then
		self.dwForbidValue = 0;
	end;
	self.objDBQuery:UpdateForbidValue(objPlayer:GetRoleID(), self.dwForbidValue)
	objPlayer.SendForbidInfoMsg{ForbidValue = self.dwForbidValue};
	
	objPlayer:BattleChange();
	
	self:BroadcastMyMsg(false,"OnRoleBattleInfoMsg",
	{
		RoleID = objPlayer:GetRoleID(),
		ChangeTable = {[41]=self.dwForbidValue},
	})
end;
--��ð���ֵ
function CTieBuShanSystem:GetForbidValue()
	if not self:HasAuthority("LronCloth") then
		return 0;
	end;
	return self.dwForbidValue;
end;
--�㲥��Ϣ
function CTieBuShanSystem:BroadCastInfo(bUpFlag)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("Cannot get player on CTieBuShanSystem:BroadCastInfo");
		return;
	end;
	if not bUpFlag then
		return;
	end;
	if self.dwClothLevel < _G.LronClothConfig.BroadCastLevel.ClothLevel then
		return;
	end;
	--�������
	local s_PlayerName = objPlayer:GetInfo().szRoleName;
	--���RoleID
	local n_PlayerRoleID = objPlayer:GetInfo().dwRoleID;
	--ȫ���㲥
	CGameApp.TieBuShanSys_BroadCastMsg{
        PlayerName = s_PlayerName,
        PlayerRoleID = n_PlayerRoleID,
		TieBuShanLevel = self.dwClothLevel,
		};
end;
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
--��װ��������
function CTieBuShanSystem:AddPropertyBySuit()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local skillSystem = objPlayer:GetSystem("CSkillSystem");
	local propertyInfo = LronClothConfig:GetSuitProperty(objPlayer, self.dwClothLevel, self.dwSuitLevel);
	local t_attr = _G.SSingleAttrChange:new();
	if propertyInfo then
		t_attr.dwHPMax	= propertyInfo["dwHPMax"] or 0;	   --����max
		t_attr.dwMPMax	= propertyInfo["dwMPMax"] or 0;    --����max
		t_attr.dwAttack	= propertyInfo["dwAttack"] or 0;   --����
		t_attr.dwDefense= propertyInfo["dwDefense"] or 0;  --����
		t_attr.dwFlee	= propertyInfo["dwFlee"] or 0;	   --��
		t_attr.dwCrit	= propertyInfo["dwCrit"] or 0;	   --����
		t_attr.dwMoveSpeed = propertyInfo["dwMoveSpeed"] or 0;	--�ƶ��ٶ�
		t_attr.dwAttackSpeed = propertyInfo["dwAttackSpeed"] or 0;	--�����ٶ�
		t_attr.dwCritDown = propertyInfo["dwCritDown"] or 0;	--�����ֿ�
		t_attr.dwRemitAttack = propertyInfo["dwRemitAttack"] or 0;	--�˺�����
		skillSystem:NotifyTieBuShanUpdate(t_attr,1);
		--����ϵͳ���Ӱ���ֵ
		local oShield = self:GetPlayer():GetSystem("CShieldSystem");
		if not oShield or not self:HasAuthority("Shield") then
			self.dwForbidLimitParam = propertyInfo["dwForbidLimitParam"];	--����ֵ����
			self.dwCutHurtRate = propertyInfo["dwCutHurtRate"];	--���Ӽ��˱���
		end
		local nLevel = _G.CShieldConfig:GetAllLevelInfo(oShield:GetExp());
		local tLevelInfo = _G.CShieldConfig:GetProInfo(nLevel);
		if tLevelInfo then
			self.dwForbidLimitParam = propertyInfo["dwForbidLimitParam"] + tLevelInfo.dwForbidLimitParam or 0;	--����ֵ����
			self.dwCutHurtRate = propertyInfo["dwCutHurtRate"] + tLevelInfo.dwCutHurtRate or 0;	--���Ӽ��˱���
		end
	end;
end;
--������װ
function CTieBuShanSystem:ActivationSuit()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("Cannot get player on CTieBuShanSystem:ActivationSuit");
		return;
	end;
	if not self:HasAuthority("LronCloth") then
		return;
	end;
	local itemSystem = objPlayer:GetSystem("CItemSystem");
	local skillSystem = objPlayer:GetSystem("CSkillSystem");
	--��װ�ȼ�����
	if self.dwSuitLevel >= _G.LronClothConfig.MaxSuitLevel then
		return;
	end;
	local bCheckFlag = LronClothConfig:CheckActivationSuit(objPlayer, self.dwClothLevel, self.dwSuitLevel)
	if not bCheckFlag then
		objPlayer.SendSuitLevelMsg{Level = self.dwSuitLevel};
		return;
	end;
	local info = LronClothConfig:GetSuitConByLevel(self.dwClothLevel, self.dwSuitLevel + 1)
	local dwItemId = info.ItemID;
	local dwNeedNum = info.ItemNum;
	if not dwItemId then
		return;
	end;
	if dwNeedNum and dwNeedNum < 0 then
		return;
	end;
	local b_IsEnough_1, n_Minus_1 = itemSystem:CheckDelEnumItemInPacketCond(dwItemId, dwNeedNum);
	if not b_IsEnough_1 then
		objPlayer.SendSuitLevelMsg{Level = self.dwSuitLevel};
		return;
	end;
	itemSystem:DelEnumItemInPacket(dwItemId, dwNeedNum, false, _G.ItemSysOperType.UpSuit);
	self.dwSuitLevel = self.dwSuitLevel + 1;
	self:AddPropertyBySuit();
	self.objDBQuery:UpdateSuitLevel(objPlayer:GetRoleID(), self.dwSuitLevel)
	objPlayer.SendSuitLevelMsg{Level = self.dwSuitLevel};
	self:BroadCastSuitInfo();
end;
--����ܵļ��˱���
function CTieBuShanSystem:GetCurtHurtValue()
	return self.dwBasicCurtHurtRate + self.dwCutHurtRate;
end;
--��������װ�㲥
function CTieBuShanSystem:BroadCastSuitInfo()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("Cannot get player on CTieBuShanSystem:BroadCastSuitInfo");
		return;
	end;
	if self.dwSuitLevel < _G.LronClothConfig.BroadCastLevel.SuitLevel then
		return;
	end;
	--�������
	local s_PlayerName = objPlayer:GetInfo().szRoleName;
	--���RoleID
	local n_PlayerRoleID = objPlayer:GetInfo().dwRoleID;
	--ȫ���㲥
	CGameApp.TieBuShanSuitSys_BroadCastMsg{
        PlayerName = s_PlayerName,
        PlayerRoleID = n_PlayerRoleID,
		SuitLevel = self.dwSuitLevel,
		};
end;
-------------------------------------------------------------------------------------------------
--------------------------------------------�鿴����---------------------------------------------
-------------------------------------------------------------------------------------------------
function CTieBuShanSystem:ViewOtherTieBuShan(fromRoleID)
	local objPlayer = self:GetPlayer(); 
	if not objPlayer then
		return;
	end;
	_G.GSRemoteCall(fromRoleID, "CTieBuShanSystem", "BeViewTieBuShan", {objPlayer:GetRoleID()}, nil);
end;

function CTieBuShanSystem:BeViewTieBuShan(dwRoleId)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_G.GSRemoteCall(dwRoleId, "CTieBuShanSystem", "ViewResult", {false, {6000410027}}, nil);
		return;
	end;
	if not self:HasAuthority("LronCloth") then
		_G.GSRemoteCall(dwRoleId, "CTieBuShanSystem", "ViewResult", {false, {6000410027}}, nil);
		return;
	end;
	local info = {};
	info["dwLevel"] = self.dwClothLevel;
	info["dwExp"] = self.dwClothExp;
	info["dwForbidValue"] = self.dwForbidValue;
	info["dwSuitLevel"] = self.dwSuitLevel;

	local extendSys = objPlayer:GetSystem("CKungFuExtendSystem");
	local nCount, nMaxCount;
	if extendSys then
		nCount, nMaxCount = extendSys:GetCount(KungFuEnum.TieBuShan);
	end
	info["tCount"] = {nCount, nMaxCount};
	_G.GSRemoteCall(dwRoleId, "CTieBuShanSystem", "ViewResult", {true, info}, nil);
end;

--���ز鿴���
function CTieBuShanSystem:ViewResult(isOK, info)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("Cannot get player by CTieBuShanSystem:ViewResult");
		return;
	end;
	objPlayer.TieBuShanSys_ViewOtherMsg{IsOK = isOK, Info = info};
end;

---------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------
function CTieBuShanSystem:CheckForbidValueFull()
	return self.dwForbidValue >= (_G.LronClothConfig.BasicInfo[self.dwClothLevel].ForbidLimit + self.dwForbidLimitParam);
end;

function CTieBuShanSystem:GetForbidValueMax()
	return (_G.LronClothConfig.BasicInfo[self.dwClothLevel].ForbidLimit + self.dwForbidLimitParam);
end;

--����������ȼ�
function CTieBuShanSystem:GetClothLevel()
	if not self:HasAuthority("LronCloth") then
		return 0;
	end;
	return self.dwClothLevel;
end;

--�����װ�ȼ�
function CTieBuShanSystem:GetSuitLevel()
	if not self:HasAuthority("LronCloth") then
		return 0;
	end;
	return self.dwSuitLevel;
end;

function CTieBuShanSystem:BroadcastMyMsg(isNeedSelf,szMsgName, tbParam)
	local objSelf = self:GetPlayer();
	if not objSelf then
		return false;
	end;
	
	if not objSelf:IsLoadEnd() then
		return false;
	end
	
	local objMapSys = objSelf:GetSystem("CMapSystem");
	if objMapSys then
		_mapcallout(szMsgName, tbParam, objMapSys:GetLogicID(), isNeedSelf)
	end
end;