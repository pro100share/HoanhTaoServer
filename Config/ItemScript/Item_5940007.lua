local dwItemId = 5940007
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
	
	objPlayer:GetSystem('CFiveElemSystem'):FiveElementRecord(50000, 50000, 50000, 50000, 50000, _G.FiveElemSysOperType.ChgFiveByUseItem)
	--金
	if objPlayer:GetSystem('CFiveElemSystem'):ChangeAttr("dwMetalValue", 50000) then
		bUse = true;
	else
		--dwError = 6000610021;
		isMetalFull = true;
	end;
	--木
	if objPlayer:GetSystem('CFiveElemSystem'):ChangeAttr("dwWoodValue", 50000) then
		bUse = true;
	else
		--dwError = 6000610022;
		isWoodFull = true;
	end;
	--水
	if objPlayer:GetSystem('CFiveElemSystem'):ChangeAttr("dwWaterValue", 50000) then
		bUse = true;
	else
		--dwError = 6000610023;
		isWaterFull = true;
	end;
	--火
	if objPlayer:GetSystem('CFiveElemSystem'):ChangeAttr("dwFireValue", 50000) then
		bUse = true;
	else
		--dwError = 6000610024;
		isFireFull = true;
	end;
	--土
	if objPlayer:GetSystem('CFiveElemSystem'):ChangeAttr("dwEarthValue", 50000) then
		bUse = true;
	else
		--dwError = 6000610025;
		isEarthFull = true;
	end;
	
	if bUse then
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

	--if not bUse then return dwError end;
end


-----批量处理脚本
--使用检测(nil：无法使用；0：直接使用；其他：读条时间(单位：毫秒))
function ItemScriptObj:CheckForMassUse(objItemSys, objItem,scripSys,num)
	local objPlayer = objItemSys:GetPlayer();
	if not objPlayer then
		return nil,0;
	end;
	local FiveElemSys = objPlayer:GetSystem('CFiveElemSystem');
	if(not FiveElemSys) then
		return false;
	end
	
	local addValue = 50000;
	local dwMetalValue, dwWoodValue, dwWaterValue, dwFireValue, dwEarthValue  = FiveElemSys:GetElemValue()
	local capacity = ERF_Count_tempOfWuxing(FiveElemSys.dwDantianLv);
	local temp = 0;
	if addValue > 0 and dwMetalValue >= capacity then
		temp = temp + 1
	end
	if addValue > 0 and dwWoodValue >= capacity then
		temp = temp + 1
	end
	if addValue > 0 and dwWaterValue >= capacity then
		temp = temp + 1
	end
	if addValue > 0 and dwFireValue >= capacity then
		temp = temp + 1
	end
	if addValue > 0 and dwEarthValue >= capacity then
		temp = temp + 1
	end
	if(temp == 5) then
		objItemSys:OnError(3000410030);
		return false,0;
	end
	local lastnum = num;
	for i = 1,num do
		local tempValue = 0;
		dwMetalValue = math.floor(dwMetalValue + addValue)
		if dwMetalValue > capacity then 
			dwMetalValue = capacity 
			tempValue = tempValue + 1;
		end
		dwWoodValue = math.floor(dwWoodValue + addValue)
		if dwWoodValue > capacity then 
			dwWoodValue = capacity 
			tempValue = tempValue + 1;
		end
		dwWaterValue = math.floor(dwWaterValue + addValue)
		if dwWaterValue > capacity then 
			dwWaterValue = capacity 
			tempValue = tempValue + 1;
		end
		dwFireValue = math.floor(dwFireValue + addValue)
		if dwFireValue > capacity then 
			dwFireValue = capacity 
			tempValue = tempValue + 1;
		end
		dwEarthValue = math.floor(dwEarthValue + addValue)
		if dwEarthValue > capacity then 
			dwEarthValue = capacity 
			tempValue = tempValue + 1;
		end
		-- print("massuseitemzhenqi",dwEarthValue,dwFireValue,dwWaterValue,dwWoodValue,dwMetalValue,tempValue,capacity)
		if(tempValue == 5) then
			objItemSys:OnError(3000410030);
			lastnum = i;
			break;
		end
	end
	return true,lastnum;
end
--使用物品(nil or false:需要删除;	返回数字:不删除;  0为没有原因，就是不删;  >0为错误提示)
----千万  别  返回true!!!!
function ItemScriptObj:OnUseMassItem(objItemSys, objItem, sysScript,num)
	local objPlayer = objItemSys:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local bUse = false;
	local dwError = 0;
	
    local isMetalFull = false;
	local isWaterFull = false;
	local isWoodFull = false;
	local isEarthFull = false;
	local isFireFull = false;
	--金
	if objPlayer:GetSystem('CFiveElemSystem'):ChangeAttr("dwMetalValue", 50000*num) then
		bUse = true;
	else
		isMetalFull = true;
	end;
	--木
	if objPlayer:GetSystem('CFiveElemSystem'):ChangeAttr("dwWoodValue", 50000*num) then
		bUse = true;
	else
		isWoodFull = true;
	end;
	--水
	if objPlayer:GetSystem('CFiveElemSystem'):ChangeAttr("dwWaterValue", 50000*num) then
		bUse = true;
	else
		isWaterFull = true;
	end;
	--火
	if objPlayer:GetSystem('CFiveElemSystem'):ChangeAttr("dwFireValue", 50000*num) then
		bUse = true;
	else
		isFireFull = true;
	end;
	--土
	if objPlayer:GetSystem('CFiveElemSystem'):ChangeAttr("dwEarthValue", 50000*num) then
		bUse = true;
	else
		isEarthFull = true;
	end;
	
	if bUse then
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
	return false
end


-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )

	