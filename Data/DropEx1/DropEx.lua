
_G.DropExConfig = {
	[1] = {
		MonsterID = {};--怪物id,可写多个，空表则不执行此判断
		Type = {3};--类型,可写多个，空表则不执行此判断(0:普通;1:精英;2:boss;3:变异;)
		Level = {40,999};--等级区间 {1,99}--上限下限（包含）
		Map = {};--所在地图，可写多个，空表则不执行此判断
		
		dwDropID = 80040;--使用的掉落id
		
		Start = {--开始时间
			year = 2013;
			month = 10;
			day = 8;
			hour = 18;
			min = 0;
			sec = 0;
		};
		End = {--结束时间
			year = 2020;
			month = 10;
			day = 8;
			hour = 19;
			min = 0;
			sec = 0;
		};
	};
    [2] = {
		MonsterID = {};--怪物id,可写多个，空表则不执行此判断
		Type = {2};--类型,可写多个，空表则不执行此判断(0:普通;1:精英;2:boss;3:变异;)
		Level = {0,999};--等级区间 {1,99}--上限下限（包含）
		Map = {};--所在地图，可写多个，空表则不执行此判断
		
		dwDropID = 80045;--使用的掉落id
		
		Start = {--开始时间
			year = 2013;
			month = 10;
			day = 8;
			hour = 18;
			min = 0;
			sec = 0;
		};
		End = {--结束时间
			year = 2020;
			month = 10;
			day = 8;
			hour = 19;
			min = 0;
			sec = 0;
		};
	};
    [3] = {
		MonsterID = {};--怪物id,可写多个，空表则不执行此判断
		Type = {};--类型,可写多个，空表则不执行此判断(0:普通;1:精英;2:boss;3:变异;)
		Level = {0,999};--等级区间 {1,99}--上限下限（包含）
		Map = {1004};--所在地图，可写多个，空表则不执行此判断
		
		dwDropID = 80035;--使用的掉落id
		
		Start = {--开始时间
			year = 2013;
			month = 10;
			day = 8;
			hour = 18;
			min = 0;
			sec = 0;
		};
		End = {--结束时间
			year = 2020;
			month = 10;
			day = 8;
			hour = 19;
			min = 0;
			sec = 0;
		};
	};
}