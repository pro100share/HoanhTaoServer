-- [[
	-- 联运平台奖励领取热更新Config
	-- 作者：lizc
	-- 时间：2013-10-29
-- ]]


-- 联运平台奖励领取相关配置信息
_G.UnionPlatformHotUpdateConfig = {
	[1] = {itemId = 6300515,dwBindType = 1,dwLifeTime = -1,},
	[2] = {itemId = 6300516,dwBindType = 1,dwLifeTime = -1,},
	[3] = {itemId = 6300517,dwBindType = 1,dwLifeTime = -1,},
	[4] = {itemId = 6300518,dwBindType = 1,dwLifeTime = -1,},
	[5] = {itemId = 6300519,dwBindType = 1,dwLifeTime = -1,},
    [6] = {itemId = 6300520,dwBindType = 1,dwLifeTime = -1,},
    [7] = {itemId = 6300521,dwBindType = 1,dwLifeTime = -1,},
    [8] = {itemId = 6300522,dwBindType = 1,dwLifeTime = -1,},
    [9] = {itemId = 6300523,dwBindType = 1,dwLifeTime = -1,},
    [10] = {itemId = 6300524,dwBindType = 1,dwLifeTime = -1,},	
}


----------------------------------------------------
-------以下为热更新接口，勿动
----------------------------------------------------
_G.UnionPlatformHotUpdate = {}

function UnionPlatformHotUpdate:Reload()
	local szPath = "../Data/"
	dofile(szPath..'UnionPlatformAward/UnionPlatformHotUpdateConfig.lua')
	
	
	print('UnionPlatformHotUpdate:Reload')
	--热更新发送给所有玩家
	for i, objPlayer in pairs(CPlayerManager.setAllPlayer) do
		objPlayer:GetSystem('CUnionPlatGiftSystem'):SynGiftCfg();
	end;
end

