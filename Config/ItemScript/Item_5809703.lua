local dwItemId = 5809703
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--ʹ����Ʒ
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	
		local objPlayer = objItemSys:GetPlayer();
		if objPlayer then
			local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
			local ScriptSystem = objPlayer:GetSystem("CScriptSystem")
			if not CTitleSystem then
				return
			end
			if ScriptSystem:CheckBUff(10134) then
				return 0;
			end
			CTitleSystem:AddTitle(10194)		
			ScriptSystem:AddBuff(10134);
		end
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )