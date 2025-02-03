
_G.CSNpcShopMsgConfig =
{
	invalid = -1,
	Buy = 1,
	Sell = 2,
	---------
	BuySuccess = 4,
	BuySuccessByBindGold = 5,
	BuySuccessByGold = 6,
	
	MoneyNotEnough = 7,
	GoldNotEnough = 8,
	BindGoldNotEnough = 9,
	NoPack = 10,
	--
	SellSuccess = 11,
	NotForSell = 12,
	--
	
	SetState = 13,

	Unlock = 99,
}
--------------------------------------------


_G.CrossSvrNpcShopConfig = 
{
	MoneyType = {
		Money = 1;		--金钱
		BindGold = 2;	--礼金
		Gold = 3;		--元宝
	};
	
	
	ItemID = { 	--金钱
				[1] = {};
				--礼金
				[2] = {};
				--元宝
				[3] = { {ItemID = 2500072 ,price = 50, dwBindType=0},{ItemID = 2500082 ,price = 50, dwBindType=0},{ItemID = 2500190, price = 50, dwBindType=0},{ItemID = 2400000 ,price = 60, dwBindType=0},{ItemID = 2400010 ,price = 60, dwBindType=0},{ItemID = 4100010 ,price = 20, dwBindType=0},{ItemID = 2500065 ,price = 888, dwBindType=0}};
				};	
	GetItemPrice = function(dwItemID,dwIndex)
		local ItemList = CrossSvrNpcShopConfig.ItemID[dwIndex]
		 for key,value in pairs(ItemList) do
			if value.ItemID == dwItemID then
				print("========dwItemID====",dwItemID)
				return value.price
			end
		 end
		return nil
	end;
	-- [2100010] = 10000;  2100010 --物品ID 10000 荣誉值
	HonorList = {
		[5809688] = 50;
		[5809689] = 100;
		[5809690] = 250;
		[5809691] = 500;
		[5809692] = 3000;
	

	};
};