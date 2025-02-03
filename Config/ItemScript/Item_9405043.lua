local dwItemId = 9405043
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local objPlayer = objItemSys:GetPlayer();
	
	local bUse = false;
	local dwError = 0;
	
	-- objPlayer:GetSystem('CFiveElemSystem'):FiveElementRecord(0, 10000, 0, 0, 0, _G.FiveElemSysOperType.ChgFiveByUseItem)

	-- 木
	-- if objPlayer:GetSystem('CFiveElemSystem'):ChangeAttr("dwWoodValue", 10000) then
		-- bUse = true;
	-- else
		-- dwError = 6000610022;
	-- end;
	
	local AddAttrSystem = objPlayer:GetSystem("CAddAttrSystem");
	if AddAttrSystem:IsCanAdd() then
		if AddAttrSystem:IsCanAddType(3) then
			--加属性
			AddAttrSystem:AddAttr("dwAttack", 11500);
			AddAttrSystem:AddAttr("dwDefense", 5750);
			AddAttrSystem:AddAttr("dwCrit", 2300);
			AddAttrSystem:AddAttr("dwFlee", 2300);
			AddAttrSystem:AddAttr("dwHPMax", 57500);
			--加类型次数
			AddAttrSystem:AddType(3);
			bUse = true;
		else
			dwError = 400010004;
		end;
	else
		dwError = 400010001;
	end;

	if not bUse then return dwError end;
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )

