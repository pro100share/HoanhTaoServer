--[[
	宠物系统
]]

--每次update同步的宠物数量
local m_dwSendCount = 10;

_G.CPetSystem = {};
function CPetSystem:new()
	local obj = CSystem:new("CPetSystem");
	obj.objDBQuery = nil;    --对应的数据库操作模块
	
	obj.setPetList = {};
	
	obj.dwOutPetID = 0;--当前出战的宠物
	
	--视野内宠物的相关参数
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
--刷新宠物资质
function CPetSystem:RefAptitudeUpLimit(dwPetId)
	self.petAptitude:GetExtraUpLimit(dwPetId)
end;

--系统创建
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
	--先读取宠物装备 计算宠物属性的时候要用它
	self.petEquip:Create();
	
	local petInfo = objPlayer:GetLineData("CPetSystem")[1][1];
	
	--读物宠物境界经验 计算宠物属性要用
	self.petBourn:Create(petInfo);
	
	self:SetPetInfo(petInfo)
	self.petAptitude:Create(petInfo)
	self.petWash:Create(petInfo);
	-- self:AddPetInstructProperty()
	self.CanSeePet = {}
	self.DelList = {}
	self.AddList = {}
	---宠物技能
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
--此为系统独有创建完成后调用的函数 
function CPetSystem:OnCreateOver()
	--判断所有宠物的死亡状态
	for petID, petObj in pairs(self.setPetList) do
		if petObj then
			petObj:JudgePetDeadState(self);
		end
	end
	
end

function CPetSystem:WhenPlayerDead(dwTimes,dwEnemyID,dwType)
	if self.dwOutPetID == 0 then return end;
	
	--设置宠物状态为隐藏
	local objSelf = self:GetPlayer(); 
	objSelf.SendPetStateChgMsg{PetId = self.dwOutPetID, State = 1};
	
	--主人死亡 隐藏宠物
	self:GetOutPetObject():Hide();
	self.dwOutPetID = 0;
end

function CPetSystem:OnEventCenter(szEventName,Param1,param2,param3)
	--主人玩家被杀死的消息
	if szEventName == enumPlayerEventType.EventBeKilled then
		self:WhenPlayerDead(Param1,param2,param3);
	end
end

--人物升级事件响应
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
		-----等级到了开启宠物技能槽
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
			
			--检测宠物技能槽位开启
			self.petSkill:OpenSkillPos(id,level)
		end
	end
end;
--结交宠物
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
	--检测是否可以结交
	local bKnowPet = _G.PetFunctionConfig.CheckKnowCon(objPlayer:GetRoleID(), dwPetId)
	if not bKnowPet then
		--发送宠物结交失败消息
		objPlayer.KnowPetFailMsg{PetID = dwPetId};
		return;
	end;
	--消耗元宝
	local KnowCondition = _G.PetBasicConfig[dwPetId].KnowCondition;
	if KnowCondition.NeedGold and KnowCondition.NeedGold > 0 then
		if not CItemSystem:IsGoldEnough(KnowCondition.NeedGold) then
			return;
		end;
	end;
	--检测消耗道具
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
	
	--初始化宠物装备
	self.petEquip:InsertPetEquip(dwPetId);
	--初始化宠物境界
	self.petBourn:InsertPetBourn(dwPetId);
	--结交宠物后，初始化宠物资质
	self.petAptitude:InitPetAptitude(dwPetId);
	--初始化洗练属性
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

--通过系统给宠物
function CPetSystem:AddPetBySystem(dwPetId)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	
	if self.setPetList[dwPetId] then
		return false;
	end
	
	--初始化宠物装备
	self.petEquip:InsertPetEquip(dwPetId)
	--初始化宠物境界
	self.petBourn:InsertPetBourn(dwPetId);
	--结交宠物后，初始化宠物资质
	self.petAptitude:InitPetAptitude(dwPetId);
	--初始化洗练属性
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
	--玩家姓名
	local s_PlayerName = objPlayer:GetInfo().szRoleName;
	--玩家RoleID
	local n_PlayerRoleID = objPlayer:GetInfo().dwRoleID;
	--全服广播
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
--开始换线
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
	----宠物技能
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

--根据宠物状态初始显示宠物
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
	
	--设置其他宠物的状态为隐藏
	for k, v in pairs(self.setPetList) do
		if k ~= self.dwOutPetID then
			if v and v.dwState == 2 then
				v.Hide();
			end
		end
	end
	
end;
---获取宠物对象，根据宠物ID
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

--宠物给人加的属性
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

--宠物指教
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
		--消耗真气
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
	--更新指教次数
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
	
	--------消耗材料
	local needItemID, needItemCount	= _G.PetImpartConfig.NeedItem(objPet.dwAllImpart, objPet.dwDayImpart, dwPetId);
	--------检测背包中是否有足够物品
	local b_IsEnough_1, n_Minus_1 = ItemSystem:CheckDelEnumItemInPacketCond(needItemID, needItemCount);
	--------用于自动购买
	local autoBuyInfo = {};
	if not b_IsEnough_1 then
		if b_IsAutoBuy then
			local t = {};
			t.dwItemEnum 	= needItemID;
			t.dwItemNumber 	= n_Minus_1;
			table.insert(autoBuyInfo, t);
		else--材料不够而且不是自动购买则返回
			return;
		end;
	end;
	--------如果自动购买列表不为空则执行自动购买逻辑
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
		--------检测背包中是否有足够物品
		b_IsEnough_1, n_Minus_1 = ItemSystem:CheckDelEnumItemInPacketCond(needItemID, needItemCount);
		if not b_IsEnough_1 then return end;
	end;
	
	--扣除消耗材料
	ItemSystem:DelEnumItemInPacket(needItemID, needItemCount, false, _G.ItemSysOperType.PetImpart);
	
	
	--更新指教次数
	objPet.dwDayImpart = objPet.dwDayImpart + 1;
	objPet.dwAllImpart = objPet.dwAllImpart + 1;
	self.objDBQuery:UpdatePetImpart(dwPetId, objPet.dwDayImpart, objPet.dwAllImpart);
	self:AddRoleProperty();
	objPlayer.SendPetImpartInfoMsg{PetId = dwPetId, DayImpart = objPet.dwDayImpart, AllImpart = objPet.dwAllImpart};
end;

--请求宠物出战/休息
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
		
		--在宠物的show和hide 函数里写了
		-- objPet.dwState = state;
		-- self.objDBQuery:UpdatePetState(dwPetId, objPet.dwState);
		
		objPlayer.SendPetStateChgMsg{PetId = dwPetId, State = objPet.dwState};
	end;
end;


--清空宠物日指教次数
function CPetSystem:ResetPetDayConsult()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	for dwPetId, objPet in pairs(self.setPetList) do
		objPet.dwDayConsult = 0;
	end; 
end;

--清空宠物日传功次数
function CPetSystem:ResetPetDayImpart()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	for dwPetId, objPet in pairs(self.setPetList) do
		objPet.dwDayImpart = 0;
	end; 
end;

--清空宠物每日洗练次数
function CPetSystem:ResetPetWashCount()
	self.petWash:ResetCount();
end

--增加一个宠物对象
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
--宠物视野的函数
--发送所有视野内宠物
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
----获取宠物技能对象
function CPetSystem:GetPetSkillObj(petID,skillID)
	return self.petSkill:GetPetSkillObj(petID,skillID);
end

--获取宠物技能系统
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
		tbBaseInfo.dwBaseInfo = self:GetPetAttriInfo(objPet:GetPetBaseAttrInfo());-----宠物的基本属性
		tbBaseInfo.dwBtlInfo = self:GetPetAttriInfo(objPet:GetBattleInfo());
		tbBaseInfo.dwEquipInfo = self:GetPetEquipInfo(id)
		tbBaseInfo.dwBournExpInfo = self:GetPetBournInfo(id)
		tbBaseInfo.WashInfo = self:GetPetWashInfo(id);
		table.insert(info, tbBaseInfo);
	end
	_G.GSRemoteCall(dwRoleId, "CPetSystem", "ViewPetResult", {true, info}, nil);
end;

--返回查看结果
function CPetSystem:ViewPetResult(isOK, info)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("Cannot get player by CPetSystem:ViewPetResult(");
		return;
	end;
	objPlayer.PetSys_ViewOtherResultMsg{IsOK = isOK, PetInfo = info};
end;


--数据库操作
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
	dwAttack = 0;--攻击
	dwDefense = 0;--防御
	dwFlee = 0;--身法
	dwCrit = 0;--暴击
	dwHPMax = 0;--生命max
	dwMPMax = 0;--内力max
	dwMoveSpeed = 0;--移动速度
	dwAttackSpeed = 0;--攻击速度
	dwHitPercent = 0;--命中率
	dwDuck = 0;--闪避率
	dwAppendCrit = 0; --暴击伤害系数
	dwAppendAttack = 0; --追加伤害
	dwIgnoreDefense = 0; --无视防御能力
	dwRemitAttack = 0;	--伤害减免
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

--增加出战宠物的hp (用作道具脚本调用)
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
---------------------------------------宠物资质查看-------------------------------------------
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
---------------------------------------宠物属性改变-------------------------------------------
------------------------------------------------------------------------------------------------
function CPetSystem:ChangeAdvAttr(dwPetId, sysName, petSingleAttr)
	--改变宠物的属性
	self:GetPetObj(dwPetId).sysAttr:ChangeAdvAttr(sysName, petSingleAttr)
	self:SendPetInfo(petID)
	self.petSkill:ExecuteAddPetPassivitySkill(dwPetId)
end
