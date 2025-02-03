local dwItemId = 6304504    --装备礼物
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});
--物品ID,1概率  2数量
local data = {
		{4100290,1000,10};     ---剑气石*10
		{4100210,1000,10};     ---精铁锭*10
		{4100420,1000,10};     ---紫钧元*10
		{4100140,1000,10};     ---强化石*10
		{4100080,1000,10};     ---亮银砂*10
		{4100110,1000,25};     ---剑魂石*25
		{4100130,1000,10};     ---升阶玄晶*10
		{4100421,1000,10};     ---一品金鳞甲片*10
		{5809111,500,1};     ---3倍剑气符*1
		{5809116,500,1};     ---宝甲3倍熔炼符*1
		{4100120,500,10};     ---升阶玄铁*10
		{4100422,300,10};     ---二品金鳞甲片*10
		{5809267,100,1};     ---强化卷轴包*1
		{5809260,100,1};     ---属性归一符*1
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
		if (id==5801998) then
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







 