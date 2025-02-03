local dwItemId = 9405040
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local objPlayer = objItemSys:GetPlayer();
	--print(debug.traceback());
	local CMountSystem = objPlayer:GetSystem("CMountSystem");
	
	if not CMountSystem:EatZZG() then
		return 0;
	end
end;
	
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )