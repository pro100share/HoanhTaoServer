_G.GuildEscortConfig = {
	dwCheckTime = 10;--10次才有奖励
	dwFollowDis = 12;--家主距离
	dwFailTime = 30*60*1000;--多久后失败（毫秒）
	dwDelay = 10*60*1000;--开始后多久刷镖车
	dwMaxRole = 40;--最多护送人员
	dwMaxCount = 1;--最大运镖次数
	dwMaxCall = 1;--最大呼叫次数
	szRule = "1.镖车只有通过<font color='#00FF00'>家主</font>才能发起<br>2.家主发起押镖<font color='#00FF00'>(1-23点)</font>,之后<font color='#00FF00'>10分钟</font>为成员<font color='#00FF00'>报名时间</font><br>3.报名结束时,镖车会出现在襄阳城<font color='#00FF00'>牛冲天(总镖头)</font>处<br>4.镖车需要<font color='#00FF00'>家主带队</font>,否则镖车不会前进<br>5.护送之前请<font color='#CC0000'>先报名</font>,否则您将<font color='#CC0000'>无法获得奖励</font><br>6.护送期间请留心恶人来<font color='#CC0000'>劫镖</font>!";--押镖规则
	szRole = "(%s/40)";--押镖人数
	szRecvCall = "家主呼叫您前往护镖，请问您是否要现在过去？";
	szDoCall = "您确认使用呼叫族人功能吗？世家一天只能使用一次，未上线的成员将无法收到请求！";
	szServer = "请到 %d线";
	szMapPos = "[%s](X:%0.0f,Y:%0.0f)"; --地图位置
	szHp = "(%0.0d/%0.0d)";--生命
	szTime = "押镖剩余时限(%0.2d:%0.2d)";
	szStartTime = "距押镖开始还剩(%0.2d:%0.2d)";
	szRefreshTime = "23:30",
	dwEscortSendPosTick = 5 * 1000;--镖车位置广播的间隔
	dwNoticeLeaderLength = 10 * 1000;--通知会长离开镖车过远的时间间隔
	dwEscortRemoveTime = 4 * 1000;--镖车到达目标后，删除的时间间隔
	Mail = {
		Sender = "系统";--发送方名字
		Title = "世家押镖";--标题
		szMailTxt = "由于您未及时领取世家押镖奖励,奖励通过邮件发送给您,请查收！";--邮件正文
	};
	Prof = {[1] = "镰",[2] = "刀",[3] = "剑",[4] = "枪",};
	Notice = {
		[6001071002] = 30*1000;
		[6001071003] = 30*1000;
		[6001071004] = 60*60*1000;
		[6001071007] = 2*60*1000;
	};
	JoinBtn = {
		[0] = "发起运镖";
		[1] = "参与报名";
	};
	State = { -- 过程
		[-1] = "押镖失败";
		[0] = "世家押镖,即将开始";
		[1] = "参与报名";
		[2] = "护送中";
		[3] = "奖励领取";
	};
	Icon = { --图标
		Life = { szImg = 'Icon_item_9401000_1.png',szTip = '镖车生命' };--生命
		Speed = { szImg = 'Icon_sk_zq_1001_1.png',szTip = '镖车速度' };--速度
		Level = { szImg = 'Mon_By_Er.png',szTip = '镖车等级' };--等级
		
		Money = { szImg = 'Qita_money.png',szTip = '银两' };--银两
		Exp = { szImg = 'Qita_exp.png',szTip = '经验' };--经验
		Pneuma = { szImg = 'Qita_zhenqi.png',szTip = '真气' };--真气
		BindGold = { szImg = 'Qita_lijin.png',szTip = '礼金' };--礼金
		Contribute = { szImg = 'Qita_sj_gongxian.png',szTip = '世家贡献' };--贡献
	};
	Car = {--镖车配置 
		[1] = {--1级
			szName = "1级车";
			szTip = "<font color='#d9ccbd'>一级镖车,发起条件：<br>1.家主<font color='#03b3fd'>发起</font>等级:50<br>2.成员<font color='#03b3fd'>报名</font>等级:40<br>3.世家<font color='#03b3fd'>资金</font>需求:200万</font>";
			dwNext = 2;--下一级车（0则为满级，无法再升级）
			dwSpeed = 200;--速度
			dwHpMax = 4000;--生命
			dwHeal = 100;--每分钟回血量
			szHp = "2000";--显示的文本
			Monster = {dwMonsterId=100;dwAIId=100;dwFightId=100;dwDropId=50122001;dwLook=8001;dwLook_MN=80010;};
			UpNeed = {
				dwLevel = 2;
				dwMoney = 20000000;
				Item = {
					{ dwType = enGuildDonate.eItem1,dwNum = 10 };
					{ dwType = enGuildDonate.eItem2,dwNum = 10 };
				};
			};
			Reward = {--奖励
				Item = --物品
				{
					{dwItemId=2500081,dwNum=1,dwBind=1};
					{dwItemId=2500071,dwNum=1,dwBind=1};
					{dwItemId=5500070,dwNum=1,dwBind=1};
					{dwItemId=4100010,dwNum=2,dwBind=1};
				};
				dwMoney = 200000;--金钱
				dwExp = 1000000;--经验
				dwPneuma = 3500;--真气
				dwBindGold = 200;--礼金
				dwContribute = 10;--贡献
			};
			Condition = {--条件
				dwLevel = 50;--发起等级
				dwJoinLevel = 40;--报名等级
				dwItemNum = 0;--资源数量
				dwMoney = 2000000;--消耗金钱
				szItem = "1面(不消耗)";---废弃
			};
			Line = {--路线
				-- [1] = {--路线1
					-- szText = "襄阳城->丘山村->平郎中";--文字
					-- szPic = "Qita_luxian1001.png";--图片
					-- szStartNpcName = "牛冲天 总镖头";--开始npc名
					-- dwStartNpcLook = 10021018;--开始npc外形
					-- szEndNpcName = "平一指 平郎中";--结束npc名
					-- dwEndNpcLook = 10011001;--结束npc外形
					-- Node = {--路线
						-- {mapid=1002,start={x=-30.67,y=-122.40},fin={x=126.74,y=21.51},round=5};
						-- {mapid=1001,start={x=55,y=-76},fin={x=-5,y=-34},round=5};
					-- };
				-- };
				-- [2] = {--路线2
					-- szText = "襄阳城->丘山村->村长";--文字
					-- szPic = "Qita_luxian1001.png";--图片
					-- szStartNpcName = "牛冲天 总镖头";--开始npc名
					-- dwStartNpcLook = 10021018;--开始npc外形
					-- szEndNpcName = "徐翁 丘山村长";--结束npc名
					-- dwEndNpcLook = 10011002;--结束npc外形
					-- Node = {--路线
						-- {mapid=1002,start={x=-30.67,y=-122.40},fin={x=126.74,y=21.51},round=5};
						-- {mapid=1001,start={x=55,y=-76},fin={x=-36,y=-42},round=5};
					-- };
				-- };
				[1] = {--路线3
					szText = "襄阳城->襄阳野郊->凌教头";--文字
					szPic = "Qita_luxian1003.png";--图片
					szStartNpcName = "牛冲天 总镖头";--开始npc名
					dwStartNpcLook = 10021018;--开始npc外形
					szEndNpcName = "凌天 左军统领";--结束npc名
					dwEndNpcLook = 10031009;--结束npc外形
					Node = {--路线
						{mapid=1002,start={x=-30.67,y=-122.40},fin={x=-2.51,y=-130.96},round=5};
						{mapid=1003,start={x=56,y=82},fin={x=-104,y=-17},round=5};
					};
				};
				[2] = {--路线4
					szText = "襄阳城->襄阳野郊->陆乘风";--文字
					szPic = "Qita_luxian1003.png";--图片
					szStartNpcName = "牛冲天 总镖头";--开始npc名
					dwStartNpcLook = 10021018;--开始npc外形
					szEndNpcName = "陆乘风 归云庄旧主";--结束npc名
					dwEndNpcLook = 10021002;--结束npc外形
					Node = {--路线
						{mapid=1002,start={x=-30.67,y=-122.40},fin={x=-2.51,y=-130.96},round=5};
						{mapid=1003,start={x=56,y=82},fin={x=-99,y=-52},round=5};
					};
				};
				[3] = {--路线5
					szText = "襄阳城->桃花岛->郭靖";--文字
					szPic = "Qita_luxian1004.png";--图片
					szStartNpcName = "牛冲天 总镖头";--开始npc名
					dwStartNpcLook = 10021018;--开始npc外形
					szEndNpcName = "郭靖 五绝之北侠";--结束npc名
					dwEndNpcLook = 10041004;--结束npc外形
					Node = {--路线
						{mapid=1002,start={x=-30.67,y=-122.40},fin={x=-135.39,y=19.72},round=5};
						{mapid=1004,start={x=8.30,y=-98.27},fin={x=-86,y=-53},round=5};
					};
				};
				[4] = {--路线6
					szText = "襄阳城->桃花岛->柯镇恶";--文字
					szPic = "Qita_luxian1004.png";--图片
					szStartNpcName = "牛冲天 总镖头";--开始npc名
					dwStartNpcLook = 10021018;--开始npc外形
					szEndNpcName = "柯镇恶 七怪之首";--结束npc名
					dwEndNpcLook = 10041003;--结束npc外形
					Node = {--路线
						{mapid=1002,start={x=-30.67,y=-122.40},fin={x=-135.39,y=19.72},round=5};
						{mapid=1004,start={x=8.30,y=-98.27},fin={x=81,y=69},round=5};
					};
				};
				[5] = {--路线7
					szText = "襄阳城->绝情密涧->裘千尺";--文字
					szPic = "Qita_luxian1004.png";--图片
					szStartNpcName = "牛冲天 总镖头";--开始npc名
					dwStartNpcLook = 10021018;--开始npc外形
					szEndNpcName = "裘千尺 公孙止原配";--结束npc名
					dwEndNpcLook = 10051002;--结束npc外形
					Node = {--路线
						{mapid=1002,start={x=-30.67,y=-122.40},fin={x=-2.51,y=-130.96},round=5};
						{mapid=1003,start={x=56,y=82},fin={x=-4,y=-98},round=5};
						{mapid=1005,start={x=-17,y=43},fin={x=31,y=-14},round=5};
					};
				};
				
			};
		};
		
		[2] = {--2级
			szName = "2级车";
			szTip = "<font color='#d9ccbd'>二级镖车,发起条件：<br>1.家主<font color='#03b3fd'>发起</font>等级:55<br>2.成员<font color='#03b3fd'>报名</font>等级:40<br>3.世家<font color='#03b3fd'>资金</font>需求:400万</font>";
			dwNext = 3;--下一级车（0则为满级，无法再升级）
			dwSpeed = 250;--速度
			dwHpMax = 6000;--生命
			dwHeal = 150;--每分钟回血量
			szHp = "3000";--显示的文本
			Monster = {dwMonsterId=101;dwAIId=101;dwFightId=101;dwDropId=50122001;dwLook=8002;dwLook_MN=80020;};
			UpNeed = {
				dwLevel = 3;
				dwMoney = 50000000;
				Item = {
					{ dwType = enGuildDonate.eItem3,dwNum = 20 };
					{ dwType = enGuildDonate.eItem4,dwNum = 20 };
				};
			};
			Reward = {--奖励
				Item = --物品
				{
					{dwItemId=2500081,dwNum=1,dwBind=1};
					{dwItemId=2500071,dwNum=1,dwBind=1};
					{dwItemId=5500070,dwNum=1,dwBind=1};
					{dwItemId=4100010,dwNum=2,dwBind=1};
				};
				dwMoney = 350000;--金钱
				dwExp = 2000000;--经验
				dwPneuma = 6000;--真气
				dwBindGold = 400;--礼金
				dwContribute = 15;--贡献
			};
			Condition = {--条件
				dwLevel = 55;--发起等级
				dwJoinLevel = 40;--报名等级
				dwItemNum = 0;--资源数量
				dwMoney = 4000000;--消耗金钱
				szItem = "1面(不消耗)";---废弃
			};
			Line = {--路线
				[1] = {--路线1
					szText = "襄阳城->襄阳野郊->绝情密涧->裘千尺";--文字
					szPic = "Qita_luxian1005.png";--图片
					szStartNpcName = "牛冲天 总镖头";--开始npc名
					dwStartNpcLook = 10021018;--开始npc外形
					szEndNpcName = "裘千尺 公孙止元配";--结束npc名
					dwEndNpcLook = 10051002;--结束npc外形
					Node = {--路线
						{mapid=1002,start={x=-30.67,y=-122.40},fin={x=-2.51,y=-130.96},round=5};
						{mapid=1003,start={x=56,y=82},fin={x=-1,y=-96},round=5};
						{mapid=1005,start={x=-17,y=49},fin={x=34,y=-9},round=5};
					};
				};
				-- [2] = {--路线2
					-- szText = "襄阳城->襄阳野郊->绝情密涧->周伯通";--文字
					-- szPic = "Qita_luxian1005.png";--图片
					-- szStartNpcName = "牛冲天 总镖头";--开始npc名
					-- dwStartNpcLook = 10021018;--开始npc外形
					-- szEndNpcName = "周伯通 老顽童";--结束npc名
					-- dwEndNpcLook = 10051001;--结束npc外形
					-- Node = {--路线
						-- {mapid=1002,start={x=-30.67,y=-122.40},fin={x=-2.51,y=-130.96},round=5};
						-- {mapid=1003,start={x=56,y=82},fin={x=-1,y=-96},round=5};
						-- {mapid=1005,start={x=-17,y=49},fin={x=-46,y=-2},round=5};
					-- };
				-- };
				[2] = {--路线3
					szText = "襄阳城->襄阳野郊->凌教头";--文字
					szPic = "Qita_luxian1003.png";--图片
					szStartNpcName = "牛冲天 总镖头";--开始npc名
					dwStartNpcLook = 10021018;--开始npc外形
					szEndNpcName = "凌天 水军教头";--结束npc名
					dwEndNpcLook = 10031009;--结束npc外形
					Node = {--路线
						{mapid=1002,start={x=-30.67,y=-122.40},fin={x=-2.51,y=-130.96},round=5};
						{mapid=1003,start={x=56,y=82},fin={x=-104,y=-17},round=5};
					};
				};
				[3] = {--路线4
					szText = "襄阳城->桃花岛->郭靖";--文字
					szPic = "Qita_luxian1004.png";--图片
					szStartNpcName = "牛冲天 总镖头";--开始npc名
					dwStartNpcLook = 10021018;--开始npc外形
					szEndNpcName = "郭靖 五绝之北侠";--结束npc名
					dwEndNpcLook = 10041004;--结束npc外形
					Node = {--路线
						{mapid=1002,start={x=-30.67,y=-122.40},fin={x=-135.39,y=19.72},round=5};
						{mapid=1004,start={x=8.30,y=-98.27},fin={x=-86,y=-53},round=5};
					};
				};
				[4] = {--路线5
					szText = "襄阳城->襄阳野郊->大理->天竺神僧";--文字
					szPic = "Qita_luxian1006.png";--图片
					szStartNpcName = "牛冲天 总镖头";--开始npc名
					dwStartNpcLook = 10021018;--开始npc外形
					szEndNpcName = "阿弥勒 天竺神僧";--结束npc名
					dwEndNpcLook = 10061002;--结束npc外形
					Node = {--路线
						{mapid=1002,start={x=-30.67,y=-122.40},fin={x=-2.51,y=-130.96},round=5};
						{mapid=1003,start={x=56,y=82},fin={x=-91,y=13},round=5};
						{mapid=1006,start={x=-96.92,y=24.15},fin={x=55,y=-47},round=5};
					};
				};
				[5] = {--路线6
					szText = "襄阳城->襄阳野郊->大理->一灯大师";--文字
					szPic = "Qita_luxian1006.png";--图片
					szStartNpcName = "牛冲天 总镖头";--开始npc名
					dwStartNpcLook = 10021018;--开始npc外形
					szEndNpcName = "一灯大师 五绝之南帝";--结束npc名
					dwEndNpcLook = 10061001;--结束npc外形
					Node = {--路线
						{mapid=1002,start={x=-30.67,y=-122.40},fin={x=-2.51,y=-130.96},round=5};
						{mapid=1003,start={x=56,y=82},fin={x=-91,y=13},round=5};
						{mapid=1006,start={x=-96.92,y=24.15},fin={x=-54,y=-25},round=5};
					};
				};
				-- [6] = {--路线7
					-- szText = "襄阳城->襄阳野郊->大理->大理·守卫";--文字
					-- szPic = "Qita_luxian1006.png";--图片
					-- szStartNpcName = "牛冲天 总镖头";--开始npc名
					-- dwStartNpcLook = 10021018;--开始npc外形
					-- szEndNpcName = "大理·守卫";--结束npc名
					-- dwEndNpcLook = 10061024;--结束npc外形
					-- Node = {--路线
						-- {mapid=1002,start={x=-30.67,y=-122.40},fin={x=-2.51,y=-130.96},round=5};
						-- {mapid=1003,start={x=56,y=82},fin={x=-91,y=13},round=5};
						-- {mapid=1006,start={x=-96.92,y=24.15},fin={x=-37,y=100},round=5};
					-- };	
				-- };
				-- [7] = {--路线8
					-- szText = "襄阳城->襄阳野郊->大理->蓝瞳瞳";--文字
					-- szPic = "Qita_luxian1006.png";--图片
					-- szStartNpcName = "牛冲天 总镖头";--开始npc名
					-- dwStartNpcLook = 10021018;--开始npc外形
					-- szEndNpcName = "蓝瞳瞳";--结束npc名
					-- dwEndNpcLook = 10061022;--结束npc外形
					-- Node = {--路线
						-- {mapid=1002,start={x=-30.67,y=-122.40},fin={x=-2.51,y=-130.96},round=5};
						-- {mapid=1003,start={x=56,y=82},fin={x=-91,y=13},round=5};
						-- {mapid=1006,start={x=-96.92,y=24.15},fin={x=-16,y=59},round=5};
					-- };	
				-- };
				-- [6] = {--路线8
					-- szText = "襄阳城->襄阳野郊->大理->白驼山->万里行";--文字
					-- szPic = "Qita_luxian1006.png";--图片
					-- szStartNpcName = "牛冲天 总镖头";--开始npc名
					-- dwStartNpcLook = 10021018;--开始npc外形
					-- szEndNpcName = "万里行 震威镖头";--结束npc名
					-- dwEndNpcLook = 10071001;--结束npc外形
					-- Node = {--路线
						-- {mapid=1002,start={x=-30.67,y=-122.40},fin={x=-2.51,y=-130.96},round=5};
						-- {mapid=1003,start={x=56,y=82},fin={x=-91,y=13},round=5};
						-- {mapid=1006,start={x=-96.92,y=24.15},fin={x=-1,y=-95},round=5};
						-- {mapid=1007,start={x=-94,y=28},fin={x=-74,y=-31},round=5};
					-- };	
				-- };
				[6] = {--路线9
					szText = "襄阳城->襄阳野郊->大理->白驼山->何不留";--文字
					szPic = "Qita_luxian1006.png";--图片
					szStartNpcName = "牛冲天 总镖头";--开始npc名
					dwStartNpcLook = 10021018;--开始npc外形
					szEndNpcName = "何不留 茶寮老板";--结束npc名
					dwEndNpcLook = 10071004;--结束npc外形
					Node = {--路线
						{mapid=1002,start={x=-30.67,y=-122.40},fin={x=-2.51,y=-130.96},round=5};
						{mapid=1003,start={x=56,y=82},fin={x=-91,y=13},round=5};
						{mapid=1006,start={x=-96.92,y=24.15},fin={x=-1,y=-95},round=5};
						{mapid=1007,start={x=-94,y=28},fin={x=-30,y=-78},round=5};
					};	
				};
			};
		};
		
		[3] = {--3级
			szName = "3级车";
			szTip = "<font color='#d9ccbd'>三级镖车,发起条件：<br>1.家主<font color='#03b3fd'>发起</font>等级:60<br>2.成员<font color='#03b3fd'>报名</font>等级:40<br>3.世家<font color='#03b3fd'>资金</font>需求:800万</font>";
			dwNext = 0;--下一级车（0则为满级，无法再升级）
			dwSpeed = 300;--速度
			dwHpMax = 8000;--生命
			dwHeal = 200;--每分钟回血量
			szHp = "4000";--显示的文本
			Monster = {dwMonsterId=102;dwAIId=102;dwFightId=102;dwDropId=50162001;dwLook=8003;dwLook_MN=80030;};
			UpNeed = {
				dwLevel = 4;
				dwMoney = 15000000;
				Item = {
					{ dwType = enGuildDonate.eItem1,dwNum = 45 };
					{ dwType = enGuildDonate.eItem4,dwNum = 55 };
				};
			};
			Reward = {--奖励
				Item = --物品
				{
					{dwItemId=9405010,dwNum=1,dwBind=1};
					{dwItemId=5500070,dwNum=5,dwBind=1};
					{dwItemId=4100140,dwNum=10,dwBind=1};
					{dwItemId=4100010,dwNum=3,dwBind=1};
					{dwItemId=2400110,dwNum=2,dwBind=1};
				};
				dwMoney = 500000;--金钱
				dwExp = 5000000;--经验
				dwPneuma = 8000;--真气
				dwBindGold = 600;--礼金
				dwContribute = 20;--贡献
			};
			Condition = {--条件
				dwLevel = 60;--发起等级
				dwJoinLevel = 40;--报名等级
				dwItemNum = 0;--资源数量
				dwMoney = 8000000;--消耗金钱
				szItem = "1面(不消耗)";---废弃
			};
			Line = {--路线
				[1] = {--路线1
					szText = "襄阳城->襄阳野郊->绝情密涧->裘千尺";--文字
					szPic = "Qita_luxian1005.png";--图片
					szStartNpcName = "牛冲天 总镖头";--开始npc名
					dwStartNpcLook = 10021018;--开始npc外形
					szEndNpcName = "裘千尺 公孙止元配";--结束npc名
					dwEndNpcLook = 10051002;--结束npc外形
					Node = {--路线
						{mapid=1002,start={x=-30.67,y=-122.40},fin={x=-2.51,y=-130.96},round=5};
						{mapid=1003,start={x=56,y=82},fin={x=-1,y=-96},round=5};
						{mapid=1005,start={x=-17,y=49},fin={x=34,y=-9},round=5};
					};
				};
				[2] = {--路线3
					szText = "襄阳城->襄阳野郊->大理->白驼山->何不留";--文字
					szPic = "Qita_luxian1007.png";--图片
					szStartNpcName = "牛冲天 总镖头";--开始npc名
					dwStartNpcLook = 10021018;--开始npc外形
					szEndNpcName = "何不留 茶寮老板";--结束npc名
					dwEndNpcLook = 10071004;--结束npc外形
					Node = {--路线
						{mapid=1002,start={x=-30.67,y=-122.40},fin={x=-2.51,y=-130.96},round=5};
						{mapid=1003,start={x=56,y=82},fin={x=-91,y=13},round=5};
						{mapid=1006,start={x=-96.92,y=24.15},fin={x=0,y=-93.84},round=5};
						{mapid=1007,start={x=-99,y=28},fin={x=-28,y=-76},round=5};
					};
				};
				-- [3] = {--路线4
					-- szText = "襄阳城->襄阳野郊->大理->白驼山->万里行";--文字
					-- szPic = "Qita_luxian1007.png";--图片
					-- szStartNpcName = "牛冲天 总镖头";--开始npc名
					-- dwStartNpcLook = 10021018;--开始npc外形
					-- szEndNpcName = "万里行 威震镖头";--结束npc名
					-- dwEndNpcLook = 10071001;--结束npc外形
					-- Node = {--路线
						-- {mapid=1002,start={x=-30.67,y=-122.40},fin={x=-2.51,y=-130.96},round=5};
						-- {mapid=1003,start={x=56,y=82},fin={x=-91,y=13},round=5};
						-- {mapid=1006,start={x=-96.92,y=24.15},fin={x=0,y=-93.84},round=5};
						-- {mapid=1007,start={x=-99,y=28},fin={x=-73,y=-38},round=5};
					-- };
				-- };
				[3] = {--路线5
					szText = "襄阳城->襄阳野郊->大理->天竺神僧";--文字
					szPic = "Qita_luxian1006.png";--图片
					szStartNpcName = "牛冲天 总镖头";--开始npc名
					dwStartNpcLook = 10021018;--开始npc外形
					szEndNpcName = "阿弥勒 天竺神僧";--结束npc名
					dwEndNpcLook = 10061002;--结束npc外形
					Node = {--路线
						{mapid=1002,start={x=-30.67,y=-122.40},fin={x=-2.51,y=-130.96},round=5};
						{mapid=1003,start={x=56,y=82},fin={x=-91,y=13},round=5};
						{mapid=1006,start={x=-96.92,y=24.15},fin={x=55,y=-47},round=5};
					};
				};
				[4] = {--路线6
					szText = "襄阳城->襄阳野郊->大理->一灯大师";--文字
					szPic = "Qita_luxian1006.png";--图片
					szStartNpcName = "牛冲天 总镖头";--开始npc名
					dwStartNpcLook = 10021018;--开始npc外形
					szEndNpcName = "一灯大师 五绝之南帝";--结束npc名
					dwEndNpcLook = 10061001;--结束npc外形
					Node = {--路线
						{mapid=1002,start={x=-30.67,y=-122.40},fin={x=-2.51,y=-130.96},round=5};
						{mapid=1003,start={x=56,y=82},fin={x=-91,y=13},round=5};
						{mapid=1006,start={x=-96.92,y=24.15},fin={x=-54,y=-25},round=5};
					};
				};
				[5] = {--路线7
					szText = "襄阳城->襄阳野郊->大理->大理·守卫";--文字
					szPic = "Qita_luxian1006.png";--图片
					szStartNpcName = "牛冲天 总镖头";--开始npc名
					dwStartNpcLook = 10021018;--开始npc外形
					szEndNpcName = "大理·守卫";--结束npc名
					dwEndNpcLook = 10061024;--结束npc外形
					Node = {--路线
						{mapid=1002,start={x=-30.67,y=-122.40},fin={x=-2.51,y=-130.96},round=5};
						{mapid=1003,start={x=56,y=82},fin={x=-91,y=13},round=5};
						{mapid=1006,start={x=-96.92,y=24.15},fin={x=-37,y=100},round=5};
					};
				};
				[6] = {--路线9
					szText = "襄阳城->襄阳野郊->大理->白驼山->万里行";--文字
					szPic = "Qita_luxian1006.png";--图片
					szStartNpcName = "牛冲天 总镖头";--开始npc名
					dwStartNpcLook = 10021018;--开始npc外形
					szEndNpcName = "万里行 震威镖头";--结束npc名
					dwEndNpcLook = 10071001;--结束npc外形
					Node = {--路线
						{mapid=1002,start={x=-30.67,y=-122.40},fin={x=-2.51,y=-130.96},round=5};
						{mapid=1003,start={x=56,y=82},fin={x=-91,y=13},round=5};
						{mapid=1006,start={x=-96.92,y=24.15},fin={x=-1,y=-95},round=5};
						{mapid=1007,start={x=-94,y=28},fin={x=-73,y=-38},round=5};
					};	
				};
				[7] = {--路线10
					szText = "襄阳城->襄阳野郊->大理->白驼山->何不留";--文字
					szPic = "Qita_luxian1006.png";--图片
					szStartNpcName = "牛冲天 总镖头";--开始npc名
					dwStartNpcLook = 10021018;--开始npc外形
					szEndNpcName = "何不留 茶寮老板";--结束npc名
					dwEndNpcLook = 10071004;--结束npc外形
					Node = {--路线
						{mapid=1002,start={x=-30.67,y=-122.40},fin={x=-2.51,y=-130.96},round=5};
						{mapid=1003,start={x=56,y=82},fin={x=-91,y=13},round=5};
						{mapid=1006,start={x=-96.92,y=24.15},fin={x=-1,y=-95},round=5};
						{mapid=1007,start={x=-94,y=28},fin={x=-25,y=-75},round=5};
					};	
				};
				-- [9] = {--路线12
					-- szText = "襄阳城->终南山->丐帮竹林->曲灵儿";--文字
					-- szPic = "Qita_luxian1006.png";--图片
					-- szStartNpcName = "牛冲天 总镖头";--开始npc名
					-- dwStartNpcLook = 10021018;--开始npc外形
					-- szEndNpcName = "曲灵儿";--结束npc名
					-- dwEndNpcLook = 10081005;--结束npc外形
					-- Node = {--路线
						-- {mapid=1002,start={x=-30.67,y=-122.40},fin={x=-68,y=112},round=5};
						-- {mapid=1008,start={x=-94,y=-9},fin={x=-62,y=-82},round=5};
						-- {mapid=1009,start={x=81,y=-74},fin={x=-67,y=-40},round=5};
					-- };	
				-- };
				-- [9] = {--路线13
					-- szText = "襄阳城->终南山->丐帮竹林->君莫问";--文字
					-- szPic = "Qita_luxian1006.png";--图片
					-- szStartNpcName = "牛冲天 总镖头";--开始npc名
					-- dwStartNpcLook = 10021018;--开始npc外形
					-- szEndNpcName = "君莫问";--结束npc名
					-- dwEndNpcLook = 10081006;--结束npc外形
					-- Node = {--路线
						-- {mapid=1002,start={x=-30.67,y=-122.40},fin={x=-68,y=112},round=5};
						-- {mapid=1008,start={x=-94,y=-9},fin={x=-62,y=-82},round=5};
						-- {mapid=1009,start={x=81,y=-74},fin={x=70,y=43},round=5};
					-- };	
				-- };

			};
		};
	};
	
	Guide = {
		[1] = {szPic = "Qita_bcgz01.png";};
		[2] = {szPic = "Qita_bcgz02.png";};
		[3] = {szPic = "Qita_bcgz03.png";};
		[4] = {szPic = "Qita_bcgz04.png";};
	};
	
}







