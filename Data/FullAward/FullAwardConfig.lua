_G.FullAwardConfig = {
	reward = {
	--累积奖励
	[1] = {
		[1] = 1,
		-- [2] = 150,
		-- [3] = 200,
		-- [4] = 250,
		-- [5] = 350,
	},
	--单笔奖励
	-- [2] = {
		-- [1] = 20,
		-- [2] = 30,
		-- [3] = 50,
		-- [4] = 80,
		-- [5] = 100,
	-- },
	}
};

_G.FullAwardInfo = {
	[1] = {
		[1] = {
			afficheStr = "感谢<font color='#4daeed'>%s</font>大侠慷慨解囊，特此奉上<font color='#ff0f0f'>价值1888元宝</font><font color='#ff9910'>首充大礼</font>！", 	
			backPng = "ShouChong_188.png",
			awardItem = {
				[1] = {dwItemEnum = 11000211,dwItemNumber = 1, dwBindType = 1}, --40级紫色+10武器
				[2] = {dwItemEnum = 6500590,dwItemNumber = 1, dwBindType = 1},  ---半年Vip礼包
				[3] = {dwItemEnum = 5940008,dwItemNumber = 1, dwBindType = 1},  ---真气丹10万
				[4] = {dwItemEnum = 5920004,dwItemNumber = 1, dwBindType = 1},  ---银两100万
				[5] = {dwItemEnum = 2400140,dwItemNumber = 99, dwBindType = 1},  ---十倍经验丹
				[6] = {dwItemEnum = 2500030,dwItemNumber = 2, dwBindType = 1},  ---闭关要诀
			},
		},
		-- [150] = {
			-- afficheStr = "恭喜玩家%s，成功领取“奖励名字2”", 
			-- awardItem = {
				-- [1] = {dwItemEnum = 4902002,dwItemNumber = 8, dwBindType = 1},
			-- },
		-- },
		-- [200] =	{
			-- afficheStr = "恭喜玩家%s，成功领取“奖励名字3”", 
			-- awardItem = {
				-- [1] = {dwItemEnum = 5500080,dwItemNumber = 8, dwBindType = 1},
			-- },
		-- }, 
		-- [250] = {
			-- afficheStr = "恭喜玩家%s，成功领取“奖励名字4”", 
			-- awardItem = {
				-- [1] = {dwItemEnum = 4100140,dwItemNumber = 8, dwBindType = 1},
			-- },
		-- }, 
		-- [350] = {
			-- afficheStr = "恭喜玩家%s，成功领取“奖励名字5”", 
			-- awardItem = {
				-- [1] = {dwItemEnum = 2500080,dwItemNumber = 8, dwBindType = 1},
			-- },
		-- }, 
	}, 
	-- [2] = {
		-- [20] = {
			-- awardId = 1004, 
			-- awardItem = {
				-- [1] = {dwItemEnum = 4902001,dwItemNumber = 8, dwBindType = 1},
			-- },
		-- },
		-- [30] = {
			-- awardId = 1005, 
			-- awardItem = {
				-- [1] = {dwItemEnum = 4902002,dwItemNumber = 8, dwBindType = 1},
			-- },
		-- },
		-- [50] =	{
			-- awardId = 1006, 
			-- awardItem = {
				-- [1] = {dwItemEnum = 5500080,dwItemNumber = 8, dwBindType = 1},
			-- },
		-- }, 
		-- [80] = {
			-- awardId = 1007, 
			-- awardItem = {
				-- [1] = {dwItemEnum = 4100140,dwItemNumber = 8, dwBindType = 1},
			-- },
		-- }, 
		-- [100] = {
			-- awardId = 1008, 
			-- awardItem = {
				-- [1] = {dwItemEnum = 2500080,dwItemNumber = 8, dwBindType = 1},
			-- },
		-- }, 
	
	-- }, 
};

_G.FullAwardVersion = 2;

----------------------------------------------------
-------以下为热更新接口，勿动
----------------------------------------------------
function FullAwardConfig:Reload()
	print("--------FullAwardConfig:Reload-----");
	local szPath = "../Data/"
	dofile(szPath..'FullAward/FullAwardConfig.lua')
end
