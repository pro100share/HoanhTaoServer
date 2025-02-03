local dwItemId = 2500190
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--检测物品是否可以使用
function ItemScriptObj:CheckForUse(objItemSys, objItem, scriptSys)
	local objPlayer = objItemSys:GetPlayer();
	local skillSys = objPlayer:GetSystem("CSkillSystem");
	if skillSys:IsNuqiFull() then
		objItemSys:OnError( 2000520002 );--提示杀意值已满
		return false;
	end
	return 0;
end

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local objPlayer = objItemSys:GetPlayer();
	local skillSys = objPlayer:GetSystem("CSkillSystem");
	
	skillSys:ChangeAttr("dwDander", 10000);--增加1W的杀意值
	--skillSys:ChgNuqi(10000);--增加1W的杀意值
	return false;--扣除物品
end


-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 