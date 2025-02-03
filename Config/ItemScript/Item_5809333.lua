local dwItemId = 5809333
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local objPlayer = objItemSys:GetPlayer()
	local sysSwordFoundry = objPlayer:GetSystem("CSwordFoundrySystem");
	--local Error = sysSwordFoundry:SetSwordFoundryByItem(objItem:GetEnumID()); ----使用物品加熟练度
	local Error = sysSwordFoundry:SetSwordFoundryLevelByItem(objItem:GetEnumID(),1);---使用物品加星级，第二个参数加几为几颗
	if(Error ~= nil) then
		return 0;
	end
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )