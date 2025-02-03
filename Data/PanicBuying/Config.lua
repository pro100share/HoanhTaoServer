--商城抢购的配置
-- [1] = 
	-- {
		-- {
            -- 神龙果抢购包	6300450
			-- dwID = 1,							--这个ID就是商品的编号，不可以重复
			-- dwEnumID = 5500040,					--神龙果抢购包
			-- dwNumber = 100,						--数量上限
            -- dwPriceType = 1,					    --价格类型，这个配置参考商城
			-- dwPrice = 150,						--价格
			-- dwBindType = 1,						--绑定类型，，这个配置参考商城1绑定 0不绑定
            -- dwLength = 1,                        --时长
            -- dwBeginDay = 20130725                --开始时间(默认为当天0点)
		-- };
	-- }
--限购的刷新时间点
_G.MallLimitTime = 
{
	--刷新时间点
	[1] = 
	{
		-- ["2013-09-28"] = {10};	--日期
		-- ["2013-09-12"] = {10};	--日期
		-- ["2013-09-13"] = {11};	--日期
		-- ["2013-09-14"] = {11};	--日期
		-- ["2013-09-15"] = {11};	--日期
		-- ["2013-09-16"] = {11};	--日期
		-- ["2013-12-01"] = {10, 12};	--日期
	};
	[2] = 
	{
		-- ["2013-09-28"] = {10};	--日期
		-- ["2013-09-12"] = {10};	--日期
		-- ["2013-09-13"] = {11};	--日期
		-- ["2013-09-14"] = {11};	--日期
		-- ["2013-09-15"] = {11};	--日期
		-- ["2013-09-16"] = {11};	--日期
		-- ["2013-12-01"] = {10, 12};	--日期
	};
}
--限购的商品列表
_G.MallLimitItem = 
{
	[10] = 
	{
		{
			dwID = 1;							
			dwEnumID = 6300450,	--神龙果抢购包*5
			dwNumber = 5,						
			dwPriceType = 1,					
			dwPrice = 39,						
			dwBindType = 1,
			dwHotFlag = 1,--热卖
			dwDiscount = 1,--折扣
		};
		{
			dwID = 2;							
			dwEnumID = 5809265,	--坐骑资质抢购礼盒*5
			dwNumber = 5,						
			dwPriceType = 1,					
			dwPrice = 38,						
			dwBindType = 1,						
			dwHotFlag = 1,--热卖
			dwDiscount = 1,--折扣
		};
		{
			dwID = 3;							
			dwEnumID = 6300461,	--九花玉露丸抢购包*5
			dwNumber = 5,						
			dwPriceType = 1,					
			dwPrice = 38,						
			dwBindType = 1,						
			dwHotFlag = 1,--热卖
			dwDiscount = 1,--折扣	
		};
		{
			dwID = 4;							
			dwEnumID = 6300464, -- 真气抢购包*1
			dwNumber = 1,						
			dwPriceType = 1,					
			dwPrice = 1,						
			dwBindType = 1,						
			dwHotFlag = 1,--热卖
			dwDiscount = 1,--折扣	
		};
	};
	
	[11] = 
	{
		{
			dwID = 1;							
			dwEnumID = 6300453,	--剑魂石抢购包*5
			dwNumber = 5,						
			dwPriceType = 1,					
			dwPrice = 58,						
			dwBindType = 1,
			dwHotFlag = 1,--热卖
			dwDiscount = 1,--折扣
		};
		{
			dwID = 2;							
			dwEnumID = 6300458,	--剑气石抢购包*1
			dwNumber = 1,						
			dwPriceType = 1,					
			dwPrice = 88,						
			dwBindType = 1,						
			dwHotFlag = 1,--热卖
			dwDiscount = 1,--折扣
		};
		{
			dwID = 3;							
			dwEnumID = 6300461,	--九花玉露丸抢购包*5
			dwNumber = 5,						
			dwPriceType = 1,					
			dwPrice = 28,						
			dwBindType = 1,						
			dwHotFlag = 1,--热卖
			dwDiscount = 1,--折扣	
		};
		{
			dwID = 4;							
			dwEnumID = 6300464, -- 真气抢购包*1
			dwNumber = 1,						
			dwPriceType = 1,					
			dwPrice = 1,						
			dwBindType = 1,						
			dwHotFlag = 1,--热卖
			dwDiscount = 1,--折扣	
		};
	};
	[12] = 
	{
		{
			dwID = 1;							
			dwEnumID = 6300453,	--剑魂石抢购包*5
			dwPriceType = 1,					
			dwPrice = 58,						
			dwBindType = 1,
			dwHotFlag = 1,--热卖
			dwDiscount = 1,--折扣
            dwLength = -1
		};
		{
			dwID = 2;							
			dwEnumID = 6300458,	--剑气石抢购包*1
			dwPriceType = 1,					
			dwPrice = 88,						
			dwBindType = 1,						
			dwHotFlag = 1,--热卖
			dwDiscount = 1,--折扣
            dwLength = -1
		};
		{
			dwID = 3;							
			dwEnumID = 6300461,	--九花玉露丸抢购包*5
			dwPriceType = 1,					
			dwPrice = 28,						
			dwBindType = 1,						
			dwHotFlag = 1,--热卖
			dwDiscount = 1,--折扣	
            dwLength = -1
		};
		{
			dwID = 4;							
			dwEnumID = 6300464, -- 真气抢购包*1
			dwPriceType = 1,					
			dwPrice = 1,						
			dwBindType = 1,						
			dwHotFlag = 1,--热卖
			dwDiscount = 1,--折扣	
            dwLength = -1
		};
	};
};
