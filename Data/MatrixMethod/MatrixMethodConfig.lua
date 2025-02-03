--[[
功能：阵法热更类
作者：魏云
时间：2013-10-29
--]]

_G.MatrixMethodConfig = {
	--是否开启回归活动
	bOpen = false;
	freeMaxNum = 10;  ----增加免费拉杆次数
	------一下未定不可修改---------
	starAddExpNum = {1,3,5,10}; ----随机星星后加的倍数
	conItemNumPre = 100; ---消耗物品百分比 如：80%
	conGoldNum = 100;    ---消耗元宝的百分比 如：80%
}

----------------------------------------------------
-------以下为热更新接口，勿动
----------------------------------------------------
function MatrixMethodConfig:Reload()
	local szPath = "../Data/"
	dofile(szPath..'MatrixMethod/MatrixMethodConfig.lua')
end