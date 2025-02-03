local dwItemId = 5809705
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	
		local objPlayer = objItemSys:GetPlayer();
		if objPlayer then
			local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
			local ScriptSystem = objPlayer:GetSystem("CScriptSystem")
			if not CTitleSystem then
				return
			end
			if ScriptSystem:CheckBUff(10136) then
				return 0;
			end
			CTitleSystem:AddTitle(10196)		
			ScriptSystem:AddBuff(10136);
		end
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )