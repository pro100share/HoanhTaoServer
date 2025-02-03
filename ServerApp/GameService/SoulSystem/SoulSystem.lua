--战魂系统

_G.CSoulSystem = {};

function CSoulSystem:new()
	local obj = CSystem:new("CSoulSystem");
	
	obj.setSoulList = {};
	
	obj.setHolder = 
	{
		[SoulHolderType.Hunt] = CSoulHuntHolder:new(obj);
		[SoulHolderType.Packet] = CSoulPacketHolder:new(obj);
		[SoulHolderType.Equip] = CSoulEquipHolder:new(obj);
	};
	
	obj.dwClickIndex = 0;
	obj.dwSoulChip = 0;
	
	obj.dwNextSoulInstID = 0;--下一个战魂的实例ID
	
	obj.setErrorPosSoul = {};--创建时发现的，位置不合理的战魂
	
	obj.setSuitInfo = {};
	obj.setActiveInfo = {};
	
	---
	for i,v in pairs(CSoulSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;

function CSoulSystem:Create(bIsChangeLine)
	local objSelf = self:GetPlayer();
	if not objSelf then
		return;
	end
	self.objDB = objSelf:GetDBQuery();
	if not self.objDB then
		_err("CSoulSystem Create Cannot get DBQuery");
		return false;
	end;
	
	local isNewRole = (objSelf:GetInfo().dwNewRoleFlag == 1);
	
	local Data = objSelf:GetLineData("CSoulSystem");
	
	--
	local datasys = Data[1];
	local objPacket = self:GetHolder(SoulHolderType.Packet);
	objPacket:SetHolderMax(datasys[1]);
	
	self.dwClickIndex = datasys[2];
	self.dwSoulChip = datasys[3];
	self.dwNextSoulInstID = datasys[4];
	self.setActiveInfo = datasys[5];
	
	--
	local index = 2;
	local dataobj = Data[index];
	while dataobj do
		for k,tbInfo in pairs(dataobj)do
			local objSoul = CSoulObject:new(tbInfo[1]);
			objSoul:FillWithInfo(tbInfo);
			
			local objHolder = self:GetHolder(tbInfo[3]);
			if objHolder and objHolder:TryMoveIn(objSoul,tbInfo[4]) then
				objHolder:InsertSoul(objSoul,tbInfo[4]);
				self.setSoulList[objSoul:GetInstID()] = objSoul;
			else
				table.insert(self.setErrorPosSoul,tbInfo);
			end
		end
		index = index + 1;
		dataobj = Data[index];
	end
	
	self:DoWithCreateOver();
	
	
	self:CheckSoulSuit();
	self:CountSystemProperty();
	
	-- --新建角色给战魂
	-- if isNewRole then
		-- local objPacket = self:GetHolder(SoulHolderType.Packet);
		-- for k,v in pairs(SoulInitList)do
			-- local dwPos = objPacket:GetFirstEmptySlot();
			-- if dwPos ~= 0 then
				-- self:CreateSoul(v,SoulHolderType.Packet,dwPos);
			-- end
		-- end
	-- end
end;

function CSoulSystem:Destroy()
	
end;

function CSoulSystem:OnChangeLineBegin()
	local objSelf = self:GetPlayer();
	if not objSelf then
		return;
	end
	
	local objPacket = self:GetHolder(SoulHolderType.Packet);
	local datasys = {};
	datasys[1] = objPacket.dwMaxPos;
	datasys[2] = self.dwClickIndex;
	datasys[3] = self.dwSoulChip;
	datasys[4] = self.dwNextSoulInstID;
	datasys[5] = self.setActiveInfo;
	
	objSelf:SetLineData("CSoulSystem", datasys);
	
	local index = 1;
	local dataobj = {};
	for _,objSoul in pairs(self.setSoulList)do
		table.insert(dataobj,objSoul:GetNetInfo());
		if index % 24 == 0 then
			objSelf:SetLineData("CSoulSystem", dataobj);
			dataobj = {};
		end;
		index = index + 1;
	end
	if #dataobj > 0 then
		objSelf:SetLineData("CSoulSystem", dataobj);
	end
	
end;

function CSoulSystem:OnEnterScene()
	
end;

function CSoulSystem:DoWithCreateOver()
	
	
	self.setErrorPosSoul = {};
end;

-------------------------------------------------------------------------------
function CSoulSystem:GetSoul(dwInstID)
	return self.setSoulList[dwInstID];
end;

function CSoulSystem:GetHolder(dwHolderType)
	return self.setHolder[dwHolderType];
end;

function CSoulSystem:GetNextInstID()
	self.dwNextSoulInstID = self.dwNextSoulInstID + 1;
	return self.dwNextSoulInstID;
end;

function CSoulSystem:GetPacketNumber()
	local objPacket = self:GetHolder(SoulHolderType.Packet);
	if objPacket then
		return objPacket:GetMaxNumber();
	else
		return 0;
	end
end;

-------------------------------------------------------------------------------
function CSoulSystem:CreateSoul(dwEnumID,dwHolderType,dwPos)
	local objHolder = self:GetHolder(dwHolderType)
	if not objHolder then
		return;
	end
	
	if (dwPos == 0) or (not dwPos) then
		dwPos = objHolder:GetFirstEmptySlot();
		if dwPos == 0 then
			return;
		end
	end
	
	local objSoul = CSoulObject:new(dwEnumID);
	
	objSoul:SetInstID(self:GetNextInstID());
	objSoul:SetPosInfo(dwHolderType,dwPos);
	
	objHolder:InsertSoul(objSoul,dwPos);
	
	self.setSoulList[objSoul:GetInstID()] = objSoul;
	
	self:DBInsertSoulInfo(objSoul);
	
	return objSoul;
end;

function CSoulSystem:AddSoul(dwEnumID,dwHolderType)
	local objSelf = self:GetPlayer();
	if not objSelf then
		return;
	end
	
	dwHolderType = dwHolderType or SoulHolderType.Packet;
	
	local objSoul = self:CreateSoul(dwEnumID,dwHolderType);
	if not objSoul then
		return;
	end
	
	objSelf.OnSoulHuntResultMsg
	{
		HuntIndex = self.dwClickIndex;
		SoulObject = objSoul:GetNetInfo();
	}
	
	CLogSystemManager:soul(objSelf,
		6,
		objSoul:GetEnumID(),
		objSoul:GetInstID(),
		objSoul:GetExp(),
		0,
		self.dwSoulChip);
	
	return true;
end;

function CSoulSystem:DeleteSoul(objSoul)
	local dwType,dwPosID = objSoul:GetPosInfo();
	local objHolder = self:GetHolder(dwType);
	if not objHolder then
		return;
	end
	
	objHolder:RemoveSoul(objSoul);
	
	self.setSoulList[objSoul:GetInstID()] = nil;
	
	self:DBDeleteSoulInfo(objSoul:GetInstID());
	
	return true;
end;


-------------------------------------------------------------------------------
--移动单个战魂，
function CSoulSystem:TryMoveSoul(dwSoulID,dwMoveType,dwMovePos)
	local isAttrChange = false;
	local isMoveSucc = false;
	dwMovePos = dwMovePos or 0;
	
	local objSoul = self:GetSoul(dwSoulID);
	if not objSoul then
		return ;
	end
	
	local dwType,dwPosID = objSoul:GetPosInfo();
	
	if dwType == dwMoveType then
		-- --装备容器内不允许移动
		-- if dwType == SoulHolderType.Equip then
			-- return;
		-- end
		
		local objHolder = self:GetHolder(dwType);
		if not objHolder then
			return;
		end
		
		if dwMovePos == 0 then
			dwMovePos = objHolder:GetFirstEmptySlot();
		end
		if dwMovePos == 0 then
			return;
		end
		
		if objHolder:TryMoveIn(objSoul,dwMovePos,true) then
			objHolder:RemoveSoul(objSoul);
			objHolder:InsertSoul(objSoul,dwMovePos);
			objSoul:SetPosInfo(dwMoveType,dwMovePos);
			local tbChg = {};
			tbChg.dwPosID = dwMovePos;
			self:DBUpdateSoulInfo(objSoul:GetInstID(),tbChg);
			isMoveSucc = true;
		end
	else
		local ToHolder = self:GetHolder(dwMoveType);
		if not ToHolder then
			return;
		end
		local FromHolder = self:GetHolder(dwType);
		if not FromHolder then
			return;
		end
		
		--
		if dwMovePos == 0 then
			dwMovePos = ToHolder:GetFirstEmptySlot();
		end
		if dwMovePos == 0 then
			return;
		end
		
		--移动
		if ToHolder:TryMoveIn(objSoul,dwMovePos) then
			FromHolder:RemoveSoul(objSoul);
			ToHolder:InsertSoul(objSoul,dwMovePos);
			objSoul:SetPosInfo(dwMoveType,dwMovePos);
			local tbChg = {};
			tbChg.dwPosID = dwMovePos;
			tbChg.dwHolderType = dwMoveType;
			self:DBUpdateSoulInfo(objSoul:GetInstID(),tbChg);
			isMoveSucc = true;
		end
		
		--如果有装备容器的移动，要修改属性
		if (dwType == SoulHolderType.Equip) or (dwMoveType == SoulHolderType.Equip) then
			isAttrChange = true;
		end
	end
	
	return isMoveSucc,isAttrChange;
end;

--计算属性
function CSoulSystem:CountSystemProperty()
	local objSelf = self:GetPlayer();
	if not objSelf then
		return;
	end
	
	local objHolder = self:GetHolder(SoulHolderType.Equip);
	if not objHolder then
		return;
	end
	
	--获得所有战魂
	local tbList = objHolder:GetSoulObjectList();
	
	local tbAdvAttr = SSingleAttrChange:new();
	local tbPerAttr = SSingleAttrChange:new();
	for k,v in pairs(tbList)do
		local adv,per = v:GetAddAttr();
		
		tbAdvAttr:AddValue(adv);
		tbPerAttr:AddValue(per);
	end
	
	local objSklSys = objSelf:GetSystem("CSkillSystem");
	objSklSys:NotifySoulInfo(tbAdvAttr,1);
	objSklSys:NotifySoulInfo(tbPerAttr,1,true);
	
	self:CountSuitAttr();
end;

function CSoulSystem:SoulEatSoul(objAdd,objDel)
	local objSelf = self:GetPlayer();
	if not objSelf then
		return;
	end
	
	--同一个战魂不可以吃
	if objAdd:GetInstID() == objDel:GetInstID() then
		return;
	end
	
	local dwAddExp = SoulFunction.FunCountSoulExp(objDel:GetEnumID(),objDel:GetExp());
	
	self:DeleteSoul(objDel);
	if objAdd:AddExp(dwAddExp) then
		local tbChg = {};
		tbChg.dwExp = objAdd:GetExp();
		self:DBUpdateSoulInfo(objAdd:GetInstID(),tbChg);
		
		CLogSystemManager:soul(objSelf,
			3,
			objAdd:GetEnumID(),
			objAdd:GetInstID(),
			objAdd:GetExp(),
			0,
			self.dwSoulChip);
		
		CLogSystemManager:soul(objSelf,
			4,
			objDel:GetEnumID(),
			objDel:GetInstID(),
			objDel:GetExp(),
			0,
			self.dwSoulChip);
	end
end;

function CSoulSystem:DealWithEat(tbSoulList,tbExp,tbDel)
	if #tbSoulList <= 1 then
		return;
	end
	
	--加经验的战魂
	local objHost = tbSoulList[1];
	if not objHost:IsCanEatOther() then
		table.remove(tbSoulList,1);
		return self:DealWithEat(tbSoulList,tbExp,tbDel);
	end
	
	local dwNum = #tbSoulList;
	--被吃掉的战魂
	local objEat = tbSoulList[dwNum];
	table.remove(tbSoulList,dwNum);
	
	table.insert(tbExp,objHost:GetInstID());
	table.insert(tbDel,objEat:GetInstID());
	
	self:SoulEatSoul(objHost,objEat);
	
	return self:DealWithEat(tbSoulList,tbExp,tbDel);
end;

function CSoulSystem:SellSoulSingle(dwSoulID)
	local objSelf = self:GetPlayer();
	if not objSelf then
		return;
	end
	
	local objSoul = self:GetSoul(dwSoulID);
	if not objSoul then
		return;
	end
	
	local objItemSystem = objSelf:GetSystem("CItemSystem");
	if not objItemSystem then
		return;
	end
	
	local dwMoney = objSoul:GetSellPrice();
	
	self:DeleteSoul(objSoul);
	
	objItemSystem:AddPacketMoney(dwMoney,ItemSysOperType.SoulSell);
	
	return true;
end;

-------------------------------------------------------------------------------
function CSoulSystem:GetRoleSoulList(dwRoleID)
	local objSelf = self:GetPlayer();
	if not objSelf then
		return;
	end
	
	local args = {objSelf:GetRoleID()};
	
	--发起远程调用,请求对方的数据
	local cbfunc = function(_, result, _)
		if result == -1 then
			--通知客户端，玩家已经下线
			objSelf.OnRoleSoulInfoMsg{Code = 1};
		end;
	end;
	
	GSRemoteCall(dwRoleID,"CSoulSystem","GetMyEquipSoul",args,cbfunc);
end;

function CSoulSystem:GetMyEquipSoul(dwFromRole)
	local objSelf = self:GetPlayer();
	if not objSelf then
		return;
	end

	local objEquip = self:GetHolder(SoulHolderType.Equip);
	
	local tbList = objEquip:GetSoulObjectList();
	
	local tbSendInfo = {};
	for k,obj in pairs(tbList)do
		tbSendInfo[k] = obj:GetNetInfo();
	end
	
	local args = {objSelf:GetRoleID(),tbSendInfo};
	
	GSRemoteCall(dwFromRole,"CSoulSystem","SendSoulList",args);
end;

--检测当前的战魂套装
function CSoulSystem:CheckSoulSuit()
	local objHolder = self:GetHolder(SoulHolderType.Equip);
	if not objHolder then
		return;
	end
	local tbSoulList = objHolder:GetSoulObjectList();
	
	local tbEquipInfo = FunSoulEquipPosInfoMaker(tbSoulList);
	
	self.setSuitInfo = FunSoulSuitCheck(tbEquipInfo);
end;

--计算套装属性
function CSoulSystem:CountSuitAttr()
	local objSelf = self:GetPlayer();
	if not objSelf then
		return;
	end
	
	local sysSkill = objSelf:GetSystem("CSkillSystem");
	if not sysSkill then
		return;
	end
	
	--统计激活属性并满足条件的套装
	local tbSuitActive = {};
	for dwRank,tbSuitList in pairs(self.setSuitInfo)do
		local tbActList = self.setActiveInfo[dwRank];
		if tbActList then
			for dwSuitID,tb in pairs(tbSuitList)do
				if (tb.isActive == 1) and (tbActList[dwSuitID]) then
					table.insert(tbSuitActive,dwSuitID);
				end
			end
		end
	end
	
	local addAttrAdv = SSingleAttrChange:new();
	local addAttrPer = SSingleAttrChange:new();
	
	for n,dwSuitID in pairs(tbSuitActive)do
		local objAdv,objPer = FunGetSoulSuitAttr(dwSuitID);
		
		addAttrAdv:AddValue(objAdv);
		addAttrPer:AddValue(objPer);
	end
	
	sysSkill:NotifySoulInfo(addAttrAdv,2);
	sysSkill:NotifySoulInfo(addAttrPer,2,true);
end;


local function IsSuitActive(setSuitInfo,dwRankID,dwSuitID)
	if not setSuitInfo[dwRankID] then
		return;
	end
	if not setSuitInfo[dwRankID][dwSuitID] then
		return;
	end
	if setSuitInfo[dwRankID][dwSuitID].isActive ~= 1 then
		return;
	end
	
	return true;
end;

function CSoulSystem:ActiveSingleSuit(dwRankID,dwSuitID)
	local objSelf = self:GetPlayer();
	if not objSelf then
		-- print("===ActiveSingleSuit -0.0===")
		return;
	end
	local sysItem = objSelf:GetSystem("CItemSystem");
	if not sysItem then
		-- print("===ActiveSingleSuit -0.1===")
		return;
	end
	
	--检测激活条件
	if not IsSuitActive(self.setSuitInfo,dwRankID,dwSuitID) then
		-- print("===ActiveSingleSuit -1===")
		return nil;
	end
	
	local tbCfgInfo = SoulSuitBaseConfig[dwSuitID];
	if not tbCfgInfo then
		-- print("===ActiveSingleSuit -2===")
		return nil;
	end
	
	if self.setActiveInfo[dwRankID] then
		if self.setActiveInfo[dwRankID][dwSuitID] then
			-- print("===ActiveSingleSuit -3===")
			return nil;
		end
	end
	
	local dwHaveNumber = sysItem:GetEnumItemNumInPacket(SoulSuitActiveItemEnum);
	if dwHaveNumber < tbCfgInfo.dwActiveCost then
		-- print("===ActiveSingleSuit -4===")
		return nil;
	end
	
	--激活
	if not self.setActiveInfo[dwRankID] then
		self.setActiveInfo[dwRankID] = {};
	end
	self.setActiveInfo[dwRankID][dwSuitID] = 1;
	
	sysItem:DelEnumItemInPacket(SoulSuitActiveItemEnum, tbCfgInfo.dwActiveCost, true, ItemSysOperType.SoulSuitActive);
	
	self:SaveActiveInfo();
	
	return true;
end;