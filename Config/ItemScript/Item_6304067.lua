local dwItemId = 6304067    --称号礼包
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});
--物品ID,1概率  2数量
local data = {
		{5809539,2,1};     ---独孤求败称号卡*1
		{5809538,3,1};     ---神功盖世称号卡*1
		{5809537,5,1};     ---惊世骇俗称号卡*1
		{5809536,10,1};     ---震古铄今称号卡*1
		{5809535,20,1};     ---天人合一称号卡*1
		{4900175,100,1};     ---称号碎片*1
		{4100430,630,1};     ---檀心丹*1
		{2500081,1500,2};     ---元气通神酒·中*2
		{4100290,2100,2};     ---剑气石*2
		{4100445,1000,1};     ---缨穗*1
		{2500071,1500,2};     ---九花玉露丸·中*2
		{4100140,630,1};     ---强化石*1
		{2400110,2500,2};     ---双倍经验丹*2
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
	if (id==5809539 or id==5809538 or id==5809537 or id==5809536 or id==5809535 or id==4900175) then
		item1.dwBindType = enItemBindType.eNo;
	else
		item1.dwBindType = enItemBindType.eYes;
	end
	table.insert(addTable, item1);
	--_G.ItemSysOperType.Used 用于记录的 必须填
	if objItemSys:AddEnumItemListToPacket(addTable, _G.ItemSysOperType.Used,true) then
		if (id==5809539 or id==5809538 or id==5809537 or id==5809536 or id==5809535) then
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







 