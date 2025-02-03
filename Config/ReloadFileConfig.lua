--重新加载配置文件

--配置文件的路径
_G.ReloadConfig = 
{
	[1] = 
	{
		'../Config/SitConfig.lua',
	};
	[2] = 
	{
		
	};
}

local ReTimeType = {
	eMinute = 1,--周期单位分钟
	eHour	= 2,--周期单位小时
	eDay	= 3,--周期单位天
	eWeek	= 4,--周期单位周
	eMonth  = 5,--周期单位月
	eYear	= 6,--周期单位年
};

--定时重新加载
_G.ReloadTimeMark = 
{
	-- [1] = 
	-- {
		-- --加载时间点
		-- ReTime = 
		-- {
			-- dwTime = "13:25",
		-- };
		-- --加载间隔运算方式
		-- ReType = ReTimeType.eDay;
		-- --加载间隔长度
		-- ReLength = 1;
		-- --加载的配置文件索引，ReloadConfig
		-- dwIndex = 1;
	-- };
}
