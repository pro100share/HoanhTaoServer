﻿--活动经验基数
_G.DataActExpBase = {
	--1.戏说天下 经验系数调整
	--2.系统多倍经验系数调整
	--3.演武经验真气系数调整
	--4.坐骑天官赐福清除标记
	--5.实战天官赐福清除标记
	--6.名剑天官赐福清除标记
	--7.宝甲天官赐福清除标记
	--8.易筋经天官赐福清除标记
	--9.血魔功天官赐福清除标记
	--10.装备升级天官赐福清除标记
	
	-- --戏说天下
	-- [1] = {	
		-- --开启时间
		-- [1] = {
			-- Again = 9,--倍数
			-- y=2013, --年
			-- m=10,	--月
			-- d=8,	--日
			-- h=16,	--小时
			-- mi=58,	--分钟
		-- };
		-- --关闭时间
		-- [2] = {
			-- Again = 0,
			-- y=2013, --年
			-- m=12,	--月
			-- d=18,	--日
			-- h=21,	--小时
			-- mi=8,	--分钟		
		-- };
		-- notice = {
			-- ["201310081736"] = "神奇的公告1";
			-- ["201310081737"] = "神奇的公告1";
			-- ["201309291538"] = "神奇的公告1";
			-- ["201309291439"] = "神奇的公告1";	
		-- };--公告
	-- };	
	-- --系统多倍经验
	[2] = {	
		-- --开启时间
		[1] = {
			 Again = 9,--倍数
			y=2013, --年
			 m=9,	--月
			 d=18,	--日
			h=20,	--小时
			 mi=55,	--分钟
		};
		-- --关闭时间
		[2] = {
			Again = 0,--倍数
			 y=2018, --年
			 m=9,	--月
			d=18,	--日
			h=20,	--小时
			 mi=56,	--分钟		
		 };
		 notice = {};
	};		
	
	-- --演武经验、真气    --谨慎用之
	-- [3] = {	
		-- --开启时间
		-- [1] = {
			-- Again = 9,--倍数
			-- y=2013, --年
			-- m=9,	--月
			-- d=18,	--日
			-- h=22,	--小时
			-- mi=58,	--分钟
		-- };
		-- --关闭时间
		-- [2] = {
			-- Again = 0,
			-- y=2013, --年
			-- m=9,	--月
			-- d=18,	--日
			-- h=22,	--小时
			-- mi=59,	--分钟		
		-- };
		-- notice = {};
	-- };
	--坐骑天官赐福
	-- [4] = {	
		-- --开启时间
		-- [1] = {
			-- Again = true,--true为不清除
			-- y=2013, --年
			-- m=9,	--月
			-- d=18,	--日
			-- h=22,	--小时
			-- mi=58,	--分钟
		-- };
		-- --关闭时间
		-- [2] = {
			-- Again = false,--false为清除
			-- y=2013, --年
			-- m=9,	--月
			-- d=18,	--日
			-- h=22,	--小时
			-- mi=59,	--分钟		
		-- };
		-- notice = {};
	-- };	
	-- --实战天官赐福
	-- [5] = {	
		-- --开启时间
		-- [1] = {
			-- Again = true,--true为不清除
			-- y=2013, --年
			-- m=9,	--月
			-- d=18,	--日
			-- h=22,	--小时
			-- mi=58,	--分钟
		-- };
		-- --关闭时间
		-- [2] = {
			-- Again = false,--false为清除
			-- y=2013, --年
			-- m=9,	--月
			-- d=18,	--日
			-- h=22,	--小时
			-- mi=59,	--分钟		
		-- };
		-- notice = {};
	-- };		
	
	-- --名剑天官赐福
	-- [6] = {	
		-- --开启时间
		-- [1] = {
			-- Again = true,--true为不清除
			-- y=2013, --年
			-- m=9,	--月
			-- d=18,	--日
			-- h=22,	--小时
			-- mi=58,	--分钟
		-- };
		-- --关闭时间
		-- [2] = {
			-- Again = false,--false为清除
			-- y=2013, --年
			-- m=9,	--月
			-- d=18,	--日
			-- h=22,	--小时
			-- mi=59,	--分钟		
		-- };
		-- notice = {};
	-- };			

	-- --宝甲天官赐福
	-- [7] = {	
		-- --开启时间
			-- [1] = {
			-- Again = true,--true为不清除
			-- y=2013, --年
			-- m=9,	--月
			-- d=18,	--日
			-- h=22,	--小时
			-- mi=58,	--分钟
		-- };
		-- --关闭时间
		-- [2] = {
			-- Again = false,--false为清除
			-- y=2013, --年
			-- m=9,	--月
			-- d=18,	--日
			-- h=22,	--小时
			-- mi=59,	--分钟		
		-- };
		-- notice = {};
	-- };			
	-- --易筋经天官赐福
	-- [8] = {	
		-- --开启时间
		-- [1] = {
			-- Again = true,--true为不清除
			-- y=2013, --年
			-- m=9,	--月
			-- d=18,	--日
			-- h=22,	--小时
			-- mi=58,	--分钟
		-- };
		-- --关闭时间
		-- [2] = {
			-- Again = false,--false为清除
			-- y=2013, --年
			-- m=9,	--月
			-- d=18,	--日
			-- h=22,	--小时
			-- mi=59,	--分钟		
		-- };
		-- notice = {};
	-- };			
	-- --血魔功天官赐福
	-- [9] = {	
		-- --开启时间
			-- [1] = {
			-- Again = true,--true为不清除
			-- y=2013, --年
			-- m=9,	--月
			-- d=18,	--日
			-- h=22,	--小时
			-- mi=58,	--分钟
		-- };
		-- --关闭时间
		-- [2] = {
			-- Again = false,--false为清除
			-- y=2013, --年
			-- m=9,	--月
			-- d=18,	--日
			-- h=22,	--小时
			-- mi=59,	--分钟		
		-- };
		-- notice = {};
	-- };			
	-- --装备升级天官赐福
	-- [10] = {	
		-- --开启时间
			-- [1] = {
			-- Again = true,--true为不清除
			-- y=2013, --年
			-- m=9,	--月
			-- d=18,	--日
			-- h=22,	--小时
			-- mi=58,	--分钟
		-- };
		-- --关闭时间
		-- [2] = {
			-- Again = false,--false为清除
			-- y=2013, --年
			-- m=9,	--月
			-- d=18,	--日
			-- h=22,	--小时
			-- mi=59,	--分钟		
		-- };
		-- notice = {};
	-- };			
};


----------------------------------------------------
-------以下为热更新接口，勿动
----------------------------------------------------
function DataActExpBase:Reload()
	local szPath = "../Data/"
	dofile(szPath..'MonNExp/ExpBase.lua')
end