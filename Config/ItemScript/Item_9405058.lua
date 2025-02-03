local dwItemId = 9405058
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local bUse = false;
	local nError = 0;

	local oAddAttrSystem = objItemSys:GetPlayer():GetSystem("CAddAttrSystem");
	if oAddAttrSystem:IsCanAddType(11) then
		oAddAttrSystem:AddAttr("dwAttack", 8330);
		oAddAttrSystem:AddType(11);
		bUse = true;
	else
		nError = 400010001;
	end

	if not bUse then return nError; end
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )

