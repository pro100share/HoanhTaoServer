local dwItemId = 5809687
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});
--��ƷID,1����  2����
local data = {
	{8700042,770,1};
	{8700043,770,1};
	{8700044,770,1};
	{8700045,770,1};
	{8700046,770,1};
	{8700047,770,1};
	{8700048,770,1};
	{8700049,770,1};
	{8700050,770,1};
	{8700051,770,1};
	{8700052,770,1};
	{8700053,770,1};
	{8700054,770,1};
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







 