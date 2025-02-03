--[[
--]]
-- _G.PlayerShopCoordinate = 
-- {
	-- MyShop = {x = 0.5,y = 0.5},			--自己摊位界面
	-- MyShopAdd = {x = 0.5,y = 0.5},		--上架界面
	-- MyShopDown = {x = 0.5,y = 0.5},		--下架界面
	-- MyShopBuy = {x = 0.5,y = 0.5},		--购买界面
		
	-- OtherShop = {x = 0.5,y = 0.5},		--他人摊位界面
		
	-- ShopList = {x = 0.5,y = 0.5},		--摊位列表界面
-- }
_G.PlayerShopConfig = 
{
	Invaild = -1,
	Money = 1,
	Gold = 2,
	
	AddItem = 11,
	AddItemSure = 12,
	AddNoItem = 13,
	ShopFull = 14,
	NotForSell = 15,
	InSell = 16,
	AddPrice = 17,
	AddGold = 18,
	AddPriceSure = 19,
	AddGoldSure = 20,
	
	DownItem = 21,
	DownItemSure = 22,
	DownNoItem = 23,
	DownNoPack = 24,
	DownPrice = 25,
	DownPriceSure = 26,
	DownGold = 27,
	DownGoldSure = 28,
	
	AddLockItem = 29,
	
	BuyItem = 31,	
	BuyItemSure = 32,
	BuyNoPack = 33,
	BuyNoItem = 34,
	NoMoney = 35,
	NoGold = 36,
	BuyPrice = 37,
	BuyPriceSure = 38,
	BuyPriceNoGold = 39,
	BuyPriceNoPrice = 40,
	BuyGold = 41,
	BuyGoldSure = 42,
	BuyGoldNoGold = 43,
	BuyGoldNoPrice = 44,
	
	SellItem = 45,
	SellPrice = 46,
	SellGold = 47,
	
	BuyItemSureByMail = 48,
	
	OpenShop = 51,
	OpenShopSure = 52,
	NoShop = 53,
	
	ShowShopList = 61,
	ShowShopListSure = 62,
	SearchItem = 63,
	SearchItemSure = 64,
	Flush = 65,
	FlushTotalNum = 66,
	ChangeName = 71,
	ShopName = 72,
	SearchMoney = 73,
	SearchGold = 74,
	SearchMoneySure = 75,
	SearchGoldSure = 76,
	
	ChangeLine = 97,
	Close = 98,
	Error = 99,
	UnLock = 100,
	PlayerDown = 81,
	----------------------------
	KAddItem = 101,
	KAddItemSure = 102,
	KDelItem = 111,
	KDelItemSure = 112,
	KAddPrice = 113,
	KAddPriceSure = 114,
	KAddGold = 115,
	KAddGoldSure = 116,
	KDelPrice = 117,
	KDelGold = 118,
	
	KAddShop = 121,
	KDelShop = 122,
	
	KBuyItem = 131,	
	KBuyItemSure = 132,
	KBuyNoItem = 133,
	KBuyPrice = 134,	
	KBuyPriceSure = 135,
	KBuyPriceNoPrice = 136,
	KBuyGold = 137,	
	KBuyGoldSure = 138,
	KBuyGoldNoGold = 139,
	
	KChangeName = 151,
	KShowShopList = 161,
	KShowShopListBegin = 162,
	KSearchItem = 163,
	
	KOpenShop = 171,
	KOpenShopSure = 172,
	KNoShop = 181,
	KGetShop = 182,
	KGetShopSure = 183,
	KSellItem = 191,
	KSellPrice = 192,
	KSellGold = 193,
	KBuyItemCancel = 194,
	KBuyItemGetMoney = 195,
--	KBuyItem = 192,
--	KBuyNoItem = 193,
	------------
	KPlayerDown = 201,
	----------------
	
	OnAddShop = 301,
	OnDelShop = 302,
	OnAddItem = 303,
	OnDelItem = 304,
	OnAddPrice = 305,
	OnDelPrice = 306,
	OnAddGold = 307,
	OnDelGold = 308,
	OnChangeName = 309,
	OnAddInitItem = 310,
	----------------
	AddTypeItem = 1001,
	AddTypePrice = 1002,
	AddTypeGold = 1003,
	
	BuyTypeItem = 1011,
	BuyTypePrice = 1012,
	BuyTypeGold = 1013,
	
}
_G.PlayerShopDataConfig =
{
	ItemNum = 10,
	ShopNum = 10, --一页显示的商店数量
	WaitTime = 10,
	dwPriceID = 5500470,
	dwGoldID = 5500480,
	szReleaseColor = '#0FB303',
	picGoldGray = 'Qita_yuanbao_0.png',
	picGoldColor = 'Qita_yuanbao.png',
	
	picPriceGray = 'Qita_money_0.png',
	picPriceColor = 'Qita_money.png',
	
	DefaultShopName = "默认商店名字";
}