--[[[
	����ϴ��ϵͳ
	����2013.12.20
	author lizc
--]]

local function ParseStr(str)
	local t = {}
	
	local lastIndex = 0;
	local nextIndex = 0;
	while true do
		nextIndex = lastIndex + 1;
		lastIndex = string.find(str, ",", nextIndex)
		if not lastIndex then break end;
		local str1 = string.sub(str, nextIndex, lastIndex - 1);
		local value = tonumber(str1);
		if not value then
			_err("!@#!$%%", str1);
		end;
		table.insert(t, value)
	end;
	
	return t;
end


local function FormatStr(t)
	local retStr = "";
	
	for k = 1, #t do
		retStr = retStr..t[k]..","
	end
	
	return retStr
end

--�����õĳ������Ա���ϵͳ�ڴ���ı��ת��
local function Cfg2Sys(petSingleAttr)
	if not petSingleAttr then
		return
	end
	
	local petWashAttr = {}
	for k = 1, #PetWashConfig.transformTab do
		table.insert(petWashAttr, petSingleAttr[PetWashConfig.transformTab[k]]);
	end
	return petWashAttr;
end


--�ڴ���ı�ļ���Ľṹ��ת�� 
local function Sys2Cfg(setPetWashAttr)
	local transAttr = PetWashConfig:AttrTransform(setPetWashAttr)
	
	local objData = _G.PetSingleAttr:new(false);
	for k, v in pairs(transAttr) do
		objData[k] = v
	end
	
	return objData;
end

_G.CPetWash = {}
function CPetWash:new(petSystem)
	local obj = {};
	
	obj.petSys = petSystem
	
	for i,v in pairs(CPetWash) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end 

function CPetWash:Create(petInfo)
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
	self.objDBQuery = CPetWashDB:new(objDB, self);
	
	
	--���г����ϴ�����ӵ�����
	--   setPetWashAttr �˱�Ľṹ
	--[[
		{
			[petid1] = {10,5,5,12,20,},
			[petid2] = {10,5,5,12,20,},
			[petid3] = {10,5,5,12,20,},
			...
		}
		
	--]]
	self.setPetWashAttr = {}
	self.setPetCount = {}
	
	--��ȡ���羭����Ϣ
	local Data = objPlayer:GetLineData("CPetWashSystem")[1]
	
	if not Data[1] then
		--����ÿ�������ϴ�����ԣ���ʼ��Ϊ0��
		for k,tbInfo in pairs(petInfo)do
			self:InsertPetWashInfo(tbInfo.dwPetId)
		end
		
	end;
	if Data[1] then
		for petId, tab in pairs(Data[1]) do
			self.setPetWashAttr[petId] = ParseStr(tab[1]);
			self.setPetCount[petId] = tab[2];
		end
	end;
	
end

----����
function CPetWash:OnChangeLineBegin()
	local objPlayer = self.petSys:GetPlayer();
	if(not objPlayer) then
		return false;
	end
	local Data = {};
	Data[1] = {};
	
	for petId, attr in pairs(self.setPetWashAttr) do
		Data[1][petId] = {FormatStr(attr), self.setPetCount[petId]}
	end
	
	objPlayer:SetLineData("CPetWashSystem",Data);
end


function CPetWash:OnChangeLineEnd()
	for petId, tab in pairs(self.setPetWashAttr) do
		--������ʱ�����ϴ�����������ӵ�����
		self.petSys:ChangeAdvAttr(petId, "PetWash", Sys2Cfg(self.setPetWashAttr[petId]));
	end
end

function CPetWash:OnEnterScene()
	for petId, tab in pairs(self.setPetWashAttr) do
		--������ʱ�����ϴ�����������ӵ�����
		self.petSys:ChangeAdvAttr(petId, "PetWash", Sys2Cfg(self.setPetWashAttr[petId]));
	end
	
	self:SynPetWashInfo();
end

--ͬ�����ﾳ�羭����Ϣ
function CPetWash:SynPetWashInfo()
	local objPlayer = self.petSys:GetPlayer();
	if(not objPlayer) then
		return false;
	end
	
	objPlayer.SynPetWashInfoMsg{SetAttr= self.setPetWashAttr, SetWashCount = self.setPetCount};
end


function CPetWash:PetWashInfoChange(petID)
	local objPlayer = self.petSys:GetPlayer();
	if(not objPlayer) then
		return false;
	end
	
	objPlayer.PetWashInfoChangeMsg{PetID = petID, SetAttr= self.setPetWashAttr[petID], SetWashCount = self.setPetCount[petID]};
end

--�������ⲿ���ýӿ�
--------------------------------------------------------------------------------------------------------
--�ύ������������ʼϴ������
function CPetWash:InsertPetWashInfo(petID)
	--print("CPetWash:InsertPetBourn petId is ", petID)
	if self.setPetWashAttr[petID] then _err("CPetWash insert pet equip already exist!") return end;
	
	--ϴ�����Գ�ʼ��
	self.setPetWashAttr[petID] = {}
	for k, v in pairs(PetWashConfig.transformTab) do
		table.insert(self.setPetWashAttr[petID], 0)
	end
	
	--ϴ��������ʼ��
	self.setPetCount[petID] = 0;
	
	--����Ϣ
	self:SynPetWashInfo();
	
	--�������ݿ�
	self.objDBQuery:InsertPetWashInfo(petID, FormatStr(self.setPetWashAttr[petID]), self.setPetCount[petID])
end



--����ϴ��
function CPetWash:Wash(petID, b_RuneActive, b_IsAutoBuy, b_IsUseGold, setAttr)
	local petLevel = self.petSys:GetPetLevel(petID);
	if not _G.PetWashConfig:IsOpenWash(petLevel) then return end; 
	
	if not self.setPetWashAttr[petID] then _err("pet Wash not exist!", petID) return end;
	
	local washAttr = self.setPetWashAttr[petID];
	
	--����ϴ������
	local washLevel = PetWashConfig:AttrToLevel(petID, washAttr);
	if washLevel > PetWashConfig.MaxLevel then
		_err("CPetWash:Wash level limit err");
		return
	end
	
	local objPlayer = self.petSys:GetPlayer();
	if(not objPlayer) then
		return false;
	end
	
	if not setAttr then
		local ItemSystem = objPlayer:GetSystem("CItemSystem");
		if not ItemSystem then
			return;
		end
			
		--�Ƿ񼤻�Զ�ŷ���
		if not b_RuneActive then
			b_IsAutoBuy = false;
			if self.setPetCount[petID] >= PetWashConfig.MaxCount then
				return
			end
		end
		
		
		--������Һ��������ϲ����򷵻�
		local costTable =  PetWashConfig:NeedItem(washLevel, washAttr, b_RuneActive, petID)
		
		if not ItemSystem:IsPacketMoneyEnough(costTable.silver) then return end;
		
		local autoBuyInfo = {};
		for needItemID, needItemCount in pairs(costTable) do
			if type(needItemID) == "number" then
				local b_IsEnough_1, n_Minus_1 = ItemSystem:CheckDelEnumItemInPacketCond(needItemID, needItemCount);
				--print("CPetWash:UplevelEquip AllSliver,itemCount", costTable.AllSliver, needItemCount[1])
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
			ItemSystem:CostPacketMoney(costTable.silver, _G.ItemSysOperType.PetWash)
		end
		
		for k, v in pairs(costTable) do
			if type(k) == "number" then
				ItemSystem:DelEnumItemInPacket(k, v, false, _G.ItemSysOperType.PetWash);
			end
		end
		
		--������ӵ�����
		local addAttr = PetWashConfig:GetAddAttr(washLevel, washAttr, b_RuneActive, petID)
		self.petSys:ChangeAdvAttr(petID, "PetWash", addAttr);
		
		self.setPetWashAttr[petID] = Cfg2Sys(addAttr)
		
		if not b_RuneActive then
			self.setPetCount[petID] = self.setPetCount[petID] + 1;
		end
	else
		self.petSys:ChangeAdvAttr(petID, "PetWash", setAttr);
		self.setPetWashAttr[petID] = Cfg2Sys(addAttr)
	end
	
	
	--��Ϣ 
	self:PetWashInfoChange(petID);
	
	--���ݿ�
	self.objDBQuery:UpdatePetAttr(petID, FormatStr(self.setPetWashAttr[petID]));
	self.objDBQuery:UpdatePetCount(petID, self.setPetCount[petID]);
	
	
	washAttr = self.setPetWashAttr[petID];
	
	--���¼���ϴ������
	local curWashLevel = PetWashConfig:AttrToLevel(petID, washAttr);
	
	if curWashLevel > washLevel and curWashLevel >= PetWashConfig.BoardcastLevel then
		local dwRoleID = objPlayer:GetRoleID();
		local szRoleName = objPlayer:GetName();
		
		--ȫ���㲥
		CGameApp.PetWashBoardcastMsg{RoleId = dwRoleID, PetId = petID, RoleName = szRoleName, WashLevel = curWashLevel, SetAttr = washAttr};
	end
	
end

function CPetWash:GetAttr(dwPetId)
	return self.setPetWashAttr[dwPetId];
end

--��ȡ����ϴ������
function CPetWash:GetLevel(dwPetId)
	if not self.setPetWashAttr or not self.setPetWashAttr[dwPetId] then
		return;
	end
	
	return _G.PetWashConfig:AttrToLevel(dwPetId, self.setPetWashAttr[dwPetId]);
end
	
--ÿ�����ϴ������
function CPetWash:ResetCount()
	for petId, _ in pairs (self.setPetCount) do
		self.setPetCount[petId] = 0;
	end
end


-------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------�߻�Ҫ�Ľӿ�-----------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------


	