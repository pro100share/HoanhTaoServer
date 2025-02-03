_G.FrenzyHoeConfig = {
	--是否开启活动
	bOpen = false;
	-- ItemFrenzyHoeExchangeConfig = {
		-- [1] = {
		-- ID = 1,
		-- FriendNum = 12,            -----友好度数
		-- ExchangeItemId = 4902009,   -----可兑换锄头的物品id
		-- ItemNum = 1,               -----可兑换物品的数量
		-- BindType = 0,
		-- String ="内含..." ,
		-- },
	-- }
}

----------------------------------------------------
-------以下为热更新接口，勿动
----------------------------------------------------
function FrenzyHoeConfig:Reload()
	local szPath = "../Data/"
	dofile(szPath..'FrenzyHoe/FrenzyHoeConfig.lua')
end