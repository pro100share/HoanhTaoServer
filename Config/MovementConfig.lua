---活动配置ID规则
---活动类型+活动时间序号+活动编号
----双倍经验   100
function _G.MovementExConfigStart()

	_G.MovementExConfig = 
	{
---------双倍经验

		[1001] = 
		{
			Time= 
			{
       ---周一			
				{	StartTime = {dwWeek = 0,dwTime = '01:00'},
					FinishTime = {dwWeek = 0,dwTime = '02:00'},
				},
					
				{	StartTime = {dwWeek = 0,dwTime = '07:00'},
					FinishTime = {dwWeek = 0,dwTime = '08:00'},
				},
		---周二
				{	StartTime = {dwWeek = 1,dwTime = '01:00'},
					FinishTime = {dwWeek = 1,dwTime = '02:00'},
				},
					
				{	StartTime = {dwWeek = 1,dwTime = '07:00'},
					FinishTime = {dwWeek = 1,dwTime = '08:00'},
				},
		---周三
				{	StartTime = {dwWeek = 2,dwTime = '01:00'},
					FinishTime = {dwWeek = 2,dwTime = '02:00'},
				},
					
				{	StartTime = {dwWeek = 2,dwTime = '07:00'},
					FinishTime = {dwWeek = 2,dwTime = '08:00'},
				},
		---周四
				{	StartTime = {dwWeek = 3,dwTime = '01:00'},
					FinishTime = {dwWeek = 3,dwTime = '02:00'},
				},
					
				{	StartTime = {dwWeek = 3,dwTime = '07:00'},
					FinishTime = {dwWeek = 3,dwTime = '08:00'},
				},
		---周五
				{	StartTime = {dwWeek = 4,dwTime = '01:00'},
					FinishTime = {dwWeek = 4,dwTime = '02:00'},
				},
					
				{	StartTime = {dwWeek = 4,dwTime = '07:00'},
					FinishTime = {dwWeek = 4,dwTime = '08:00'},
				},
		---周六
				{	StartTime = {dwWeek = 5,dwTime = '00:00'},
					FinishTime = {dwWeek = 5,dwTime = '24:00'},
				},
		---周日
				{	StartTime = {dwWeek = 6,dwTime = '00:00'},
					FinishTime = {dwWeek = 6,dwTime = '24:00'},
				},
			},
			sFunc = function(v)
						local Base = 2;
						if (ActivityConfig.Exp[2]) and (ActivityConfig.Exp[2].value or 0) > 0 then
							Base = Base + ActivityConfig.Exp[2].value
						end
						CMovementSystemMgr:SetMRoleAddExp(Base)
						CMovementSystemMgr:SetWRoleAddExp(Base)
						CMovementSystemMgr:SetAddFiveElem(Base)
					end,	
			eFunc = function(v) 
						CMovementSystemMgr:SetMRoleAddExp(1)
						CMovementSystemMgr:SetWRoleAddExp(1)
						CMovementSystemMgr:SetAddFiveElem(1)
					end,
		},
	
---------龙鼎战

		[2001] = 
		{
			Time= 
			{
		---周二
				{	StartTime = {dwWeek = 1,dwTime = '08:00'},
					FinishTime = {dwWeek = 1,dwTime = '09:00'},
				},
		---周五
				{	StartTime = {dwWeek = 4,dwTime = '08:00'},
					FinishTime = {dwWeek = 4,dwTime = '09:00'},
				},
			},
			
			SpecialCheck = function(dwBeginTick)
				if not WarEnterConfig[10001].tmServerOpenDistance then
					return dwBeginTick;
				end
				
				local tmServerStart = CTimeRewardManager:GetServerStartTime();
				local tmOpenDis = WarEnterConfig[10001].tmServerOpenDistance;
				
				local dwNewTick = dwBeginTick;
				local tmDis = dwBeginTick - tmServerStart;
				if tmDis < tmOpenDis then
					while true do
						dwNewTick = dwNewTick + ONE_WEEK_MSEC;
						if dwNewTick - tmServerStart >= tmOpenDis then
							break;
						end
					end
				end
				
				return dwNewTick;
			end;
		},
---------盟主战

		[3001] = 
		{
			Time= 
			{
		---周六
				{	StartTime = {dwWeek = 5,dwTime = '08:00'},
					FinishTime = {dwWeek = 5,dwTime = '09:00'},
				},
			},
			
			SpecialCheck = function(dwBeginTick)
				if not WarEnterConfig[10010].tmServerOpenDistance then
					return dwBeginTick;
				end
				
				local tmServerStart = CTimeRewardManager:GetServerStartTime();
				local tmOpenDis = WarEnterConfig[10010].tmServerOpenDistance;
				
				local dwNewTick = dwBeginTick;
				local tmDis = dwBeginTick - tmServerStart;
				if tmDis < tmOpenDis then
					while true do
						dwNewTick = dwNewTick + ONE_WEEK_MSEC;
						if dwNewTick - tmServerStart >= tmOpenDis then
							break;
						end
					end
				end
				
				return dwNewTick;
			end;
		},
---------夜战襄阳

		[4001] = 
		{
			Time= 
			{
		---周一			
				{	
					StartTime = {dwTime = '07:30'},
					FinishTime = {dwTime = '07:50'},
				},
			},
		},
---------怪物攻城

		[5001] = 
		{
			Time= 
			{
       ---周一			
				{	StartTime = {dwWeek = 0,dwTime = '09:10'},
					FinishTime = {dwWeek = 0,dwTime = '10:00'},
				},

		---周三
				{	StartTime = {dwWeek = 2,dwTime = '09:10'},
					FinishTime = {dwWeek = 2,dwTime = '10:00'},
				},
		---周六
				{	StartTime = {dwWeek = 5,dwTime = '09:10'},
					FinishTime = {dwWeek = 5,dwTime = '10:00'},
				},
			},
		},
------流星雨
		[6001] = 
		{
			Time= 
			{
       ---周一			
				{	StartTime = {dwWeek = 0,dwTime = '04:30'},
					FinishTime = {dwWeek = 0,dwTime = '05:00'},
				},
       ---周二			
				{	StartTime = {dwWeek = 1,dwTime = '04:30'},
					FinishTime = {dwWeek = 1,dwTime = '05:00'},
				},

		---周三
				{	StartTime = {dwWeek = 2,dwTime = '04:30'},
					FinishTime = {dwWeek = 2,dwTime = '05:00'},
				},
		---周四
				{	StartTime = {dwWeek = 3,dwTime = '04:30'},
					FinishTime = {dwWeek = 3,dwTime = '05:00'},
				},
		---周五
				{	StartTime = {dwWeek = 4,dwTime = '04:30'},
					FinishTime = {dwWeek = 4,dwTime = '05:00'},
				},
		---周六
				{	StartTime = {dwWeek = 5,dwTime = '04:30'},
					FinishTime = {dwWeek = 5,dwTime = '05:00'},
				},
		---周日
				{	StartTime = {dwWeek = 6,dwTime = '04:30'},
					FinishTime = {dwWeek = 6,dwTime = '05:00'},
				},
			},
		},
------戏说天下
		[7001] = 
		{
			Time= 
			{
       ---周一			
				{	StartTime = {dwWeek = 0,dwTime = '00:01'},
					FinishTime = {dwWeek = 0,dwTime = '00:31'},
				},
       ---周二			
				{	StartTime = {dwWeek = 1,dwTime = '00:01'},
					FinishTime = {dwWeek = 1,dwTime = '00:31'},
				},

		---周三
				{	StartTime = {dwWeek = 2,dwTime = '00:01'},
					FinishTime = {dwWeek = 2,dwTime = '00:31'},
				},
		---周四
				{	StartTime = {dwWeek = 3,dwTime = '00:01'},
					FinishTime = {dwWeek = 3,dwTime = '00:31'},
				},
		---周五
				{	StartTime = {dwWeek = 4,dwTime = '00:01'},
					FinishTime = {dwWeek = 4,dwTime = '00:31'},
				},
		---周六
				{	StartTime = {dwWeek = 5,dwTime = '00:01'},
					FinishTime = {dwWeek = 5,dwTime = '00:31'},
				},
		---周日
				{	StartTime = {dwWeek = 6,dwTime = '00:01'},
					FinishTime = {dwWeek = 6,dwTime = '00:31'},
				},
			},
		},
------岑夫子
		[8001] = 
		{
			Time= 
			{
       ---周一			
				{	StartTime = {dwWeek = 0,dwTime = '07:01'},
					FinishTime = {dwWeek = 0,dwTime = '07:30'},
				},
       ---周二			
				{	StartTime = {dwWeek = 1,dwTime = '07:01'},
					FinishTime = {dwWeek = 1,dwTime = '07:30'},
				},

		---周三
				{	StartTime = {dwWeek = 2,dwTime = '07:01'},
					FinishTime = {dwWeek = 2,dwTime = '07:30'},
				},
		---周四
				{	StartTime = {dwWeek = 3,dwTime = '07:01'},
					FinishTime = {dwWeek = 3,dwTime = '07:30'},
				},
		---周五
				{	StartTime = {dwWeek = 4,dwTime = '07:01'},
					FinishTime = {dwWeek = 4,dwTime = '07:30'},
				},
		---周六
				{	StartTime = {dwWeek = 5,dwTime = '07:01'},
					FinishTime = {dwWeek = 5,dwTime = '07:30'},
				},
		---周日
				{	StartTime = {dwWeek = 6,dwTime = '07:01'},
					FinishTime = {dwWeek = 6,dwTime = '07:30'},
				},
			},
		},
------商城抢购
		[9001] = 
		{
			Time= 
			{
       ---周一			
				{	StartTime = {dwWeek = 0,dwTime = '11:58'},
					FinishTime = {dwWeek = 0,dwTime = '12:30'},
				},
				{	StartTime = {dwWeek = 0,dwTime = '23:58'},
					FinishTime = {dwWeek = 0,dwTime = '00:30'},
				},
       ---周二			
				{	StartTime = {dwWeek = 1,dwTime = '11:58'},
					FinishTime = {dwWeek = 1,dwTime = '12:30'},
				},
				{	StartTime = {dwWeek = 1,dwTime = '23:58'},
					FinishTime = {dwWeek = 1,dwTime = '00:30'},
				},

		---周三
				{	StartTime = {dwWeek = 2,dwTime = '11:58'},
					FinishTime = {dwWeek = 2,dwTime = '12:30'},
				},
				{	StartTime = {dwWeek = 2,dwTime = '23:58'},
					FinishTime = {dwWeek = 2,dwTime = '00:30'},
				},
		---周四
				{	StartTime = {dwWeek = 3,dwTime = '11:58'},
					FinishTime = {dwWeek = 3,dwTime = '12:30'},
				},
				{	StartTime = {dwWeek = 3,dwTime = '23:58'},
					FinishTime = {dwWeek = 3,dwTime = '00:30'},
				},
		---周五
				{	StartTime = {dwWeek = 4,dwTime = '11:58'},
					FinishTime = {dwWeek = 4,dwTime = '12:30'},
				},
				{	StartTime = {dwWeek = 4,dwTime = '23:58'},
					FinishTime = {dwWeek = 4,dwTime = '00:30'},
				},
		---周六
				{	StartTime = {dwWeek = 5,dwTime = '11:58'},
					FinishTime = {dwWeek = 5,dwTime = '12:30'},
				},
				{	StartTime = {dwWeek = 5,dwTime = '23:58'},
					FinishTime = {dwWeek = 5,dwTime = '00:30'},
				},
		---周日
				{	StartTime = {dwWeek = 6,dwTime = '11:58'},
					FinishTime = {dwWeek = 6,dwTime = '12:30'},
				},
				{	StartTime = {dwWeek = 6,dwTime = '23:58'},
					FinishTime = {dwWeek = 6,dwTime = '00:30'},
				},
			},
		},
------青云蜀道
		[10001] = 
		{
			Time= 
			{
		---周一			
				{	StartTime = {dwWeek = 0,dwTime = '08:00'},
					FinishTime = {dwWeek = 0,dwTime = '08:30'},
				},
		---周四
				{	StartTime = {dwWeek = 3,dwTime = '08:00'},
					FinishTime = {dwWeek = 3,dwTime = '08:30'},
				},
			},
		},
------行镖天下
		[11001] = 
		{
			Time= 
			{
       ---周一			
				{	StartTime = {dwWeek = 0,dwTime = '03:00'},
					FinishTime = {dwWeek = 0,dwTime = '04:00'},
				},
       ---周二			
				{	StartTime = {dwWeek = 1,dwTime = '03:00'},
					FinishTime = {dwWeek = 1,dwTime = '04:00'},
				},

		---周三
				{	StartTime = {dwWeek = 2,dwTime = '03:00'},
					FinishTime = {dwWeek = 2,dwTime = '04:00'},
				},
		---周四
				{	StartTime = {dwWeek = 3,dwTime = '03:00'},
					FinishTime = {dwWeek = 3,dwTime = '04:00'},
				},
		---周五
				{	StartTime = {dwWeek = 4,dwTime = '03:00'},
					FinishTime = {dwWeek = 4,dwTime = '04:00'},
				},
		---周六
				{	StartTime = {dwWeek = 5,dwTime = '03:00'},
					FinishTime = {dwWeek = 5,dwTime = '04:00'},
				},
		---周日
				{	StartTime = {dwWeek = 6,dwTime = '03:00'},
					FinishTime = {dwWeek = 6,dwTime = '04:00'},
				},
			},
		},
------桃花迷阵
		[12001] = 
		{
			Time= 
			{
       ---周一			
				{	StartTime = {dwWeek = 0,dwTime = '05:30'},
					FinishTime = {dwWeek = 0,dwTime = '06:00'},
				},
       ---周二			
				{	StartTime = {dwWeek = 1,dwTime = '05:30'},
					FinishTime = {dwWeek = 1,dwTime = '06:00'},
				},

		---周三
				{	StartTime = {dwWeek = 2,dwTime = '05:30'},
					FinishTime = {dwWeek = 2,dwTime = '06:00'},
				},
		---周四
				{	StartTime = {dwWeek = 3,dwTime = '05:30'},
					FinishTime = {dwWeek = 3,dwTime = '06:00'},
				},
		---周五
				{	StartTime = {dwWeek = 4,dwTime = '05:30'},
					FinishTime = {dwWeek = 4,dwTime = '06:00'},
				},
		---周六
				{	StartTime = {dwWeek = 5,dwTime = '05:30'},
					FinishTime = {dwWeek = 5,dwTime = '06:00'},
				},
		---周日
				{	StartTime = {dwWeek = 6,dwTime = '05:30'},
					FinishTime = {dwWeek = 6,dwTime = '06:00'},
				},
			},
		},
------侠客岛
		[13001] = 
		{
			Time= 
			{
       ---周一			
				{	StartTime = {dwWeek = 0,dwTime = '01:00'},
					FinishTime = {dwWeek = 0,dwTime = '01:40'},
				},
       ---周二			
				{	StartTime = {dwWeek = 1,dwTime = '01:00'},
					FinishTime = {dwWeek = 1,dwTime = '01:40'},
				},

		---周三
				{	StartTime = {dwWeek = 2,dwTime = '01:00'},
					FinishTime = {dwWeek = 2,dwTime = '01:40'},
				},
		---周四
				{	StartTime = {dwWeek = 3,dwTime = '01:00'},
					FinishTime = {dwWeek = 3,dwTime = '01:40'},
				},
		---周五
				{	StartTime = {dwWeek = 4,dwTime = '01:00'},
					FinishTime = {dwWeek = 4,dwTime = '01:40'},
				},
		---周六
				{	StartTime = {dwWeek = 5,dwTime = '01:00'},
					FinishTime = {dwWeek = 5,dwTime = '01:40'},
				},
		---周日
				{	StartTime = {dwWeek = 6,dwTime = '01:00'},
					FinishTime = {dwWeek = 6,dwTime = '01:40'},
				},
			},
		},
------跨服战-群雄争霸
		[13002] = 
		{
			Time= 
			{
       -- -周一			
				{	
					StartTime = {dwWeek = 0,dwTime = '07:50'},
					FinishTime = {dwWeek = 0,dwTime = '09:00'},
				},

			},
		},		
	}
end



------------------------------------------------------------------------------------------------------------------

-----------------------------活动提示界面

