local dwItemId = 5809488
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local objPlayer = objItemSys:GetPlayer()
	if(not objPlayer) then
		return 0;
	end
	local starIndex = 0;
	local starLevelNum = 0;
	local effectIndex = 0;
	local b_has = false;
	for k,v in pairs(_G.UseItemAddStarLevelConfig) do
		if(k == objItem:GetEnumID()) then
			starIndex = v.starIndex;
			starLevelNum = v.starLevelNum;
			effectIndex = v.effectIndex;
			b_has = true;
			break;
		end
	end
	if(not b_has) then
		return 0;
	end
	if(starIndex < 0 or starLevelNum <= 0 or effectIndex <= 0) then
		return 0;
	end
	local sys = objPlayer:GetSystem("CMatrixMethodSystem");
	local Error = sys:UseItemOneStarAddLevel(starIndex,starLevelNum,effectIndex); ---使用物品加星等级
	if(Error ~= nil) then
		return 0;
	end
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )