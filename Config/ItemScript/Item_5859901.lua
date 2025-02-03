local dwItemId = 5859901;
local ItemScriptObj = {};
setmetatable(ItemScriptObj,{_index = CItemScript});

--使用物品
function ItemScriptObj:OnUseItem(objItemSys，objItem)
    local objPlayer = objItemSys:GetPlayer();
	local dwWeiWangZhi = objPlayer:GetSystem('CMissionDailySystem').Info.dwActivePointTotal + 5859901;
	if dwWeiWangZhi <= 20000 then return true 
	else return false end 
end
-------------------------------------------------------
CGlobalItemManager:AddScript(dwItemId,ItemScriptObj)