local dwItemId = 9405065
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local bUse = false;
	local nError = 0;
	local tAttInfo = {
		{"dwAttack", 83300};
		{"dwDefense", 100000};
		{"dwHPMax", 250000};
	};
	local nRandom = math.random(#tAttInfo);
	local oAddAttrSystem = objItemSys:GetPlayer():GetSystem("CAddAttrSystem");
	if oAddAttrSystem:IsCanAddType(18) then
		oAddAttrSystem:AddAttr(tAttInfo[nRandom][1], tAttInfo[nRandom][2]);
		oAddAttrSystem:AddType(18);
		bUse = true;
	else
		nError = 400010001;
	end

	if not bUse then return nError; end
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )

