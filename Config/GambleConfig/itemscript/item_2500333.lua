 local dwItemId = 2500333
 local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local objPlayer = objItemSys:GetPlayer();
	
	local bUse = false;
	local dwError = 0;
	--血
	local corssSys = objPlayer:GetSystem("CCrossSvrSystem");
	local dwHonor = corssSys:GetCrossHonor();
	dwHonor = dwHonor + 500;
	
	if corssSys:SetCrossHonor(dwHonor) then
		bUse = true;
	else
		dwError = 13009300023;
	end;
	
	if not bUse then return dwError end;
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )