local dwItemId = 2400360
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
		local objPlayer = objItemSys:GetPlayer();
	    objPlayer:GetSystem('CBuffSystem'):AddBuff(2400410,1);
	return false;
end


-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 