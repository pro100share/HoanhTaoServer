local dwItemId = 2400370
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});
function ItemScriptObj:CheckForUse(objItemSys, objItem,sysScript)
	
	return 0

end
--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local objPlayer = objItemSys:GetPlayer()
	if not objPlayer then 
		return 0
	end 
	local objBuffSys = objPlayer:GetSystem("CBuffSystem");
	local buff = nil
	local buffTmie = 0 
	for loop = 9000,9009 do
		buff = objBuffSys:GetBuffObj(loop);
		if (buff) then
			buffTmie = objBuffSys:GetBuffLifeTime(loop)
			break;
		end
	end
	
	if not (buff) then
		return 2000520003
	end

	
	buffTmie =  buffTmie + (30*60*1000 )
	objBuffSys:SetBuffLifeTime(buff, buffTmie)
	return false;
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 