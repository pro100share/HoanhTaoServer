-- 8113005
local dwItemId = 8113005
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local objPlayer = objItemSys:GetPlayer()
	if not objPlayer then
		return 4000110013;
	end;
	local exprd = math.random(100000,200000);
	objPlayer:AddExp(exprd);
	if (exprd > 150000) then
		local dwMapId,Pos = sysMap.dwCurMapID,sysMap:GetPlayerPos()
		sysScript:PlayPfx(110006,Pos.x,Pos.y,0,bAll)
	end
	return false;
end

CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )