--[[
--]]
--交易码
_G.TradeMsgConfig =
{
	invalid = -1,
	
	Request = 1,    --请求
	Response = 2,	--回应
	Refuse = 3,		--拒绝
	OverTime = 4,	--超时
	NotOnLine = 5,  --离线
	OutOfRange = 6, --超出范围
	Tradeing = 7,   --正在交易状态
	NotSameLine = 8,--不在同一线
	Dead  = 9,		--玩家已死亡

	
	RequestSendSuccsee = 11, --交易请求成功被响应
	ShowRequest = 12, --被交易方显示请求
	ShowMain = 13,--打开交易面板
	
	--------------------------------------------------------------------------------------	
	ItemFull = 111,
	AddItem = 112,	--上架
	AddItemSure = 113, --上架确认
	DownItem = 114,	--下架
	DownItemSure = 115, --下架确认
	NoPack = 116,	--背包已满
	OtherNoPack = 117,--对方背包已满
	LockItem = 118, ----被锁物品
	BindItem = 119, ----绑定物品
	
	AddMoney = 121,	--改变交易银两
	AddGold = 122,	--改变交易元宝
	MoneyFull = 123,	--银两达到上限
	OtherMoneyFull = 124, --对方银两达上限
	NotEnoughMoney = 125,	--银两不够消耗
	OtherNotEnoughMoney = 126, --对方银两不够消耗
	NotEnoughGold = 127,	--元宝不够消耗
	OtherNotEnoughGold = 128, --对方元宝不够消耗
	
	
	Deaded = 131,	--玩家自身死亡，被动关闭交易
	OtherDeaded = 132,--对方死亡
	OutOfRanged = 133,--超出范围，被动关闭交易
	Break = 134,     --交易中断
	Lock = 135,		--锁定交易
	Complete = 136,	--交易成功
	Breaked = 137, --交易被动中断
	
	Error = 999,
}
_G.TradeConfig = 
{
	OverTime = 10000,
	PastTime = 60000,
	ItemNum = 5,
	TradeLimitDistance = 10,
}