--罐子消息配置
_G.PotMsgConfig = 
{
	Open = 1,
	NoHammer = 2,
	OpenSure = 3,
	Complete = 4,
	GetSuccess = 5,
	--摇之后的判断
	NoPack = 6,
	NoPot = 7,
	--摇之前的判断
	NoPacket = 8,
	
	Interrupt = 9, --中断当前
}



----------------------------
----------------------------
--罐子配置
_G.PotConfig = 
{
	StepConfig = 
	{
		--dwLevelTop等级上限
		--dwLevelBottom等级下限
		--Group 物品组，
			--dwGroupNum 集合组ID
			--dwPerValue 物品组抽中概率
			--[[
		[5500120] = 
		{
			[1] = {dwLevelTop = 20,dwLevelBottom = 1,Group = {[1] = {dwGroupNum = 910201,dwPerValueBottom = 1,dwPerValueTop = 60},[2] = {dwGroupNum = 910202,dwPerValueBottom = 61,dwPerValueTop = 95},[3] = {dwGroupNum = 910203,dwPerValueBottom = 96,dwPerValueTop = 100},},},
			[2] = {dwLevelTop = 40,dwLevelBottom = 21,Group = {[1] = {dwGroupNum = 910401,dwPerValueBottom = 1,dwPerValueTop = 60},[2] = {dwGroupNum = 910402,dwPerValueBottom = 61,dwPerValueTop = 95},[3] = {dwGroupNum = 910403,dwPerValueBottom = 96,dwPerValueTop = 100},},},
			[3] = {dwLevelTop = 60,dwLevelBottom = 41,Group = {[1] = {dwGroupNum = 910601,dwPerValueBottom = 1,dwPerValueTop = 60},[2] = {dwGroupNum = 910602,dwPerValueBottom = 61,dwPerValueTop = 95},[3] = {dwGroupNum = 910603,dwPerValueBottom = 96,dwPerValueTop = 100},},},
			[4] = {dwLevelTop = 80,dwLevelBottom = 61,Group = {[1] = {dwGroupNum = 910801,dwPerValueBottom = 1,dwPerValueTop = 60},[2] = {dwGroupNum = 910802,dwPerValueBottom = 61,dwPerValueTop = 95},[3] = {dwGroupNum = 910803,dwPerValueBottom = 96,dwPerValueTop = 100},},},
			[5] = {dwLevelTop = 100,dwLevelBottom = 81,Group = {[1] = {dwGroupNum = 911001,dwPerValueBottom = 1,dwPerValueTop = 60},[2] = {dwGroupNum = 911002,dwPerValueBottom = 61,dwPerValueTop = 95},[3] = {dwGroupNum = 911003,dwPerValueBottom = 96,dwPerValueTop = 100},},},
		},
		[5500130] = 
		{
			[1] = {dwLevelTop = 20,dwLevelBottom = 1,Group = {[1] = {dwGroupNum = 920201,dwPerValueBottom = 1,dwPerValueTop = 50},[2] = {dwGroupNum = 920202,dwPerValueBottom = 51,dwPerValueTop = 90},[3] = {dwGroupNum = 920203,dwPerValueBottom = 91,dwPerValueTop = 100},},},
			[2] = {dwLevelTop = 40,dwLevelBottom = 21,Group = {[1] = {dwGroupNum = 920401,dwPerValueBottom = 1,dwPerValueTop = 50},[2] = {dwGroupNum = 920402,dwPerValueBottom = 51,dwPerValueTop = 90},[3] = {dwGroupNum = 920403,dwPerValueBottom = 91,dwPerValueTop = 100},},},
			[3] = {dwLevelTop = 60,dwLevelBottom = 41,Group = {[1] = {dwGroupNum = 920601,dwPerValueBottom = 1,dwPerValueTop = 50},[2] = {dwGroupNum = 920602,dwPerValueBottom = 51,dwPerValueTop = 90},[3] = {dwGroupNum = 920603,dwPerValueBottom = 91,dwPerValueTop = 100},},},
			[4] = {dwLevelTop = 80,dwLevelBottom = 61,Group = {[1] = {dwGroupNum = 920801,dwPerValueBottom = 1,dwPerValueTop = 50},[2] = {dwGroupNum = 920802,dwPerValueBottom = 51,dwPerValueTop = 90},[3] = {dwGroupNum = 920803,dwPerValueBottom = 91,dwPerValueTop = 100},},},
			[5] = {dwLevelTop = 100,dwLevelBottom = 81,Group = {[1] = {dwGroupNum = 921001,dwPerValueBottom = 1,dwPerValueTop = 50},[2] = {dwGroupNum = 921002,dwPerValueBottom = 51,dwPerValueTop = 90},[3] = {dwGroupNum = 921003,dwPerValueBottom = 91,dwPerValueTop = 100},},},
		},
		[5500140] = 
		{
			[1] = {dwLevelTop = 20,dwLevelBottom = 1,Group = {[1] = {dwGroupNum = 930201,dwPerValueBottom = 1,dwPerValueTop = 40},[2] = {dwGroupNum = 930202,dwPerValueBottom = 41,dwPerValueTop = 84},[3] = {dwGroupNum = 930203,dwPerValueBottom = 85,dwPerValueTop = 100},},},
			[2] = {dwLevelTop = 40,dwLevelBottom = 21,Group = {[1] = {dwGroupNum = 930401,dwPerValueBottom = 1,dwPerValueTop = 40},[2] = {dwGroupNum = 930402,dwPerValueBottom = 41,dwPerValueTop = 84},[3] = {dwGroupNum = 930403,dwPerValueBottom = 85,dwPerValueTop = 100},},},
			[3] = {dwLevelTop = 60,dwLevelBottom = 41,Group = {[1] = {dwGroupNum = 930601,dwPerValueBottom = 1,dwPerValueTop = 40},[2] = {dwGroupNum = 930602,dwPerValueBottom = 41,dwPerValueTop = 84},[3] = {dwGroupNum = 930603,dwPerValueBottom = 85,dwPerValueTop = 100},},},
			[4] = {dwLevelTop = 80,dwLevelBottom = 61,Group = {[1] = {dwGroupNum = 930801,dwPerValueBottom = 1,dwPerValueTop = 40},[2] = {dwGroupNum = 930802,dwPerValueBottom = 41,dwPerValueTop = 84},[3] = {dwGroupNum = 930803,dwPerValueBottom = 85,dwPerValueTop = 100},},},
			[5] = {dwLevelTop = 100,dwLevelBottom = 81,Group = {[1] = {dwGroupNum = 931001,dwPerValueBottom = 1,dwPerValueTop = 40},[2] = {dwGroupNum = 931002,dwPerValueBottom = 41,dwPerValueTop = 84},[3] = {dwGroupNum = 931003,dwPerValueBottom = 85,dwPerValueTop = 100},},},
		},
		--]]
		--木罐
		[5500120] = 
		{
			[1] = {dwLevelTop = 20,dwLevelBottom = 1,Group = {[1] = {dwGroupNum = 900001,dwPerValueBottom = 1,dwPerValueTop = 50},},},
			
			[2] = {dwLevelTop = 40,dwLevelBottom = 21,Group = {[1] = {dwGroupNum = 900002,dwPerValueBottom = 1,dwPerValueTop = 100},},},
			[3] = {dwLevelTop = 60,dwLevelBottom = 41,Group = {[1] = {dwGroupNum = 900003,dwPerValueBottom = 1,dwPerValueTop = 100},},},
			[4] = {dwLevelTop = 80,dwLevelBottom = 61,Group = {[1] = {dwGroupNum = 900004,dwPerValueBottom = 1,dwPerValueTop = 100},},},
			[5] = {dwLevelTop = 100,dwLevelBottom = 81,Group = {[1] = {dwGroupNum = 900005,dwPerValueBottom = 1,dwPerValueTop = 100},},},
		},
		--银罐
		[5500130] = 
		{
			[1] = {dwLevelTop = 20,dwLevelBottom = 1,Group = {[1] = {dwGroupNum = 900006,dwPerValueBottom = 1,dwPerValueTop = 100},},},
			[2] = {dwLevelTop = 40,dwLevelBottom = 21,Group = {[1] = {dwGroupNum = 900007,dwPerValueBottom = 1,dwPerValueTop = 100},},},
			[3] = {dwLevelTop = 60,dwLevelBottom = 41,Group = {[1] = {dwGroupNum = 900008,dwPerValueBottom = 1,dwPerValueTop = 100},},},
			[4] = {dwLevelTop = 80,dwLevelBottom = 61,Group = {[1] = {dwGroupNum = 900009,dwPerValueBottom = 1,dwPerValueTop = 100},},},
			[5] = {dwLevelTop = 100,dwLevelBottom = 81,Group = {[1] = {dwGroupNum = 900010,dwPerValueBottom = 1,dwPerValueTop = 100},},},
		},
		--金罐
		[5500140] = 
		{
			[1] = {dwLevelTop = 20,dwLevelBottom = 1,Group = {[1] = {dwGroupNum = 900011,dwPerValueBottom = 1,dwPerValueTop = 100},},},
			[2] = {dwLevelTop = 40,dwLevelBottom = 21,Group = {[1] = {dwGroupNum = 900012,dwPerValueBottom = 1,dwPerValueTop = 100},},},
			[3] = {dwLevelTop = 60,dwLevelBottom = 41,Group = {[1] = {dwGroupNum = 900013,dwPerValueBottom = 1,dwPerValueTop = 100},},},
			[4] = {dwLevelTop = 80,dwLevelBottom = 61,Group = {[1] = {dwGroupNum = 900014,dwPerValueBottom = 1,dwPerValueTop = 100},},},
			[5] = {dwLevelTop = 100,dwLevelBottom = 81,Group = {[1] = {dwGroupNum = 900015,dwPerValueBottom = 1,dwPerValueTop = 100},},},
		},
		
		
	},
	TimeCount = 4500,--总共特效时间
	TimeOnce = 70,--图标切换时间
	PotNeedItemNum = 
	{----每次消耗
		[5500120] = 4,
		[5500130] = 4,
		[5500140] = 4,
	},
	PotEnumConfig = 
	{
		[1] = 5500120, --檀木罐
		[2] = 5500130, --白银罐
		[3] = 5500140, --黄金罐
	},
	HammerEnumConfig = 
	{
		[1] = 5500150,	--硬木锤
		[2] = 5500160,	--白银锤
		[3] = 5500170,	--黄金锤
	},
	PotTipsConfig = 
	{
		13001150001, -- "檀木罐",
		13001150002, -- "白银罐",
		13001150003, -- "黄金罐",
	}
	-- ItemConfig = 
	-- {
		-- --dwItemEnum 物品ID
		-- --dwItemNumber 物品数量
		-- --dwItemPercent 物品抽中成功率
		-- [1] = 
		-- {
			-- [1] = {dwItemEnum = 2300170,dwItemNumber = 1,dwItemPercent = 30000,},
			-- [2] = {dwItemEnum = 2300180,dwItemNumber = 1,dwItemPercent = 30000,},
			-- [3] = {dwItemEnum = 2300190,dwItemNumber = 1,dwItemPercent = 40000,},
		-- },
		-- [2] = 
		-- {
			-- [1] = {dwItemEnum = 2100010,dwItemNumber = 1,dwItemPercent = 30000,},
			-- [2] = {dwItemEnum = 2100020,dwItemNumber = 1,dwItemPercent = 30000,},
			-- [3] = {dwItemEnum = 2100030,dwItemNumber = 1,dwItemPercent = 40000,},
		-- },
		-- [3] = 
		-- {
			-- [1] = {dwItemEnum = 2200010,dwItemNumber = 1,dwItemPercent = 30000,},
			-- [2] = {dwItemEnum = 2200020,dwItemNumber = 1,dwItemPercent = 30000,},
			-- [3] = {dwItemEnum = 2200030,dwItemNumber = 1,dwItemPercent = 40000,},
		-- },
		-- [4] = 
		-- {
			-- [1] = {dwItemEnum = 2500010,dwItemNumber = 1,dwItemPercent = 30000,},
			-- [2] = {dwItemEnum = 2500030,dwItemNumber = 1,dwItemPercent = 30000,},
			-- [3] = {dwItemEnum = 2500040,dwItemNumber = 1,dwItemPercent = 40000,},
		-- },
		-- [5] = 
		-- {
			-- [1] = {dwItemEnum = 2500130,dwItemNumber = 1,dwItemPercent = 30000,},
			-- [2] = {dwItemEnum = 2500140,dwItemNumber = 1,dwItemPercent = 30000,},
			-- [3] = {dwItemEnum = 2500150,dwItemNumber = 1,dwItemPercent = 40000,},
		-- },
	-- },
}