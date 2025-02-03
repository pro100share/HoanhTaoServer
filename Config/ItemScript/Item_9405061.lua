local dwItemId = 9405061
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local bUse = false;
	local nError = 0;
	local tAttInfo = {
		{"dwAttack", 8330};
		{"dwDefense", 10000};
		{"dwHPMax", 25000};
	};
	local nRandom = math.random(#tAttInfo);
	local oAddAttrSystem = objItemSys:GetPlayer():GetSystem("CAddAttrSystem");
	if oAddAttrSystem:IsCanAddType(14) then
		oAddAttrSystem:AddAttr(tAttInfo[nRandom][1], tAttInfo[nRandom][2]);
		oAddAttrSystem:AddType(14);
		bUse = true;
	else
		nError = 400010001;
	end

	if not bUse then return nError; end
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )

