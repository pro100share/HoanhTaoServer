--荣誉商城 （跨服战服务器外部）

--荣誉商城创建
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
	
	
	-- 如果背包有足够空间
	if ItemSystem:IsEnumItemListCanAddToPacket(setAddList) then
		local honorValue = self.dwHonor - dwPrice * dwItemCount;
		
		if honorValue >= 0 then
			--扣除荣誉值
			self:SetCrossHonor(honorValue);
			--给物品
			ItemSystem:AddEnumItemListToPacket(setAddList, _G.ItemSysOperType.CrossServer);
		end
	end
end
