--[[ 	
	群侠录系统 --卡片融合
	author lizc
	2014.1.7
--]]

function CQunXiaLuSystem:Fuse(setCard)
	--检测是否拥有权限
	if not self:HasAuthority('QunXiaLuRongHe') then
		return false;
	end
	
	local curQuality = QunXiaCardConfig[setCard[1]].dwQuality;
	local cardsCount = 0
	for k, v in pairs(setCard) do
		cardsCount = cardsCount + 1;
		if QunXiaCardConfig[v].dwQuality ~= curQuality then
			-- print("CQunXiaLuSystem:Fuse cards quality are diffrient!!")
			return
		end
	end
	
	--检测卡片数量是否足够
	if cardsCount ~= QunXiaFuseConfig.fuseNeedCount then
		-- print("CQunXiaLuSystem:Fuse cards count err")
	end
	
	--检测所需银两
	local nextQuality = curQuality + 1;
	local needSilver = QunXiaFuseConfig:GetCostMoney(nextQuality)
	if not self.ItemSystem:IsPacketMoneyEnough(needSilver) then
		return
	end
	
	--检测卡片是否足够
	for k, v in pairs(setCard) do
		local bIsEnough, _ = self.ItemSystem:CheckDelEnumItemInPacketCond(v, 1);
		if not bIsEnough then
			return
		end
	end
	
	
	--检测成功率
	local bIsSuccess = false;
	local successRate = QunXiaFuseConfig:GetSuccRate(nextQuality);
	local randomNum = math.random(1, 10000);
	if randomNum <= successRate then
		bIsSuccess = true;
	end
	
	
	local needPacketSlot = 1;
	if not bIsSuccess then
		needPacketSlot = QunXiaFuseConfig:GetBackCarNum(nextQuality)
	end
	
	if not self.ItemSystem:IsPacketSlotEnoughFor(needPacketSlot) then
		--背包空间不足
		-- self:SendFailInfo(13000710001)
		return
	end
	
	--扣除银两
	self.ItemSystem:CostPacketMoney(needSilver, _G.ItemSysOperType.QunXiaLu)
	
	--扣除卡片
	local b_IsUseBindItem = false
	for k, v in pairs(setCard) do
		local _, bIsUseBind = self.ItemSystem:DelEnumItemInPacket(v, 1, false, _G.ItemSysOperType.QunXiaLu);
		if bIsUseBind then
			b_IsUseBindItem = true
		end
	end
	
	if bIsSuccess then
		--给高阶卡片
		self:GetHighQualityCardId(nextQuality, b_IsUseBindItem);
	else
		--给失败返还卡片
		self:ReturnFailCard(setCard, nextQuality, b_IsUseBindItem)
	end
end



--随机给一张高品阶卡片
function CQunXiaLuSystem:GetHighQualityCardId(dwQuality, bIsUseBind)
	local cardCount = #QunXiaCardQualityConfig[dwQuality].setCard;
	local randomIndex = math.random(1, cardCount)
	local cardId = QunXiaCardQualityConfig[dwQuality].setCard[randomIndex]
	
	--给卡片
	local bindType = _G.enItemBindType.eNo;
	if bIsUseBind then
		bindType =  _G.enItemBindType.eYes;
	end
	
	
	local setAddList = {};
	local tempTabel = {
			dwItemEnum	= _G.QunXiaCardConfig[cardId].dwItemEnum;
			dwItemNumber = 1;
			dwBindType = bindType;
		};
	table.insert(setAddList, tempTabel);
	self.ItemSystem:AddEnumItemListToPacket(setAddList, _G.ItemSysOperType.QunXiaLu);
	
	--发送消息
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("error");
		return
	end;
	objPlayer.QunXiaLuFuseResultMsg{IsSuccess = true, SuccessItem = setAddList, FaliItem = {}}
	
	if dwQuality >= QunXiaFuseConfig.boradcastQuality then
		local dwRoleID = objPlayer:GetRoleID();
		local szRoleName = objPlayer:GetName();
		
		--全服广播
		CGameApp.QunXiaLuFuseBroadcastMsg{RoleId = dwRoleID, RoleName = szRoleName, CardID = cardId};
	end
end

--给失败返还卡片
function CQunXiaLuSystem:ReturnFailCard(setCard, dwQuality, bIsUseBind)
	local setAddList = {};
	
	local bindType =  _G.enItemBindType.eNo;
	if bIsUseBind then
		bindType =  _G.enItemBindType.eYes;
	end

	local returnCount = QunXiaFuseConfig:GetBackCarNum(dwQuality);
	for i = 1, returnCount do
		local cardCount = #setCard;
		local randomIndex = math.random(1, cardCount)
		local cardId = setCard[randomIndex]
		
		local tempTabel = {
			dwItemEnum	= _G.QunXiaCardConfig[cardId].dwItemEnum;
			dwItemNumber = 1;
			dwBindType = bindType;
		};
		table.insert(setAddList, tempTabel);
	end
	
	self.ItemSystem:AddEnumItemListToPacket(setAddList, _G.ItemSysOperType.QunXiaLu);
	
	
	--发送消息
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("error");
		return
	end;
	
	objPlayer.QunXiaLuFuseResultMsg{IsSuccess = false, SuccessItem = {}, FaliItem = setAddList}
end

