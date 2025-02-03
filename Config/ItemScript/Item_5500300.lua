local dwItemId = 5500300
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
    if objItemSys:GetPacketMoney() + 50000 > _G.InitConfig.dwMaxMoney then   
        return 6000610001;
    end
    objItemSys:AddPacketMoney(50000, _G.ItemSysOperType.Used);   
    return false
end


-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 
