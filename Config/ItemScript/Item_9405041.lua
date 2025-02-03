local dwItemId = 9405041
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
		if AddAttrSystem:IsCanAddType(1) then
			--加属性
			AddAttrSystem:AddAttr("dwAttack", 115);
			AddAttrSystem:AddAttr("dwDefense", 57);
			AddAttrSystem:AddAttr("dwCrit", 23);
			AddAttrSystem:AddAttr("dwFlee", 23);
			AddAttrSystem:AddAttr("dwHPMax", 575);
			--加类型次数
			AddAttrSystem:AddType(1);
			bUse = true;
		else
			dwError = 400010002;
		end;
	else
		dwError = 400010001;
	end;

	if not bUse then return dwError end;
end



-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )

