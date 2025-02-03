local dwItemId = 6304517    --特级宝石礼包
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});
--物品ID,1概率  2数量
local data = {
		{3900010,3000,10};     ---1品宝石精华*10
		{3900020,1550,5};     ---2品宝石精华*5
		{3900030,1550,3};     ---3品宝石精华*3
		{4100400,500,1};     ---云英之玉*1
		{3900020,1000,10};     ---2品宝石精华*10
		{3900030,1000,10};     ---3品宝石精华*10
		{3900040,500,3};     ---4品宝石精华*3
		{4100400,100,3};     ---云英之玉*3
		{3900050,300,2};     ---5品宝石精华*2
		{3900060,300,2};     ---6品宝石精华*2
		{3900070,100,1};     ---7品宝石精华*1
		{4100400,50,6};     ---云英之玉*6
		{3900080,25,1};     ---8品宝石精华*1
		{3900090,25,1};     ---9品宝石精华*1
};

-------------------------------------------------------
--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)

	local id,Count = ArticleSustain:probability(data)
	local addTable = {};
	
	--[[
	_G.enItemBindType.eNo--未绑定
	_G.enItemBindType.eYes--已绑定
	]]
	--碎片
	local item1 = {}
	--物品ID
	item1.dwItemEnum = id;
	--数量
	item1.dwItemNumber = Count;
	--绑定类型 
	item1.dwBindType = enItemBindType.eYes;
	table.insert(addTable, item1);
	--_G.ItemSysOperType.Used 用于记录的 必须填
	if objItemSys:AddEnumItemListToPacket(addTable, _G.ItemSysOperType.Used,true) then
		if (id==3900090 or id==3900080 or (id==4100400 and count==6)) then
			local objPlayer = objItemSys:GetPlayer()
			local Name = objPlayer:GetName()
			--道具名称
			local a = OtherBaseData[dwItemId].strName
			--开启后获得的道具ID
			local b = OtherBaseData[id].strName
			--数量和开启道具拼接
			local m = ""..b.."x"..Count
			CScriptManager:ChatNoticeAll(string.format(SysStringConfigInfo[4000110047],Name,a,m),1,true)
		end
	else
		--什么都不返回  标示 删除道具，返回大于0的标示 错误提示
		return 6000810018;
	end;

end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 