local dwItemId = 9701012
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--ʹ����Ʒ
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	-- local articleID = 90005;
	-- local objPlayer = objItemSys:GetPlayer()
	-- local sysMount = objPlayer:GetSystem("CMountSystem");
		
	-- local isOK, _ = sysMount:AddMountByID(articleID,1) ;
	-- if not isOK then
		-- return 7000110046;
	-- end
	
	local dwPetID = 10051001;
	local objPlayer = objItemSys:GetPlayer()
	local sysPet = objPlayer:GetSystem("CPetSystem");
	
	local isOK, _ = sysPet:AddPetBySystem(dwPetID) ;
	if not isOK then
		return 8008000309;
	end
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 