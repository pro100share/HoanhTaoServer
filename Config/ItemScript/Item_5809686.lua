local dwItemId = 5809686
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});
--��ƷID,1����  2����
local data = {
	{8700023,670,1};
	{8700024,670,1};
	{8700025,670,1};
	{8700026,670,1};
	{8700027,670,1};
	{8700028,670,1};
	{8700029,670,1};
	{8700034,670,1};
	{8700035,670,1};
	{8700036,670,1};
	{8700037,670,1};
	{8700038,670,1};
	{8700039,670,1};
	{8700040,670,1};
	{8700041,670,1};
};

-------------------------------------------------------
--ʹ����Ʒ
function ItemScriptObj:OnUseItem(objItemSys, objItem)

	if not objItemSys:IsPacketSlotEnoughFor(1) then return 9000110010 end;
	
	local id,Count = ArticleSustain:probability(data)
	local addTable = {};
	
	print("ItemScriptObj:OnUseItem",id,Count)
	--[[
	_G.enItemBindType.eNo--δ��
	_G.enItemBindType.eYes--�Ѱ�
	]]
	--��Ƭ
	local item1 = {}
	--��ƷID
	item1.dwItemEnum = id;
	--����
	item1.dwItemNumber = Count;
	--������ 
	item1.dwBindType = enItemBindType.eYes;
	table.insert(addTable, item1);
	--_G.ItemSysOperType.Used ���ڼ�¼�� ������
	if not objItemSys:AddEnumItemListToPacket(addTable, _G.ItemSysOperType.Used,true) then
		--ʲô��������  ��ʾ ɾ�����ߣ����ش���0�ı�ʾ ������ʾ
		return 6000810018;
	end;
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 