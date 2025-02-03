local dwItemId = 5509999
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local articleID = 90006;
	local objPlayer = objItemSys:GetPlayer()

	local objChatSys = objPlayer:GetSystem("CChatSystem");
	if objChatSys then
		objChatSys:SetSpecialFlag()
	end
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 