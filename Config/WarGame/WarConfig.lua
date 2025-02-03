--世家战配置

_G.WarConfig = 
{
	--盟主战中播放的特效
	enSpecialMemberPfxID = 50000;
	enSpecialMemberPfxBind = "feetpoint";
	
	[10001] = 
	{
		--地图总表
		MapSet = { 8008,8001,8002,8007,8009,8003,8006,8005,8004,8010};
		--进入的地图，不止一个入口地图
		--每个地图还有若干个入口点
		EnterMapSet = 
		{
			[8001] = {2};
			[8007] = {2};
			[8003] = {2};
			[8005] = {2};
		};
		--鼎的Enum
		TrophyMonster = 
		{
			[8008] = 95,
			[8001] = 91,
			[8002] = 96,
			[8007] = 92,
			[8009] = 99,
			[8003] = 93,
			[8006] = 97,
			[8005] = 94,
			[8004] = 98,
		};
		BuffForbidList = {510000};
		--名字颜色配置
		NameColor = 
		{
			self_textcolor = 0xFF1E90FF;--自己
			self_edgeColor = 0xFF000000;
			friend_textcolor = 0xFFE3CF57;--友军
			friend_edgeColor = 0xFF000000;
			enemy_textcolor = 0xFFffff00;--敌人
			enemy_edgeColor = 0xFFE3170D;
		};
		--退出战场后的跳转到的地点，如果没有这个表就是回到原来点
		ExitMapPosList = 
		{
			{dwCurMapID = 1002;fMyPosX = 12.74;fMyPosY = 16.21;};
			{dwCurMapID = 1002;fMyPosX = -1.95;fMyPosY = 15.61;};
			{dwCurMapID = 1002;fMyPosX = -21.84;fMyPosY = -49.96;};
			{dwCurMapID = 1002;fMyPosX = -37.61;fMyPosY = -50.68;};
		};
		Notice = 6001010205;
	};
	
	[10002] = 
	{
		--地图总表8050,
		MapSet = {8050};
		--进入的地图，不止一个入口地图
		--每个地图还有若干个入口点
		EnterMapSet = 
		{
			[8050] = {1};
			
		};
		--鼎的Enum
		TrophyMonster = 
		{
		};
		BuffForbidList = {510000};
		Notice = 9000669012;
	};
	
	[10003] = 
	{
		--地图总表8051,
		MapSet = {8051};
		--进入的地图，不止一个入口地图
		--每个地图还有若干个入口点
		EnterMapSet = 
		{
			[8051] = {1};
			
		};
		--鼎的Enum
		TrophyMonster = 
		{
		};
		BuffForbidList = {510000};
		Notice = 9000669012;
	};
	
	[10004] = 
	{
		--地图总表8052,
		MapSet = {8052};
		--进入的地图，不止一个入口地图
		--每个地图还有若干个入口点
		EnterMapSet = 
		{
			[8052] = {1};
			
		};
		--鼎的Enum
		TrophyMonster = 
		{
		};
		BuffForbidList = {510000};
		Notice = 9000669012;
	};

	[10005] = 
	{
		--地图总表8053,
		MapSet = {8053};
		--进入的地图，不止一个入口地图
		--每个地图还有若干个入口点
		EnterMapSet = 
		{
			[8053] = {1};
			
		};
		--鼎的Enum
		TrophyMonster = 
		{
		};
		BuffForbidList = {510000};
		Notice = 9000669012;
	};	
	
	[10006] = 
	{
		--地图总表8051,
		MapSet = {8054};
		--进入的地图，不止一个入口地图
		--每个地图还有若干个入口点
		EnterMapSet = 
		{
			[8054] = {1};
			
		};
		--鼎的Enum
		TrophyMonster = 
		{
		};
		BuffForbidList = {510000};
		Notice = 9000669012;
	};
	--盟主战
	[10010] = 
	{
		MapSet = {8020};
		--进入的地图，不止一个入口地图
		--每个地图还有若干个入口点
		EnterMapSet = 
		{
			[8020] = {1,2,3,4};
			
		};
		--鼎的Enum
		TrophyMonster = 
		{
		};
		BuffForbidList = {510000};
		Notice = 6001047023;
	};
	
	--夜战襄阳
	[10020] = 
	{
		MapSet = {8060};
		--进入的地图，不止一个入口地图
		--每个地图还有若干个入口点
		EnterMapSet = 
		{
			[8060] = {1,2,3,4,5,6,7,8,9,10};
		};
		--鼎的Enum
		TrophyMonster = 
		{
		};
		BuffForbidList = {510000};
		Notice = 6001048001;
	};
	--戏说天下
	[10030] = 
	{
		MapSet = {8025};
		--进入的地图，不止一个入口地图
		--每个地图还有若干个入口点
		EnterMapSet = 
		{
			[8025] = {1};
		};
		--鼎的Enum
		TrophyMonster = 
		{
		};
		BuffForbidList = {510000};
		--Notice = 6001048001;
	};
	--个人押镖 低级
	[10050] = 
	{
		MapSet = {8070};
		--进入的地图，不止一个入口地图
		--每个地图还有若干个入口点
		EnterMapSet = 
		{
			[8070] = {11};
			[8070] = {12};
			[8070] = {13};
			[8070] = {14};
			[8070] = {15};
			[8070] = {16};
			[8070] = {17};
			[8070] = {18};
			[8070] = {19};
		};
		--鼎的Enum
		TrophyMonster = 
		{
		};
		BuffForbidList = {510000};
		--Notice = 6001048001;
	};
	--个人押镖 高级
	[10051] = 
	{
		MapSet = {8071};
		--进入的地图，不止一个入口地图
		--每个地图还有若干个入口点
		EnterMapSet = 
		{
			[8071] = {11};
			[8071] = {12};
			[8071] = {13};
			[8071] = {14};
			[8071] = {15};
			[8071] = {16};
			[8071] = {17};
			[8071] = {18};
			[8071] = {19};
		};
		--鼎的Enum
		TrophyMonster = 
		{
		};
		BuffForbidList = {510000};
		--Notice = 6001048001;
	};
	--青云蜀道
	[10040] = 
	{
		MapSet = {8030,8031};
		--进入的地图，不止一个入口地图
		--每个地图还有若干个入口点
		EnterMapSet = 
		{
			[8031] = {2};
			-- [8030] = {1};
		};
		--鼎的Enum
		TrophyMonster = 
		{
		};
		BuffForbidList = {510000};
		Notice = 13009000013;
	};
	--桃花迷阵
	[10060] = 
	{
		MapSet = {8080,8081,8082,8083,8084,8085,8086,8087,8088,8089};
		--进入的地图，不止一个入口地图
		--每个地图还有若干个入口点
		EnterMapSet = 
		{
			[8080] = {10};
			-- [8030] = {1};
		};
		--鼎的Enum
		TrophyMonster = 
		{
		};
		BuffForbidList = {510000};
		Notice = 13009100001;
	};
	--侠客岛
	[10070] = 
	{
		MapSet = {8090};
		--进入的地图，不止一个入口地图
		--每个地图还有若干个入口点
		EnterMapSet = 
		{
			[8090] = {1,2,3,4,5};
		};
		--鼎的Enum
		TrophyMonster = 
		{
		};
		BuffForbidList = {510000};
		Notice = 13009200001;
	};	
}

--鼎对象和世家中鼎索引的ID
_G.WarTrophyConfig = 
{
	[91] = 1;
	[96] = 2;
	[93] = 3;
	[98] = 4;
	[94] = 5;
	[97] = 6;
	[92] = 7;
	[95] = 8;
	[99] = 9;
};

--鼎血量上限
_G.TrophyHPMax = 
{
	[1] = 3000;
	[2] = 4000;
	[3] = 3000;
	[4] = 4000;
	[5] = 3000;
	[6] = 4000;
	[7] = 3000;
	[8] = 4000;
	[9] = 6000;
};

--鼎的分数
_G.TrophyScore = 
{
	[1] = 1;
	[2] = 1;
	[3] = 1;
	[4] = 1;
	[5] = 10;
	[6] = 10;
	[7] = 10;
	[8] = 10;
	[9] = 100;
};

--鼎的永久有效时间，毫秒
_G.TrophyTimeConfig = 
{
	[1] = 1000*60*20;
	[2] = 1000*60*20;
	[3] = 1000*60*20;
	[4] = 1000*60*20;
	[5] = 1000*60*20;
	[6] = 1000*60*20;
	[7] = 1000*60*20;
	[8] = 1000*60*20;
	[9] = 1000*60*20;
}

--盟主令的有效时间
_G.LeaderTimeConfig = 1000*60*20;

--连杀数的通知配置
_G.KillComboNoticeNum = 
{
	[5] = {strid = 6001010312;broadtype = 1;noticetype = 5;};
	[15] = {strid = 6001010313;broadtype = 3;noticetype = 5;};
	[30] = {strid = 6001010314;broadtype = 3;noticetype = 5;};
	[50] = {strid = 6001010314;broadtype = 3;noticetype = 5;};
	[100] = {strid = 6001010314;broadtype = 3;noticetype = 5;};
	[150] = {strid = 6001010314;broadtype = 3;noticetype = 5;};
	[200] = {strid = 6001010314;broadtype = 3;noticetype = 5;};
	[250] = {strid = 6001010314;broadtype = 3;noticetype = 5;};
	[300] = {strid = 6001010314;broadtype = 3;noticetype = 5;};
	[350] = {strid = 6001010314;broadtype = 3;noticetype = 5;};
}

--战场中禁止使用的物品配置ID
_G.WarForbidItem = 
{
	[5500180] = 1,
	[5500190] = 1,
}

--禁止世家操作的战场
_G.GuildForbidWar =
{
	[10001] = 1,
	[10010] = 1,
}
