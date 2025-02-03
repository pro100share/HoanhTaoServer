local dwItemId = 5809263
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
	
	local biao = {};
	
	
	for loop = 1,12 do
		local JianCe = EquipBuildSystem:CheckSlotLevel(loop)
		if not JianCe then
			biao[#biao+1] = loop
		end
	end
	
	if (#biao <= 0) then
		return 13007000022
	end
	
	local dwRand = math.random(#biao);
	EquipBuildSystem:AddExpToSlot(1,biao[dwRand])
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )

	
