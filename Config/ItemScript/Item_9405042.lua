local dwItemId = 9405042
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
		if AddAttrSystem:IsCanAddType(2) then
			--加属性
			AddAttrSystem:AddAttr("dwAttack", 1150);
			AddAttrSystem:AddAttr("dwDefense", 575);
			AddAttrSystem:AddAttr("dwCrit", 230);
			AddAttrSystem:AddAttr("dwFlee", 230);
			AddAttrSystem:AddAttr("dwHPMax", 5750);
			--加类型次数
			AddAttrSystem:AddType(2);
			bUse = true;
		else
			dwError = 400010003;
		end;
	else
		dwError = 400010001;
	end;

	if not bUse then return dwError end;
end
-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )

