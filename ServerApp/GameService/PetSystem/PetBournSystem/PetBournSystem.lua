--[[[
	���ﾳ��ϵͳ
	����2013.12.20
	author lizc
--]]

_G.CPetBourn = {}
function CPetBourn:new(petSystem)
	local obj = {};
	
	--���г���ľ��羭��
	obj.setPetExp = {}
	obj.petSys = petSystem
	--���鱶��
	obj.ExpMul = 0
	
	for i,v in pairs(CPetBourn) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end 

function CPetBourn:Create(petInfo)
	--��ȡPlayer
	local objPlayer = self.petSys:GetPlayer();
	if not objPlayer then
		_err("CPetBournSystem Create Cannot get player");
		return false;
	end;
	--��ʼ��DB
	local objDB = objPlayer:GetDBQuery();
	if not objDB then
		_err("CPetBournSystem Create Cannot get DBQuery");
		return false;
	end;
	self.objDBQuery = CPetBournDB:new(objDB, self);
	
	--��ȡ���羭����Ϣ
	local Data = objPlayer:GetLineData("CPetBournSystem")[1]
	
	if not Data[1] then
		--_err("CPetBournSystem Create CanNot GetLineData!!!");
		--Data = {}
		--����ÿ������ĳ��ﾳ�羭�飨��ʼ��Ϊ0��
		for k,tbInfo in pairs(petInfo)do
			self:InsertPetBourn(tbInfo.dwPetId)
		end
		
	end;
	if Data[1] then
		self.setPetExp = Data[1];
	end;
	
end

----����
function CPetBourn:OnChangeLineBegin()
	local objPlayer = self.petSys:GetPlayer();
	if(not objPlayer) then
		return false;
	end
	local Data = {};
	Data[1] = self.setPetExp;
	objPlayer:SetLineData("CPetBournSystem",Data);
	
	self:DealBreakPro();
	self.ExpMul = 0;
end


function CPetBourn:OnEnterScene()
	self:SynPetBournInfo();
end

--��������
function CPetBourn:OnDead(dwEnemyType,dwEnemyID)
	self:DealBreakPro();
end;
--�����Ϻϳ�
function CPetBourn:DealBreakPro()
	local objPlayer = self.petSys:GetPlayer();
	if not objPlayer then
		return;
	end;
	objPlayer.OnPetBournChangeLineMsg{};
end;

--ͬ�����ﾳ�羭����Ϣ
function CPetBourn:SynPetBournInfo()
	local objPlayer = self.petSys:GetPlayer();
	if(not objPlayer) then
		return false;
	end
	
	objPlayer.SynPetBournInfoMsg{AllPetBournInfo = self.setPetExp}
end

--�������ⲿ���ýӿ�
--------------------------------------------------------------------------------------------------------
--�ύ������������ʼ���羭��
function CPetBourn:InsertPetBourn(petID)
	--print("CPetBourn:InsertPetBourn petId is ", petID)
	if self.setPetExp[petID] then _err("insert pet equip already exist!") return end;
	
	--���羭��ȫ����ʼ��Ϊ0
	self.setPetExp[petID] = 0;
	--����Ϣ
	self:SynPetBournInfo();
	
	--�������ݿ�
	self.objDBQuery:InsertPetBourn(petID, self.setPetExp[petID])
end


--���;��鱶��
function CPetBourn:SendExpMul()
	local objPlayer = self.petSys:GetPlayer();
	if(not objPlayer) then
		return false;
	end
	
	if self.ExpMul ~= 0 then
		_err("pet bourn expmul is not 0!!!")
	end
	
	self.ExpMul =  _G.PetBournConfig:CalExpMul()
	objPlayer.PetBournExpMulMsg{ExpMul = self.ExpMul};
end

--�������羭��
function CPetBourn:AddExp(petID, b_IsAutoBuy, b_IsUseGold, dwExp)
	--print("CPetBourn:UplevelEquip petID, equipType", petID, equipType)
	if not self.setPetExp[petID] then _err("pet bourn addExp not exist!") return end;
	
	local petLevel = self.petSys:GetPetLevel(petID);
	if not _G.PetBournConfig.IsOpenBourn(petLevel) then return end; 
	
	local bournExp = self.setPetExp[petID];
	
	--����Ѵﵽ���ȼ��򷵻�
	if bournExp >= _G.PetBournConfig:GetMaxExp()  then return end;
	
	local objPlayer = self.petSys:GetPlayer();
	if(not objPlayer) then
		return false;
	end
	
	if not dwExp then
		local ItemSystem = objPlayer:GetSystem("CItemSystem");
		if not ItemSystem then
			return;
		end
		
		--������Һ��������ϲ����򷵻�
		local calLevel,_ = _G.PetBournConfig:ExpToLevel(bournExp);
		
		local costTable =  _G.PetBournConfig.NeedItem(petID, calLevel)
		
		if not ItemSystem:IsPacketMoneyEnough(costTable.silver) then return end;
		
		local autoBuyInfo = {};
		for needItemID, needItemCount in pairs(costTable) do
			if type(needItemID) == "number" then
				local b_IsEnough_1, n_Minus_1 = ItemSystem:CheckDelEnumItemInPacketCond(needItemID, needItemCount);
				--print("CPetBourn:UplevelEquip AllSliver,itemCount", costTable.AllSliver, needItemCount[1])
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
				
			end
		end
		
		
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
			for k, v in pairs(costTable) do
				if type(k) == "number" then
					isEnough, _ = ItemSystem:CheckDelEnumItemInPacketCond(k, v);
					if not isEnough then return end;
				end
			end
		end;
		
		
		
		--�۳����Һ���������
		if costTable.silver > 0 then
			ItemSystem:CostPacketMoney(costTable.silver, _G.ItemSysOperType.PetBourn)
		end
		
		for k, v in pairs(costTable) do
			if type(k) == "number" then
				ItemSystem:DelEnumItemInPacket(k, v, false, _G.ItemSysOperType.PetBourn);
			end
		end
		
		--������ӵľ���
		if self.ExpMul == 0 then
			_err("pet bourn expmul is 0!!!")
		end
		local baseExp = _G.PetBournConfig.AddExp[calLevel].baseExp;
		local addExp = baseExp * self.ExpMul;
		self.ExpMul = 0;
		
		
		
		--print("CPetBourn:AddExp the addExp is", addExp)
		
		if addExp <= 0 then _err("pet bourn addexp error"); return end;
		
		self.setPetExp[petID] = self.setPetExp[petID] + addExp;
		--print("CPetBourn:AddExp----------- petid,exp", petID, self.setPetExp[petID])
	else
		self.setPetExp[petID] = dwExp;
	end
	
	-- �����羭������Ϣ
	objPlayer.PetBournAddExpMsg{PetID = petID, BournExp = self.setPetExp[petID]}
	--ˢϴ���������
	self.petSys:GetPetObj(petID).sysAttr:ChangeAdvAttr("PetBourn", _G.PetBournConfig:CalBournProp(petID, self.setPetExp[petID]))
	self.petSys:SendPetInfo(petID)
	--ˢϴ���������ӵ�����
	--self.petSys:AddRoleProperty()
	self.petSys.petSkill:ExecuteAddPetPassivitySkill(petID)
	-- �������ݿ�
	self.objDBQuery:UpdatePetBourn(petID, self.setPetExp[petID])
	
	
	--���׹���
	-- local curEquipLevel = self.setPetExp[petID][equipType];
	-- if (curEquipLevel % 10 == 1) then
		-- local dwRoleID = objPlayer:GetRoleID();
		-- local szRoleName = objPlayer:GetName();
		-- -- local setNet = {};
		-- -- for i, objPlayer in pairs(CPlayerManager.setAllPlayer) do
			-- -- table.insert(setNet, objPlayer.objNet);
		-- -- end;
		-- -- _groupcallout(setNet, "PetEquipUpGradeMsg", {RoleId = dwRoleID, RoleName = szRoleName, PetId = petID, EquipType = equipType, CurLevel = curEquipLevel});
		
		-- --ȫ���㲥
		-- CGameApp.PetEquipUpGradeMsg{RoleId = dwRoleID, RoleName = szRoleName, PetId = petID, EquipType = equipType, CurLevel = curEquipLevel};
	-- end
	
	-- --��������
	-- if curEquipLevel >= _G.PetEquipConfig.MaxEquipLevel then
		-- local dwRoleID = objPlayer:GetRoleID();
		-- local szRoleName = objPlayer:GetName();
		-- -- local setNet = {};
		-- -- for i, objPlayer in pairs(CPlayerManager.setAllPlayer) do
			-- -- table.insert(setNet, objPlayer.objNet);
		-- -- end;
		-- -- _groupcallout(setNet, "PetEquipUpGradeMsg", {RoleId = dwRoleID, RoleName = szRoleName, PetId = petID, EquipType = equipType, CurLevel = curEquipLevel});
		
		-- --ȫ���㲥
		-- CGameApp.PetEquipUpGradeMsg{RoleId = dwRoleID, RoleName = szRoleName, PetId = petID, EquipType = equipType, CurLevel = curEquipLevel};
	-- end
	
	--��Ұ�㲥��lw
	local objPet = self.petSys:GetPetObj(petID);
	if objPet and (objPet:IsShow()) then
		_mapcallout("PetBournBoradcastMsg", 
		{
			RoleID = objPlayer:GetRoleID();
			BournExp = self.setPetExp[petID];
		}, 
		objPet:GetLogicID(), true)
	end
	self.petSys:RefAptitudeUpLimit(petID);
end

function CPetBourn:GetExp(dwPetId)
	return self.setPetExp[dwPetId];
end

--��ȡ����
function CPetBourn:GetLevel(dwPetId)
	if not self.setPetExp or not self.setPetExp[dwPetId] then
		return
	end
	local dwLevel = _G.PetBournConfig:ExpToLevel(self.setPetExp[dwPetId]);
	local dwBourn, _ = _G.PetBournConfig.GetBournLvAndStar(dwLevel);
	return dwBourn;
end
	

-------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------�߻�Ҫ�Ľӿ�-----------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------

function CPetBourn:SetExp(petID, dwExp)
	self:AddExp(petID, dwExp)
end

	