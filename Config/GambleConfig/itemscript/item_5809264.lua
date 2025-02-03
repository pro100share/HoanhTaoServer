local dwItemId = 5809264
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local objPlayer = objItemSys:GetPlayer();

	local EquipBuildSystem = objPlayer:GetSystem('CEquipBuildSystem')
	
	if not EquipBuildSystem then
		return
	end
	
	if not EquipBuildSystem:HasAuthority("ZhuangBeiXiuLian") then
		return 13007000020;
	end;
	
	local JiShu = 0;
	for loop = 1,12 do
		local JianCe = EquipBuildSystem:CheckSlotLevel(loop)
		if not (JianCe) then
			JiShu = JiShu + 1;
			EquipBuildSystem:AddExpToSlot(12, loop)
		end
	end
	if JiShu == 0 then
		return 13007000022;
	end

end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )

	
