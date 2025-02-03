--[[
���ܣ�����ϵͳ
���ͣ��̳���CSystem�࣬�����������������ع���
�汾��
	v1.0	2012-04-10 create by lkj
	v2.0	10/16/2012 modify by lkj ���������߼����ģ�ȡ������Ʒ���������ܡ�����Ʒ�������ñ�󶨡�
]]

_G.CMountSystem = {};

----------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------�ⲿϵͳ���ýӿ�--------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
--�Ƿ������״̬
function CMountSystem:GetState()
	return self.b_State;
end;
--����ӵ���������߽�����û�����ﷵ��0
function CMountSystem:GetMaxMountGrade()
	local nGrade = 0;
	for k, v in pairs(self.t_Mount) do
		if v:GetGrade() > nGrade then
			nGrade = v:GetGrade()
		end;
	end;
	return nGrade;
end;
--��ȡ���������ID
function CMountSystem:GetActiveMountID()
	return self.n_ActiveMountID;
end;
--��ȡ������������� û�з���0
function CMountSystem:GetActiveMountPoint()
	local dwPoint = 0;
	
	local objSelf = self:GetPlayer();
	if not objSelf then
		return;
	end
	
	local mountInst = self:GetMountInst(self:GetActiveMountID());
	if mountInst then
		dwPoint = dwPoint + mountInst:GetPoint();
		
		local objItemSys = objSelf:GetSystem("CItemSystem");
		if objItemSys then
			for slot, dwItemID in pairs(mountInst.t_Equip) do
				local objItem = objItemSys:GetItemInst(dwItemID);
				if objItem then
					dwPoint = dwPoint + objItem:GetScore();
				end
			end
		end
	end;
	
	return dwPoint;
end;
--��þ���ָ�����ϵͳ
function CMountSystem:AddExp(addValue, monsterLevel)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("CMountSystem AddExp Cannot get player");
		return;
	end;
	local mountInst = self:GetMountInst(self.n_ActiveMountID);
	if mountInst then
		addValue = _G.CMountSystemConfig.AddExp(addValue, monsterLevel, mountInst);
		--��������
		local dwExpUp = self.SkillSystem:GetInfo().dwMountExpUp;
		addValue = math.floor(addValue * (1 + dwExpUp));
		objPlayer.MountSys_MountAddExpMsg{Exp = addValue};
		--�Ӿ����ж��Ƿ�����
		local bLevelUP;
		local playerLevel = objPlayer:GetInfo().dwLevel;
		addValue, bLevelUP= mountInst:AddExp(addValue, playerLevel);
		if addValue > 0 then
			self:InsertDirty(self.n_ActiveMountID);
			if bLevelUP then
				self.b_ImmediatelySave = true;
				--���¼���֪ͨ�¼�����
				objPlayer:GetSystem('CPlayerEventCenterSystem'):DoEvent(_G.enumPlayerEventType.EventMountUpLevel, mountInst:GetLevel());
				self:AttributeChange();
			end;
		end;
	end;
end;
-----ʹ�õ��߼����ﾭ��
function CMountSystem:UseItemAddExp(addValue)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("CMountSystem AddExp Cannot get player");
		return 1;
	end;
	local mountInst = self:GetMountInst(self.n_ActiveMountID);
	if(not mountInst) then
		return 2;
	end
	if mountInst then
		--��������
		objPlayer.MountSys_MountAddExpMsg{Exp = addValue};
		--�Ӿ����ж��Ƿ�����
		local bLevelUP;
		local playerLevel = objPlayer:GetInfo().dwLevel;
		addValue, bLevelUP= mountInst:AddExp(addValue, playerLevel);
		if addValue > 0 then
			self:InsertDirty(self.n_ActiveMountID);
			if bLevelUP then
				self.b_ImmediatelySave = true;
				--���¼���֪ͨ�¼�����
				objPlayer:GetSystem('CPlayerEventCenterSystem'):DoEvent(_G.enumPlayerEventType.EventMountUpLevel, mountInst:GetLevel());
				self:AttributeChange();
			end;
			return nil;
		end;
	end;
	return 3;
end
--����������ʹ�
function CMountSystem:EatZZG()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("CMountSystem EatZZG Cannot get player");
		return false;
	end;
	local mountInst = self:GetMountInst(self.n_ActiveMountID);
	if mountInst then
		if mountInst:EatZZG() then
			objPlayer.ReturnMountEatZZGMsg{};
			self:AttributeChange();
			self:InsertDirty(mountInst:GetInstID());
			return true;
		end;
	end;
	return false;
end;
--GM����������������Ӿ���
function CMountSystem:AddExp_GM(addValue)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("CMountSystem AddExp Cannot get player");
		return;
	end;
	local mountInst = self:GetMountInst(self.n_ActiveMountID);
	if mountInst then
		--�Ӿ����ж��Ƿ�����
		objPlayer.MountSys_MountAddExpMsg{Exp = addValue};
		local bLevelUP;
		local playerLevel = objPlayer:GetInfo().dwLevel;
		addValue, bLevelUP = mountInst:AddExp(addValue, playerLevel);
		if addValue > 0 then
			self:InsertDirty(self.n_ActiveMountID);
			if bLevelUP then
				self.b_ImmediatelySave = true;
				--���¼���֪ͨ�¼�����
				objPlayer:GetSystem('CPlayerEventCenterSystem'):DoEvent(_G.enumPlayerEventType.EventMountUpLevel, mountInst:GetLevel());
				self:AttributeChange();
			end;
		end;
	end;
end;

--������������ID
--���óɹ� ����true
--����ʧ�� ����false
function CMountSystem:SetMountEnumID(enumID)
	local mountInst = self:GetMountInst(self:GetActiveMountID());
	if not mountInst then return false end;
	if not _G.CMountTable[enumID] then return false end;
	
	local objPlayer = self:GetPlayer();
	
	local beforeName = mountInst:GetName();
	local beforeQuality = mountInst:GetQuality();
	mountInst:SetEnumID(enumID);
	local afterName = mountInst:GetName();
	local afterQuality = mountInst:GetQuality();
	
	if self:GetState() then
		self.nShift = 0;
		objPlayer:SetMount(mountInst:GetEnumID(self.nShift, objPlayer:GetInfo().dwProf));
		self:AddMountEffect(#mountInst:GetChangeRank());
	end;
	self:AttributeChange();
	
	self:InsertDirty(mountInst:GetInstID());
	self.b_ImmediatelySave = true;
	
	--֪ͨ�¼�����
	objPlayer:GetSystem('CPlayerEventCenterSystem'):DoEvent(_G.enumPlayerEventType.EventMountUpGrade, 1, mountInst:GetGrade());
	
	objPlayer.MountSys_SetEnumIDMsg{MountInstID = self:GetActiveMountID(), EnumID = enumID};
	
	local playerRoleID = objPlayer:GetRoleID();
	local playerName = objPlayer:GetInfo().szRoleName;
	if mountInst:GetGrade() > _G.UpGradeConfig.BroadCastGrade then
		CGameApp.MountSys_BroadCastUpGradeMsg{
			PlayerRoleID = playerRoleID,
			PlayerName = playerName,
			MountInstID = mountInst:GetInstID(),
			BeforeName = beforeName,
			BeforeQuality = beforeQuality,
			AfterName = afterName,
			AfterQuality = afterQuality
		};
	end;
	
	return true;
end;

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

--new()
function CMountSystem:new()
	local obj = CSystem:new("CMountSystem");
	--��������
	for index, value in pairs(CMountSystem) do
		if type(value) == "function" then
			obj[index] = value;
		end;
	end;
	return obj;
end;

--create()
function CMountSystem:Create(bIsChangeLine)
	--ÿ��ϵͳ����ʱ����ҽӵ��Լ��Ĺ�����player����
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("CMountSystem Create Cannot get player");
		return false;
	end;
	--��Ҫ����player�Ļ�������ϵͳ
	self.ItemSystem = objPlayer:GetSystem("CItemSystem");
	if not self.ItemSystem then
		_err("CMountSystem Create Cannot get ItemSystem");
		return false;
	end;
	--��Ҫ����player�Ļ�������ϵͳ
	self.SkillSystem = objPlayer:GetSystem("CSkillSystem");
	if not self.SkillSystem then
		_err("CMountSystem Create Cannot get SkillSystem");
		return false;
	end;
	--��ٴ͸�ϵͳ
	if not CConfig.bIsCrossSvr then
		self.TianGuanCiFuSystem = objPlayer:GetSystem("CTianGuanCiFuSystem");
		if not self.TianGuanCiFuSystem then
			_err("CMountSystem Create Cannot get TianGuanCiFuSystem----");
			return false;
		end;
		--��ʼ��DBģ��
		local objDB = objPlayer:GetDBQuery();
		if not objDB then
			_err("CMountSystem Create Cannot get DBQuery");
			return false;
		end;
		self.objDBQuery = CMountSystemDB:new(objDB, self);
	end;
	--���ش��¼���������
	self.b_ImmediatelySave = false;
	--��Ҫ���̵������
	self.t_Dirty = {};
	
	--------------------
	local Data = {};
	--����ǿ��ս

	--��ȡ��Ϣ
	local Data	= objPlayer:GetLineData("CMountSystem")[1];
	if not Data then
		_err("MountSystem Create CanNot GetLineData!!!");
		Data = {}
	end;
	if Data[1] then--������λ
		self.n_MountSlotNum = Data[1];
	else
		_err("MountSystem Create CanNot GetLineData[1]!!!");
		self.n_MountSlotNum = _G.CMountSystemConfig.InitialSlotNum;
	end;
	if Data[2] then--Ĭ�ϼ�������ID
		self.n_ActiveMountID = Data[2];
	else
		_err("MountSystem Create CanNot GetLineData[2]!!!");
		self.n_ActiveMountID = 0;
	end;
	if Data[3] then--��һ������ID
		self.NextMountID = Data[3];
	else
		_err("MountSystem Create CanNot GetLineData[3]!!!");
		self.NextMountID = 1;
	end;
	if Data[4] then--���״̬
		self.b_State = Data[4];
	else
		self.b_State = false;
	end;
	--�����
	self.t_Mount = {};
	--ӵ���������
	self.n_MountNum = 0;
	--table.print(Data[5]);
	if Data[5] then
		for k, v in pairs(Data[5]) do
			local mountInst = _G.CMount:new(v.n_EnumID);
			mountInst:Parse(v);
			self.t_Mount[mountInst:GetInstID()] = mountInst;
			self.n_MountNum = self.n_MountNum + 1;
		end;
	end;
	--print("self.n_MountNumself.n_MountNumself.n_MountNum",self.n_MountNum)
	--�ݴ�
	if self.n_MountNum > 0 and self.n_ActiveMountID == 0 then
		_err("ERROR mount activeID!!!", bIsChangeLine);
		for k, v in pairs(self.t_Mount) do
			self.n_ActiveMountID = k;
			break;
		end;
	end;
	
	self.nShift = Data[6] or 0;
	--------------------
	--�������а�����
	self.t_MountChart = {};
	local nPlayerRoleID = objPlayer:GetRoleID();
	if not CConfig.bIsCrossSvr then
		for k, v in pairs(self.t_Mount) do
			self.t_MountChart[k] = CChartManager:GetChartNumber(enChartType.eMount,'dwRoleID',nPlayerRoleID) 
		end;
	end;
	--�ӳ�����
	self:AttributeChange();
	---ת�����Լӳ�
	-- local mountInst = self:GetMountInst(self.n_ActiveMountID);
	-- if mountInst then
		-- self:AddProChangeRankAttr(#mountInst:GetChangeRank());
	-- end
	--��������ģ��ID
	if self.b_State then
		local mountInst = self:GetMountInst(self.n_ActiveMountID);
		if mountInst then
			objPlayer:SetMount(mountInst:GetEnumID(self.nShift, objPlayer:GetInfo().dwProf),true);
			self:AddMountEffect(#mountInst:GetChangeRank());
		end;
	end;
	
	--�ۿ�
	self.nDiscount_UpGrade = 1;--�����ۿ�
	
	return true;
end;
--Update()
function CMountSystem:Update(dwInterval)
	if self.b_ImmediatelySave then
		--��������
		self:Save();
		self.b_ImmediatelySave = false;
	end;
	return true;
end;
--destroy
function CMountSystem:Destroy()
	--���ߴ���
	if not CConfig.bIsCrossSvr then
		self:Save();
	end
end;
--OnEnterScene��ͻ���ͬ������
function CMountSystem:OnEnterScene()
	--ͬ���ͻ�����Ϣ
	self:SynchronizeAll();
	self:SynchronizeMountChart();
	self:SynTianGuanCiFu();
end;
--ϵͳ���߿�ʼ
function CMountSystem:OnChangeLineBegin(dwLine)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("error");
		return
	end;
	local Data = {};
	Data[1] = self.n_MountSlotNum;		--������λ
	Data[2] = self.n_ActiveMountID;		--��������ID 
	Data[3] = self.NextMountID;			--��һ������ID
	Data[4] = self.b_State;				--���״̬
	for k, v in pairs(self.t_Mount) do
		if not Data[5] then
			Data[5] = {};
		end;
		local mountDBInfo = v:Serialize();
		table.insert(Data[5], mountDBInfo);
	end;
	Data[6] = self.nShift;
	objPlayer:SetLineData("CMountSystem", Data);
end;

-----�����ս��
function CMountSystem:OnEnterCrossBegin()
	local objPlayer = self:GetPlayer()
	if not objPlayer then
		return;
	end
	local Data = {};
	Data[1] = self.n_MountSlotNum;		--������λ
	Data[2] = self.n_ActiveMountID;		--��������ID
	Data[3] = self.NextMountID;			--��һ������ID	
	Data[4] = self.b_State;				--���״̬
	for k, v in pairs(self.t_Mount) do
		if not Data[5] then
			Data[5] = {};
		end;
		local mountDBInfo = v:CrossSerialize();
		table.insert(Data[5], mountDBInfo);
	end;
	--print("=======OnEnterCrossBegin==========",#Data[5])
	--table.print(Data[5]);
	objPlayer:SetCrossSvrData("CMountSystem",Data);
end;

--ϵͳ���߽���
-- function CMountSystem:OnChangeLineEnd(dwLine)
	-- local objPlayer = self:GetPlayer();
	-- if not objPlayer then
		-- _err("error");
		-- return
	-- end;
	-- self:AttributeChange();
-- end;
--�¼�����
function CMountSystem:OnEventCenter(szEventName, Param1, Param2)
	--���а�ˢ���¼�
	if szEventName == 'EventChartRefresh' and Param1 == _G.enChartType.eMount then
		local objPlayer = self:GetPlayer();
		if not objPlayer then
			_err("cannot get objPlayer");
			return;
		end;
		--�������а�����
		self.t_MountChart = {};
		local nPlayerRoleID = objPlayer:GetRoleID();
		for k, v in pairs(self.t_Mount) do
			self.t_MountChart[k] = CChartManager:GetChartNumber(enChartType.eMount,'dwRoleID',nPlayerRoleID)
		end;
		self:SynchronizeMountChart();
	end
end
--ͬ����ٴ͸�ֵ
function CMountSystem:SynTianGuanCiFu()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("CMountSystem Cannot get player SynTianGuanCiFu");
		return;
	end;
	--װ��������ٴ͸�
	if not CConfig.bIsCrossSvr then
		local n_Value = self.TianGuanCiFuSystem:Get_MountUpGrade();
		local restTime = self:GetRestTime();
		objPlayer.MountSys_SynTianGuanCiFuMsg{MountUpGrade = n_Value, RestTime = restTime};
	end;
end;

function CMountSystem:GetRestTime()
	local endTime = CTimeFormat:GetTodayThisTimeMsec(6, 0);
	local restTime = 0;
	
	if GetCurTime() < endTime then
		restTime = endTime - GetCurTime();
	end;	
	if GetCurTime() > endTime then
		restTime = 24 * 60 * 60 * 1000 - (GetCurTime() - endTime);
	end;
	return restTime;
end;
------------------------------------------------------------------------------------------------------------------------------------------
--����
function CMountSystem:OnDead(dwEnemyType,dwEnemyID)
	self:OnClose();
end;
--���߻ص�
function CMountSystem:OnChangeGameLine()
	self:OnClose();
end;
function CMountSystem:OnClose()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("CMountSystem Cannot get player OnClose");
		return;
	end;
	objPlayer.MountSys_OnCloseMsg{};
end;
-------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------�����������----------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------
--������ͻ���ͬ��������Ϣ
function CMountSystem:SynchronizeAll()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("CMountSystem:SynchronizeAll() get player err!!!");
		return;
	end;
	local info = {};
	--������λ
	info[1] = self.n_MountSlotNum;
	--�������
	info[2]	= self.n_MountNum;
	--Ĭ�ϼ�������ID
	info[3] = self.n_ActiveMountID;
	--���״̬
	info[4]	= self:GetState();
	--������Ϣ
	info[5] = {};
	for k, v in pairs(self.t_Mount) do
		local netData = v:GetNetData();
		info[5][k] = netData;
	end;
	
	objPlayer.MountSys_SynchronizeAllMsg{Info = info};
end;
--��ͻ���ͬ������������Ϣ
function CMountSystem:SynchronizeMountChart()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("CMountSystem:SynchronizeAll() get player err!!!");
		return;
	end;
	objPlayer.MountSys_SynchronizeChartMsg{Info = self.t_MountChart};
end;
--��ͻ���ͬ��������Ϣ
function CMountSystem:SynchronizeMountInst(mountInst)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("CMountSystem:SynchronizeMountInst() get player err!!!");
		return;
	end;
	local netData = mountInst:GetNetData();
	objPlayer.MountSys_SynchronizeMountInstMsg{NetData = netData};
end;
--��ͻ���ͬ��ɾ��������Ϣ
-- function CMountSystem:SynchronizeDeleteMount(n_MountInstID)
	-- local objPlayer = self:GetPlayer();
	-- if not objPlayer then
		-- _err("CMountSystem:SynchronizeDeleteMount() get player err!!!");
		-- return;
	-- end;
	-- objPlayer.MountSys_SynchronizeDeleteMountMsg{MountInstID = n_MountInstID};
-- end;
--��ͻ���ͬ���̶�������Ϣ
-- function CMountSystem:SynchronizeByParam(...)
	-- local objPlayer = self:GetPlayer();
	-- if not objPlayer then
		-- _err("CMountSystem:SynchronizeByParam() get player err!!!");
		-- return;
	-- end;
	-- local arg = {...};
	-- local info = {};
	-- if arg[1] then
		-- info.arg = arg;
		-- info.value = self;
		-- for k, v in ipairs(arg) do
			-- info.value = info.value[v];
		-- end;
		-- objPlayer.MountSys_SynchronizeByParamMsg{Info = info};
	-- end;
-- end;
--------------------------------------------------------
--ͨ������ID��������
function CMountSystem:AddMountByID(mountEnumID)

	local mountInst = _G.CMount:new(mountEnumID);

	return self:AddMountByObj(mountInst);
end;
--ͨ��������������
function CMountSystem:AddMountByObj(mountObj)
	--���û�ط����򷵻�false
	if self.n_MountNum >= self.n_MountSlotNum then return false end;
	--��������ID
	mountObj:SetInstID(self.NextMountID);
	--��������
	self.t_Mount[self.NextMountID] = mountObj;
	self.n_MountNum = self.n_MountNum + 1;
	--������������
	self:InsertDirty(self.NextMountID, true);
	--��������Ϊ��Ҫ����������Ϊ
	self.b_ImmediatelySave = true;
	
	self.NextMountID = self.NextMountID + 1;
	self:SynchronizeMountInst(mountObj);
	
	--��õ�һ������ֱ�Ӽ���
	if self.n_MountNum == 1 then
		self:Activate(mountObj:GetInstID());
	end;
	
	--���¼���֪ͨ�¼�����
	local objPlayer = self:GetPlayer();
	if objPlayer then
		objPlayer:GetSystem('CPlayerEventCenterSystem'):DoEvent(_G.enumPlayerEventType.EventGetNewMount, self.n_MountNum);
	end;
	
	return true, mountObj:GetInstID();
end;
-------------------------------------------------------
--ɾ������
--[[
function CMountSystem:DeleteMountInst(n_MountInstID)
	local mountInst = self:GetMountInst(n_MountInstID);
	if not mountInst then return end;
	for slot, n_EquipInstID in pairs(mountInst.t_Equip) do
		if n_EquipInstID > 0 then return end;
	end;
	--���ɾ��������Ϊ�Ѽ��������
	if n_MountInstID == self.n_ActiveMountID then
		--����������
		self:InActivate();
	end;
	--��DB��ɾ��
	self.objDBQuery:DeleteMountInst(n_MountInstID);
	--��dirty�����Ƴ�
	self:RemoveDirty(n_MountInstID);
	--����������Ƴ�
	self.t_Mount[n_MountInstID] = nil;
	self.n_MountNum = self.n_MountNum - 1;
	--ͬ���ͻ���
	self:SynchronizeDeleteMount(n_MountInstID);
end;
]]
------------------------------------------------------
--�������ʵ��
function CMountSystem:GetMountInst(mountInstID)
	return self.t_Mount and self.t_Mount[mountInstID];
end;
------------------------------------------------------
--����������̱�
function CMountSystem:InsertDirty(mountInstID, bIsNew)
	for k, v in ipairs(self.t_Dirty) do
		if v[1] == mountInstID then
			return;
		end;
	end;
	table.insert(self.t_Dirty, {mountInstID, bIsNew});
end;
--��dirty�����Ƴ�
function CMountSystem:RemoveDirty(n_MountInstID)
	local pos = 0;
	for k, v in ipairs(self.t_Dirty) do
		if v[1] == n_MountInstID then
			pos = k;
			break;
		end;
	end;
	if pos > 0 then
		table.remove(self.t_Dirty, pos);
	end;
end;
---------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------���ݿ����-------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------
--��������
function CMountSystem:Save()
	if not CConfig.bIsCrossSvr then
		--��������ϵͳ����
		local info = {
			n_MountSlotNum = self.n_MountSlotNum;
			n_ActiveMountID = self.n_ActiveMountID;
			n_NextInstID	= self.NextMountID;
		};
		self.objDBQuery:UpdateMountSysInfo(info);
		--��������
		for k, v in ipairs(self.t_Dirty) do
			local mountInst = self:GetMountInst(v[1]);
			if mountInst then
				local mountInfo = mountInst:Serialize();
				if not self.objDBQuery:SaveMountInfo(mountInfo, v[2]) then
					_err("CMountSystem:Save() error!!!");
				end;
			end;
		end;
		self.t_Dirty = {};
	end;
end;
-----------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------�鿴������������б���Ϣ------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
--�鿴���������Ϣ
function CMountSystem:ViewOtherMountList(RoleID, MountInstID)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("Cannot get player by CMountSystem:ViewOtherMountList");
		return;
	end;
	local cbk = function(_, result, _)
		if result == -1 then
			self:ViewResult(false);
		end;
	end;
	_G.GSRemoteCall(RoleID, "CMountSystem", "BeViewMountList", {MountInstID, objPlayer:GetRoleID()}, cbk);
end;
--���ز鿴���
function CMountSystem:ViewResult(isOK, mountList, nProf)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("Cannot get player by CMountSystem:ViewResult");
		return;
	end;
	objPlayer.MountSys_ViewOtherResultMsg{IsOK = isOK, MountList = mountList, Prof = nProf};
end;
--�����˲鿴�����������б���
function CMountSystem:BeViewMountList(n_MountInstID, fromRoleID)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("Cannot get player by CMountSystem:BeViewMountList");
		return;
	end;
	local mountInst = self:GetMountInst(n_MountInstID);
	if not self:HasAuthority("Mount") then 
		_G.GSRemoteCall(fromRoleID, "CMountSystem", "ViewFailResult", {false}, nil);
		return 
	end;
	
	if not mountInst then 
		_G.GSRemoteCall(fromRoleID, "CMountSystem", "ViewFailResult", {false}, nil);
		return
	end;
	local mountList = {};
	local mountNetData = mountInst:GetNetData();
	mountNetData[12] = self.t_MountChart[n_MountInstID];
	--����װ��
	mountNetData[10] 	= {};
	for slot, n_EquipInstID in pairs(mountInst.t_Equip) do
		--װ��������Ϣ
		local itemInst = self.ItemSystem:GetItem(n_EquipInstID);
		if itemInst then
			-- local itemNetData = SItemMessage:new();
			-- itemInst:FillItemMessage(itemNetData);
			
			local itemNetData = itemInst:GetNetData();
			mountNetData[10][slot] = itemNetData;
		end;
	end;
	table.insert(mountList, mountNetData);
	for k, v in pairs(self.t_Mount) do
		if k ~= n_MountInstID then
			mountNetData = v:GetNetData();
			mountNetData[12] = self.t_MountChart[k];
			--����װ��
			mountNetData[10] 	= {};
			for slot, n_EquipInstID in pairs(v.t_Equip) do
				--װ��������Ϣ
				local itemInst = self.ItemSystem:GetItem(n_EquipInstID);
				if itemInst then
					-- local itemNetData = SItemMessage:new();
					-- itemInst:FillItemMessage(itemNetData);
					
					local itemNetData = itemInst:GetNetData();
					mountNetData[10][slot] = itemNetData;
				end;
			end;
			table.insert(mountList, mountNetData);
		end;
	end;
	_G.GSRemoteCall(fromRoleID, "CMountSystem", "ViewResult", {true, mountList, objPlayer:GetInfo().dwProf}, nil);
end;

--���ز鿴���
function CMountSystem:ViewFailResult(isOK)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("Cannot get player by CMountSystem:ViewResult");
		return;
	end;
	objPlayer.MountSys_ViewOtherFailMsg{IsOK = isOK};
end;
--�������ȼ�
function CMountSystem:GetMountLevel()
	local level = 0;
	if self.n_ActiveMountID then
		local mountInst = self:GetMountInst(self.n_ActiveMountID);
		if mountInst then
			level = mountInst:GetLevel();
		end;
	end;
	return level;
end;

--��ȡ����Ƚ�
function CMountSystem:GetMountGrade()
	local grade = 0;
	if self.n_ActiveMountID then
		local mountInst = self:GetMountInst(self.n_ActiveMountID);
		if mountInst then
			grade = mountInst:GetGrade();
		end;
	end;
	return grade;
end;

