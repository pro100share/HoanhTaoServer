local dwItemId = 5809541
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

-------------------------------------------------------
--ʹ����Ʒ
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local objPlayer = objItemSys:GetPlayer();
	objPlayer:GetSystem('CBuffSystem'):AddBuff(10060,1);
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )
