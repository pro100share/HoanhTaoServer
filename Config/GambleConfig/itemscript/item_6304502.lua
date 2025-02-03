local dwItemId = 6304502
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

local SpiritData = {
	{3000,5000};
	{5000,3500};
	{10000,1000};
	{50000,350};
	{100000,150};
};

--权重
local function probability(data)
	local dwMax = 0;
	for k,v in pairs(data) do
		dwMax = dwMax + v[2]
	end
	local dwRes = math.random(1,dwMax)
	local dwCur = 0;
	for k,v in pairs(data) do
		dwCur = dwCur + v[2]
		if dwRes <= dwCur then
			return v[1];
		end
	end
end

-------------------------------------------------------
--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)

	local value = probability(SpiritData)

	--获得五行属性值
	local objPlayer = objItemSys:GetPlayer()
	if not objPlayer then
		return 0;
	end
	
	local sysFiveElem = objPlayer:GetSystem('CFiveElemSystem')
	if not sysFiveElem then
		return 0;
	end
	
	-- local dwMetalValue,dwWoodValue,dwWaterValue,dwFireValue,dwEarthValue = sysFiveElem:GetElemValue()

	if (not sysFiveElem:CanChange("dwWaterValue", value)) and 
		(not sysFiveElem:CanChange("dwWoodValue", value)) and
		(not sysFiveElem:CanChange("dwMetalValue", value)) and
		(not sysFiveElem:CanChange("dwFireValue", value)) and
		(not sysFiveElem:CanChange("dwEarthValue", value)) then	
		return 13001350013;
	else
		sysFiveElem:ChangeAttr("dwWaterValue", value)
		sysFiveElem:ChangeAttr("dwWoodValue", value)
		sysFiveElem:ChangeAttr("dwMetalValue", value)
		sysFiveElem:ChangeAttr("dwFireValue", value)
		sysFiveElem:ChangeAttr("dwEarthValue", value)
	end
	
	return false;
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 