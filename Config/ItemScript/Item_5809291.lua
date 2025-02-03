local dwItemId = 5809291
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});
-------------------------------------------------------
--[[
	只重写需要重写的方法。
	比如：
		这个脚本需要有 CheckForUse 和 OnUseItem 方法，
		则只需重写这两个方法。
		另两个 OnGetItem OnDeleteItem不需要重写。
]]
--使用检测(nil：无法使用；0：直接使用；其他：读条时间(单位：毫秒))
function ItemScriptObj:CheckForUse(objItemSys, objItem)
	local objPlayer = objItemSys:GetPlayer();
	if not objPlayer then
		return nil;
	end;
	return 0
end
--使用物品(nil or false:需要删除;	返回数字:不删除;  0为没有原因，就是不删;  >0为错误提示)
----千万  别  返回true!!!!
function ItemScriptObj:OnUseItem(objItemSys, objItem, sysScript)
	-- ArticleSustain:SkillSkilled(objItemSys,dwItemId)
	
	local objPlayer = objItemSys:GetPlayer();
	if not objPlayer then
		return nil;
	end
	
	local dwGuildID = objPlayer:GetSystem("CGuildSystem"):GetGuildID()
	if (dwGuildID) then	
		local dwRoleID = objPlayer:GetRoleID()
		if (dwRoleID) then
			CGuildServerMsg:NotifyKernel("AppointLeader",dwGuildID,dwRoleID)
		end
	else
		return nil
	end
end
-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )