local dwItemId = 5809251
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local objPlayer = objItemSys:GetPlayer()
	local sysGuild = objPlayer:GetSystem('CGuildSystem')
	if sysGuild:GetGuildInfo() then
		sysGuild:UpdateActive(1000)
		objItemSys:OnError( 6001020031 )
		return false
	else
		return 6001020032;
	end
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )












 