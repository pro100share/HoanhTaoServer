local dwItemId = 5500310
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
    if objItemSys:GetPacketMoney() + 100000 > _G.InitConfig.dwMaxMoney then   
        return 6000610001;
    end
    objItemSys:AddPacketMoney(100000, _G.ItemSysOperType.Used);   
    return false
end


-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 
