--[[[
	宠物装备系统
	日期2013.11.11
	author lizc
--]]


--[[
宠物装备表结构说明
self.setPetEquip =
 {
	[宠物配置ID] = { 武器等级,衣服等级, 裤子等级,戒指等级}
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
	--所有宠物的装备等级表
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
	--获取Player
	local objPlayer = self.petSys:GetPlayer();
	if not objPlayer then
		_err("CPetEquipSystem Create Cannot get player");
		return false;
	end;
	--初始化DB
	local objDB = objPlayer:GetDBQuery();
	if not objDB then
		_err("CPetEquipSystem Create Cannot get DBQuery");
		return false;
	end;
	self.objDBQuery = CPetEquipDB:new(objDB, self);
	
	--获取装备信息
	local Data = objPlayer:GetLineData("CPetEquipSystem")[1]
	
	if not Data then
		_err("CPetEquipSystem Create CanNot GetLineData!!!");
		Data = {}
	end;
	if Data[1] then
		self.setPetEquip = Data[1];
	end;
	
end

----换线
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

--同步宠物装备信息
function CPetEquip:SynPetEquipInfo()
	local objPlayer = self.petSys:GetPlayer();
	if(not objPlayer) then
		return false;
	end
	
	objPlayer.SynPetEquipInfoMsg{AllPetEquipInfo = self.setPetEquip}
end

--以下是外部调用接口
--------------------------------------------------------------------------------------------------------
--结交宠物后插入宠物初始装备
function CPetEquip:InsertPetEquip(petID)
	--print("CPetEquip:InsertPetEquip petId is ", petID)
	if self.setPetEquip[petID] then _err("insert pet equip already exist!") return end;
	
	--装备全部初始化为一级
	self.setPetEquip[petID] = {1,1,1,1}
	--发消息
	self:SynPetEquipInfo();
	
	--插入数据库
	self.objDBQuery:InsertPetEquip(petID, FormatStr(self.setPetEquip[petID]))
end


--装备升级
function CPetEquip:UplevelEquip(petID, equipType, dwLevel)
	--print("CPetEquip:UplevelEquip petID, equipType", petID, equipType)
	if not self.setPetEquip[petID] then _err("uplevel pet equip not exist!") return end;
	
	local equipLevel = self.setPetEquip[petID][equipType];
	
	--如果已达到最大等级则返回
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
		
		--如果银币和升级材料不够则返回
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
		

		--扣除银币和升级材料
		if costTable.AllSliver > 0 then
			objItemSys:CostPacketMoney(costTable.AllSliver, _G.ItemSysOperType.PetEquip)
		end
		
		for k, v in pairs(costTable) do
			if type(k) == "number" then
				objItemSys:DelEnumItemInPacket(k, v[1], false, _G.ItemSysOperType.PetEquip);
			end
		end
		
		--计算升级成功率
		local successRato = _G.PetEquipConfig.Probability(petID, equipType, equipLevel);
		if math.random(1, 10000) > successRato then
			objPlayer.PetEquipLevelUpMsg{PetID = petID, IsSucess = 0, equipLevel = self.setPetEquip[petID]}
			return;
		end
		
		self.setPetEquip[petID][equipType] = self.setPetEquip[petID][equipType] + 1;
	else
		self.setPetEquip[petID][equipType] = dwLevel;
	end
	
	-- 发装备变更消息
	objPlayer.PetEquipLevelUpMsg{PetID = petID, IsSucess = 1, equipLevel = self.setPetEquip[petID]}
	--刷洗宠物的属性
	self.petSys:GetPetObj(petID).sysAttr:ChangeAdvAttr("PetEquip", _G.PetEquipConfig.GetAddAttrToPet(petID, self.setPetEquip[petID]))
	self.petSys:SendPetInfo(petID)
	--刷洗宠物给人物加的属性
	--self.petSys:AddRoleProperty()
	self.petSys.petSkill:ExecuteAddPetPassivitySkill(petID)
	-- 更新数据库
	self.objDBQuery:UpdatePetEquip(petID, FormatStr(self.setPetEquip[petID]))
	
	
	--升阶公告
	local curEquipLevel = self.setPetEquip[petID][equipType];
	if (curEquipLevel % 10 == 1) then
		local dwRoleID = objPlayer:GetRoleID();
		local szRoleName = objPlayer:GetName();
		-- local setNet = {};
		-- for i, objPlayer in pairs(CPlayerManager.setAllPlayer) do
			-- table.insert(setNet, objPlayer.objNet);
		-- end;
		-- _groupcallout(setNet, "PetEquipUpGradeMsg", {RoleId = dwRoleID, RoleName = szRoleName, PetId = petID, EquipType = equipType, CurLevel = curEquipLevel});
		
		--全服广播
		CGameApp.PetEquipUpGradeMsg{RoleId = dwRoleID, RoleName = szRoleName, PetId = petID, EquipType = equipType, CurLevel = curEquipLevel};
	end
	
	--满级公告
	if curEquipLevel >= _G.PetEquipConfig.MaxEquipLevel then
		local dwRoleID = objPlayer:GetRoleID();
		local szRoleName = objPlayer:GetName();
		-- local setNet = {};
		-- for i, objPlayer in pairs(CPlayerManager.setAllPlayer) do
			-- table.insert(setNet, objPlayer.objNet);
		-- end;
		-- _groupcallout(setNet, "PetEquipUpGradeMsg", {RoleId = dwRoleID, RoleName = szRoleName, PetId = petID, EquipType = equipType, CurLevel = curEquipLevel});
		
		--全服广播
		CGameApp.PetEquipUpGradeMsg{RoleId = dwRoleID, RoleName = szRoleName, PetId = petID, EquipType = equipType, CurLevel = curEquipLevel};
	end
	
	
end

function CPetEquip:GetEquipTable(dwPetId)
	return self.setPetEquip[dwPetId];
end


-------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------策划要的接口-----------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------

function CPetEquip:SetLevel(petID, equipType, dwLevel)
	self:UplevelEquip(petID, equipType, dwLevel)
end

	