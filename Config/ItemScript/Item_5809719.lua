local dwItemId = 5809719
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local oPlayer = objItemSys:GetPlayer();
	local oScriptSystem = oPlayer:GetSystem('CScriptSystem');
	if oPlayer then
		if not (oScriptSystem:CheckBUff(130000) or 
			oScriptSystem:CheckBUff(130001) or oScriptSystem:CheckBUff(130002)) then
			oScriptSystem:AddBuff(130001);
		else
			return 0;
		end
	end
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )