--[[
	����ϵͳ
]]

--ÿ��updateͬ���ĳ�������
local m_dwSendCount = 10;

_G.CPetSystem = {};
function CPetSystem:new()
	local obj = CSystem:new("CPetSystem");
	obj.objDBQuery = nil;    --��Ӧ�����ݿ����ģ��
	
	obj.setPetList = {};
	
	obj.dwOutPetID = 0;--��ǰ��ս�ĳ���
	
	--��Ұ�ڳ������ز���
	obj.CanSeePet = {}
	obj.AddList = {}
	obj.DelList = {}
	
	for i,v in pairs(CPetSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end; 
	obj.petSkill = CPetSkill:new(obj);
	obj.petEquip = CPetEquip:new(obj);
	obj.petBourn = CPetBourn:new(obj);
	obj.petAptitude = CPetAptitudeSystem:new(obj);
	obj.petWash = CPetWash:new(obj);
	return obj;
end;
--ˢ�³�������
function CPetSystem:RefAptitudeUpLimit(dwPetId)
	self.petAptitude:GetExtraUpLimit(dwPetId)
end;

--ϵͳ����
function CPetSystem:Create()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local objDB = objPlayer:GetDBQuery();
	if not objDB then
		_err("--Get objDB error ~~ by CPetSystem");
		return;
	end;
	self.PetInfo = {};
	self.objDBQuery = CPetSystemDB:new(objDB, self);
	local dwProf = objPlayer:GetInfo().dwProf;
	local skillSystem = objPlayer:GetSystem("CSkillSystem");
	--�ȶ�ȡ����װ�� ����������Ե�ʱ��Ҫ����
	self.petEquip:Create();
	
	local petInfo = objPlayer:GetLineData("CPetSystem")[1][1];
	
	--������ﾳ�羭�� �����������Ҫ��
	self.petBourn:Create(petInfo);
	
	self:SetPetInfo(petInfo)
	self.petAptitude:Create(petInfo)
	self.petWash:Create(petInfo);
	-- self:AddPetInstructProperty()
	self.CanSeePet = {}
	self.DelList = {}
	self.AddList = {}
	---���＼��
	local data1 = objPlayer:GetLineData("CPetSystem")[1][2] or {};
	local data2 = objPlayer:GetLineData("CPetSystem")[1][3] or {};
	self.petSkill:Create(data1,data2);
	self:AddRoleProperty();
	return true;
end;
function CPetSystem:Destroy()
	for petId, objPet in pairs(self.setPetList) do
		objPet:DestroyDriver()
		if objPet.bExpChange then
			local objDB = self:GetPlayer():GetDBQuery();
			if not objDB then
				_err("--Get objDB error ~~ by CPetObject");
				return;
			end;
			--print("========2===========UpdateUpdateUpdateUpdateUpdateUpdate================================")
			local SqlCmd = objDB:CreateUpdateCmd('T_Pet_Info');
			SqlCmd.Fields.dwExp = objPet.dwExp;
			SqlCmd.Wheres.dwRoleId = objPet.dwRoleID;
			SqlCmd.Wheres.dwPetId = objPet.dwEnumID;
			SqlCmd:execute();
			objPet.bExpChange = false;
		end
	end
end
--��Ϊϵͳ���д�����ɺ���õĺ��� 
function CPetSystem:OnCreateOver()
	--�ж����г��������״̬
	for petID, petObj in pairs(self.setPetList) do
		if petObj then
			petObj:JudgePetDeadState(self);
		end
	end
	
end

function CPetSystem:WhenPlayerDead(dwTimes,dwEnemyID,dwType)
	if self.dwOutPetID == 0 then return end;
	
	--���ó���״̬Ϊ����
	local objSelf = self:GetPlayer(); 
	objSelf.SendPetStateChgMsg{PetId = self.dwOutPetID, State = 1};
	
	--�������� ���س���
	self:GetOutPetObject():Hide();
	self.dwOutPetID = 0;
end

function CPetSystem:OnEventCenter(szEventName,Param1,param2,param3)
	--������ұ�ɱ������Ϣ
	if szEventName == enumPlayerEventType.EventBeKilled then
		self:WhenPlayerDead(Param1,param2,param3);
	end
end

--���������¼���Ӧ
function CPetSystem:EventLevelUp(dwValue,dwUpLevel)
	--local objPlayer = self:GetPlayer();
	--if not objPlayer then
	--	return false;
	--end;
	--for dwPetId, objPet in pairs(self.setPetList) do
		-- info.dwLevel = dwUpLevel;
		-- info.dwExp = 0;
		-- self.objDBQuery:UpdatePetLevel(dwPetId, info.dwLevel, info.dwExp)
		--objPlayer.SendPetLevelChgMsg{PetId = dwPetId, Level = dwUpLevel, Exp = 0};
		-----�ȼ����˿������＼�ܲ�
		--self.petSkill:OpenSkillPos(dwPetId,dwUpLevel)
	--end;
end

function CPetSystem:SetPetInfo(petInfo)
	self.PetNum = 0;
	
	if not petInfo then
		return;
	end
	
	local objSelf = self:GetPlayer();
	if not objSelf then
		return;
	end
	
	for k,tbInfo in pairs(petInfo)do
		local objPet = CPetObject:new(objSelf:GetRoleID(),tbInfo,self.petEquip:GetEquipTable(tbInfo.dwPetId),self.petBourn:GetExp(tbInfo.dwPetId),self);
		self.setPetList[tbInfo.dwPetId] = objPet;
		if tbInfo.dwState == 2 and self.dwOutPetID == 0 then
			self.dwOutPetID = tbInfo.dwPetId;
		end
		self.PetNum  = self.PetNum + 1;
	end
	
end;

function CPetSystem:SendPetInfo(dwPetID)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if dwPetID then
		local objPet = self.setPetList[dwPetID];
		if objPet then
			local tbBaseInfo = objPet:GetPetBaseInfo();
			local level = 0
			level,tbBaseInfo.dwExp = PetConfigScript:GetPetLevel(tbBaseInfo.dwExp);
			local tbBattleInfo = objPet:GetBattleInfo();
			
			objPlayer.SynchronizeDevelopInfoToClientMsg
			{
				PetId = dwPetID;
				BaseInfo = tbBaseInfo;
				BattleInfo = tbBattleInfo;
				BOver = true;
			};
		end
	else
		local num = 0;
		-- for petId, info in pairs(self.PetInfo) do
			-- num = num + 1;
			-- objPlayer.SynchronizeDevelopInfoToClientMsg{PetId = petId, Info = info, BOver = (num == self.PetNum)};
		-- end;
		
		for id,objPet in pairs(self.setPetList)do
			local tbBaseInfo = objPet:GetPetBaseInfo();
			local level = 0
			level,tbBaseInfo.dwExp = PetConfigScript:GetPetLevel(tbBaseInfo.dwExp);
			local tbBattleInfo = objPet:GetBattleInfo();
			num = num + 1;
			
			objPlayer.SynchronizeDevelopInfoToClientMsg
			{
				PetId = id;
				BaseInfo = tbBaseInfo;
				BattleInfo = tbBattleInfo;
				BOver = (num == self.PetNum);
			};
			
			--�����＼�ܲ�λ����
			self.petSkill:OpenSkillPos(id,level)
		end
	end
end;
--�ύ����
function CPetSystem:KnowPet(dwPetId)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local CItemSystem = objPlayer:GetSystem("CItemSystem");
	if not dwPetId then
		return;
	end;
	if self.setPetList[dwPetId] then
		return;
	end;
	--����Ƿ���Խύ
	local bKnowPet = _G.PetFunctionConfig.CheckKnowCon(objPlayer:GetRoleID(), dwPetId)
	if not bKnowPet then
		--���ͳ���ύʧ����Ϣ
		objPlayer.KnowPetFailMsg{PetID = dwPetId};
		return;
	end;
	--����Ԫ��
	local KnowCondition = _G.PetBasicConfig[dwPetId].KnowCondition;
	if KnowCondition.NeedGold and KnowCondition.NeedGold > 0 then
		if not CItemSystem:IsGoldEnough(KnowCondition.NeedGold) then
			return;
		end;
	end;
	--������ĵ���
	if KnowCondition.NeedItem then
		for _, info in pairs(KnowCondition.NeedItem) do
			if CItemSystem:GetEnumItemNumInPacket(info.dwItemEnum) < info.dwNum then
				return;
			end;
		end;
	end;
	if KnowCondition.NeedGold and KnowCondition.NeedGold > 0 then
		CItemSystem:CostGold(KnowCondition.NeedGold, _G.ItemSysOperType.KnowPet) 
	end;
	if KnowCondition.NeedItem then
		for _, info in pairs(KnowCondition.NeedItem) do
			local enough, bIsUseBind = CItemSystem:DelEnumItemInPacket(info.dwItemEnum, info.dwNum, true, _G.ItemSysOperType.KnowPet);
			if not enough then
				return;
			end;
		end;
	end;
	
	--��ʼ������װ��
	self.petEquip:InsertPetEquip(dwPetId);
	--��ʼ�����ﾳ��
	self.petBourn:InsertPetBourn(dwPetId);
	--�ύ����󣬳�ʼ����������
	self.petAptitude:InitPetAptitude(dwPetId);
	--��ʼ��ϴ������
	self.petWash:InsertPetWashInfo(dwPetId);
	
	local objPet = self:AddPetObject(dwPetId,self.petEquip:GetEquipTable(dwPetId),self.petBourn:GetExp(dwPetId));
	
	self.PetNum  = self.PetNum + 1;
	self.petSkill:AddPetSkillByAddPet(dwPetId);
	self.petSkill:AddPetSkill(dwPetId,1,0,0);
	
	self:SendPetInfo(dwPetId);
	
	self:AddRoleProperty();
	
	self.objDBQuery:InsertPetInfo(dwPetId, 1);
	
	if _G.KnowPetBroadCast[dwPetId] then
		self:BroadCastKnowPetMsg(dwPetId)
	end;
end;

--ͨ��ϵͳ������
function CPetSystem:AddPetBySystem(dwPetId)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	
	if self.setPetList[dwPetId] then
		return false;
	end
	
	--��ʼ������װ��
	self.petEquip:InsertPetEquip(dwPetId)
	--��ʼ�����ﾳ��
	self.petBourn:InsertPetBourn(dwPetId);
	--�ύ����󣬳�ʼ����������
	self.petAptitude:InitPetAptitude(dwPetId);
	--��ʼ��ϴ������
	self.petWash:InsertPetWashInfo(dwPetId);
	
	local objPet = self:AddPetObject(dwPetId,self.petEquip:GetEquipTable(dwPetId),self.petBourn:GetExp(dwPetId));
	
	self.PetNum  = self.PetNum + 1;
	self.petSkill:AddPetSkillByAddPet(dwPetId);
	self.petSkill:AddPetSkill(dwPetId,1,0,0);

	self:SendPetInfo(dwPetId);
	
	self:AddRoleProperty();
	
	self.objDBQuery:InsertPetInfo(dwPetId,1);
	
	if _G.KnowPetBroadCast[dwPetId] then
		self:BroadCastKnowPetMsg(dwPetId)
	end;
	
	return true;
end;

function CPetSystem:BroadCastKnowPetMsg(dwPetId)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("Cannot get player on CPetSystem:BroadCastKnowPetMsg");
		return;
	end;
	--�������
	local s_PlayerName = objPlayer:GetInfo().szRoleName;
	--���RoleID
	local n_PlayerRoleID = objPlayer:GetInfo().dwRoleID;
	--ȫ���㲥
	CGameApp.PetSys_BroadCastMsg{
        PlayerName = s_PlayerName,
        PlayerRoleID = n_PlayerRoleID,
        PetId = dwPetId};
end;

function CPetSystem:GetPetLevel(dwPetId)
	if not dwPetId then
		return nil;
	end;
	local objPet = self.setPetList[dwPetId];
	if not objPet then
		return nil;
	end;
	return objPet:GetOwnerLevel();
end;

function CPetSystem:OnEnterScene()
	self:SendPetInfo();
	self:ShowFirstPet(true);
	if(next(self.setPetList)) then
		self.petSkill:OnEnterScene();
		self.petEquip:OnEnterScene();
		self.petBourn:OnEnterScene();
		self.petAptitude:OnEnterScene();
		self.petWash:OnEnterScene();
	end
end;
--��ʼ����
function CPetSystem:OnChangeLineBegin()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local infoTbl = {};
	local tbl = {};
	for petId, objPet in pairs(self.setPetList) do
		local petInfo = objPet:GetPetBaseInfo();
		-- petInfo.dwPetId = petId;
		-- petInfo.dwLevel = info.dwLevel;
		-- petInfo.dwExp = info.dwExp;
		-- petInfo.dwDayConsult = info.dwDayConsult;
		-- petInfo.dwConsult = info.dwConsult;
		-- petInfo.dwHp = info.dwHp;
		-- petInfo.dwState = info.dwState;
		-- petInfo.dwState = info.dwState;
		-- petInfo.dwRoleId = objPlayer:GetRoleID();
		table.insert(tbl, petInfo);
		--table.print(petInfo)
	end;
	--table.insert(infoTbl, tbl);
	--objPlayer:SetLineData("CPetSystem", infoTbl);
	----���＼��
	self.petSkill:OnChangeLineBegin(tbl)
	self.petEquip:OnChangeLineBegin();
	self.petBourn:OnChangeLineBegin();
	self.petAptitude:OnChangeLineBegin();
	self.petWash:OnChangeLineBegin();
end;

function CPetSystem:OnChangeLineEnd()
	self.petAptitude:OnChangeLineEnd();
	self.petWash:OnChangeLineEnd();
end;

function CPetSystem:OnChangeSceneEnd()
	self:ShowFirstPet();
end;

--���ݳ���״̬��ʼ��ʾ����
function CPetSystem:ShowFirstPet(isInit)
	local objSelf = self:GetPlayer();
	if not objSelf then
		return;
	end;
	if self.dwOutPetID == 0 then
		return;
	end
	
	local objPet = self.setPetList[self.dwOutPetID];
	if objPet then
		objPet:AddDriver();
		local objMapSystem = objSelf:GetSystem("CMapSystem");
		local objCurMap = objMapSystem:GetCurMap();
		if objCurMap then
			-- local tbPos = objMapSystem:GetPlayerPos();
			--print("===ShowFirstPet===",objMapSystem.fXPos,objMapSystem.fYPos,isInit)
			objPet:Show(objCurMap,objMapSystem.fXPos,objMapSystem.fYPos);
			
			if isInit then
				objSelf.SendPetStateChgMsg{PetId = self.dwOutPetID, State = 2};
			end
		end
	end
	
	--�������������״̬Ϊ����
	for k, v in pairs(self.setPetList) do
		if k ~= self.dwOutPetID then
			if v and v.dwState == 2 then
				v.Hide();
			end
		end
	end
	
end;
---��ȡ������󣬸��ݳ���ID
function CPetSystem:GetPetObj(dwPetEnumID) 
	if(dwPetEnumID == nil or self.setPetList[dwPetEnumID] == nil) then
		_info("This player not has pet",dwPetEnumID);
		return nil;
	end
	return self.setPetList[dwPetEnumID];
end
function CPetSystem:GetOutPetObject()
	return self.setPetList[self.dwOutPetID];
end;

function CPetSystem:GetOutPetEnumId()
	return self.dwOutPetID;
end

--������˼ӵ�����
function CPetSystem:AddRoleProperty()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local skillSystem = objPlayer:GetSystem("CSkillSystem");
	
	for id,objPet in pairs(self.setPetList)do
		local tbInfo = objPet:GetInstructInfo();
		local petAttr = self.petSkill:GetPetPassivitySkillAttr(id);
		tbInfo.AddValue(petAttr);
		skillSystem:NotifyPetStateProperty(tbInfo,id);   
	end
end;

--����ָ��
function CPetSystem:OnPetInstruct(dwPetId)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	
	local objPet = self.setPetList[dwPetId];
	
	if not objPet then
		return;
	end;
	if objPet.dwDayConsult >= _G.PetBasicConfig[dwPetId].DayConsult then
		return;
	end;
	if objPet.dwConsult >= _G.PetBasicConfig[dwPetId].Consult then
		return;
	end;
	local ItemSystem = objPlayer:GetSystem("CItemSystem");	
	local objElemSystem = objPlayer:GetSystem("CFiveElemSystem");
	local dwMoney = 0;
	local dwNeedElement = 0;
	local dwMoney,dwNeedElement = PetZJConfig.AdviceCost(dwPetId,objPet.dwConsult+1)---_G.PetBasicConfig[dwPetId].Instruction;  money,element
	if dwMoney and dwMoney > 0 then
		if not ItemSystem:IsPacketMoneyEnough(dwMoney) then
			return;
		end;
	end;
	if dwNeedElement and dwNeedElement > 0 then
		local uItemGold, uItemWood, uItemWater, uItemFire, uItemEarth  = objElemSystem:GetElemValue()
		if dwNeedElement > uItemGold or dwNeedElement > uItemWood 
								or dwNeedElement > uItemWater or dwNeedElement > uItemFire 
								or dwNeedElement > uItemEarth then
			return;
		end;
	end;
	-- if instruction.NeedItem then
		-- for _, info in pairs(instruction.NeedItem) do
			-- if ItemSystem:GetEnumItemNumInPacket(info.dwItemEnum) < info.dwNum then
				-- print("7")
				-- return;
			-- end;
		-- end;
	-- end;
	if dwMoney and dwMoney > 0 then
		ItemSystem:CostPacketMoney(dwMoney, _G.ItemSysOperType.KnowPet) 
	end;
	if dwNeedElement and dwNeedElement > 0 then 
		--��������
		objElemSystem:ChangeAttr("dwMetalValue",-dwNeedElement)
		objElemSystem:ChangeAttr("dwWoodValue",-dwNeedElement)
		objElemSystem:ChangeAttr("dwWaterValue",-dwNeedElement)
		objElemSystem:ChangeAttr("dwFireValue",-dwNeedElement)
		objElemSystem:ChangeAttr("dwEarthValue",-dwNeedElement)
		
		local setData = {
			[1] = {dwCurrent = uItemGold, dwChange = -dwNeedElement};
			[2] = {dwCurrent = uItemWood, dwChange = -dwNeedElement};
			[3] = {dwCurrent = uItemWater, dwChange = -dwNeedElement};
			[4] = {dwCurrent = uItemFire, dwChange = -dwNeedElement};
			[5] = {dwCurrent = uItemEarth, dwChange = -dwNeedElement};
		}
		CLogSystemManager:zhenqi(objPlayer, setData, _G.FiveElemSysOperType.PetInstruct)	
	end;
	-- if instruction.NeedItem then
		-- for _, info in pairs(instruction.NeedItem) do
			-- local enough, bIsUseBind = ItemSystem:DelEnumItemInPacket(info.dwItemEnum, info.dwNum, true, _G.ItemSysOperType.PetInstruct);
			-- if not enough then
				-- print("8")
				-- return;
			-- end;
		-- end;
	-- end;
	--����ָ�̴���
	objPet.dwDayConsult = objPet.dwDayConsult + 1;
	objPet.dwConsult = objPet.dwConsult + 1;
	self.objDBQuery:UpdatePetConsult(dwPetId, objPet.dwDayConsult, objPet.dwConsult);
	self:AddRoleProperty();
	objPlayer.SendPetInstructInfoMsg{PetId = dwPetId, DayConsult = objPet.dwDayConsult, Consult = objPet.dwConsult};
end;

function CPetSystem:OnPetImpart(dwPetId, b_IsAutoBuy, b_IsUseGold)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	
	local objPet = self.setPetList[dwPetId];
	
	if not objPet then
		return;
	end;
	if objPet.dwDayImpart >= _G.PetImpartConfig.GetImpartCount(dwPetId)[2] then
		return;
	end;
	if objPet.dwAllImpart >= _G.PetImpartConfig.GetImpartCount(dwPetId)[1] then
		return;
	end;
	
	
	
	local ItemSystem = objPlayer:GetSystem("CItemSystem");	
	
	--------���Ĳ���
	local needItemID, needItemCount	= _G.PetImpartConfig.NeedItem(objPet.dwAllImpart, objPet.dwDayImpart, dwPetId);
	--------��ⱳ�����Ƿ����㹻��Ʒ
	local b_IsEnough_1, n_Minus_1 = ItemSystem:CheckDelEnumItemInPacketCond(needItemID, needItemCount);
	--------�����Զ�����
	local autoBuyInfo = {};
	if not b_IsEnough_1 then
		if b_IsAutoBuy then
			local t = {};
			t.dwItemEnum 	= needItemID;
			t.dwItemNumber 	= n_Minus_1;
			table.insert(autoBuyInfo, t);
		else--���ϲ������Ҳ����Զ������򷵻�
			return;
		end;
	end;
	--------����Զ������б�Ϊ����ִ���Զ������߼�
	if #autoBuyInfo > 0 then
		local mallSystem = objPlayer:GetSystem("CMallSystem");
		if not mallSystem then
			_err("get mallSystem error!!!");
			return;
		end;
		if b_IsUseGold then
--			local n_Result, n_Cost = mallSystem:CanBuyItemListGold(autoBuyInfo);
--			if n_Result > 0 then return end;
			for k, v in pairs(autoBuyInfo) do
				local buySuc = mallSystem:BuyItemByIDGold(v.dwItemNumber, v.dwItemEnum)
				if not buySuc then
					_err("auto buy error!!!");
					return
				end;
			end;
		else
--			local n_Result, n_Cost = mallSystem:CanBuyItemListBindGold(autoBuyInfo);
--			if n_Result > 0 then return end;
			for k, v in pairs(autoBuyInfo) do
				local buySuc = mallSystem:BuyItemByIDBindGold(v.dwItemNumber, v.dwItemEnum)
				if not buySuc then
					_err("auto buy error!!!");
					return
				end;
			end;
		end
		--------��ⱳ�����Ƿ����㹻��Ʒ
		b_IsEnough_1, n_Minus_1 = ItemSystem:CheckDelEnumItemInPacketCond(needItemID, needItemCount);
		if not b_IsEnough_1 then return end;
	end;
	
	--�۳����Ĳ���
	ItemSystem:DelEnumItemInPacket(needItemID, needItemCount, false, _G.ItemSysOperType.PetImpart);
	
	
	--����ָ�̴���
	objPet.dwDayImpart = objPet.dwDayImpart + 1;
	objPet.dwAllImpart = objPet.dwAllImpart + 1;
	self.objDBQuery:UpdatePetImpart(dwPetId, objPet.dwDayImpart, objPet.dwAllImpart);
	self:AddRoleProperty();
	objPlayer.SendPetImpartInfoMsg{PetId = dwPetId, DayImpart = objPet.dwDayImpart, AllImpart = objPet.dwAllImpart};
end;

--��������ս/��Ϣ
function CPetSystem:OnPetStateChg(dwPetId, state)
	local objPlayer = self:GetPlayer();
	if not objPlayer or objPlayer:IsDead() then
		return;
	end;
	
	if not state or state < 1 or state > 2 then
		return;
	end;
	
	if state == 2 and self.dwOutPetID == dwPetId then return end;
	
	
	local objPet = self.setPetList[dwPetId];
	
	if not objPet then
		return;
	end;
	
	if state == 2 and self.dwOutPetID ~= 0 then
		local outPet = self.setPetList[self.dwOutPetID];
		outPet:Hide();
		objPlayer.SendPetStateChgMsg{PetId = self.dwOutPetID, State = 1};
	end
	
	if objPet.dwState ~= state then
		
		if state == 1 then
			local objPet = self.setPetList[self.dwOutPetID];
			if objPet then
				objPet:Hide();
			end
			objPet:DelDriver()
			self.petSkill:ExecuteDelPetPassivitySkill(self.dwOutPetID);
			self.dwOutPetID = 0;
		elseif state == 2 then
			
			local tempPet = self.setPetList[dwPetId];
			tempPet:JudgePetDeadState(self);
			
			if tempPet:IsDead() then 
				return; 
			end
			tempPet:AddDriver();
			
			if(self.dwOutPetID >0) then
				local objPet = self.setPetList[self.dwOutPetID];
				objPet:DelDriver()
				self.petSkill:ExecuteDelPetPassivitySkill(self.dwOutPetID);
			end
			self.dwOutPetID = dwPetId;
			self:ShowFirstPet();
			self.petSkill:ExecuteAddPetPassivitySkill(dwPetId);

			objPlayer:GetSystem("CPlayerEventCenterSystem"):DoEvent(enumPlayerEventType.EventPetOutBattle,self.dwOutPetID);
		end
		
		--�ڳ����show��hide ������д��
		-- objPet.dwState = state;
		-- self.objDBQuery:UpdatePetState(dwPetId, objPet.dwState);
		
		objPlayer.SendPetStateChgMsg{PetId = dwPetId, State = objPet.dwState};
	end;
end;


--��ճ�����ָ�̴���
function CPetSystem:ResetPetDayConsult()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	for dwPetId, objPet in pairs(self.setPetList) do
		objPet.dwDayConsult = 0;
	end; 
end;

--��ճ����մ�������
function CPetSystem:ResetPetDayImpart()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	for dwPetId, objPet in pairs(self.setPetList) do
		objPet.dwDayImpart = 0;
	end; 
end;

--��ճ���ÿ��ϴ������
function CPetSystem:ResetPetWashCount()
	self.petWash:ResetCount();
end

--����һ���������
function CPetSystem:AddPetObject(dwPetID,setEquipLevel,dwBournExp)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local tbPetInfo = {};
	tbPetInfo.dwPetId = dwPetID;
	tbPetInfo.dwState = 1;
	tbPetInfo.dwExp = 0;  ---=============>>
	tbPetInfo.dwLevel = 1;
	local objPet = CPetObject:NewCreateObject(objPlayer:GetRoleID(),tbPetInfo,setEquipLevel,dwBournExp,self);
	if not objPet then
		return;
	end
	
	self.setPetList[dwPetID] = objPet;
	
	return objPet;
end;

--
function CPetSystem:Update()
	local Add = {} 
	local Del = {}
	local bNeedSend = false
	local dwCount = 0
	
	for k,v in pairs(self.DelList) do
		Del[k] = v;
		self.DelList[k] = nil;
		bNeedSend = true;
	end
	
	for k,v in pairs(self.AddList) do
		local objPet = v;
		if objPet and objPet:IsShow() then
			Add[objPet:GetRoleID()] = objPet:GetMapShowInfo();
			bNeedSend = true;
			dwCount = dwCount + 1;
		end
		self.AddList[k] = nil;
		if dwCount >= m_dwSendCount then
			break;
		end
	end
	
	if bNeedSend then
		local objPlayer = self:GetPlayer();
		objPlayer.PetMapGetAllMsg{Add=Add;Del=Del};
		--print("CPetSystem:Update==========PetMapGetAllMsg")
	else
		CDriverManager:DelDriver(self.objDriver);
		self.objDriver = nil;
	end
	
	return true;
end;

function CPetSystem:OnLeaveCurMap()
	local objPet = self:GetOutPetObject();
	if objPet then
		objPet:Hide();
	end
end;

-------------------------------------------------------------------------------
--������Ұ�ĺ���
--����������Ұ�ڳ���
function CPetSystem:SendMapPetInfo()
	local objSelf = self:GetPlayer()
	local mapSystem = objSelf:GetSystem("CMapSystem")
	-- local sysScript = objSelf:GetSystem("CScriptSystem")
	local tbPetList = mapSystem:GetCurMap():GetCanLookPet(objSelf) or {}
	
	for dwObjId,objPet in pairs(self.CanSeePet) do
		if (not tbPetList[dwObjId]) then
			self.CanSeePet[dwObjId] = nil
			self.DelList[dwObjId] = dwObjId;
			self.AddList[dwObjId] = nil
		end
	end
	
	for dwObjId,objPet in pairs(tbPetList) do
		if objPet:IsShow() then
			if not self.CanSeePet[dwObjId] then
				self.CanSeePet[dwObjId] = objPet
				self.AddList[objPet:GetRoleID()] = objPet
				self.DelList[objPet:GetRoleID()] = nil
			end
		end
	end
	
	if self.objDriver then
		CDriverManager:DelDriver(self.objDriver)
	end
	self.objDriver = CDriverManager:AddDriver(eInterval._100ms_j,self,CPetSystem.Update)
end;

function CPetSystem:SendAddPetInView(objPet)
	local objPlayer = self:GetPlayer()
	local dwObjId = objPet:GetRoleID();
	if not dwObjId then return end;
	self.CanSeePet[dwObjId] = objPet
	self.DelList[dwObjId] = nil
	self.AddList[dwObjId] = nil
	objPlayer.PetMapGetAllMsg{Add = {objPet:GetMapShowInfo()}};
end;

function CPetSystem:SendDelPetInView(dwObjId)
	local objPlayer = self:GetPlayer()
	self.CanSeePet[dwObjId] = nil
	self.DelList[dwObjId] = nil
	self.AddList[dwObjId] = nil
	objPlayer.PetMapGetAllMsg{Del = {dwObjId}};
	--print("CPetSystem:SendDelPetInView===========PetMapGetAllMsg")
end;

function CPetSystem:Clear()
	self.CanSeePet = {}
	self.DelList = {}
	self.AddList = {}
end
----��ȡ���＼�ܶ���
function CPetSystem:GetPetSkillObj(petID,skillID)
	return self.petSkill:GetPetSkillObj(petID,skillID);
end

--��ȡ���＼��ϵͳ
function CPetSystem:GetPetSikllSystem()
	return self.petSkill;
end

function CPetSystem:ViewOtherPet(dwRoleId)
	local objPlayer = self:GetPlayer(); 
	if not objPlayer then
		return;
	end;
	_G.GSRemoteCall(dwRoleId, "CPetSystem", "BeViewPetInfo", {objPlayer:GetRoleID()}, nil);
end;

function CPetSystem:BeViewPetInfo(dwRoleId)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_G.GSRemoteCall(dwRoleId, "CPetSystem", "ViewPetResult", {false, {6000410027}}, nil);
		return;
	end;
	if self.PetNum == 0  then
		_G.GSRemoteCall(dwRoleId, "CPetSystem", "ViewPetResult", {false, {4001310009}}, nil);
		return;
	end;
	local info = {};
	local skillNum = 0;
	for id,objPet in pairs(self.setPetList) do	
		local tbBaseInfo = objPet:GetPetBaseInfo();
		local level = 0
		level,tbBaseInfo.dwExp = PetConfigScript:GetPetLevel(tbBaseInfo.dwExp);	
		tbBaseInfo.dwSkillInfo,skillNum = self:GetPetSkillInfo(id);
		tbBaseInfo.dwCorValue = _G.G_GetPetCorValue(skillNum);
		tbBaseInfo.dwBaseInfo = self:GetPetAttriInfo(objPet:GetPetBaseAttrInfo());-----����Ļ�������
		tbBaseInfo.dwBtlInfo = self:GetPetAttriInfo(objPet:GetBattleInfo());
		tbBaseInfo.dwEquipInfo = self:GetPetEquipInfo(id)
		tbBaseInfo.dwBournExpInfo = self:GetPetBournInfo(id)
		tbBaseInfo.WashInfo = self:GetPetWashInfo(id);
		table.insert(info, tbBaseInfo);
	end
	_G.GSRemoteCall(dwRoleId, "CPetSystem", "ViewPetResult", {true, info}, nil);
end;

--���ز鿴���
function CPetSystem:ViewPetResult(isOK, info)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("Cannot get player by CPetSystem:ViewPetResult(");
		return;
	end;
	objPlayer.PetSys_ViewOtherResultMsg{IsOK = isOK, PetInfo = info};
end;


--���ݿ����
-----------------------------------------------------------------------------------------------------------------
function CPetSystem:DBPetHpChg(dwPetId, dwHp, dwLastDieTime)
	self.objDBQuery:UpdatePetHp(dwPetId, dwHp, dwLastDieTime)
end;

function CPetSystem:DBPetStateChg(dwPetId, dwState)
	self.objDBQuery:UpdatePetState(dwPetId, dwState);
end;

function CPetSystem:GetPetSkillInfo(PetEnumID)
	local skillInfo = {};
	local tempSkillInfo = {};
	skillInfo = self:GetPetSkillObj(PetEnumID);
	if not skillInfo then
		return tempSkillInfo,0;
	end
	for k,v in pairs(skillInfo) do 
		tempSkillInfo[k] = {};
		tempSkillInfo[k].skillLevel = v.skillObj:GetLevel();
		tempSkillInfo[k].skillId = v.skillId;
 	end
	return tempSkillInfo,#skillInfo;
end

function CPetSystem:GetPetAttriInfo(tabInfo)
	local tempInfo = {
	dwAttack = 0;--����
	dwDefense = 0;--����
	dwFlee = 0;--��
	dwCrit = 0;--����
	dwHPMax = 0;--����max
	dwMPMax = 0;--����max
	dwMoveSpeed = 0;--�ƶ��ٶ�
	dwAttackSpeed = 0;--�����ٶ�
	dwHitPercent = 0;--������
	dwDuck = 0;--������
	dwAppendCrit = 0; --�����˺�ϵ��
	dwAppendAttack = 0; --׷���˺�
	dwIgnoreDefense = 0; --���ӷ�������
	dwRemitAttack = 0;	--�˺�����
	}
	for k,v in pairs(tempInfo) do
		tempInfo[k] = tabInfo[k];
	end
	return tempInfo;
end

function CPetSystem:GetPetEquipInfo(PetEnumID)
	return self.petEquip:GetEquipTable(PetEnumID)
end

function CPetSystem:GetPetBournInfo(PetEnumID)
	return self.petBourn:GetExp(PetEnumID)
end

function CPetSystem:GetPetWashInfo(PetEnumID)
	return self.petWash:GetAttr(PetEnumID)
end

--���ӳ�ս�����hp (�������߽ű�����)
function CPetSystem:ChangeOutputPetHp(dwValue)
	local outputPet = self:GetOutPetObject();

	if outputPet then
		if outputPet:IsFullHP() then return false end;
		
		outputPet:ChgHPByMedica(dwValue)
		return true
	end
	return false
end

------------------------------------------------------------------------------------------------
---------------------------------------�������ʲ鿴-------------------------------------------
------------------------------------------------------------------------------------------------
function CPetSystem:ViewOtherPetAptitude(fromRoleID, dwPetId)
	local objPlayer = self:GetPlayer(); 
	if not objPlayer then
		return;
	end;
	_G.GSRemoteCall(fromRoleID, "CPetSystem", "BeViewAptitudeInfo", {objPlayer:GetRoleID(), dwPetId}, nil);
end;

function CPetSystem:BeViewAptitudeInfo(dwRoleId, dwPetId)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_G.GSRemoteCall(dwRoleId, "CPetSystem", "ViewResult", {false, {6000410027}}, nil);
		return;
	end;
	local petAptitude = self.petAptitude:GetPetAptitudeValue(dwPetId);
	if not petAptitude then
		_G.GSRemoteCall(dwRoleId, "CPetSystem", "ViewResult", {false, {6000410027}}, nil);
		return;
	end;
	local dwBournLevel = self.petBourn:GetLevel(dwPetId);
	_G.GSRemoteCall(dwRoleId, "CPetSystem", "ViewResult", {true, petAptitude, dwBournLevel}, nil);
end;

function CPetSystem:ViewResult(isOK, petAptitudeInfo, dwBournLevel)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("Cannot get player by CPetSystem:ViewResult");
		return;
	end;
	objPlayer.ViewPetAptitudeInfoMsg{IsOK = isOK, PetAptitude = petAptitudeInfo, BournLevel = dwBournLevel};
end;



------------------------------------------------------------------------------------------------
---------------------------------------�������Ըı�-------------------------------------------
------------------------------------------------------------------------------------------------
function CPetSystem:ChangeAdvAttr(dwPetId, sysName, petSingleAttr)
	--�ı���������
	self:GetPetObj(dwPetId).sysAttr:ChangeAdvAttr(sysName, petSingleAttr)
	self:SendPetInfo(petID)
	self.petSkill:ExecuteAddPetPassivitySkill(dwPetId)
end
