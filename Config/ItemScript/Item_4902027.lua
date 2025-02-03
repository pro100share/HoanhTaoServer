local dwItemId = 4902027
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local objPlayer = objItemSys:GetPlayer();
	
	local bUse = false;
	local dwError = 0;
	local isMetalFull = false;
	local isWaterFull = false;
	local isWoodFull = false;
	local isEarthFull = false;
	local isFireFull = false;

	local AddAttrSystem = objPlayer:GetSystem("CAddAttrSystem");
	local FiveElemSystem = objPlayer:GetSystem("CFiveElemSystem");
	FiveElemSystem:FiveElementRecord(100000, 100000, 100000, 100000, 100000, _G.FiveElemSysOperType.ChgFiveByUseItem)
	if AddAttrSystem:IsCanAddType(5) then
		if FiveElemSystem:ChangeAttr("dwMetalValue", 100000) then
			bUse = true;
		else
			isMetalFull = true;
		end;
		--木
		if FiveElemSystem:ChangeAttr("dwWoodValue", 100000) then
			bUse = true;
		else
			isWoodFull = true;
		end;
		--水
		if FiveElemSystem:ChangeAttr("dwWaterValue", 100000) then
			bUse = true;
		else
			isWaterFull = true;
		end;
		--火
		if FiveElemSystem:ChangeAttr("dwFireValue", 100000) then
			bUse = true;
		else
			isFireFull = true;
		end;
		--土
		if FiveElemSystem:ChangeAttr("dwEarthValue", 100000) then
			bUse = true;
		else
			isEarthFull = true;
		end;
		
		if bUse then
			AddAttrSystem:AddType(5);
			return;
		end
		
		if isEarthFull and isFireFull and isMetalFull and isWaterFull and isWoodFull then
			return 3000410030;
		end
		
		if isEarthFull then
			return 6000610025;
		end
		if isFireFull then
			return 6000610024;
		end
		if isMetalFull then
			return 6000610021;
		end
		if isWaterFull then
			return 6000610023
		end
		if isWoodFull then
			return 6000610022
		end
	else
		dwError = 400010001;
	end;

	if not bUse then return dwError end;
end



-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )

