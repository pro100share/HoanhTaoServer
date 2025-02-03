local dwItemId = 9405056
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local bUse = false;
	local nError = 0;

	local oAddAttrSystem = objItemSys:GetPlayer():GetSystem("CAddAttrSystem");
	if oAddAttrSystem:IsCanAddType(9) then
		oAddAttrSystem:AddAttr("dwHPMax", 2500);
		oAddAttrSystem:AddType(9);
		bUse = true;
	else
		nError = 400010001;
	end

	if not bUse then return nError; end
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )

