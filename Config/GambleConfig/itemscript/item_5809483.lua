local dwItemId = 5809483
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local objPlayer = objItemSys:GetPlayer()
	if(not objPlayer) then
		return 0;
	end
	local starIndex = 0;
	local starExp = 0;
	local effectIndex = 0;
	local b_has = false;
	for k,v in pairs(_G.UseItemAddStarExpConfig) do
		if(k == objItem:GetEnumID()) then
			starIndex = v.starIndex;
			starExp = v.starExp;
			effectIndex = v.effectIndex;
			b_has = true;
			break;
		end
	end
	if(not b_has) then
		return 0;
	end
	if(starIndex <= 0 or starExp <= 0 or effectIndex <= 0) then
		return 0;
	end
	local sys = objPlayer:GetSystem("CMatrixMethodSystem");
	local Error = sys:UseItemOneStarAddExp(starIndex,starExp,effectIndex); ---使用物品加星经验
	if(Error ~= nil) then
		return 0;
	end
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )