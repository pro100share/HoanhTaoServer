local dwItemId = 5809250
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local objPlayer = objItemSys:GetPlayer()
	local sysGuild = objPlayer:GetSystem('CGuildSystem')
	if sysGuild:GetGuildInfo() then
		sysGuild:UpdateActive(500)
		objItemSys:OnError( 6001020030 )
		return false
	else
		return 6001020032;
	end
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )












 