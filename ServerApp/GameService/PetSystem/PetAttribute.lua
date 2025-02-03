--宠物属性

local function TableClone(from)
	local to = {};
	for n,v in pairs(from)do
		to[n] = v;
	end
	return to;
end;

local function MakeDifferentTable(oldInfo,newInfo)
	local tbDif = {};
	
	if oldInfo == nil then
		if newInfo == nil then
			return tbDif;
		else
			for key,value in pairs(newInfo)do
				if type(value) ~= 'function' then
					tbDif[key] = value;
				end
			end
		end
	else
		if newInfo == nil then
			for key,value in pairs(oldInfo)do
				if type(value) ~= 'function' then
					tbDif[key] = 0;
				end
			end
		else
			for key,value in pairs(newInfo)do
				if type(value) ~= 'function' then
					if oldInfo[key] ~= newInfo[key] then
						tbDif[key] = newInfo[key];
					end
				end
			end
		end
	end
	
	return tbDif;
end;

_G.CPetAttr = {};

function CPetAttr:new(objPet,dwHP)
	local obj = {};
	
	obj.objOwner = objPet;
	
	obj.objBaseAttrInfo = PetSingleAttr:new();
	obj.objAdvAttrInfo = PetAttrChangeInfo:new();
	obj.objBaseAttrInfo.dwHP = dwHP;
	
	for k,v in pairs(CPetAttr)do
		if type(v) == "function" then
			obj[k] = v;
		end
	end
	return obj;
end;

function CPetAttr:Create(setEquipLevel, dwBournExp)
	local func = PetBaseInfo[self.objOwner.dwEnumID];
	if not func then
		return;
	end
	
	local tbBase = func(self.objOwner:GetOwnerLevel());
	tbBase.dwHP = 0;
	self.objBaseAttrInfo:AddValue(tbBase);
	
	--计算宠物装备加成属性
	if setEquipLevel then
		--self.objBaseAttrInfo:AddValue(_G.PetEquipConfig.GetAddAttrToPet(self.objOwner.dwEnumID, setEquipLevel))
		self:ChangeAdvAttr("PetEquip", _G.PetEquipConfig.GetAddAttrToPet(self.objOwner.dwEnumID, setEquipLevel))
	else
		_err("CPetAttr:Create() pet dont have equip petId is ",self.objOwner.dwEnumID)
	end
	
	
	--计算宠物境界加成属性
	if dwBournExp then
		self:ChangeAdvAttr("PetBourn", _G.PetBournConfig:CalBournProp(self.objOwner.dwEnumID, dwBournExp))
	else 
		_err("CPetAttr:Create() pet dont have bourn petId is ",self.objOwner.dwEnumID)
	end
	
	self:CheckHPMax();
end;

function CPetAttr:FillHP()
	local tbInfo = self:GetInfo();
	self.objBaseAttrInfo.dwHP = tbInfo.dwHPMax;
end;

function CPetAttr:GetInfo()
	local tbInfo = PetSingleAttr:new();
	local func = PetBaseInfo[self.objOwner.dwEnumID];
	if not func then
		return;
	end
	local tbAdv = self.objAdvAttrInfo:GetInfo();
	local tbBase = func(self.objOwner:GetOwnerLevel());
	tbBase.dwHP = self.objBaseAttrInfo.dwHP;
	tbInfo:AddValue(tbBase);
	tbInfo:AddValue(tbAdv);
	
	return tbInfo:GetData();
end;

--装备改变宠物的属性
function CPetAttr:ChangeBaseAttr(setEquipLevel)
end

function CPetAttr:ChangeAdvAttr(szSystemName,objInfo)
	if not self.objAdvAttrInfo[szSystemName] then
		--print("ERROR___CPetAttr:ChangeAdvAttr",szSystemName)
		return false;
	end
	
	local tbOldInfo = TableClone(self:GetInfo());
	
	self.objAdvAttrInfo[szSystemName] = objInfo;
	
	--检查HP上限
	self:CheckHPMax();
	
	local tbNewInfo = self:GetInfo();
		
	--通知客户端
	
	--检测是否需要地图广播
	self:CheckNeedBroadcast(tbOldInfo,tbNewInfo);
	
	return true;
end;

--检查最大HP，防止HP超最大
function CPetAttr:CheckHPMax(isSend)
	local tbInfo = self:GetInfo();
	
	--空HP
	if (not self.objBaseAttrInfo.dwHP) or (self.objBaseAttrInfo.dwHP == 0) then
		self.objBaseAttrInfo.dwHP = tbInfo.dwHPMax;
	end
	
	if tbInfo.dwHP <= tbInfo.dwHPMax then
		return;
	end
	
	self.objBaseAttrInfo.dwHP = tbInfo.dwHPMax;
end;

--检测是否需要进行地图广播
function CPetAttr:CheckNeedBroadcast(tbOldInfo,tbNewInfo)
	local tbChg = {};
	local isChange = false;
	
	if tbOldInfo.dwHP ~= tbNewInfo.dwHP then
		isChange = true;
	end
	if tbOldInfo.dwHPMax ~= tbNewInfo.dwHPMax then
		isChange = true;
	end
	
	if isChange then
		_mapcallout("PetMapHPChangeMsg", 
		{
			RoleID = self.objOwner:GetRoleID();
			HP = tbNewInfo.dwHP;
			HPMax = tbNewInfo.dwMaxHP;
		}, 
		self.objOwner:GetLogicID(), true);
	end
end;

--修改HP
function CPetAttr:ChgHP(dwValue,isCrit,dwEnemyType,dwEnemyID,dwSkillID,dwExecTime,dwActCount)
	local dwSkipValue = dwValue;
	local tbInfo = self:GetInfo();
	
	if not dwSkillID then
		dwSkillID = 0;
	end
	if not dwExecTime then
		dwExecTime = 0;
	end
	if not dwActCount then
		dwActCount = 0;
	end
	
	
	if dwValue > 0 then
		if self.objBaseAttrInfo.dwHP >= tbInfo.dwHPMax then
			return 0;
		end
		
		if dwValue > tbInfo.dwHPMax - self.objBaseAttrInfo.dwHP then
			dwValue = tbInfo.dwHPMax - self.objBaseAttrInfo.dwHP;
			dwSkipValue = dwValue;
		end
		
		self.objBaseAttrInfo.dwHP = self.objBaseAttrInfo.dwHP + dwValue;
		
	else
		if self.objBaseAttrInfo.dwHP + dwValue < 0 then
			dwValue = 0 - self.objBaseAttrInfo.dwHP;
			dwSkipValue = dwValue;
		end
		
		self.objBaseAttrInfo.dwHP = self.objBaseAttrInfo.dwHP + dwValue;
		
	end
	
	
	if self.objOwner:IsShow() then
		_mapcallout("PetMapHPChangeMsg", 
		{
			RoleID = self.objOwner:GetRoleID();
			HP = self.objBaseAttrInfo.dwHP;
			HPMax = tbInfo.dwHPMax;
			Crit = isCrit;
			EnemyType = dwEnemyType;
			EnemyID = dwEnemyID;
		},
		self.objOwner:GetLogicID(), true);
	end
	
	
	if self.objBaseAttrInfo.dwHP <= 0 then
		--print("==========pet dead ==================dwEnemyType,dwEnemyID",dwEnemyType,dwEnemyID)
		self.objOwner:Dead(dwEnemyType,dwEnemyID);
	end
	
	
	self.objOwner:GetOwnerRole():GetSystem("CPetSystem"):DBPetHpChg(self.objOwner:GetEnumID(), self.objBaseAttrInfo.dwHP, self.objOwner:GetLastDieTime());
	
	return dwValue;
end;

--增加HP(通过药品)
function CPetAttr:ChgHPByMedica(dwValue)
	local dwSkipValue = dwValue;
	local tbInfo = self:GetInfo();
	
	if dwValue > 0 then
		if self.objBaseAttrInfo.dwHP >= tbInfo.dwHPMax then
			return 0;
		end
		
		if dwValue > tbInfo.dwHPMax - self.objBaseAttrInfo.dwHP then
			dwValue = tbInfo.dwHPMax - self.objBaseAttrInfo.dwHP;
			dwSkipValue = dwValue;
		end
		
		self.objBaseAttrInfo.dwHP = self.objBaseAttrInfo.dwHP + dwValue;
	end;
	
	if self.objOwner:IsShow() then
		_mapcallout("PetMapHPChangeMsg", 
		{
			RoleID = self.objOwner:GetRoleID();
			HP = self.objBaseAttrInfo.dwHP;
			HPMax = tbInfo.dwHPMax;
			Crit = false;
			EnemyType = enEntType.eEntType_Pet;
			EnemyID = self.objOwner:GetRoleID();
		},
		self.objOwner:GetLogicID(), true);
	end
	
	self.objOwner:GetOwnerRole():GetSystem("CPetSystem"):DBPetHpChg(self.objOwner:GetEnumID(), self.objBaseAttrInfo.dwHP, self.objOwner:GetLastDieTime());
	return dwValue;
end

function CPetAttr:IsFullHP()
	local tbInfo = self:GetInfo();
	if self.objBaseAttrInfo.dwHP >= tbInfo.dwHPMax then
		return true;
	end
	return false;
end
