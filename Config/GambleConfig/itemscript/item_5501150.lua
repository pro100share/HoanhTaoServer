-----满月百宝箱
local dwItemId = 5501150
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

local ItemDate = {
	[1] = 
	{	--1-40
		{ItemID = 2500100,ItemNum = 10};
		{ItemID = 2500101,ItemNum = 10};
		{ItemID = 5500020,ItemNum = 10};
	};
	[2] = 
	{--41-60
		{ItemID = 2400120,ItemNum = 1};
		{ItemID = 4100140,ItemNum = 10};
		{ItemID = 2500030,ItemNum = 2} ;
		{ItemID = 4100290,ItemNum = 50};
	};
	[3] = 
	{-- >=61
		{ItemID = 3900050,ItemNum = 4};
		{ItemID = 5500080,ItemNum = 2};
		{ItemID = 4100120,ItemNum = 10};
		{ItemID = 5602030,ItemNum = 5};
		{ItemID = 4100210,ItemNum = 50};
	};
};

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	
	if not objItemSys:IsPacketSlotEnoughFor(1) then return 9000110010 end;
	
	local objPlayer = objItemSys:GetPlayer()
	if not objPlayer then
		return ;
	end 
	local dwLevel = objPlayer:GetLevel();  
	if not dwLevel then
		return ;
	end 
	
	--[[
	_G.enItemBindType.eNo--未绑定
	_G.enItemBindType.eYes--已绑定
	]]
	
	
	local addTable = {};
	local tempLv = 1
	if dwLevel >= 41 and dwLevel <= 60 then
		tempLv = 2
	elseif dwLevel >= 61 then
		tempLv = 3
	end 
	
	for k,v in pairs( ItemDate[tempLv] ) do 
		addTable[k] = {}
		addTable[k].dwItemEnum = v.ItemID
		addTable[k].dwItemNumber = v.ItemNum
		addTable[k].dwBindType = enItemBindType.eYes;
		--table.insert(addTable, addTable[k]);
	end 
	
	
	--_G.ItemSysOperType.Used 用于记录的 必须填
	if not objItemSys:AddEnumItemListToPacket(addTable, _G.ItemSysOperType.Used,true) then
		--什么都不返回  标示 删除道具，返回大于0的标示 错误提示
		return 6000810018;
	end;
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 