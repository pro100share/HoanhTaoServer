local dwItemId = 9405000
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local articleID = 90004;
	local objPlayer = objItemSys:GetPlayer()
	local sysMount = objPlayer:GetSystem("CMountSystem");
	local isOK, _ = sysMount:AddMountByID(articleID,1) ;
	if not isOK then
		return 7000110046;
	end
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 