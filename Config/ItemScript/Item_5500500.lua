local dwItemId = 5500500
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
	return 0;
end
--使用物品(nil or false:需要删除;	返回数字:不删除;  0为没有原因，就是不删;  >0为错误提示)
----千万  别  返回true!!!!
function ItemScriptObj:OnUseItem(objItemSys, objItem, sysScript)
    local TGCFSys = objItemSys:GetPlayer():GetSystem("CTianGuanCiFuSystem");
    --增加装备升阶天官赐福值
    TGCFSys:Add_EquipUpGradeValue(1000);
    --增加护身宝甲升阶天官赐福值
    TGCFSys:Add_AmuletUpGradeValue(1000);
    --增加坐骑升阶天官赐福值
    TGCFSys:Add_MountUpGradeValue(1000);
    --增加境界升级天官赐福值
    TGCFSys:Add_JingJieUpValue(1000);
    --增加宝剑升阶天官赐福值
    TGCFSys:Add_SwordUpGradeValue(1000);
    --增加装备强化天官赐福值
    TGCFSys:Add_EquipStrongValue(1000);
end


-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 