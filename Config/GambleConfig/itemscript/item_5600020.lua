--藏宝图
local dwItemId = 5600020
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
	--print('~~~~~~ItemScriptObj:CheckForUse-5600010-UIItemTreasureMapConfig.model: '..UIItemTreasureMapConfig.model)
	return UIItemTreasureMapConfig.model;	
end
--使用物品(nil or false:需要删除;	返回数字:不删除;  0为没有原因，就是不删;  >0为错误提示)
----千万  别  返回true!!!!
function ItemScriptObj:OnUseItem(objItemSys, objItem, sysScript)
	local objPlayer = objItemSys:GetPlayer();
	if not objPlayer then return 0; end;
	local objSysItem = objPlayer:GetSystem('CItemSystem');
	local objSysVip = objPlayer:GetSystem('CVipSystem');
	local objSysRefresh = objPlayer:GetSystem('CRefreshSystem');
	if objSysItem and objSysVip and objSysRefresh then
		local dwCount = objSysRefresh:GetData(1001);
		objSysItem:OnOpenTreasrueMap(objItem:GetInstID(),objItem:GetDoodle(),dwCount);
	end
	return 0;
end


-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 