local dwItemId = 6304520    --特级装备礼包
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});
--物品ID,1概率  2数量
local data = {
		{4100290,1250,10};     ---剑气石*10
		{4100210,1250,10};     ---精铁锭*10
		{4100110,1250,5};     ---剑魂石*5
		{4100130,1250,5};     ---升阶玄晶*5
		{4100421,1250,10};     ---一品金鳞甲片*10
		{4100111,1200,5};     ---剑魂玉*5
		{4100131,1200,5};     ---云母金精*5
		{5809112,325,1};     ---5倍剑气符*1
		{5809117,325,1};     ---宝甲5倍熔炼符*1
		{4100422,150,10};     ---二品金鳞甲片*10
		{4100423,150,10};     ---三品金鳞甲片*10
		{4100110,150,30};     ---剑魂石*30
		{4100111,100,30};     ---剑魂玉*30
		{4100131,100,30};     ---云母金精*30
		{4100110,50,99};     ---剑魂石*99
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
		if (id==4100110 and count==99) then
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







 