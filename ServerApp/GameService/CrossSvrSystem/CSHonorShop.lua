--�����̳� �����ս�������ⲿ��

--�����̳Ǵ���
function CCrossSvrSystem:HonorShopCreate()
	return true;
end

function CCrossSvrSystem:HonorShopBuy(dwItemId, dwItemCount, dwItemIndex)
	local dwPrice, dwBindType = CSHonorShopConfig.GetItemPrice(dwItemId, dwItemIndex);
	if not dwPrice then
		return
	end
	
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	
	local ItemSystem = objPlayer:GetSystem("CItemSystem");
	if not ItemSystem then
		return
	end
	
	local setAddList = {};
	
	local tempTabel = {
		dwItemEnum	= dwItemId;
		dwItemNumber = dwItemCount;
		dwBindType = dwBindType;
	};
	table.insert(setAddList, tempTabel);
	
	
	-- ����������㹻�ռ�
	if ItemSystem:IsEnumItemListCanAddToPacket(setAddList) then
		local honorValue = self.dwHonor - dwPrice * dwItemCount;
		
		if honorValue >= 0 then
			--�۳�����ֵ
			self:SetCrossHonor(honorValue);
			--����Ʒ
			ItemSystem:AddEnumItemListToPacket(setAddList, _G.ItemSysOperType.CrossServer);
		end
	end
end
