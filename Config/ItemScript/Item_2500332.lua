local dwItemId = 2500332
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--ʹ����Ʒ
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local objPlayer = objItemSys:GetPlayer();
	
	local bUse = false;
	local dwError = 0;
	--Ѫ
	local corssSys = objPlayer:GetSystem("CCrossSvrSystem");
	local dwHonor = corssSys:GetCrossHonor();
	dwHonor = dwHonor + 100;
	
	if corssSys:SetCrossHonor(dwHonor) then
		bUse = true;
	else
		dwError = 13009300023;
	end;
	
	if not bUse then return dwError end;
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )

	
