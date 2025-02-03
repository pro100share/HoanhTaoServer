local dwItemId = 6304519    --特级江湖礼包
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});
--物品ID,1概率  2数量
local data = {
		{6300418,2000,1};     ---强化石小包*1
		{9405051,1750,5};     ---化身金丹*5
		{4100450,1750,5};     ---侠客秘传*5
		{9701015,1500,10};     ---返神丹*10
		{6300419,900,1};     ---强化石中包*1
		{9405051,500,25};     ---化身金丹*25
		{4100450,500,25};     ---侠客秘传*25
		{9701015,500,50};     ---返神丹*50
		{4902013,250,1};     ---钻石锄头*1
		{6300420,100,1};     ---强化石大包*1
		{9405051,100,50};     ---化身金丹*50
		{4100450,100,50};     ---侠客秘传*50
		{9701015,50,100};     ---返神丹*100
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
		if (id==9701015 and count==100) then
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







 