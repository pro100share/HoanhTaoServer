local dwItemId = 6304065    --天山秘宝
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});
--物品ID,1概率  2数量
local data = {
		{4100443,10,10};     ---凝血炼骨丹*10
		{4100443,20,8};     ---凝血炼骨丹*8
		{4100443,70,6};     ---凝血炼骨丹*6
		{4100443,100,3};     ---凝血炼骨丹*3
		{4100443,500,1};     ---凝血炼骨丹*1
		{4100080,1000,1};     ---亮银砂*1
		{4100010,1200,5};     ---千纸鹤*5
		{2500040,2000,2};     ---益元丹*2
		{4100442,1000,1};     ---九转熊蛇丸*1
		{9405040,600,1};     ---坐骑资质丹*1
		{4100444,500,1};     ---九转熊蛇丸·大*1
		{5910003,2000,1};     ---礼金券(100礼金)*1
		{4100140,1000,1};     ---强化石*1
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
		if (id==4100443 and Count~=1) then
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







 