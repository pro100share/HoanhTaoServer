local dwItemId = 9405057
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local bUse = false;
	local nError = 0;
	local tAttInfo = {
		{"dwAttack", 833};
		{"dwDefense", 1000};
		{"dwHPMax", 2500};
	};
	local nRandom = math.random(#tAttInfo);
	local oAddAttrSystem = objItemSys:GetPlayer():GetSystem("CAddAttrSystem");
	if oAddAttrSystem:IsCanAddType(10) then
		oAddAttrSystem:AddAttr(tAttInfo[nRandom][1], tAttInfo[nRandom][2]);
		oAddAttrSystem:AddType(10);
		bUse = true;
	else
		nError = 400010001;
	end

	if not bUse then return nError; end
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )

