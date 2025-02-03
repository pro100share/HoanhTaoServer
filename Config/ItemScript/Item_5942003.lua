local dwItemId = 5942003
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local objPlayer = objItemSys:GetPlayer();
	
	local bUse = false;
	local dwError = 0;
	
	objPlayer:GetSystem('CFiveElemSystem'):FiveElementRecord(0, 1000, 0, 0, 0, _G.FiveElemSysOperType.ChgFiveByUseItem)
	--木
	if objPlayer:GetSystem('CFiveElemSystem'):ChangeAttr("dwWoodValue", 1000) then
		bUse = true;
	else
		dwError = 6000610022;
	end;
	

	
	if not bUse then return dwError end;
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
	
	local addValue = 1000;
	local dwMetalValue, dwWoodValue, dwWaterValue, dwFireValue, dwEarthValue  = FiveElemSys:GetElemValue()
	local capacity = ERF_Count_tempOfWuxing(FiveElemSys.dwDantianLv);

	local temp = 0;
	if addValue > 0 and dwWoodValue >= capacity then
		temp = temp + 1
	end

	if(temp == 1) then
		objItemSys:OnError(6000610022);
		return false,0;
	end
	local lastnum = num;
	for i = 1,num do
		local tempValue = 0;
		dwWoodValue = math.floor(dwWoodValue + addValue)
		if dwWoodValue > capacity then 
			dwWoodValue = capacity 
			tempValue = tempValue + 1;
		end
		-- print("massuseitemzhenqi",dwEarthValue,dwFireValue,dwWaterValue,dwWoodValue,dwMetalValue,tempValue,capacity)
		if(tempValue == 1) then
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
	
	local isWoodFull = false;

	--木
	if objPlayer:GetSystem('CFiveElemSystem'):ChangeAttr("dwWoodValue", 1000*num) then
		bUse = true;
	else
		isWoodFull = true;
	end;
	
	if bUse then
		return;
	end
	
	if isWoodFull then
		return 6000610022;
	end

	return false
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )