--荣誉商城配置
_G.CSHonorShopConfig = {
		--荣誉商城所需要的物品：ItemList有两张表，【1】是常用类表，【2】是变强类表。
		--每张表有3个参数：物品ID，用荣誉值购买时的单价，绑定类型
		ItemList = {
				[1] = {
					{ItemID = 9701013 ,price = 1888, dwBindType=1},
					{ItemID = 9701014 ,price = 1888, dwBindType=1},
					{ItemID = 5121006, price = 38000, dwBindType=1},
					{ItemID = 5131006 ,price = 38000, dwBindType=1},
					{ItemID = 5141006 ,price = 38000, dwBindType=1},
					{ItemID = 5151006 ,price = 38000, dwBindType=1},
					{ItemID = 9405044 ,price = 400, dwBindType=1},
					{ItemID = 9405045 ,price = 800, dwBindType=1},
					{ItemID = 9405046, price = 800, dwBindType=1},
					{ItemID = 9405047 ,price = 800, dwBindType=1},
					{ItemID = 9405048 ,price = 800, dwBindType=1},
					{ItemID = 4100170 ,price = 800, dwBindType=1},
					{ItemID = 4100450 ,price = 800, dwBindType=1},
					};
	
				[2] = {
                    {ItemID = 4100420 ,price = 88, dwBindType=1},
					{ItemID = 4100448 ,price = 500, dwBindType=1},
					{ItemID = 4100440 ,price = 500, dwBindType=1},
					{ItemID = 4100444 ,price = 500, dwBindType=1},
					{ItemID = 5809367 ,price = 500, dwBindType=1},
					{ItemID = 4100443 ,price = 800, dwBindType=1},
					{ItemID = 4100441, price = 800, dwBindType=1},
					{ItemID = 5809368 ,price = 800, dwBindType=1},
					{ItemID = 4100400 ,price = 1500, dwBindType=1},
					{ItemID = 5809687 ,price = 28000, dwBindType=1},					
					};
				};
		--无法购买时的提示信息
		Text = {
					--当前荣誉值不足以购买物品
					[1] = "您的荣誉值不足，无法兑换",
					--当前背包数不能放下购买物品的数量
					[2] = "背包空间不足,请整理您的背包",
					--当购买的数量是0或者nil时候
					[3] = "兑换数量不能小于1",
					--当荣誉值大于999999999时，提示说明
					[4] = "荣誉值最大获取限制为999999999",
					--荣誉商场单价界面，在%前面添加图标
					[5] = "现价:<img src = 'img://rongyuxiao.png'>%s",
			
			};
		--当前荣誉值label的tips
		Tips = {
					[1] = "您的当前荣誉值",		
				};
		--获取荣誉单价的函数
		GetItemPrice = function(dwItemID,dwIndex)
			local ItemList = CSHonorShopConfig.ItemList[dwIndex]
			 for key,value in pairs(ItemList) do
				if value.ItemID == dwItemID then
					return value.price, value.dwBindType;
				end
			 end
			return nil
		end;
};