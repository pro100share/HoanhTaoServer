local dwItemId = 4100520
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local objPlayer = objItemSys:GetPlayer()
	local ScriptSys = objPlayer:GetSystem("CScriptSystem");
	local FashionDressSys = objPlayer:GetSystem("CFashionDressSystem");
	--获得职业
	local nProf = ScriptSys:GetProf();
	local DressByItem = _G.FashionDressConfig.DressByItem;
	
	for i, v in pairs(DressByItem) do
		if nProf == i then
			if not FashionDressSys:IsAlreadyHave(v[1]) then
				FashionDressSys:GetDress(v[1], 3)
			else
				return 14000600001;
			end
		end
	end
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )












 
