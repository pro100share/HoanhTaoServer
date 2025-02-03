local dwItemId = 6304066    --天山秘宝
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});
--物品ID,1概率  2数量
local data = {
		{4100441,10,10};     ---锻骨丹*10
		{4100441,20,8};     ---锻骨丹*8
		{4100441,70,6};     ---锻骨丹*6
		{4100441,100,3};     ---锻骨丹*3
		{4100441,500,1};     ---锻骨丹*1
		{5809364,1000,1};     ---神威命魂·真*1
		{4100440,1500,1};     ---虎骨壮筋散*1
		{2500069,2000,3};     ---小还丹*3
		{4100170,1200,1};     ---悟道残卷*1
		{4100423,100,1};     ---三品金鳞甲片*1
		{4100422,500,1};     ---二品金鳞甲片*1
		{5920004,2000,1};     ---钱袋(100万)*1
		{4100421,1000,1};     ---一品金鳞甲片*1
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
		if (id==4100441 and Count~=1) then
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







 