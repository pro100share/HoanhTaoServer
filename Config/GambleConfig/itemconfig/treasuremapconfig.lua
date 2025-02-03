﻿--定义地图、等级_G.Mine_News.MapLevel = {		--常规场景		Rule = {			[10] = {1002,1003};			[20] = {1004};			[30] = {1005};			[40] = {1006};			[50] = {1007};			[60] = {1008};			[70] = {1009};			[80] = {1010};		};		--副本、活动场景		Special = {		--	[20] = {5071};		--	[25] = {5030};		--	[30] = {8001,8002,8003,8004,8005,8006,8007,8008,8009};		--	[40] = {5070,5004};			[45] = {8050};--5005			--[50] = {5050,5006};			[55] = {8051};--,5072,5007,5008			-- [60] = {5009};			-- [65] = {5010,5011};			-- [70] = {5012};			-- [80] = {5014};			-- [90] = {5015,5016};			[70] = {8052};--,5072,5007,5008		};};function _G.Mine_News.Belong(Mpa)	local Name = ""	if (Mpa >= 1001 and Mpa <= 1010) then		Name = T"常规地图"	elseif (Mpa >=8001 and Mpa <= 8009) then		Name = T"龙鼎战（活动）"	elseif (Mpa >=5004 and Mpa <= 5016) then		Name = T"大破联营（副本）"	elseif (Mpa >=8050 and Mpa <= 8052) then		Name = T"恶人谷（活动）"	elseif (Mpa == 5071) then		Name = T"演武节堂（副本）"	elseif (Mpa == 5030) then		Name = T"珍珑棋局（副本）"	elseif (Mpa == 5070) then		Name = T"烽火辎路（副本）"	elseif (Mpa == 5072) then			Name = T"守卫襄阳（副本）"	elseif (Mpa == 5050) then		Name = T"五行道场（副本）"	end	return Nameend--怪物库_G.Mine_News.MonsterDeploy = {	{MonsterId = 20003001,FightId = 20002001,AiId = 10012001,DropId = 20002001,Look = 100920060};	{MonsterId = 20003003,FightId = 20002003,AiId = 10012001,DropId = 20002003,Look = 100410031};	{MonsterId = 20003004,FightId = 20002004,AiId = 10012001,DropId = 20002004,Look = 100510030};	{MonsterId = 20003005,FightId = 20002005,AiId = 10012001,DropId = 20002005,Look = 100610010};	{MonsterId = 20003006,FightId = 20002006,AiId = 10012001,DropId = 20002006,Look = 100710070};};--buff库--ID =BUFFID Base=作用基数  period=生命周期基数_G.Mine_News.buff  = {	--演武真气	{Id = 196000,Base = 20,period = 1800};	--移动速度	{Id = 190001,Base = 30,period = 1800};	--身法	{Id = 191000,Base = 10,period = 1800};	--暴击	{Id = 192000,Base = 10,period = 1800};	--经验	{Id = 193000,Base = 20,period = 1800};	--BOSS伤害	{Id = 194000,Base = 20,period = 1800};	--技能等级	{Id = 195000,Base = 2,period = 1800};	};	--藏宝图坐标_G.Mine_News.Coordinate_Library ={	-- [1001] = {			-- {x=-52.95,y=-40.96},			-- {x=-91.8,y=-32.14},			-- {x=-96.88,y=-18.63},			-- {x=-39.3,y=69.0},			-- {x=-74.65,y=33.23},			-- {x=-69.74,y=47.16},			-- {x=-59.24,y=59.20},			-- {x=-53.8,y=34.86},			-- {x=40.18,y=-26.8},			-- {x=49.57,y=-14.21},			-- {x=51.27,y=7.8},			-- {x=59.17,y=-69.47},			-- {x=84.59,y=-25.41},			-- {x=78.42,y=-7.81},			-- {x=29.56,y=-72.37},			-- {x=20.91,y=-62.46},			-- {x=27.57,y=31.64},			-- {x=45.16,y=26.30},			-- {x=47.18,y=66.31},			-- {x=31.15,y=-1.30},			-- {x=24.93,y=-21.86},			-- {x=6.79,y=42.73},			-- {x=-43.14,y=51.9},			-- {x=-34.17,y=33.9},			-- {x=-6.76,y=-48.49},			-- {x=-37.15,y=-45.29},			-- {x=-48.72,y=-8.0},			-- {x=-85.14,y=20.93},			-- {x=-65.40,y=17.1},			-- {x=-26.79,y=-20.56},		-- };	[1002] = {			{x=111.39,y=21.34},			{x=72.65,y=21.77},			{x=58.00,y=20.47},			{x=60.00,y=0.83},			{x=59.41,y=-24.70},			{x=56.79,y=-47.01},			{x=17.66,y=-63.05},			{x=-3.62,y=-59.68},			{x=-3.09,y=-122.76},			{x=-3.06,y=-17.45},			{x=16.92,y=19.55},			{x=27.43,y=19.22},			{x=-62.46,y=20.59},			{x=-100.29,y=20.37},			{x=-68.50,y=51.93},			{x=-113.88,y=19.32},			{x=-98.60,y=2.17},			{x=-3.66,y=41.63},			{x=34.00,y=-45.73},			{x=-29.84,y=-124.03},			{x=-23.97,y=1.92},			{x=-52.20,y=-4.52},			{x=-99.54,y=0.41},			{x=-108.43,y=52.23},			{x=-97.02,y=47.42},			{x=-56.05,y=34.79},			{x=-62.63,y=69.77},			{x=87.81,y=4.83},			{x=62.93,y=-47.11},			{x=16.60,y=9.02},		};	[1003] = {			{x=51.99,y=97.74},			{x=46.27,y=53.18},			{x=-9.52,y=85.98},			{x=-6.28,y=46.5},			{x=17.54,y=60.39},			{x=-79.10,y=41.4},			{x=-100.6,y=43.35},			{x=-16.5,y=-5.94},			{x=-96.51,y=-15.90},			{x=-70.29,y=-60.8},			{x=-92.79,y=-56.12},			{x=-56.28,y=-78.21},			{x=-5.10,y=-42.1},			{x=-8.85,y=-84.48},			{x=26.86,y=-60.13},			{x=84.92,y=-22.50},			{x=78.86,y=-7.2},			{x=44.1,y=-19.4},			{x=36.44,y=-78.24},			{x=21.89,y=-24.90},			{x=-16.28,y=-64.79},			{x=58.2,y=64.2},			{x=-41.13,y=-14.61},			{x=-83.31,y=13.99},			{x=-102.1,y=-76.34},			{x=4.56,y=-56.90},			{x=85.21,y=-91.51},			{x=50.65,y=-63.71},			{x=-69.52,y=-42.42},			{x=-59.1,y=14.70},		};	[1004] = {			{x=107.53,y=-26.20},			{x=67.5,y=-32.81},			{x=79.69,y=-11.63},			{x=66.42,y=92.88},			{x=69.40,y=63.95},			{x=83.32,y=62.13},			{x=82.87,y=78.1},			{x=77.48,y=45.19},			{x=38.43,y=48.30},			{x=-4.14,y=5.56},			{x=20.7,y=0.14},			{x=16.52,y=-25.82},			{x=18.20,y=-52.72},			{x=-0.29,y=-59.96},			{x=-9.99,y=-78.41},			{x=-15.70,y=-41.11},			{x=-93.74,y=-51.32},			{x=-49.93,y=32.13},			{x=-45.96,y=2.97},			{x=-95.71,y=11.63},			{x=-78.98,y=21.1},			{x=-61.51,y=8.92},			{x=-57.41,y=40.14},			{x=-94.50,y=27.28},			{x=-93.26,y=87.47},			{x=-70.55,y=58.32},			{x=-76.91,y=82.64},			{x=-55.2,y=80.37},			{x=94.26,y=-55.98},			{x=23.79,y=-91.7},		};	[1005] = {			{x=3.28,y=36.85},			{x=-47.10,y=36.92},			{x=-45.57,y=21.35},			{x=-5.12,y=26.34},			{x=-44.0,y=0.25},			{x=-28.43,y=-15.80},			{x=-27.89,y=-5.51},			{x=-5.68,y=7.97},			{x=15.72,y=-7.5},			{x=20.67,y=-20.66},			{x=42.51,y=-17.63},			{x=37.57,y=-9.0},			{x=15.37,y=6.98},			{x=27.25,y=29.33},			{x=30.91,y=16.0},			{x=-48.91,y=-22.38},			{x=13.24,y=-31.90},			{x=2.76,y=-47.55},			{x=-19.41,y=-55.24},			{x=-38.47,y=-16.44},			{x=-38.65,y=-40.65},			{x=19.47,y=-50.30},			{x=-14.80,y=-30.36},			{x=29.25,y=-7.64},			{x=-35.79,y=0.26},			{x=28.66,y=-21.79},			{x=-10.85,y=-21.42},			{x=-9.57,y=46.59},			{x=-2.53,y=-31.32},			{x=6.52,y=9.15},		};	[1006] = {			{x=-30.24,y=-104.35},			{x=-91.72,y=-83.62},			{x=-78.50,y=-82.90},			{x=-62.95,y=-56.65},			{x=-36.22,y=-20.73},			{x=-66.99,y=-20.17},			{x=-82.13,y=-1.53},			{x=3.1,y=-65.15},			{x=-8.37,y=22.74},			{x=91.53,y=0.69},			{x=72.50,y=10.14},			{x=44.1,y=29.95},			{x=54.90,y=99.87},			{x=22.8,y=100.44},			{x=30.19,y=64.22},			{x=32.89,y=92.83},			{x=37.20,y=83.30},			{x=-20.27,y=108.75},			{x=-13.65,y=54.72},			{x=-66.54,y=100.9},			{x=-59.76,y=65.77},			{x=-93.48,y=101.64},			{x=34.27,y=-75.22},			{x=53.40,y=-82.29},			{x=44.81,y=20.3},			{x=17.53,y=19.98},			{x=-36.5,y=72.3},			{x=56.55,y=-5.82},			{x=26.11,y=-40.51},			{x=-109.0,y=-56.73},		};	[1007] = {			{x=-31.74,y=84.97},			{x=4.36,y=50.98},			{x=-14.54,y=37.13},			{x=-44.22,y=33.19},			{x=-69.55,y=78.61},			{x=-10.84,y=87.43},			{x=16.57,y=79.85},			{x=14.81,y=57.95},			{x=-56.11,y=66.64},			{x=-26.6,y=34.74},			{x=-74.49,y=60.57},			{x=-67.17,y=42.79},			{x=-65.67,y=17.52},			{x=-90.29,y=15.70},			{x=-87.47,y=-8.22},			{x=-69.92,y=-55.40},			{x=-46.35,y=-81.65},			{x=21.24,y=-13.41},			{x=13.59,y=3.99},			{x=85.21,y=59.98},			{x=63.34,y=55.47},			{x=74.98,y=-37.41},			{x=62.41,y=-34.22},			{x=44.66,y=-49.1},			{x=31.42,y=-98.93},			{x=1.39,y=-103.7},			{x=-20.2,y=-77.47},			{x=-38.20,y=-74.3},			{x=-66.56,y=-105.25},			{x=-50.67,y=88.14},		};	[1008] = {			{x=-78.93,y=7.14,};			{x=-60.75,y=9.75,};			{x=-50.70,y=-23.74,};			{x=-57.85,y=-47.33,};			{x=-94.40,y=47.61,};			{x=-26.44,y=4.3,};			{x=2.16,y=-39.10,};			{x=-28.99,y=-59.72,};			{x=81.24,y=76.22,};			{x=19.87,y=47.38,};			{x=17.33,y=66.52,};			{x=31.88,y=-83.58,};			{x=80.63,y=-45.93,};			{x=80.65,y=-10.34,};			{x=84.01,y=48.81,};			{x=-5.31,y=38.33,};			{x=-51.25,y=61.85,};			{x=22.99,y=-4.74,};			{x=79.41,y=-83.2,};			{x=49.36,y=-14.82,};			{x=10.59,y=-67.57,};			{x=-31.7,y=-28.24,};			{x=0.49,y=-9.84,};			{x=-55.87,y=-75.32,};			{x=-103.61,y=-18.66,};			{x=-87.38,y=-34.52,};			{x=-73.10,y=35.0,};		};			[1009] = {			{x=73.56,y=-11.37,};			{x=31.46,y=39.35,};			{x=44.79,y=0.11,};			{x=-72.12,y=50.34,};			{x=-53.88,y=44.64,};			{x=-82.53,y=-63.47,};			{x=13.77,y=-37.3,};			{x=39.71,y=-66.45,};			{x=-4.90,y=-88.99,};			{x=-69.90,y=-83.25,};			{x=-32.23,y=-57.47,};			{x=-74.4,y=-39.56,};			{x=-51.80,y=-29.35,};			{x=-16.11,y=69.44,};			{x=-71.45,y=65.35,};			{x=-77.32,y=19.8,};			{x=-43.92,y=12.19,};			{x=49.69,y=24.85,};			{x=84.88,y=-23.67,};			{x=83.12,y=-59.86,};			{x=60.55,y=-27.62,};			{x=-5.15,y=-28.3,};			{x=-27.2,y=-84.2,};			{x=-2.97,y=-60.48,};			{x=-26.87,y=22.65,};			{x=-4.89,y=-1.76,};			{x=-8.51,y=43.69,};			{x=53.63,y=-9.51,};			{x=24.24,y=0.39,};		};				[1010] = {			{x=-103.88,y=11.41,};			{x=-112.30,y=-30.16,};			{x=-88.7,y=-41.5,};			{x=-69.77,y=-75.7,};			{x=-99.14,y=-69.64,};			{x=-77.81,y=-98.56,};			{x=-53.53,y=-99.58,};			{x=-23.52,y=-85.96,};			{x=-15.99,y=-107.32,};			{x=-11.29,y=-66.18,};			{x=-34.60,y=-49.25,};			{x=-28.71,y=50.14,};			{x=-53.92,y=46.22,};			{x=-80.93,y=50.32,};			{x=-62.83,y=88.15,};			{x=-82.80,y=74.68,};			{x=-38.16,y=91.39,};			{x=-6.57,y=88.85,};			{x=28.6,y=50.22,};			{x=32.43,y=30.84,};			{x=58.27,y=9.84,};			{x=80.44,y=-31.89,};			{x=72.65,y=-6.48,};			{x=21.34,y=83.50,};			{x=84.15,y=27.60,};			{x=1.59,y=115.48,};			{x=75.17,y=54.25,};			{x=57.36,y=53.21,};			{x=-38.33,y=-3.95,};			{x=9.42,y=-104.86,};		};					[8050] = {			{x=-2.72,y=-26.2,};			{x=-13.86,y=-23.79,};			{x=24.7,y=3.18,};			{x=-11.73,y=-14.69,};			{x=-4.80,y=-8.17,};			{x=-9.5,y=-3.17,};			{x=3.58,y=7.85,};			{x=-14.76,y=6.22,};			{x=-6.33,y=5.57,};			{x=11.28,y=14.1,};			{x=-22.81,y=-19.26,};			{x=-3.80,y=-19.66,};			{x=17.54,y=20.92,};			{x=24.89,y=25.60,};			{x=29.25,y=17.20,};			{x=30.61,y=9.26,};			{x=19.68,y=11.75,};		};	[8051] = {			{x=-25.71,y=-21.86,};			{x=-10.1,y=-36.95,};			{x=-33.60,y=-29.47,};			{x=3.91,y=-8.86,};			{x=-15.34,y=6.78,};			{x=-11.43,y=16.67,};			{x=-1.19,y=20.60,};			{x=-6.24,y=32.8,};			{x=-30.61,y=5.67,};			{x=-19.27,y=-2.31,};			{x=-19.26,y=27.56,};			{x=-33.52,y=-4.50,};			{x=-23.52,y=-29.50,};			{x=-34.52,y=-13.50,};		};	[8052] = {			{x=27.51,y=-40.81,};			{x=42.47,y=-48.62,};			{x=-3.41,y=-23.77,};			{x=-32.2,y=-14.84,};			{x=-30.40,y=-4.70,};			{x=-20.69,y=20.42,};			{x=-31.0,y=8.1,};			{x=-44.94,y=5.99,};			{x=-69.52,y=45.38,};			{x=-59.56,y=9.12,};			{x=-69.95,y=30.10,};			{x=-18.31,y=-14.29,};			{x=-18.72,y=41.47,};			{x=-6.54,y=46.65,};		};	[8001] = {		{x=0.25,y=-17.90,},		{x=20.56,y=-3.40,},		{x=4.20,y=16.21,},		{x=-14.36,y=10.36,},		{x=9.40,y=-4.6,},		{x=-3.3,y=22.96,},		{x=-14.6,y=-22.92,},		{x=-18.19,y=-7.0,},		{x=10.91,y=-17.33,},		{x=-0.36,y=-0.4,},		};	[8002] = {		{x=17.17,y=3.74,},		{x=7.10,y=-7.55,},		{x=-2.24,y=-24.68,},		{x=-18.74,y=-21.90,},		{x=-19.43,y=-5.96,},		{x=-20.97,y=12.68,},		{x=-17.17,y=21.26,},		{x=-0.41,y=19.87,},		{x=3.30,y=7.73,},		{x=-4.70,y=-10.95,},		};	[8003] = {		{x=23.58,y=-9.42,},		{x=22.95,y=5.43,},		{x=14.82,y=25.5,},		{x=2.44,y=22.65,},		{x=-14.68,y=12.53,},		{x=-20.11,y=3.6,},		{x=-24.3,y=-10.45,},		{x=-0.12,y=-16.15,},		{x=-1.20,y=-23.91,},		{x=8.83,y=2.34,},		};	[8004] = {		{x=20.91,y=-19.51,},		{x=23.83,y=1.71,},		{x=14.94,y=11.29,},		{x=1.87,y=10.59,},		{x=-29.28,y=6.80,},		{x=1.57,y=-21.43,},		{x=0.57,y=-11.29,},		{x=-10.74,y=9.45,},		{x=-16.48,y=-16.92,},		{x=0.13,y=1.17,},		};	[8005] = {		{x=23.67,y=12.90,},		{x=23.64,y=-19.69,},		{x=0.53,y=-13.46,},		{x=7.81,y=6.82,},		{x=-37.56,y=13.35,},		{x=-29.24,y=-11.15,},		{x=-15.0,y=-24.57,},		{x=-24.71,y=24.58,},		{x=-4.94,y=22.0,},		{x=16.51,y=29.50,},		};	[8006] = {		{x=26.18,y=29.14,},		{x=6.13,y=34.24,},		{x=-7.66,y=30.86,},		{x=-15.85,y=7.46,},		{x=-8.8,y=-18.70,},		{x=-5.67,y=-34.25,},		{x=30.16,y=11.11,},		{x=16.64,y=-17.6,},		{x=-3.57,y=17.75,},		{x=12.15,y=2.43,},		};	[8007] = {		{x=-5.88,y=-20.79,},		{x=20.17,y=-15.29,},		{x=27.27,y=1.19,},		{x=12.37,y=24.91,},		{x=-0.90,y=26.4,},		{x=1.34,y=15.45,},		{x=-22.15,y=14.81,},		{x=-20.32,y=1.48,},		{x=-23.71,y=-15.30,},		{x=10.48,y=-6.80,},		};	[8008] = {		{x=-20.93,y=0.44,},		{x=-7.88,y=6.65,},		{x=1.4,y=7.32,},		{x=1.24,y=20.62,},		{x=31.19,y=-4.24,},		{x=19.15,y=0.46,},		{x=25.42,y=-12.37,},		{x=-2.83,y=-13.76,},		{x=-23.94,y=-13.10,},		{x=-8.45,y=22.24,},		};	[8009] = {		{x=24.58,y=3.43,},		{x=23.44,y=-7.59,},		{x=3.53,y=-21.40,},		{x=-3.34,y=-31.77,},		{x=-18.35,y=-2.34,},		{x=-29.80,y=-1.61,},		{x=-20.38,y=12.36,},		{x=-10.78,y=22.85,},		{x=7.71,y=26.6,},		{x=14.63,y=4.19,},		};	--副本相关坐标	--演武	[5071] = {		{x=-28.75,y=-1.4},		{x=-23.0,y=11.5},		{x=-8.51,y=24.68},		{x=10.1,y=24.64},		{x=26.20,y=14.92},		{x=25.58,y=-8.67},		{x=13.83,y=-24.23},		{x=-1.2,y=-29.98},		{x=17.11,y=7.66},		{x=12.11,y=-0.94},		{x=0.85,y=13.15},		{x=-10.96,y=-1.19},	};	--真龙棋局	[5030] = {   		{x=-26.65,y=-40.7},		{x=-35.17,y=-32.67},		{x=-31.97,y=-20.6},		{x=-30.20,y=-10.65},		{x=-35.5,y=-2.55},		{x=-19.81,y=-2.70},		{x=-6.70,y=-10.80},		{x=-10.40,y=-31.13},		{x=-22.33,y=-36.55},		{x=-8.53,y=-41.79},	};	--大破联营	--(1/13)	[5004] = {		{x=-26.94,y=-46.82},		{x=-21.58,y=-34.23},		{x=-32.12,y=-20.18},		{x=-20.25,y=-18.1},		{x=-35.40,y=0.0},		{x=-22.85,y=8.81},		{x=-7.57,y=10.71},		{x=26.24,y=-3.41},		{x=10.91,y=8.5},		{x=16.55,y=-18.85},		{x=3.88,y=-16.80},		{x=5.55,y=-29.6},		{x=18.63,y=-28.20},		{x=18.63,y=-28.20},		{x=-9.66,y=-6.2},	};	--[5005] = --(2/13)  地图有bug	[5005] = {			{x=14.11,y=7.28},			{x=19.23,y=0.57},			{x=24.93,y=-5.12},			{x=18.19,y=-19.97},			{x=-21.96,y=9.20},			{x=-28.95,y=4.55},			{x=-21.19,y=-14.52},			{x=-20.80,y=-27.18},			{x=-20.68,y=-36.3},			{x=-33.61,y=-13.3},	};	--(3/13)	[5006] = {  		{x=5.63,y=19.55},		{x=-3.41,y=6.87},		{x=-14.61,y=-8.97},		{x=-20.44,y=3.5},		{x=-22.54,y=-13.53},		{x=-6.86,y=-23.49},		{x=10.54,y=-14.75},		{x=6.41,y=-5.18},		{x=17.36,y=5.19},		{x=-8.15,y=17.7},	};	--(4/13)  	[5007] = {		{x=-12.9,y=-10.22},		{x=-21.65,y=-15.99},		{x=-18.97,y=5.1},		{x=-13.33,y=14.46},		{x=12.0,y=18.91},		{x=-0.61,y=5.2},		{x=16.1,y=8.46},		{x=11.10,y=-11.81},		{x=1.12,y=-10.11},		{x=-2.53,y=-21.3},	};	--(5/13)	[5008] = {  		{x=-10.96,y=-23.76},		{x=-1.33,y=-17.45},		{x=-3.50,y=2.87},		{x=-17.29,y=2.5},		{x=-14.78,y=-10.6},		{x=-24.24,y=-12.59},		{x=-2.40,y=-8.37},	};	--(6/13) 	[5009] = {		{x=-21.55,y=-33.64},		{x=-23.50,y=-19.97},		{x=-32.71,y=-19.18},		{x=-33.14,y=-6.12},		{x=-28.58,y=3.64},		{x=-13.95,y=11.32},		{x=10.54,y=12.75},		{x=18.68,y=-11.50},		{x=18.37,y=-0.92},		{x=18.17,y=-27.74},		{x=6.68,y=-20.25},		{x=-34.30,y=-39.2},	};	--[5010] = --(7/13)地图有bug	[5010] = {		{x=9.53,y=-24.50},		{x=18.15,y=-12.70},		{x=1.3,y=-4.92},		{x=12.83,y=3.75},		{x=24.17,y=-7.58},		{x=-16.94,y=9.25},		{x=-24.50,y=-4.1},		{x=-21.91,y=-21.45},		{x=-34.33,y=-36.79},		{x=-21.8,y=-37.38},	};	--(8/13)	[5011] = {		{x=18.68,y=16.84},		{x=10.93,y=16.97},		{x=17.32,y=-6.5},		{x=11.21,y=-12.57},		{x=-8.97,y=-15.10},		{x=4.73,y=-5.83},		{x=-5.3,y=0.72},		{x=-3.22,y=12.63},		{x=-18.91,y=-4.60},		{x=-20.67,y=-14.99},	};	--(9/13)	[5012] = {		{x=15.15,y=7.47},		{x=13.40,y=-5.35},		{x=8.86,y=-13.88},		{x=-0.34,y=-8.87},		{x=-6.78,y=3.33},		{x=-0.25,y=11.28},		{x=16.18,y=19.29},		{x=-10.55,y=13.95},		{x=-17.31,y=-5.77},		{x=-3.30,y=-20.72},	};	--(10/13)	[5013] = {		{x=-0.7,y=-4.80},		{x=-1.61,y=-17.25},		{x=-9.16,y=-14.73},		{x=-7.81,y=-7.7},		{x=-17.86,y=-17.24},		{x=-16.87,y=-22.15},		{x=-21.72,y=0.48},		{x=-10.0,y=3.38},	};	--(11/13)	[5014] = {		{x=23.34,y=-5.75},		{x=14.24,y=-19.91},		{x=9.90,y=-27.85},		{x=3.8,y=-5.6},		{x=10.84,y=8.73},		{x=-5.58,y=8.1},		{x=-21.57,y=7.91},		{x=-32.25,y=-3.58},		{x=-24.33,y=-24.32},		{x=-31.69,y=-31.74},		{x=-23.35,y=-40.74},	};	--(12/13)	[5015] = {		{x=-3.1,y=6.59},		{x=-1.2,y=-12.95},		{x=25.48,y=-2.72},		{x=14.94,y=-1.67},		{x=25.37,y=-29.49},		{x=-1.22,y=-36.12},		{x=-10.68,y=-15.1},		{x=-10.23,y=7.71},		{x=-12.74,y=23.0},		{x=-34.99,y=16.85},		{x=-27.59,y=24.31},		{x=-34.30,y=6.15},		{x=-34.42,y=-1.18},		{x=-38.66,y=-20.17},		{x=-24.7,y=-20.99},	};	--(13/13)	[5016] = {		{x=16.81,y=10.18},		{x=4.56,y=15.29},		{x=-3.33,y=5.32},		{x=-13.80,y=12.61},		{x=-15.83,y=2.46},		{x=-14.35,y=-9.78},		{x=-2.89,y=-22.28},		{x=8.74,y=-13.69},		{x=13.18,y=-0.14},		{x=-19.43,y=-14.35},		{x=-10.87,y=-25.16},	};	--烽火	[5070] = {		{x=31.4,y=8.88},		{x=11.20,y=9.95},		{x=16.54,y=43.69},		{x=8.90,y=1.15},		{x=-5.7,y=45.52},		{x=-19.22,y=37.0},		{x=-4.28,y=-3.86},		{x=-18.36,y=-18.90},		{x=-5.87,y=-36.62},		{x=-4.15,y=-20.78},		{x=-29.50,y=-32.13},		{x=-42.61,y=-38.24},		{x=-46.25,y=7.80},		{x=-35.62,y=21.66},		{x=-20.93,y=19.49},	};	--五行	[5050] = {  		{x=-57.29,y=-35.55},		{x=-51.56,y=-6.97},		{x=-32.40,y=25.78},		{x=-7.11,y=25.28},		{x=20.11,y=14.87},		{x=21.92,y=-13.79},		{x=28.6,y=-42.30},		{x=1.28,y=-63.78},		{x=-29.78,y=-68.37},		{x=-45.31,y=-43.47},	};	--守卫襄阳	[5072] ={		{x=-55.41,y=10.51},		{x=-64.75,y=-8.72},		{x=-40.94,y=-10.45},		{x=-19.77,y=-16.75},		{x=-1.48,y=45.54},		{x=13.14,y=22.21},		{x=47.76,y=-9.31},		{x=47.49,y=7.7},		{x=40.99,y=-26.80},		{x=-4.84,y=-45.31},	};};