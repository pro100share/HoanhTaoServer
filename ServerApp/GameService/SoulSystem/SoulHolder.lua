--ս������

_G.CSoulHolder = {};

function CSoulHolder:new(dwHolderType,objSoulSystem)
	local obj = {};
	
	obj.setSoulPos = {};
	obj.dwUsedNumber = 0;
	
	obj.dwMaxPos = 0;
	
	obj.objOwner = objSoulSystem;
	
	---
	for i,v in pairs(CSoulHolder) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;

--������������
function CSoulHolder:SetHolderMax(dwNumber)
	for i = self.dwMaxPos+1,dwNumber do
		if not self.setSoulPos[i] then
			self.setSoulPos[i] = 0;
		end
	end
	self.dwMaxPos = dwNumber;
end;

function CSoulHolder:GetMaxNumber()
	return self.dwMaxPos;
end;

function CSoulHolder:TryMoveIn(objSoul,dwPos)
	return true;
end;

function CSoulHolder:InsertSoul(objSoul,dwPos)
	if not self.setSoulPos then
		-- print(debug.traceback())
	end
	self.setSoulPos[dwPos] = objSoul:GetInstID();
	
	self.dwUsedNumber = self.dwUsedNumber + 1;
end;

function CSoulHolder:RemoveSoul(objSoul)
	local dwType,dwPos = objSoul:GetPosInfo();
	self.setSoulPos[dwPos] = 0;
	
	self.dwUsedNumber = self.dwUsedNumber - 1;
end;

--������ȵĿո��ӣ�û�оͷ���0
function CSoulHolder:GetFirstEmptySlot()
	local dwRsl = 0;
	for k,v in pairs(self.setSoulPos)do
		if v == 0 then
			return k;
		end
	end
	
	return dwRsl;
end;

--���ؿյĸ�����
function CSoulHolder:GetEmptyNumber()
	if self.dwMaxPos < self.dwUsedNumber then
		_err("CSoulHolder maxpos < usedpos",self.dwMaxPos,self.dwUsedNumber)
		return 0;
	end
	return self.dwMaxPos-self.dwUsedNumber;
end;


--��������������ս�����
function CSoulHolder:GetSoulObjectList()
	local tbSoulList = {};
	local dwCount = 0;
	for k,v in pairs(self.setSoulPos)do
		if v ~= 0 then
			local objSoul = self.objOwner:GetSoul(v);
			if objSoul then
				table.insert(tbSoulList,objSoul);
				dwCount = dwCount + 1;
			end
		end
	end
	
	return tbSoulList,dwCount
end;

function CSoulHolder:IsCanAutoSort()
	return false;
end;

-------------------------------------------------------------------------------
--
_G.CSoulEquipHolder = {};
function CSoulEquipHolder:new(objSoulSystem)
	local obj = CSoulHolder:new(SoulHolderType.Equip,objSoulSystem);
	
	obj.setHaveEquip = {};
	
	for i = 1,SoulSystem.MountRankMax do
		obj.setHaveEquip[i] = {};
	end
	
	obj:SetHolderMax(SoulSystem.EquipNumber);
	
	---
	for i,v in pairs(CSoulEquipHolder) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	
	obj.InsertSoul = obj.InsertSoulPlus;
	obj.RemoveSoul = obj.RemoveSoulPlus;
	
	return obj;
end;

--Ŀǰ���ÿ������10���ո�һ��10�ף��ܹ�100��
function CSoulEquipHolder:TryMoveIn(objSoul,dwPos,isInHolderMove)
	if SoulEquipForbidType[objSoul:GetQuality()] then
		return false;
	end
	
	local dwEquipID = objSoul:GetEquipID();
	
	local dwRank,dwEquip = SoulFunction.FunGetEquipHolderPosRank(dwPos);
	-- print("===TryMoveIn===",dwRank,dwEquipID)
	--װ��λ����Ӧ�����ܷ�
	-- if dwEquipID ~= dwEquip then
		-- print("===TryMoveIn 1===",dwEquipID,dwEquip)
		-- return false;
	-- end
	
	--�ж����λ����û�п���
	local objMountSystem = self.objOwner:GetPlayer():GetSystem("CMountSystem");
	if not objMountSystem then
		return false;
	end
	local dwMyLevel = objMountSystem:GetMountLevel();
	local dwMyRank = objMountSystem:GetMaxMountGrade();
	--��������Ӧ�����ܷ�
	if dwRank > dwMyRank then
		-- print("rank error 1",dwRank,dwMyRank);
		return false;
	end
	--װ��λ�Ƿ���
	if not SoulFunction.FunIsEquipCanUse(dwRank,dwMyLevel,dwEquip) then
		-- print("===TryMoveIn 2===",dwRank,dwMyLevel,dwEquip)
		return false;
	end
	
	if not self.setHaveEquip[dwRank] then
		-- print("rank error 2",dwRank);
		return false;
	end
	
	--װ��λ�Ѿ��У����ܷ�
	-- print("===self.setHaveEquip====",self.setHaveEquip[dwRank][dwEquipID])
	--װ�������ڲ��ƶ����������װ��
	if not isInHolderMove then
		if self.setHaveEquip[dwRank][dwEquipID] == 1 then
			-- print("===TryMoveIn 3===",dwMyLevel,dwEquipID)
			return false;
		end
	end
	
	return true;
end;

function CSoulEquipHolder:TryEatIn(objSoul,dwPos)
	local dwRank,dwEquip = SoulFunction.FunGetEquipHolderPosRank(dwPos);
	
	--�ж����λ����û�п���
	local objMountSystem = self.objOwner:GetPlayer():GetSystem("CMountSystem");
	if not objMountSystem then
		return false;
	end
	local dwMyLevel = objMountSystem:GetMountLevel();
	local dwMyRank = objMountSystem:GetMaxMountGrade();
	--��������Ӧ�����ܷ�
	if dwRank > dwMyRank then
		-- print("rank error 1",dwRank,dwMyRank);
		return false;
	end
	
	--װ��λ�Ƿ���
	if not SoulFunction.FunIsEquipCanUse(dwRank,dwMyLevel,dwEquip) then
		-- print("===TryEatIn 2===",dwRank,dwMyLevel,dwEquip)
		return false;
	end
	
	if not self.setHaveEquip[dwRank] then
		-- print("rank error 2",dwRank);
		return false;
	end
	
	local dwEquipID = objSoul:GetEquipID();
	
	if self.setHaveEquip[dwRank][dwEquipID] == 1 then
		--���ԭλ����ս�꣬ȡԭս���װ��λ�����һ�¿��Է�
		local dwOldEquipID = -1;
		local dwID = self.setSoulPos[dwPos];
		local objOldSoul = self.objOwner:GetSoul(dwID);
		if objOldSoul then
			dwOldEquipID = objOldSoul:GetEquipID();
		end
		
		if dwOldEquipID == dwEquipID then
			return true;
		end
		-- print("===TryEatIn 3===",dwMyLevel,dwEquipID)
		return false;
	end
	
	return true;
end;

function CSoulEquipHolder:InsertSoulPlus(objSoul,dwPos)
	local dwEquipID = objSoul:GetEquipID();
	CSoulHolder.InsertSoul(self,objSoul,dwPos);
	
	local dwRank,dwEquip = SoulFunction.FunGetEquipHolderPosRank(dwPos);
	if not self.setHaveEquip[dwRank] then
		_err("rank error ",dwRank);
		return false;
	end
	-- print("===InsertSoulPlus===",dwRank,dwEquipID)
	self.setHaveEquip[dwRank][dwEquipID] = 1;
end;

function CSoulEquipHolder:RemoveSoulPlus(objSoul)
	local dwEquipID = objSoul:GetEquipID();
	local dwType,dwPos = objSoul:GetPosInfo();
	CSoulHolder.RemoveSoul(self,objSoul);
	
	local dwRank,dwEquip = SoulFunction.FunGetEquipHolderPosRank(dwPos);
	if not self.setHaveEquip[dwRank] then
		_err("rank error ",dwRank);
		return false;
	end
	
	self.setHaveEquip[dwRank][dwEquipID] = nil;
end;

-------------------
_G.CSoulHuntHolder = {};
function CSoulHuntHolder:new(objSoulSystem)
	local obj = CSoulHolder:new(SoulHolderType.Hunt,objSoulSystem);
	
	obj:SetHolderMax(SoulSystem.HuntNumber);
	
	---
	for i,v in pairs(CSoulHuntHolder) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;

function CSoulHuntHolder:TryMoveIn(objSoul,dwPos)
	if self.setSoulPos[dwPos] ~= 0 then
		return false;
	end
	
	return true;
end;

function CSoulHuntHolder:IsCanAutoSort()
	return true;
end;

-------------------
_G.CSoulPacketHolder = {};
function CSoulPacketHolder:new(objSoulSystem)
	local obj = CSoulHolder:new(SoulHolderType.Packet,objSoulSystem);
	
	
	
	---
	for i,v in pairs(CSoulPacketHolder) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;

function CSoulPacketHolder:TryMoveIn(objSoul,dwPos)
	local dwQuality = objSoul:GetQuality();
	if dwQuality == SoulQuality.Gray then
		return false;
	end
	if self.setSoulPos[dwPos] ~= 0 then
		return false;
	end
	
	return true;
end;

function CSoulPacketHolder:IsCanAutoSort()
	return true;
end;
