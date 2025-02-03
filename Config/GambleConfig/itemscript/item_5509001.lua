local dwItemId = 5509001
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem,sysScript)

	local objPlayer = objItemSys:GetPlayer()
	if(not objPlayer) then
		return 0;
	end
	local swordSys = objPlayer:GetSystem("CSwordSystem")
	if(not swordSys) then
		return 0;
	end
	local swordLevel = swordSys:GetSwordLevel();
	local Ladder = swordSys:GetSwordLadder()
	if(swordLevel < 32 ) then
		--名剑等级不足提示
		
		return 1300081001;
	end
	local Error = swordSys:UsePropertyCardItem(objItem:GetEnumID())
	if(Error) then
		return 1300081002;
	end
	
end
-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )