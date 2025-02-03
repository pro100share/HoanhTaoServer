--[[
	活动配置 脚本配置
	周长沙
	2013-5-15
--]]

_G.FestivalScript = {}
----------------------------------------------------
--冲榜类函数配置
_G.FestivalScript.RushCondition = {
};

--反馈类函数配置
_G.FestivalScript.BackCondition = {
	[FestivalBackTypeEnum.Mount] = {--坐骑
		fun = 2;--函数索引
	};
	[FestivalBackTypeEnum.Sword] = {--名剑
		fun = 3;--函数索引
	};
	[FestivalBackTypeEnum.Amulet] = {--宝甲
		fun = 4;--函数索引
	};
	[FestivalBackTypeEnum.Bourn] = {--实战
		fun = 5;--函数索引
	};
	[FestivalBackTypeEnum.Practice]={ --修行
		fun = 6;
	};
	[FestivalBackTypeEnum.KungFu]={ --易筋经
		fun = 7;
	};
	[FestivalBackTypeEnum.MegaKill]={ --血魔功
		fun = 8;
	};

};

--其他类函数配置
_G.FestivalScript.OtherCondition = {
};





















