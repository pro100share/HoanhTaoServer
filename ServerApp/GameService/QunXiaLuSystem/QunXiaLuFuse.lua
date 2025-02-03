--[[ 	
	Ⱥ��¼ϵͳ --��Ƭ�ں�
	author lizc
	2014.1.7
--]]

function CQunXiaLuSystem:Fuse(setCard)
	--����Ƿ�ӵ��Ȩ��
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
	
	--��⿨Ƭ�����Ƿ��㹻
	if cardsCount ~= QunXiaFuseConfig.fuseNeedCount then
		-- print("CQunXiaLuSystem:Fuse cards count err")
	end
	
	--�����������
	local nextQuality = curQuality + 1;
	local needSilver = QunXiaFuseConfig:GetCostMoney(nextQuality)
	if not self.ItemSystem:IsPacketMoneyEnough(needSilver) then
		return
	end
	
	--��⿨Ƭ�Ƿ��㹻
	for k, v in pairs(setCard) do
		local bIsEnough, _ = self.ItemSystem:CheckDelEnumItemInPacketCond(v, 1);
		if not bIsEnough then
			return
		end
	end
	
	
	--���ɹ���
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
		--�����ռ䲻��
		-- self:SendFailInfo(13000710001)
		return
	end
	
	--�۳�����
	self.ItemSystem:CostPacketMoney(needSilver, _G.ItemSysOperType.QunXiaLu)
	
	--�۳���Ƭ
	local b_IsUseBindItem = false
	for k, v in pairs(setCard) do
		local _, bIsUseBind = self.ItemSystem:DelEnumItemInPacket(v, 1, false, _G.ItemSysOperType.QunXiaLu);
		if bIsUseBind then
			b_IsUseBindItem = true
		end
	end
	
	if bIsSuccess then
		--���߽׿�Ƭ
		self:GetHighQualityCardId(nextQuality, b_IsUseBindItem);
	else
		--��ʧ�ܷ�����Ƭ
		self:ReturnFailCard(setCard, nextQuality, b_IsUseBindItem)
	end
end



--�����һ�Ÿ�Ʒ�׿�Ƭ
function CQunXiaLuSystem:GetHighQualityCardId(dwQuality, bIsUseBind)
	local cardCount = #QunXiaCardQualityConfig[dwQuality].setCard;
	local randomIndex = math.random(1, cardCount)
	local cardId = QunXiaCardQualityConfig[dwQuality].setCard[randomIndex]
	
	--����Ƭ
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
	
	--������Ϣ
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("error");
		return
	end;
	objPlayer.QunXiaLuFuseResultMsg{IsSuccess = true, SuccessItem = setAddList, FaliItem = {}}
	
	if dwQuality >= QunXiaFuseConfig.boradcastQuality then
		local dwRoleID = objPlayer:GetRoleID();
		local szRoleName = objPlayer:GetName();
		
		--ȫ���㲥
		CGameApp.QunXiaLuFuseBroadcastMsg{RoleId = dwRoleID, RoleName = szRoleName, CardID = cardId};
	end
end

--��ʧ�ܷ�����Ƭ
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
	
	
	--������Ϣ
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("error");
		return
	end;
	
	objPlayer.QunXiaLuFuseResultMsg{IsSuccess = false, SuccessItem = {}, FaliItem = setAddList}
end

