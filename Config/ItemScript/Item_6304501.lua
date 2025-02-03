local dwItemId = 6304501
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

local GoldData = {
	{50000,4184};
	{100000,3500};
	{150000,1500};
	{30000,500};
	{300000,150};
	{750000,100};
	{1000000,50};
	{2500000,10};
	{5000000,5};
	{10000000,1};
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

	local dwValue = probability(GoldData)

	if objItemSys:GetAllPacketMoney() == _G.InitConfig.dwMaxMoney then			--检测绑定金币的是否超上限
		return 6000610001;
	end	
	
	if objItemSys:GetAllPacketMoney() + dwValue > _G.InitConfig.dwMaxMoney then			
		dwValue = _G.InitConfig.dwMaxMoney - objItemSys:GetAllPacketMoney();
	end

	objItemSys:AddPacketMoney(dwValue, 1);
	
	return false;
	
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 