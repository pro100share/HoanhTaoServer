--[[[
	����װ��ϵͳ
	����2013.11.11
	author lizc
--]]


--[[
����װ����ṹ˵��
self.setPetEquip =
 {
	[��������ID] = { �����ȼ�,�·��ȼ�, ���ӵȼ�,��ָ�ȼ�}
	[petID1] = { 1, 3,5,6}


--]]

local function FormatStr(t)
	local retStr = "";
	
	for k, v in pairs(t) do
		retStr = retStr..v..","
	end
	
	return retStr
end

_G.CPetEquip = {}
function CPetEquip:new(petSystem)
	--���г����װ���ȼ���
	local obj = {};
	obj.setPetEquip = {}
	obj.petSys = petSystem
	
	for i,v in pairs(CPetEquip) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end 

function CPetEquip:Create()
	--��ȡPlayer
	local objPlayer = self.petSys:GetPlayer();
	if not objPlayer then
		_err("CPetEquipSystem Create Cannot get player");
		return false;
	end;
	--��ʼ��DB
	local objDB = objPlayer:GetDBQuery();
	if not objDB then
		_err("CPetEquipSystem Create Cannot get DBQuery");
		return false;
	end;
	self.objDBQuery = CPetEquipDB:new(objDB, self);
	
	--��ȡװ����Ϣ
	local Data = objPlayer:GetLineData("CPetEquipSystem")[1]
	
	if not Data then
		_err("CPetEquipSystem Create CanNot GetLineData!!!");
		Data = {}
	end;
	if Data[1] then
		self.setPetEquip = Data[1];
	end;
	
end

----����
function CPetEquip:OnChangeLineBegin()
	local objPlayer = self.petSys:GetPlayer();
	if(not objPlayer) then
		return false;
	end
	local Data = {};
	Data[1] = self.setPetEquip;
	objPlayer:SetLineData("CPetEquipSystem",Data);
end


function CPetEquip:OnEnterScene()
	self:SynPetEquipInfo();
end

--ͬ������װ����Ϣ
function CPetEquip:SynPetEquipInfo()
	local objPlayer = self.petSys:GetPlayer();
	if(not objPlayer) then
		return false;
	end
	
	objPlayer.SynPetEquipInfoMsg{AllPetEquipInfo = self.setPetEquip}
end

--�������ⲿ���ýӿ�
--------------------------------------------------------------------------------------------------------
--�ύ������������ʼװ��
function CPetEquip:InsertPetEquip(petID)
	--print("CPetEquip:InsertPetEquip petId is ", petID)
	if self.setPetEquip[petID] then _err("insert pet equip already exist!") return end;
	
	--װ��ȫ����ʼ��Ϊһ��
	self.setPetEquip[petID] = {1,1,1,1}
	--����Ϣ
	self:SynPetEquipInfo();
	
	--�������ݿ�
	self.objDBQuery:InsertPetEquip(petID, FormatStr(self.setPetEquip[petID]))
end


--װ������
function CPetEquip:UplevelEquip(petID, equipType, dwLevel)
	--print("CPetEquip:UplevelEquip petID, equipType", petID, equipType)
	if not self.setPetEquip[petID] then _err("uplevel pet equip not exist!") return end;
	
	local equipLevel = self.setPetEquip[petID][equipType];
	
	--����Ѵﵽ���ȼ��򷵻�
	if equipLevel >= _G.PetEquipConfig.MaxEquipLevel  then return end;
	
	local objPlayer = self.petSys:GetPlayer();
	if(not objPlayer) then
		return false;
	end
	
	if not dwLevel then
		local objItemSys = objPlayer:GetSystem("CItemSystem");
		if not objItemSys then
			return;
		end
		
		--������Һ��������ϲ����򷵻�
		local calLevel,calStar = _G.PetEquipConfig.GetEeuipLvAndStar(equipLevel);
		
		local costTable =  _G.PetEquipConfig.GetUpgradeCost(petID, equipType, calLevel, calStar)
		
		if not objItemSys:IsPacketMoneyEnough(costTable.AllSliver) then return end;
		
		for k, v in pairs(costTable) do
			if type(k) == "number" then
				local isEnough, _ = objItemSys:CheckDelEnumItemInPacketCond(k, v[1]);
				--print("CPetEquip:UplevelEquip AllSliver,itemCount", costTable.AllSliver, v[1])
				if not isEnough then return end;
			end
		end
		

		--�۳����Һ���������
		if costTable.AllSliver > 0 then
			objItemSys:CostPacketMoney(costTable.AllSliver, _G.ItemSysOperType.PetEquip)
		end
		
		for k, v in pairs(costTable) do
			if type(k) == "number" then
				objItemSys:DelEnumItemInPacket(k, v[1], false, _G.ItemSysOperType.PetEquip);
			end
		end
		
		--���������ɹ���
		local successRato = _G.PetEquipConfig.Probability(petID, equipType, equipLevel);
		if math.random(1, 10000) > successRato then
			objPlayer.PetEquipLevelUpMsg{PetID = petID, IsSucess = 0, equipLevel = self.setPetEquip[petID]}
			return;
		end
		
		self.setPetEquip[petID][equipType] = self.setPetEquip[petID][equipType] + 1;
	else
		self.setPetEquip[petID][equipType] = dwLevel;
	end
	
	-- ��װ�������Ϣ
	objPlayer.PetEquipLevelUpMsg{PetID = petID, IsSucess = 1, equipLevel = self.setPetEquip[petID]}
	--ˢϴ���������
	self.petSys:GetPetObj(petID).sysAttr:ChangeAdvAttr("PetEquip", _G.PetEquipConfig.GetAddAttrToPet(petID, self.setPetEquip[petID]))
	self.petSys:SendPetInfo(petID)
	--ˢϴ���������ӵ�����
	--self.petSys:AddRoleProperty()
	self.petSys.petSkill:ExecuteAddPetPassivitySkill(petID)
	-- �������ݿ�
	self.objDBQuery:UpdatePetEquip(petID, FormatStr(self.setPetEquip[petID]))
	
	
	--���׹���
	local curEquipLevel = self.setPetEquip[petID][equipType];
	if (curEquipLevel % 10 == 1) then
		local dwRoleID = objPlayer:GetRoleID();
		local szRoleName = objPlayer:GetName();
		-- local setNet = {};
		-- for i, objPlayer in pairs(CPlayerManager.setAllPlayer) do
			-- table.insert(setNet, objPlayer.objNet);
		-- end;
		-- _groupcallout(setNet, "PetEquipUpGradeMsg", {RoleId = dwRoleID, RoleName = szRoleName, PetId = petID, EquipType = equipType, CurLevel = curEquipLevel});
		
		--ȫ���㲥
		CGameApp.PetEquipUpGradeMsg{RoleId = dwRoleID, RoleName = szRoleName, PetId = petID, EquipType = equipType, CurLevel = curEquipLevel};
	end
	
	--��������
	if curEquipLevel >= _G.PetEquipConfig.MaxEquipLevel then
		local dwRoleID = objPlayer:GetRoleID();
		local szRoleName = objPlayer:GetName();
		-- local setNet = {};
		-- for i, objPlayer in pairs(CPlayerManager.setAllPlayer) do
			-- table.insert(setNet, objPlayer.objNet);
		-- end;
		-- _groupcallout(setNet, "PetEquipUpGradeMsg", {RoleId = dwRoleID, RoleName = szRoleName, PetId = petID, EquipType = equipType, CurLevel = curEquipLevel});
		
		--ȫ���㲥
		CGameApp.PetEquipUpGradeMsg{RoleId = dwRoleID, RoleName = szRoleName, PetId = petID, EquipType = equipType, CurLevel = curEquipLevel};
	end
	
	
end

function CPetEquip:GetEquipTable(dwPetId)
	return self.setPetEquip[dwPetId];
end


-------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------�߻�Ҫ�Ľӿ�-----------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------

function CPetEquip:SetLevel(petID, equipType, dwLevel)
	self:UplevelEquip(petID, equipType, dwLevel)
end

	