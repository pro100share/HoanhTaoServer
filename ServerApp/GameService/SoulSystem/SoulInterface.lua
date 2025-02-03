--对外接口

local m_SendSoulNumber = 70;

--发送初始化数据
function CSoulSystem:SendSoulInitInfo()
	local objSelf = self:GetPlayer();
	if not objSelf then
		return;
	end
	local objRefreshSys = objSelf:GetSystem("CRefreshSystem");
	if not objRefreshSys then
		return;
	end
	
	local dwCurCount = objRefreshSys:GetData(2101);
	
	local dwSendIndex = self.dwClickIndex;
	if dwSendIndex == 0 then
		dwSendIndex = 1;
	end
	
	objSelf.OnSoulSystemInitMsg
	{
		HuntClickIndex = dwSendIndex;
		PacketNumber = self:GetPacketNumber();
		ChipNumber = self.dwSoulChip;
		ChangeIndexCount = dwCurCount;
		ActiveList = self.setActiveInfo;
	}
	
	local dwCount = 0;
	local setSendList = {};
	for k,objSoul in pairs(self.setSoulList)do
		local objNetInfo = objSoul:GetNetInfo();
		
		table.insert(setSendList,objNetInfo);
		dwCount = dwCount + 1;
		
		if dwCount >= m_SendSoulNumber then
			objSelf.OnSoulObjectInitMsg
			{
				SoulList = setSendList;
				IsEnd = 0;
			}
			
			dwCount = 0;
			setSendList = {};
		end
	end
	
	objSelf.OnSoulObjectInitMsg
	{
		SoulList = setSendList;
		IsEnd = 1;
	}
end;

--狩猎
function CSoulSystem:HuntSoul()
	local objSelf = self:GetPlayer();
	if not objSelf then
		return;
	end
	
	--判断钱
	local objItemSystem = objSelf:GetSystem("CItemSystem");
	if not objItemSystem then
		objSelf.OnSoulHuntResultMsg{Code = 1};
		return;
	end
	
	local dwUsedIndex = self.dwClickIndex;
	if dwUsedIndex == 0 then
		dwUsedIndex = 1;
	end
	local tbHuntInfo = SoulConfig.tbMonster[dwUsedIndex];
	if not tbHuntInfo then
		objSelf.OnSoulHuntResultMsg{Code = 4};
		return;
	end
	local dwCostMoney = tbHuntInfo.money;
	
	if not objItemSystem:IsPacketMoneyEnough(dwCostMoney) then
		objSelf.OnSoulHuntResultMsg{Code = 5};
		return;
	end
	
	--狩猎容器判断
	local objHolder = self:GetHolder(SoulHolderType.Hunt)
	if not objHolder then
		objSelf.OnSoulHuntResultMsg{Code = 1};
		return;
	end
	local dwPos = objHolder:GetFirstEmptySlot();
	if dwPos == 0 then
		objSelf.OnSoulHuntResultMsg{Code = 2};
		return;
	end
	
	--加战魂
	local dwGetEnum,dwNewIndex = SoulFunction.FunHuntSoul(self.dwClickIndex);
	
	local objSoul = self:CreateSoul(dwGetEnum,SoulHolderType.Hunt,dwPos);
	if not objSoul then
		objSelf.OnSoulHuntResultMsg{Code = 3};
		return;
	end
	
	--消耗钱
	objItemSystem:CostPacketMoney(dwCostMoney, ItemSysOperType.SoulHunt);
	
	self.dwClickIndex = dwNewIndex;
	
	objSelf.OnSoulHuntResultMsg
	{
		Code = 0;
		HuntIndex = self.dwClickIndex;
		SoulObject = objSoul:GetNetInfo();
	}
	
	local tbChgInfo = {dwClickIndex = self.dwClickIndex};
	self:DBSaveSystemInfo(tbChgInfo);
	
	CLogSystemManager:soul(objSelf,
		1,
		dwGetEnum,
		objSoul:GetInstID(),
		objSoul:GetExp(),
		dwCostMoney,
		self.dwSoulChip);
end;

--修改狩猎索引
function CSoulSystem:ChangeHuntIndex(dwChangeTo)
	local objSelf = self:GetPlayer();
	if not objSelf then
		return;
	end
	
	local objRefreshSys = objSelf:GetSystem("CRefreshSystem");
	if not objRefreshSys then
		objSelf.OnSoulChangeIndexResultMsg{Code = 1};
		return;
	end
	local objItemSystem = objSelf:GetSystem("CItemSystem");
	if not objItemSystem then
		objSelf.OnSoulChangeIndexResultMsg{Code = 1};
		return;
	end
	local objVipSystem = objSelf:GetSystem("CVipSystem");
	if not objVipSystem then
		objSelf.OnSoulChangeIndexResultMsg{Code = 1};
		return;
	end
	
	--
	local dwCurCount = objRefreshSys:GetData(2101);
	
	--判断是否免费
	local isVip = objVipSystem:isVip();
	local isFree = false;
	if isVip then
		if dwCurCount <= SoulConfig.dwFreeChangeCountForVip then
			isFree = true;
		end
	else
		if dwCurCount <= SoulConfig.dwFreeChangeCountForNormal then
			isFree = true;
		end
	end
	
	--判断元宝
	if not isFree then
		if not objItemSystem:IsGoldEnough(SoulConfig.dwChangeIndexCostGold) then
			objSelf.OnSoulChangeIndexResultMsg{Code = 2};
			return;
		end
	end
	
	if not isFree then
		objItemSystem:CostGold(SoulConfig.dwChangeIndexCostGold, ItemSysOperType.ChangeHuntIndex);
	end
	
	--修改
	self.dwClickIndex = dwChangeTo;
	
	dwCurCount = dwCurCount + 1;
	
	--保存次数
	objRefreshSys:SetData(2101,dwCurCount);
	
	objSelf.OnSoulChangeIndexResultMsg
	{
		NewIndex = self.dwClickIndex;
		ChangeIndexCount = dwCurCount;
	};
end;

--移动战魂位置
function CSoulSystem:MoveSoul(dwSoulID,dwMoveToHolder,dwMoveToPos)
	local objSelf = self:GetPlayer();
	if not objSelf then
		return;
	end
	
	local isMoveSucc = false;
	local isAttrChange = false;
	local tbRsl = {};
	
	local isSucc,isAttr = self:TryMoveSoul(dwSoulID,dwMoveToHolder,dwMoveToPos);
	
	if isSucc then
		local objSoul = self:GetSoul(dwSoulID);
		if objSoul then
			local tbInfo = {};
			local dwType,dwPos = objSoul:GetPosInfo();
			tbInfo[1] = dwSoulID;
			tbInfo[2] = dwType;
			tbInfo[3] = dwPos;
			table.insert(tbRsl,tbInfo);
			isMoveSucc = true;
		end
	end
	if isAttr then
		isAttrChange = true;
	end
	
	--有属性改变
	if isAttrChange then
		self:CheckSoulSuit()
		self:CountSystemProperty();
	end
	
	if isMoveSucc then
		objSelf.OnSoulMoveResultMsg
		{
			SoulMoveList = tbRsl;
		}
	else
		objSelf.OnSoulMoveResultMsg
		{
			Code = 1;
		}
	end
end;

--一键收集
function CSoulSystem:PickAllSoul()
	-- print("===PickAllSoul===")
	local objSelf = self:GetPlayer();
	if not objSelf then
		return;
	end
	
	--先看背包是否可以放下
	local objPacket = self:GetHolder(SoulHolderType.Packet);
	local objHunt = self:GetHolder(SoulHolderType.Hunt);
	
	-- local tbSoulList,dwCount = objHunt:GetSoulObjectList();
	local tbCanMove = {};
	local dwCount = 0;
	for k,id in pairs(objHunt.setSoulPos)do
		local objSoul = self:GetSoul(id);
		if objSoul then
			local dwQuality = objSoul:GetQuality();
			if dwQuality ~= SoulQuality.Gray then
				tbCanMove[id] = objSoul;
				dwCount = dwCount + 1;
			end
		end
	end
	
	-- if objPacket:GetEmptyNumber() < dwCount then
		-- objSelf.OnSoulMoveResultMsg{Code = 1};
		-- return;
	-- end
	
	local tbSendRsl = {};
	for id,objSoul in pairs(tbCanMove)do
		local isSucc,isChg = self:TryMoveSoul(id,SoulHolderType.Packet);
		
		if isSucc then
			local tmp = {};
			local dwType,dwPos = objSoul:GetPosInfo();
			tmp[1] = objSoul:GetInstID();
			tmp[2] = dwType;
			tmp[3] = dwPos;
			
			table.insert(tbSendRsl,tmp);
		end
	end
	
	objSelf.OnSoulMoveResultMsg
	{
		IsPickAll = 1;
		SoulMoveList = tbSendRsl;
	};
end;

--出售
function CSoulSystem:SellSoul(dwSoulID)
	local objSelf = self:GetPlayer();
	if not objSelf then
		return;
	end
	
	if dwSoulID ~= 0 then
		if self:SellSoulSingle(dwSoulID) then
			objSelf.OnSoulSellResultMsg{SoulList = {dwSoulID}};
		else
			objSelf.OnSoulSellResultMsg{Code = 1};
		end
		
		return;
	end
	
	local objHunt = self:GetHolder(SoulHolderType.Hunt);
	local tbList = objHunt:GetSoulObjectList();
	
	local tbDel = {};
	for k,obj in pairs(tbList)do
		if obj:GetQuality() == SoulQuality.Gray then
			local id = obj:GetInstID()
			if self:SellSoulSingle(id) then
				table.insert(tbDel,id);
			end
		end
	end
	
	objSelf.OnSoulSellResultMsg{SoulList = tbDel};
end;

--战魂吞噬
function CSoulSystem:EatSoul(dwSoulIDA,dwSoulIDB)
	local objSelf = self:GetPlayer();
	if not objSelf then
		return;
	end
	
	local objSoulA = self:GetSoul(dwSoulIDA);
	local objSoulB = self:GetSoul(dwSoulIDB);
	
	if (not objSoulA) or (not objSoulB) then
		objSelf.OnSoulEatResultMsg{Code = 1};
		return;
	end
	
	local dwHolderA,dwPosA = objSoulA:GetPosInfo();
	local dwHolder,dwPos = objSoulB:GetPosInfo();
	
	local isNeedChg = false;
	local isEquipChg = false;
	if (dwHolderA == SoulHolderType.Equip) or (dwHolder == SoulHolderType.Equip) then
		isEquipChg = true;
	end
	
	local objDel = nil;
	local objAdd = nil;
	if FunSoulSort(objSoulA,objSoulB) then
		objAdd = objSoulA;
		objDel = objSoulB;
		
		isNeedChg = true;
	else
		objAdd = objSoulB;
		objDel = objSoulA;
	end
	
	--战魂不能吞别的战魂
	if not objAdd:IsCanEatOther() then
		objSelf.OnSoulEatResultMsg{Code = 2};
		return;
	end
	
	--判断能否移动到新位置
	if isNeedChg then
		local dwHolderAdd,dwPosADD = objAdd:GetPosInfo();
		if dwHolderAdd ~= dwHolder then
			local objHolderMoveTo = self:GetHolder(dwHolder);
			
			if objHolderMoveTo.TryEatIn then
				if not objHolderMoveTo:TryEatIn(objAdd,dwPos) then
					objSelf.OnSoulEatResultMsg{Code = 3};
					return;
				end
			end
		end
	end
	
	local dwDelID = objDel:GetInstID();
	
	self:SoulEatSoul(objAdd,objDel)
	
	local addtype,addid = objAdd:GetPosInfo();
	local dwNewHolder = addtype;
	local dwNewPos = addid;
	
	--如果是B被删除了，则把A移动到B
	if isNeedChg then
		local isSucc = self:TryMoveSoul(dwSoulIDA,dwHolder,dwPos);
		if isSucc then
			dwNewHolder = dwHolder;
			dwNewPos = dwPos;
		end
	end
	
	objSelf.OnSoulEatResultMsg
	{
		SoulDelete = dwDelID;
		SoulChange = objAdd:GetInstID();
		NewExp = objAdd:GetExp();
		NewHolder = dwNewHolder;
		NewPos = dwNewPos;
	}
	
	if isEquipChg then
		self:CheckSoulSuit()
		self:CountSystemProperty();
	end
end;

--一键吃战魂
function CSoulSystem:EatAllSoul(dwHolderType)
	local objSelf = self:GetPlayer();
	if not objSelf then
		return;
	end
	
	if dwHolderType ~= SoulHolderType.Packet and dwHolderType ~= SoulHolderType.Hunt then
		objSelf.OnSoulEatAllResultMsg{Code = 1};
		return;
	end
	
	local objPacket = self:GetHolder(dwHolderType);
	if not objPacket then
		objSelf.OnSoulEatAllResultMsg{Code = 2};
		return;
	end
	
	local tbObjList = objPacket:GetSoulObjectList();
	
	-- for k,obj in pairs(tbObjList)do
		-- local dwEnumID = obj:GetEnumID();
		-- local dwQua = obj:GetQuality();
		-- local dwLevel = obj:GetLevel();
		
		-- print("===soul print 1===",dwEnumID,dwQua,dwLevel)
	-- end
	
	table.sort(tbObjList,FunSoulSort);
	
	local tbExp = {};
	local tbDel = {};
	
	self:DealWithEat(tbObjList,tbExp,tbDel);
	
	local tbSend = {};
	for k,v in pairs(tbExp)do
		local objSoul = self:GetSoul(v);
		if objSoul then
			tbSend[v] = objSoul:GetExp();
		end
	end
	
	objSelf.OnSoulEatAllResultMsg
	{
		SoulDlete = tbDel;
		SoulExp = tbSend;
	}
end;

--购买
function CSoulSystem:BuySoul(dwShopIndex)
	local objSelf = self:GetPlayer();
	if not objSelf then
		return;
	end
	
	local cfg = SoulShopConfig[dwShopIndex];
	if not cfg then
		objSelf.OnSoulBuyResultMsg{Code = 1};
		return;
	end
	
	if self.dwSoulChip < cfg.dwCost then
		objSelf.OnSoulBuyResultMsg{Code = 2};
		return;
	end
	
	--狩猎容器判断
	local objHolder = self:GetHolder(SoulHolderType.Packet)
	if not objHolder then
		objSelf.OnSoulBuyResultMsg{Code = 3};
		return;
	end
	local dwPos = objHolder:GetFirstEmptySlot();
	if dwPos == 0 then
		objSelf.OnSoulBuyResultMsg{Code = 4};
		return;
	end
	
	self.dwSoulChip = self.dwSoulChip - cfg.dwCost;
	
	local objSoul = self:CreateSoul(cfg.dwEnumID,SoulHolderType.Packet,dwPos);
	
	objSelf.OnSoulBuyResultMsg
	{
		ChipNumber = self.dwSoulChip;
		SoulObject = objSoul:GetNetInfo();
	}
	
	local tbChgInfo = {dwSoulChip = self.dwSoulChip};
	self:DBSaveSystemInfo(tbChgInfo);
	
	CLogSystemManager:soul(objSelf,
		2,
		objSoul:GetEnumID(),
		objSoul:GetInstID(),
		objSoul:GetExp(),
		0,
		self.dwSoulChip);
end;

--分解战魂
function CSoulSystem:BreakSoul(tbSoulList)
	local objSelf = self:GetPlayer();
	if not objSelf then
		return;
	end
	
	local tbSoulObject = {};
	for k,v in pairs(tbSoulList)do
		local objSoul = self:GetSoul(v);
		if objSoul then
			--只有背包的战魂才可以被分解
			local dwType,dwPos = objSoul:GetPosInfo();
			if dwType == SoulHolderType.Packet then
				if SoulBreakCondition[objSoul:GetQuality()] then
					tbSoulObject[v] = objSoul;
				end
			end
		end
	end
	
	--删除，增加碎片
	local dwAddChip = 0;
	local tbDel = {};
	for k,obj in pairs(tbSoulObject)do
		local dwAdd = SoulFunction.FunBreakSoul(obj:GetEnumID(),obj:GetLevel());
		
		if self:DeleteSoul(obj) then
			dwAddChip = dwAddChip + dwAdd;
			table.insert(tbDel,k);
			
			CLogSystemManager:soul(objSelf,
				5,
				obj:GetEnumID(),
				obj:GetInstID(),
				obj:GetExp(),
				0,
				self.dwSoulChip + dwAdd);
		end
	end
	
	if dwAddChip == 0 then
		objSelf.OnSoulBreakResultMsg{Code = 1};
		return;
	end
	
	self.dwSoulChip = self.dwSoulChip + dwAddChip;
	
	objSelf.OnSoulBreakResultMsg
	{
		ChipNumber = self.dwSoulChip;
		SoulIDList = tbDel;
	}
	
	local tbChgInfo = {dwSoulChip = self.dwSoulChip};
	self:DBSaveSystemInfo(tbChgInfo);
end;

--扩展背包
function CSoulSystem:ExtendPacket(dwAddNumber)
	local objSelf = self:GetPlayer();
	if not objSelf then
		return;
	end
	
	local objPacket = self:GetHolder(SoulHolderType.Packet);
	if not objPacket then
		objSelf.OnSoulPacketExtendMsg{Code = 1};
		return;
	end
	
	local objItemSystem = objSelf:GetSystem("CItemSystem");
	if not objItemSystem then
		objSelf.OnSoulPacketExtendMsg{Code = 2};
		return;
	end
	
	local dwCur = objPacket:GetMaxNumber();
	local dwCost = SoulFunction.FunExtendCost(dwCur,dwAddNumber);
	
	if not objItemSystem:IsGoldEnough(dwCost) then
		objSelf.OnSoulPacketExtendMsg{Code = 3};
		return;
	end
	
	objItemSystem:CostGold(dwCost, ItemSysOperType.SoulPacketExtand);
	
	objPacket:SetHolderMax(dwCur+dwAddNumber);
	
	objSelf.OnSoulPacketExtendMsg
	{
		PacketNumber = objPacket:GetMaxNumber();
	};
	
	local tbChgInfo = {dwPacketNumber = objPacket:GetMaxNumber()};
	self:DBSaveSystemInfo(tbChgInfo);
end;

--将查询的soul结果发送到客户端
function CSoulSystem:SendSoulList(dwRoleID,tbList)
	local objSelf = self:GetPlayer();
	if not objSelf then
		return;
	end
	
	local tbSend = {};
	
	local count = 0;
	for k,tb in pairs(tbList)do
		table.insert(tbSend,tb);
		count = count + 1;
		
		if count >= m_SendSoulNumber then
			objSelf.OnRoleSoulInfoMsg
			{
				RoleID = dwRoleID;
				SoulList = tbSend;
			}
			
			count = 0;
			tbSend = {};
		end
	end
	
	objSelf.OnRoleSoulInfoMsg
	{
		RoleID = dwRoleID;
		SoulList = tbSend;
		IsEnd = 1;
	}
end;

--自动排序
function CSoulSystem:SoulAutoSort(isPickAll,dwHolderType)
	local objSelf = self:GetPlayer();
	if not objSelf then
		return;
	end
	
	local objHolder = self:GetHolder(dwHolderType);
	if not objHolder then
		objSelf.OnSoulAutoResultMsg{Code = 1};
		return;
	end
	
	local tbSoulList = objHolder:GetSoulObjectList();
	
	table.sort(tbSoulList,FunSoulSort);
	
	-- for k,objSoul in pairs(tbSoulList)do
		-- print("===SoulAutoSort begin===",k)
		-- print("===SoulAutoSort enum===",objSoul:GetEnumID())
		-- print("===SoulAutoSort qua===",objSoul:GetQuality())
		-- print("===SoulAutoSort exp===",objSoul:GetExp())
	-- end
	
	--排序完毕，修改位置
	local tbSend = {};
	
	for k,v in pairs(objHolder.setSoulPos)do
		objHolder.setSoulPos[k] = 0;
	end
	
	for k,objSoul in pairs(tbSoulList)do
		local dwType,dwOldPos = objSoul:GetPosInfo();
		
		objHolder.setSoulPos[k] = objSoul:GetInstID();
		
		objSoul:SetPosInfo(dwType,k);
		
		tbSend[objSoul:GetInstID()] = k;
		
		local tbUpdateInfo = {};
		tbUpdateInfo.dwHolderType = dwType;
		tbUpdateInfo.dwPosID = k;
		self:DBUpdateSoulInfo(objSoul:GetInstID(),tbUpdateInfo)
	end
	
	objSelf.OnSoulAutoResultMsg
	{
		IsPickAll = isPickAll;
		HolderType = dwHolderType;
		NewPosInfo = tbSend;
	};
end;

--激活套装的属性
function CSoulSystem:ActiveSuitAttr(dwRankID,tbSuitIDList)
	local objSelf = self:GetPlayer();
	if not objSelf then
		return;
	end
	
	local tbActChg = {};
	for n,id in pairs(tbSuitIDList)do
		if self:ActiveSingleSuit(dwRankID,id) then
			tbActChg[n] = id;
		end
	end
	
	objSelf.OnSulSuitActiveResultMsg
	{
		Rank = dwRankID;
		SuitIDList = tbSuitIDList;
	}
	
	self:CountSystemProperty();
	
	return true;
end;

