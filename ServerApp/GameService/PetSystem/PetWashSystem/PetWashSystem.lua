--[[[
	宠物洗练系统
	日期2013.12.20
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

--计算用的宠物属性表到本系统内存里的表的转换
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


--内存里的表的计算的结构的转换 
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
	--获取Player
	local objPlayer = self.petSys:GetPlayer();
	if not objPlayer then
		_err("CPetBournSystem Create Cannot get player");
		return false;
	end;
	--初始化DB
	local objDB = objPlayer:GetDBQuery();
	if not objDB then
		_err("CPetBournSystem Create Cannot get DBQuery");
		return false;
	end;
	self.objDBQuery = CPetWashDB:new(objDB, self);
	
	
	--所有宠物的洗练增加的属性
	--   setPetWashAttr 此表的结构
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
	
	--获取境界经验信息
	local Data = objPlayer:GetLineData("CPetWashSystem")[1]
	
	if not Data[1] then
		--插入每个宠物的洗练属性（初始化为0）
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

----换线
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
		--创建的时候计算洗练给宠物增加的属性
		self.petSys:ChangeAdvAttr(petId, "PetWash", Sys2Cfg(self.setPetWashAttr[petId]));
	end
end

function CPetWash:OnEnterScene()
	for petId, tab in pairs(self.setPetWashAttr) do
		--创建的时候计算洗练给宠物增加的属性
		self.petSys:ChangeAdvAttr(petId, "PetWash", Sys2Cfg(self.setPetWashAttr[petId]));
	end
	
	self:SynPetWashInfo();
end

--同步宠物境界经验信息
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

--以下是外部调用接口
--------------------------------------------------------------------------------------------------------
--结交宠物后插入宠物初始洗练属性
function CPetWash:InsertPetWashInfo(petID)
	--print("CPetWash:InsertPetBourn petId is ", petID)
	if self.setPetWashAttr[petID] then _err("CPetWash insert pet equip already exist!") return end;
	
	--洗练属性初始化
	self.setPetWashAttr[petID] = {}
	for k, v in pairs(PetWashConfig.transformTab) do
		table.insert(self.setPetWashAttr[petID], 0)
	end
	
	--洗练次数初始化
	self.setPetCount[petID] = 0;
	
	--发消息
	self:SynPetWashInfo();
	
	--插入数据库
	self.objDBQuery:InsertPetWashInfo(petID, FormatStr(self.setPetWashAttr[petID]), self.setPetCount[petID])
end



--宠物洗练
function CPetWash:Wash(petID, b_RuneActive, b_IsAutoBuy, b_IsUseGold, setAttr)
	local petLevel = self.petSys:GetPetLevel(petID);
	if not _G.PetWashConfig:IsOpenWash(petLevel) then return end; 
	
	if not self.setPetWashAttr[petID] then _err("pet Wash not exist!", petID) return end;
	
	local washAttr = self.setPetWashAttr[petID];
	
	--计算洗练重数
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
			
		--是否激活远古符文
		if not b_RuneActive then
			b_IsAutoBuy = false;
			if self.setPetCount[petID] >= PetWashConfig.MaxCount then
				return
			end
		end
		
		
		--如果银币和升级材料不够则返回
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
					else--材料不够而且不是自动购买则返回
						return;
					end;
				end;
				
			end
		end
		
		
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
			for k, v in pairs(costTable) do
				if type(k) == "number" then
					isEnough, _ = ItemSystem:CheckDelEnumItemInPacketCond(k, v);
					if not isEnough then return end;
				end
			end
		end;
		
		
		
		--扣除银币和升级材料
		if costTable.silver > 0 then
			ItemSystem:CostPacketMoney(costTable.silver, _G.ItemSysOperType.PetWash)
		end
		
		for k, v in pairs(costTable) do
			if type(k) == "number" then
				ItemSystem:DelEnumItemInPacket(k, v, false, _G.ItemSysOperType.PetWash);
			end
		end
		
		--随机增加的属性
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
	
	
	--消息 
	self:PetWashInfoChange(petID);
	
	--数据库
	self.objDBQuery:UpdatePetAttr(petID, FormatStr(self.setPetWashAttr[petID]));
	self.objDBQuery:UpdatePetCount(petID, self.setPetCount[petID]);
	
	
	washAttr = self.setPetWashAttr[petID];
	
	--重新计算洗练重数
	local curWashLevel = PetWashConfig:AttrToLevel(petID, washAttr);
	
	if curWashLevel > washLevel and curWashLevel >= PetWashConfig.BoardcastLevel then
		local dwRoleID = objPlayer:GetRoleID();
		local szRoleName = objPlayer:GetName();
		
		--全服广播
		CGameApp.PetWashBoardcastMsg{RoleId = dwRoleID, PetId = petID, RoleName = szRoleName, WashLevel = curWashLevel, SetAttr = washAttr};
	end
	
end

function CPetWash:GetAttr(dwPetId)
	return self.setPetWashAttr[dwPetId];
end

--获取宠物洗练重数
function CPetWash:GetLevel(dwPetId)
	if not self.setPetWashAttr or not self.setPetWashAttr[dwPetId] then
		return;
	end
	
	return _G.PetWashConfig:AttrToLevel(dwPetId, self.setPetWashAttr[dwPetId]);
end
	
--每日清空洗练次数
function CPetWash:ResetCount()
	for petId, _ in pairs (self.setPetCount) do
		self.setPetCount[petId] = 0;
	end
end


-------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------策划要的接口-----------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------


	