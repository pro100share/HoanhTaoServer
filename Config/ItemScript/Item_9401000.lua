local dwItemId = 9401000
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local objPlayer = objItemSys:GetPlayer()
	local sysMount = objPlayer:GetSystem("CMountSystem");
	local isOK, _ = sysMount:AddMountByID(30001,1) ;
	if not isOK then
		return 7000110046;
	end
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 