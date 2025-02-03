-- 8113003
local dwItemId = 8113003
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local objPlayer = objItemSys:GetPlayer()
	if not objPlayer then
		return 4000110013;
	end;
	local exprd = math.random(10000,100000);
	objPlayer:AddExp(exprd);
	return false;
end

CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )