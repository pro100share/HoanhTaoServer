local dwItemId = 4100515  --潜能丹
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

-------------------------------------------------------
--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	objItemSys:GetPlayer():GetSystem("CSkillSystem"):
		AddOtherPoint(120);
	return false;
end

-----批量处理脚本
--使用检测(nil：无法使用；0：直接使用；其他：读条时间(单位：毫秒))
function ItemScriptObj:CheckForMassUse(objItemSys, objItem,scripSys,num)
	local lastnum = num;

	return true,lastnum;
end
--使用物品(nil or false:需要删除;	返回数字:不删除;  0为没有原因，就是不删;  >0为错误提示)
----千万  别  返回true!!!!
function ItemScriptObj:OnUseMassItem(objItemSys, objItem, sysScript,num)
	objItemSys:GetPlayer():GetSystem("CSkillSystem"):
		AddOtherPoint(120 * num);
end
-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )

