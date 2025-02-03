local dwItemId = 6304071    --云英礼包
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});
--物品ID,1概率  2数量
local data = {
		{4100400,1,20};     ---云英之玉*20
		{4100400,5,10};     ---云英之玉*10
		{4100400,4,8};     ---云英之玉*8
		{4100400,40,6};     ---云英之玉*6
		{4100400,50,3};     ---云英之玉*3
		{4100400,299,1};     ---云英之玉*1
		{9405041,1,1};     ---无极仙元丹·灵*1
		{4902012,100,1};     ---精炼锤*1
		{5920005,2000,1};     ---钱袋(500万)*1
		{4100446,1500,2};     ---檀木托*2
		{4100421,2000,5};     ---一品金鳞甲片*5
		{4902007,1000,1};     ---金锄头*1
		{9405050,1500,1};     ---洗髓灌顶丹*1
		{5940007,1500,1};     ---真气丹(5万)*1
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
		if (id==4100400 and Count~=1 or id==9405041) then
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







 