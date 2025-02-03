--[[
功能：酒葫芦热更类
作者：魏云
时间：2014-4-2
--]]

_G.UpdateGourdConfig = {
	--是否开启回归活动
	bOpen = false;
	Info = {
		[1] = {ItemID = 5910001;Limit = 1000;AddExp = 100};	
		[2] = {ItemID = 5910002;Limit = 10;AddExp = 20};	
		[3] = {ItemID = 5910003;Limit = 10;AddExp = 40};
		[4] = {ItemID = 5910004;Limit = 10;AddExp = 80};
	}
	
}
----------------------------------------------------
-------以下为热更新接口，勿动
----------------------------------------------------
function UpdateGourdConfig:Reload()
	local szPath = "../Data/"
	dofile(szPath..'Gourd/GourdConfig.lua')
end