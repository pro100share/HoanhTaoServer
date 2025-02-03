--地图的区域相关信息

-- 如果地图没有区域属性，就不填
-- 999是安全区属性，其他编号用在地图逻辑中，编号小的优先判断，大的靠后
-- dwType目前只有两种，1--圆圈，2--方块
-- 圆圈的参数：val1--中心点X，val2--中心点Y，val3--半径，val4--空闲
-- 方块的参数：val1--最小点X，val2--最小点Y，val3--最大点X，val4--最大点Y


_G.MapAreaConfig = 
{
----新手村
	{
		dwMapID = 1001;
		AreaTable = 
		{
			{dwID = 999,dwType = 1,val1 = -16.93, val2 = -30.65, val3 = 32, val4 = 0};
			{dwID = 999,dwType = 1,val1 = -43.85, val2 = -6.89, val3 = 11, val4 = 0};
		};
	};
----襄阳城
	{
		dwMapID = 1002;
		AreaTable = 
		{
			{dwID = 999,dwType = 1,val1 = 0, val2 = 0, val3 = 9999, val4 = 0};
		};
	};
----太守府
	{	
		dwMapID = 1102;
		AreaTable = 
		{
			{dwID = 999,dwType = 1,val1 = 0, val2 = 0, val3 = 9999, val4 = 0};
		};
	};
----龙鼎战 备战区
	{
		dwMapID = 8010;
		AreaTable = 
		{
			{dwID = 999,dwType = 1,val1 = 0, val2 = 0, val3 = 9999, val4 = 0};
		};
	};
----青云栈道
	{
		dwMapID = 8031;
		AreaTable = 
		{
			{dwID = 999,dwType = 1,val1 = 0, val2 = 0, val3 = 9999, val4 = 0};
		};
	};
----风云客栈
	{	
		dwMapID = 8025;
		AreaTable = 
		{
			{dwID = 999,dwType = 1,val1 = 0, val2 = 0, val3 = 9999, val4 = 0};
		};
	};
	--盟主战区域
	{
		dwMapID = 8020;
		AreaTable = 
		{
			--核心区域
			{dwID = 1,dwType = 2,val1 = -18.81, val2 = 45.38, val3 = 17.52, val4 = 85.39};
			--城内
			{dwID = 2,dwType = 2,val1 = -65.21, val2 = 3.81, val3 = 60.78, val4 = 86.39};
		};
	};
	--个人押镖 低级
	{
		dwMapID = 8070;
		AreaTable = 
		{
			--起点
			{dwID = 999,dwType = 1,val1 = -146, val2 = -25, val3 = 50, val4 = 0};
			--终点
			{dwID = 999,dwType = 1,val1 = 119, val2 = -25, val3 = 38, val4 = 0};
		};
	};
	--个人押镖 高级
	{
		dwMapID = 8071;
		AreaTable = 
		{
			--起点
			{dwID = 999,dwType = 1,val1 = -146, val2 = -25, val3 = 50, val4 = 0};
			--终点
			{dwID = 999,dwType = 1,val1 = 119, val2 = -25, val3 = 38, val4 = 0};
		};
	};
	----桃花迷阵1
	{	
		dwMapID = 8080;
		AreaTable = 
		{
			{dwID = 999,dwType = 1,val1 = 0, val2 = 0, val3 = 9999, val4 = 0};
		};
	};
	----桃花迷阵2
	{	
		dwMapID = 8081;
		AreaTable = 
		{
			{dwID = 999,dwType = 1,val1 = 0, val2 = 0, val3 = 9999, val4 = 0};
		};
	};
	----桃花迷阵3
	{	
		dwMapID = 8082;
		AreaTable = 
		{
			{dwID = 999,dwType = 1,val1 = 0, val2 = 0, val3 = 9999, val4 = 0};
		};
	};
	----桃花迷阵4
	{	
		dwMapID = 8083;
		AreaTable = 
		{
			{dwID = 999,dwType = 1,val1 = 0, val2 = 0, val3 = 9999, val4 = 0};
		};
	};
	----桃花迷阵5
	{	
		dwMapID = 8084;
		AreaTable = 
		{
			{dwID = 999,dwType = 1,val1 = 0, val2 = 0, val3 = 9999, val4 = 0};
		};
	};
	----桃花迷阵6
	{	
		dwMapID = 8085;
		AreaTable = 
		{
			{dwID = 999,dwType = 1,val1 = 0, val2 = 0, val3 = 9999, val4 = 0};
		};
	};
	----桃花迷阵7
	{	
		dwMapID = 8086;
		AreaTable = 
		{
			{dwID = 999,dwType = 1,val1 = 0, val2 = 0, val3 = 9999, val4 = 0};
		};
	};
	----桃花迷阵8
	{	
		dwMapID = 8087;
		AreaTable = 
		{
			{dwID = 999,dwType = 1,val1 = 0, val2 = 0, val3 = 9999, val4 = 0};
		};
	};
	----桃花迷阵9
	{	
		dwMapID = 8088;
		AreaTable = 
		{
			{dwID = 999,dwType = 1,val1 = 0, val2 = 0, val3 = 9999, val4 = 0};
		};
	};
	----桃花迷阵10
	{	
		dwMapID = 8089;
		AreaTable = 
		{
			{dwID = 999,dwType = 1,val1 = 0, val2 = 0, val3 = 9999, val4 = 0};
		};
	};
	----跨服战
	{
		dwMapID = 9999;
		AreaTable = 
		{
			--抢刀区域
			{dwID = 99,dwType = 1,val1 = -4, val2 = -21, val3 = 45, val4 = 0};
			
			--安全区
			{dwID = 999,dwType = 1,val1 = 92, val2 = -86, val3 = 10, val4 = 0};
			{dwID = 999,dwType = 1,val1 = -68, val2 = 97, val3 = 10, val4 = 0};
			{dwID = 999,dwType = 1,val1 = 64, val2 = 48, val3 = 10, val4 = 0};
			{dwID = 999,dwType = 1,val1 = -37, val2 = -110, val3 = 10, val4 = 0};
			{dwID = 999,dwType = 1,val1 = -100, val2 = -7, val3 = 10, val4 = 0};
			
		};
	};
	----侠客岛
	{	
		dwMapID = 8090;
		AreaTable = 
		{
			-- {dwID = 999,dwType = 2,val1 = -40, val2 = -54, val3 = -73, val4 = 41};
			{dwID = 999,dwType = 1,val1 = -52, val2 = -56, val3 = 12, val4 = 0};
			{dwID = 999,dwType = 1,val1 = -65, val2 = -40, val3 = 10, val4 = 0};
			{dwID = 999,dwType = 1,val1 = -70, val2 = -10, val3 = 10, val4 = 0};
			{dwID = 999,dwType = 1,val1 = -60, val2 = 26, val3 = 10, val4 = 0};
			{dwID = 999,dwType = 1,val1 = -16, val2 = -64, val3 = 10, val4 = 0};
			{dwID = 999,dwType = 1,val1 = -57, val2 = 46, val3 = 10, val4 = 0};
		};
	};	
	
}

return MapAreaConfig;