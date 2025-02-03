--[[
	时间奖励配置
--]]


--签到奖励
_G.SigninRewardConfig = {
	[1] = {--阶段1
		szText = "签到2次";--文字
		dwSigninTime = 2;--需要的签到次数
		Item = {--奖励的物品ID，数量
			{2500071,2};
			{2500081,2};
			{2400110,2};
			{5910003,4};

		};
		Vip = {--vip额外奖励物品ID，数量
			{5940003,2};

		};
	};
	[2] = {
		szText = "签到5次";
		dwSigninTime = 5;
		Item = {
			{2500071,4};
			{2500081,4};
			{2400110,4};
			{5910003,8};
			{4100010,3};

		};
		Vip = {
			{5940003,4};
		};
	};
	[3] = {
		szText = "签到10次";
		dwSigninTime = 10;
		Item = {
			{2500071,6};
			{2500081,6};
			{2400110,6};
			{5910003,15};
			{4100010,8};
			{5500070,2};
		};
		Vip = {
			{5940003,9};
			{5500070,1};
		};
	};
	[4] = {
		szText = "签到17次";
		dwSigninTime = 17;
		Item = {
			{2500071,8};
			{2500081,8};
			{2400110,10};
			{5910003,20};
			{4100010,15};
			{5500070,5};
		};
		Vip = {
			{5940003,20};
			{5500070,3};
		};
	};
	[5] = {
		szText = "签到26次";
		dwSigninTime = 26;
		Item = {
			{2500071,10};
			{2500081,10};
			{2400110,15};
			{5910003,25};
			{4100010,20};
			{5500070,10};
		};
		Vip = {
			{5940003,40};
			{5500070,6};
		};
	};
}

--补签
_G.RepairSignin = {
	--月光宝盒物品配置ID
	itemEnumId = 2500320,
	--补签一次需要的月光宝盒数量
	itemCount = 1,
}

--每周工资
_G.WeekMoneyConfig = {
	[1] = {--阶段1
		dwStart = 1;--开始日期
		dwEnd = 14;--结束日期
		dwHourMoney = 15;--每小时工资（礼金）
	};
	[2] = {--阶段2
		dwStart = 15;--开始日期
		dwEnd = 28;--结束日期
		dwHourMoney = 30;--每小时工资（礼金）
	};
	[3] = {--阶段3
		dwStart = 29;--开始日期
		dwEnd = 36500;--结束日期
		dwHourMoney = 50;--每小时工资（礼金）
	};
}

--登陆奖励
_G.LoginRewardConfig = {
	[1] = {--第一天
		{5910003,1};--物品id，数量
		{2400010,2};

	};
	[2] = {--第二天
		{5910003,2};
		{2400000,2};
		{5500020,2};

	};
	[3] = {--第三天
		{5910003,5};
		{2400110,2};
		{3900010,10};

	};
	[4] = {--第四天
		{5910003,8};
		{2400110,2};		
		{9405010,5};
		{5500070,5};
		
	};
	[5] = {--第五天
		{5910003,10};
		{5602010,10};
		{4100290,5};
		{4100010,20};

	};
	[6] = {--第六天
		{5910003,15};
		{5602020,5};
		{4100140,20};
		{4100080,10};
		{5940005,1};

	};
	[7] = {--第七天
		{5910003,20};
		{5602030,2};
		{3900020,10};
		{5500070,10};
		{5940006,1};
		{2400120,1};
	};
}

--登陆资源
_G.LoginRewardResConfig = {
	Icon = {--物品图标配置（false:亮  true:灰）
		[1] = false;
		[2] = true;
		[3] = false;
	};
	[0] = {
		[1] = "orange";
		[2] = "gray";
		[3] = "red";
	};
	[1] = {
		[1] = "img://Qita_Checkin_denglu_orange.png";--可领
		[2] = "img://Qita_Checkin_denglu_gray.png";--已领
		[3] = "img://Qita_Checkin_denglu_red.png";--未满足
	};
	[2] = {
		[1] = "img://Qita_Checkin_day_01.png";--还剩1天
		[2] = "img://Qita_Checkin_day_02.png";--还剩2天
		[3] = "img://Qita_Checkin_day_03.png";--还剩3天
		[4] = "img://Qita_Checkin_day_04.png";--还剩4天
		[5] = "img://Qita_Checkin_day_05.png";--还剩5天
		[6] = "img://Qita_Checkin_day_06.png";--还剩6天
	};
	[3] = "img://Qita_Checkin_yilingqu.png";--已领取
}

--签到文字与资源
_G.SigninRewardResConfig = {
	Text = {
		[1] = "<font color='#cdc6c4'>本区开服时间 %d 年 %d 月 %d 日<br>当前处于开服第</font> <font color='#DD4747'>【%d】</font> <font color='#cdc6c4'>天</font>";
		[2] = "<font color='#FDF445'>| 开 |</font><font color='#31cf32'> 1 -14天 在线每小时奖励礼金：15</font><br><font color='#FDF445'>| 服 |</font><font color='#278cf1'> 15-28天 在线每小时奖励礼金：30</font><br><font color='#FDF445'>| 起 |</font><font color='#e082da'> 29 天后 在线每小时奖励礼金：50</font>";
		[3] = "<font color='#cdc6c4'>本周累计在线时间：</font><font color='#DD4747'> %d 小时 %d 分钟</font>";
		[4] = "本月累计签到次数：<font color='#FE1400' size='24'>%d</font> 天";
		[5] = "%d";
		[6] = "领取";
		--[7] = "还差 <font color='#FE1400'>%d</font> 天";
		[8] = "已领取";
		[9] = "关闭";
		[10] = "还差 <font color='#FE1400'>%d</font> 天";
		[11] = "领取工资";
	};
	Month = {
		[1] = "一月";
		[2] = "二月";
		[3] = "三月";
		[4] = "四月";
		[5] = "五月";
		[6] = "六月";
		[7] = "七月";
		[8] = "八月";
		[9] = "九月";
		[10] = "十月";
		[11] = "十一月";
		[12] = "十二月";
	};
	Day = {
		Gray = "#334433";
		Normal = "#00ff00";
	};
	Week = {
		[1] = "周一";
		[2] = "周二";
		[3] = "周三";
		[4] = "周四";
		[5] = "周五";
		[6] = [[<font color="#ff0000">周六</font>]];
		[7] = [[<font color="#ff0000">周日</font>]];
	};
	Pic = {
		[1] = "img://Qita_Wages_Show.png";--Title1Word			开服越久，工资越多
		[2] = "img://Qita_Wages_Vippay.png";--VipEWaiWord		VIP额外奖励
		[3] = "img://Qita_Wages_Yiqiandao.png";--YiQianDaoPic		以签到
		[4] = "img://Qita_Wages_weekpay.png";--NowWeakTitleWord	本周预计工资
		[5] = "img://Qita_Wages_lastweekpay.png";--NextWeakTitleWord	上周可领
		[6] = "img://Qita_Checkin_yilingqu.png";--YiLingQuPic		已领取
		[7] = "img://Qita_Wages_Day.png";	--ShengYuTimeWord	剩余天数				
		[8] = "img://Qita_Checkin_yilingqu.png";--ItemYLQ			已领取
	};
}




-------------------------------------
--字符串相关
_G.TimeRewardStringConfig = {
	[1] = {--领取工资
		[0] = "领取成功";
		[1] = "已经领过了";
		
		
	};
	[2] = {--签到
		[0] = "签到成功";
		[1] = "已经签到过了";
		[2] = "消耗%s%d个,补签该天签到";
		[3] = "消耗%s%d个,补签本月所有可补签签到";
		[4] = "道具不足"
	};
	[3] = {--领取签到奖励
		[0] = "领取成功";
		[1] = "已经领取过了";
		[2] = "未满足签到天数";
		[3] = "背包空间不足";
		
	};
	[4] = {--领取登陆奖励
		[0] = "领取成功";
		[1] = "不能领取（未满足天数或已领过）";
		[2] = "";--预留
		[3] = "背包空间不足";
		
	};
};



















